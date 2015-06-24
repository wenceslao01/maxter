<?php
/**
 * Controller is the customized base controller class.
 * All controller classes for this application should extend from this base class.
 */
class Controller extends CController
{
	/**
	 * @var string the default layout for the controller view. Defaults to '//layouts/column1',
	 * meaning using a single column layout. See 'protected/views/layouts/column1.php'.
	 */
	public $layout='//layouts/column1';
	/**
	 * @var array context menu items. This property will be assigned to {@link CMenu::items}.
	 */
	public $menu=array();
	/**
	 * @var array the breadcrumbs of the current page. The value of this property will
	 * be assigned to {@link CBreadcrumbs::links}. Please refer to {@link CBreadcrumbs::links}
	 * for more details on how to specify this property.
	 */
	public $breadcrumbs = array();

	/**
	 * Return data to browser as JSON and end application.
	 * @param array $data
	 */
	protected function json($data)
	{
	    header('Content-type: application/json');
	    echo CJSON::encode($data);

	    foreach (Yii::app()->log->routes as $route) {
	        if($route instanceof CWebLogRoute) {
	            $route->enabled = false; // disable any weblogroutes
	        }
	    }
	    Yii::app()->end();
	}

	/**
	 * @return array action filters
	 */
	public function filters()
	{
		return array(
			//'accessControl', // perform access control for CRUD operations
			'postOnly + delete', // we only allow deletion via POST request
		);
	}
	
	public function accessRules()
	{
        $role = '';

		if (Yii::app()->user->isGuest == false) {
			$role = Yii::app()->user->model->role->name;
		}

		$actions = array('');

        if ($role == "Administrator")
        {
            $actions = array('search','remove','restore','delete','update');
        } 
                
        return array(
        array('allow',
                'actions' => $actions,
                'users' => array('@'),
            ),
                                    
            array('deny',
                'users' => array('*'),
            ),
        );
    }



  protected function jsonWithRelations(array $models, $model, $attributeNames) {
  	$rows = getArrayWithRelations($models, $model, $attributeNames);
    $this->json($rows);
  }

  protected function getArrayWithRelations(array $models, $model, $attributeNames) {
  	if ($model != null) {
		$aux = '';
		foreach($model->attributeLabels() as $key => $value) {
			if ($aux != '') {
				$aux .= ', ';
			}
			$aux .= $key;
		}

		if ($attributeNames != '') {
			$aux .= ', ';
		}
		$attributeNames = $aux . $attributeNames;
  	}

    $attributeNames = explode(',', $attributeNames);

    $rows = array(); //the rows to output
    foreach ($models as $model) {
      $row = array(); //you will be copying in model attribute values to this array 
      foreach ($attributeNames as $name) {
        $name = trim($name); //in case of spaces around commas
        $row[$name] = CHtml::value($model, $name); //this function walks the relations 
      }
      $rows[] = $row;
    }
    return $rows;
  }
}