<?php

class StateController extends Controller
{
	public function actionSearch()
	{
		$model = new State();
		$model->unsetAttributes();

		if (isset($_GET['model'])) {
			$model->attributes = $_GET['model'];
		}

		$search = $model->search();
		$criteria = $search->getCriteria();

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
			$model = new State();
		}

		$model->attributes = $_POST['model'];
		$this->update($model);
	}

	public function update($model) {
		if(isset($_POST['model']))
		{
			$model->attributes = $_POST['model'];

			if($model->save()) {
				$this->getStatus('ok', '');
			}
		}
		$this->json(array('error'));
	}

	public function find($id) {
		$model = State::model()->findByPk($id);
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
