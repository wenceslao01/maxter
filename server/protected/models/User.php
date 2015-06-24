<?php

/**
 * This is the model class for table "user".
 *
 * The followings are the available columns in table 'user':
 * @property string $id
 * @property string $date_created
 * @property string $date_deleted
 * @property string $id_role
 * @property string $password
 * @property string $password_question
 * @property string $password_answer
 * @property string $first_name
 * @property string $last_name
 * @property string $sex
 * @property string $email
 * @property string $phone
 * @property string $birthday
 * @property string $address
 * @property string $description
 * @property string $id_country
 * @property string $id_state
 * @property string $id_city
 * @property string $zip_code
 *
 * The followings are the available model relations:
 * @property Notification[] $notifications
 * @property PermissionAssigned[] $permissionAssigneds
 * @property Role $idRole
 * @property Country $idCountry
 * @property State $idState
 * @property City $idCity
 * @property UserNotification[] $userNotifications
 * @property UserSession[] $userSessions
 */
class User extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'user';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('id_role, first_name, last_name', 'required'),
			array('id_role, phone', 'length', 'max'=>20),
			array('password', 'length', 'max'=>16),
			array('password_question', 'length', 'max'=>200),
			array('password_answer', 'length', 'max'=>100),
			array('first_name, last_name', 'length', 'max'=>35),
			array('sex', 'length', 'max'=>1),
			array('email', 'length', 'max'=>254),
			array('address', 'length', 'max'=>40),
			array('id_country, id_state, id_city, zip_code', 'length', 'max'=>10),
			array('id, date_created, date_deleted, birthday, description', 'safe'),
			array('date_deleted, birthday, id_country, id_state, id_city', 'default', 'setOnEmpty' => true, 'value' => null),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, date_created, date_deleted, id_role, password, password_question, password_answer, first_name, last_name, sex, email, phone, birthday, address, description, id_country, id_state, id_city, zip_code', 'safe', 'on'=>'search'),
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
			'notifications' => array(self::HAS_MANY, 'Notification', 'id_user'),
			'permissionAssigneds' => array(self::HAS_MANY, 'PermissionAssigned', 'id_user'),
			'idRole' => array(self::BELONGS_TO, 'Role', 'id_role'),
			'idCountry' => array(self::BELONGS_TO, 'Country', 'id_country'),
			'idState' => array(self::BELONGS_TO, 'State', 'id_state'),
			'idCity' => array(self::BELONGS_TO, 'City', 'id_city'),
			'userNotifications' => array(self::HAS_MANY, 'UserNotification', 'id_user'),
			'userSessions' => array(self::HAS_MANY, 'UserSession', 'id_user'),
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
			'id_role' => 'Id Role',
			'password' => 'Password',
			'password_question' => 'Password Question',
			'password_answer' => 'Password Answer',
			'first_name' => 'First Name',
			'last_name' => 'Last Name',
			'sex' => 'Sex',
			'email' => 'Email',
			'phone' => 'Phone',
			'birthday' => 'Birthday',
			'address' => 'Address',
			'description' => 'Description',
			'id_country' => 'Id Country',
			'id_state' => 'Id State',
			'id_city' => 'Id City',
			'zip_code' => 'Zip Code',
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
		$criteria->compare('id_role',$this->id_role,true);
		$criteria->compare('password',$this->password,true);
		$criteria->compare('password_question',$this->password_question,true);
		$criteria->compare('password_answer',$this->password_answer,true);
		$criteria->compare('first_name',$this->first_name,true);
		$criteria->compare('last_name',$this->last_name,true);
		$criteria->compare('sex',$this->sex,true);
		$criteria->compare('email',$this->email,true);
		$criteria->compare('phone',$this->phone,true);
		$criteria->compare('birthday',$this->birthday,true);
		$criteria->compare('address',$this->address,true);
		$criteria->compare('description',$this->description,true);
		$criteria->compare('id_country',$this->id_country,true);
		$criteria->compare('id_state',$this->id_state,true);
		$criteria->compare('id_city',$this->id_city,true);
		$criteria->compare('zip_code',$this->zip_code,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return User the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
