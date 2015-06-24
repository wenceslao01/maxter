<?php

/**
 * This is the model class for table "permission_assigned".
 *
 * The followings are the available columns in table 'permission_assigned':
 * @property string $id
 * @property string $date_created
 * @property string $date_deleted
 * @property string $id_permission
 * @property string $id_user
 * @property string $id_role
 *
 * The followings are the available model relations:
 * @property Permission $idPermission
 * @property User $idUser
 * @property Role $idRole
 */
class PermissionAssigned extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'permission_assigned';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('id_permission', 'required'),
			array('id_permission, id_user, id_role', 'length', 'max'=>20),
			array('id, date_created, date_deleted', 'safe'),
			array('date_deleted, id_user, id_role', 'default', 'setOnEmpty' => true, 'value' => null),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, date_created, date_deleted, id_permission, id_user, id_role', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'idPermission' => array(self::BELONGS_TO, 'Permission', 'id_permission'),
			'idUser' => array(self::BELONGS_TO, 'User', 'id_user'),
			'idRole' => array(self::BELONGS_TO, 'Role', 'id_role'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'date_created' => 'Date Created',
			'date_deleted' => 'Date Deleted',
			'id_permission' => 'Id Permission',
			'id_user' => 'Id User',
			'id_role' => 'Id Role',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 *
	 * Typical usecase:
	 * - Initialize the model fields with values from filter form.
	 * - Execute this method to get CActiveDataProvider instance which will filter
	 * models according to data in model fields.
	 * - Pass data provider to CGridView, CListView or any similar widget.
	 *
	 * @return CActiveDataProvider the data provider that can return the models
	 * based on the search/filter conditions.
	 */
	public function search()
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id,true);
		$criteria->compare('date_created',$this->date_created,true);
		$criteria->compare('date_deleted',$this->date_deleted,true);
		$criteria->compare('id_permission',$this->id_permission,true);
		$criteria->compare('id_user',$this->id_user,true);
		$criteria->compare('id_role',$this->id_role,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return PermissionAssigned the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
