<?php

/**
 * This is the model class for table "notification".
 *
 * The followings are the available columns in table 'notification':
 * @property string $id
 * @property string $date_created
 * @property string $date_deleted
 * @property string $date
 * @property integer $priority
 * @property string $id_role
 * @property string $id_user
 * @property string $description
 * @property string $link
 *
 * The followings are the available model relations:
 * @property Role $idRole
 * @property User $idUser
 * @property UserNotification[] $userNotifications
 */
class Notification extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'notification';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('date, priority', 'required'),
			array('priority', 'numerical', 'integerOnly'=>true),
			array('id_role, id_user', 'length', 'max'=>20),
			array('link', 'length', 'max'=>2083),
			array('id, date_created, date_deleted, description', 'safe'),
			array('date_deleted, date, id_role, id_user', 'default', 'setOnEmpty' => true, 'value' => null),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, date_created, date_deleted, date, priority, id_role, id_user, description, link', 'safe', 'on'=>'search'),
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
			'idRole' => array(self::BELONGS_TO, 'Role', 'id_role'),
			'idUser' => array(self::BELONGS_TO, 'User', 'id_user'),
			'userNotifications' => array(self::HAS_MANY, 'UserNotification', 'id_notification'),
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
			'date' => 'Date',
			'priority' => 'Priority',
			'id_role' => 'Id Role',
			'id_user' => 'Id User',
			'description' => 'Description',
			'link' => 'Link',
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
		$criteria->compare('date',$this->date,true);
		$criteria->compare('priority',$this->priority);
		$criteria->compare('id_role',$this->id_role,true);
		$criteria->compare('id_user',$this->id_user,true);
		$criteria->compare('description',$this->description,true);
		$criteria->compare('link',$this->link,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Notification the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
