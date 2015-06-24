<?php

/**
 * This is the model class for table "user_session".
 *
 * The followings are the available columns in table 'user_session':
 * @property string $id
 * @property string $id_user
 * @property string $logon_date
 * @property string $logoff_date
 * @property string $ip_address
 * @property string $user_agent
 *
 * The followings are the available model relations:
 * @property User $idUser
 */
class UserSession extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'user_session';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('id_user', 'required'),
			array('id_user', 'length', 'max'=>20),
			array('ip_address', 'length', 'max'=>45),
			array('user_agent', 'length', 'max'=>413),
			array('id, logon_date, logoff_date', 'safe'),
			array('logon_date, logoff_date', 'default', 'setOnEmpty' => true, 'value' => null),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, id_user, logon_date, logoff_date, ip_address, user_agent', 'safe', 'on'=>'search'),
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
			'idUser' => array(self::BELONGS_TO, 'User', 'id_user'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'id_user' => 'Id User',
			'logon_date' => 'Logon Date',
			'logoff_date' => 'Logoff Date',
			'ip_address' => 'Ip Address',
			'user_agent' => 'User Agent',
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
		$criteria->compare('id_user',$this->id_user,true);
		$criteria->compare('logon_date',$this->logon_date,true);
		$criteria->compare('logoff_date',$this->logoff_date,true);
		$criteria->compare('ip_address',$this->ip_address,true);
		$criteria->compare('user_agent',$this->user_agent,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return UserSession the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
