<?php

class NotificationController extends Controller
{

	public static function create($date, $description, $link, $priority, $id_role, $id_user) {

		$model = new Notification();

		$model->date = $date;
		$model->link = $link;
		$model->description = $description;
		$model->priority = $priority;
		$model->id_role = $id_role;
		$model->id_user = $id_user;

		if ($model->save()) {
				NotificationController::saveUsersNotifications($model);
		}
	}

	public function actionSearch()
	{
		$model = new Notification();
		$model->unsetAttributes();

		if (isset($_GET['model'])) {
			$model->attributes = $_GET['model'];
		}

		$search = $model->search();
		$criteria = $search->getCriteria();

		if (!isset($_GET['model']['date_deleted'])) {
			$criteria->addCondition('date_deleted IS NULL');
		}

		if (isset($_GET['sort'])) {
			$criteria->order = $_GET['sortBy'] . ' ' . $_GET['sort'];
		}

		$total = $model->count($criteria);
		$search->pagination = array(
            'pageSize' => $total
        );

		if (isset($_GET['currentPage'])) {
			$search->pagination = array(
                'pageSize' => $_GET['pageSize'],
                'currentPage' => ($_GET['currentPage']-1),
            );
		}

		$result = $this->getArrayWithRelations($search->getData(), $model, 'idRole, idUser');
		$obj = (object) array('total' => $total, 'entries' => $result);
		$this->json($obj);
	}

	public function actionUpdate()
	{
		if (!isset($_POST)) {
			return;
		}

		if (isset($_POST['model']['id'])) {
			$model = $this->find($_POST['model']['id']);
		} else {
			$model = new Notification();
		}

		$model->attributes = $_POST['model'];
		$this->update($model);
	}

	public function actionRemove()
	{
		if (!isset($_POST)) {
			return;
		}
		$id = $_POST['model']['id'];
		$date = new DateTime();

		Notification::model()->updateByPk($id, array(
		    'date_deleted' => $date->format('Y-m-d H:i:s')
		));

		$this->deleteRelations($id);
		$this->json(array('ok'));
	}

	public function deleteRelations($id)
	{
		UserNotification::model()->deleteAll("id_notification ='" . $id . "'");
	}

	public function actionRestore()
	{
		if (!isset($_POST)) {
			return;
		}
		$id = $_POST['id'];

		Notification::model()->updateByPk($id, array(
		    'date_deleted' => null
		));

		$this->json(array('ok'));
	}

	public function actionDelete()
	{
		if (!isset($_POST)) {
			return;
		}
		$id = $_POST['id'];
		$model = $this->find($id);
		$model->delete();
		$this->deleteRelations($id);
		$this->json(array('ok'));
	}

	public function update($model) {
		if(isset($_POST['model']))
		{
			$model->attributes = $_POST['model'];

			if($model->save()) {
				NotificationController::saveUsersNotifications($model);

				$this->getStatus('ok', $model->id);
			}
		}
		$this->json(array('error'));
	}

	public static function saveUsersNotifications($model) {
			if ($model->id_user > 0) {
				NotificationController::saveUserNotification($model->id_user, $model->id);
			}

			if ($model->id_role > 0) {
				$users = User::model()->findAll($model->id_role);
				$users = User::model()->findAll(array("condition"=>"id_role = $model->id_role AND date_deleted IS NULL"));
				foreach ($users as $key => $user) {
					NotificationController::saveUserNotification($user->id, $model->id);
				}
			}
	}

	public static function saveUserNotification($idUser, $idNotification) {
			$userAlert = new UserNotification();
			$userAlert->id_user = $idUser;
			$userAlert->id_notification = $idNotification;
			$userAlert->checked = 0;
			$userAlert->save();
	}

	public function find($id) {
		$model = Notification::model()->findByPk($id);
		if ($model === null) {
			$this->json(array('error'));
		}
		return $model;
	}

	public function getStatus($status, $id) {
		$obj = (object) array('status' => $status, 'id' => $id);
		$this->json($obj);
	}
}
