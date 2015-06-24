<?php

class SessionController extends Controller
{
	public function actionLogin()
	{
		if (!isset($_POST['model'])) {
			return;
		}

		$login = $_POST['model']['login'];
		$pass = $_POST['model']['password'];

    $users = User::model()->findAll(array("condition"=>"email = '$login' AND password = '$pass'"));

		if (count($users) == 0) {
			$obj = (object) array('status' => 'error');
			$this->json($obj);
		}

		$obj = (object) array('status' => 'ok', 'user' => $users[0]);
		$this->json($obj);
	}
}
