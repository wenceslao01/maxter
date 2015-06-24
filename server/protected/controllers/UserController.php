<?php

class UserController extends Controller
{
	public function actionSearch()
	{
		$model = new User();
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

		$result = $this->getArrayWithRelations($search->getData(), $model, '');
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
			$model = new User();
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

		User::model()->updateByPk($id, array(
		    'date_deleted' => $date->format('Y-m-d H:i:s')
		));

		$this->json(array('ok'));
	}

	public function actionRestore()
	{
		if (!isset($_POST)) {
			return;
		}
		$id = $_POST['id'];

		User::model()->updateByPk($id, array(
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
		$this->json(array('ok'));
	}

	public function update($model) {
		if(isset($_POST['model']))
		{
			$model->attributes = $_POST['model'];
			if ($model->password == null) {
				$model->password = 'ascensoft';
			}
			if($model->save()) {
				$this->getStatus('ok', $model->id);
			}
		}
		$this->json(array('error'));
	}

	public function find($id) {
		$model = User::model()->findByPk($id);
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
