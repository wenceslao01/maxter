<?php

class ReportController extends Controller
{

  public function actionYearBalance() {

    $connection = Yii::app()->db;

    $year = date("Y");
    if (isset($_GET['year'])) {
      $year = $_GET['year'];
    }

    $cmd = "select month(payment_date) as month, sum(debit) debit, sum(credit) credit from accounting_entry ";
        $cmd .= "where year(payment_date) = '$year' ";
        $cmd .= "and payment_date is not null ";
        $cmd .= "group by month ";
        $cmd .= "order by month ";


    $command = $connection->createCommand($cmd);
    $row = $command->queryAll();

    $res = array();
    foreach ($row as $key=>$val) {
        $res[] = $val;
    }

    $this->json($res);
  }

  public function actionClientBalance() {

    $connection = Yii::app()->db;

    $init = date("Y");
    $end = date("Y");

    if (isset($_GET['init'])) {
      $init = $_GET['init'];
    }
    if (isset($_GET['end'])) {
      $end = $_GET['end'];
    }

    $cmd = "select c.name, sum(ae.debit) debit ";
    $cmd .= "from accounting_entry ae, client c ";
    $cmd .= "where ae.payment_date between '$init' and '$end' ";
    $cmd .= "and c.id = ae.id_client ";
    $cmd .= "and ae.payment_date is not null ";
    $cmd .= "and ae.id_client is not null ";
    $cmd .= "group by ae.id_client ";
    $cmd .= "order by debit DESC, ae.id_client ";

    $command = $connection->createCommand($cmd);
    $row = $command->queryAll();

    $res = array();
    foreach ($row as $key=>$val) {
        $res[] = $val;
    }

    $this->json($res);
  }

  public function actionClientDue() {

    $connection = Yii::app()->db;

    $init = date("Y");
    $end = date("Y");

    if (isset($_GET['init'])) {
      $init = $_GET['init'];
    }
    if (isset($_GET['end'])) {
      $end = $_GET['end'];
    }

    $cmd = "select c.name, sum(ae.credit) credit ";
    $cmd .= "from accounting_entry ae, client c ";
    $cmd .= "where ae.payment_due_date between '$init' and '$end' ";
    $cmd .= "and c.id = ae.id_client ";
    $cmd .= "and ae.payment_due_date is not null ";
    $cmd .= "and ae.id_client is not null ";
    $cmd .= "group by ae.id_client ";
    $cmd .= "order by credit DESC, ae.id_client ";

    $command = $connection->createCommand($cmd);
    $row = $command->queryAll();

    $res = array();
    foreach ($row as $key=>$val) {
        $res[] = $val;
    }

    $this->json($res);
  }

  public function actionClientTicket() {

    $connection = Yii::app()->db;

    $init = date("Y");
    $end = date("Y");

    if (isset($_GET['init'])) {
      $init = $_GET['init'];
    }
    if (isset($_GET['end'])) {
      $end = $_GET['end'];
    }


    $cmd = "select c.name, count(*) total from ticket t, client c ";
    $cmd .= "where c.id = t.id_client ";
    $cmd .= "and id_ticket_option is not null ";
    $cmd .= "and t.date between '$init' and '$end' ";
    $cmd .= "group by c.id ";
    $cmd .= "order by c.id ";

    $command = $connection->createCommand($cmd);
    $row = $command->queryAll();

    $res = array();
    foreach ($row as $key=>$val) {
        $res[] = $val;
    }

    $this->json($res);
  }

  public function actionEngineer() {

    $connection = Yii::app()->db;

    $cmd = "select concat(first_name, ' ', last_name) as name, count(*) as total  ";
    $cmd .= "from client_engineer ce, engineer e ";
    $cmd .= "where ce.id_engineer = e.id ";
    $cmd .= "and e.date_deleted is null ";
    $cmd .= "group by ce.id_engineer ";
    $cmd .= "order by total, ce.id_engineer ";

    $command = $connection->createCommand($cmd);
    $row = $command->queryAll();

    $res = array();
    foreach ($row as $key=>$val) {
        $res[] = $val;
    }

    $this->json($res);
  }

  public function actionTechnician() {

    $connection = Yii::app()->db;
    $cmd = "select concat(te.first_name, ' ', te.last_name) as name, count(*) as total  ";
    $cmd .= "from ticket t, technician te ";
    $cmd .= "where t.id_technician = te.id ";
    $cmd .= "and t.id_technician is not null ";
    $cmd .= "group by t.id_technician ";
    $cmd .= "order by total, t.id_technician ";

    $command = $connection->createCommand($cmd);
    $row = $command->queryAll();

    $res = array();
    foreach ($row as $key=>$val) {
        $res[] = $val;
    }

    $this->json($res);
  }
}
