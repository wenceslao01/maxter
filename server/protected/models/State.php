<?php

/**
 * This is the model class for table "state".
 *
 * The followings are the available columns in table 'state':
 * @property string $id
 * @property string $id_country
 * @property string $name
 *
 * The followings are the available model relations:
 * @property Administrator[] $administrators
 * @property City[] $cities
 * @property Client[] $clients
 * @property Engineer[] $engineers
 * @property Profile[] $profiles
 * @property Country $idCountry
 * @property User[] $users
 */
class State extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'state';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('id_country, name', 'required'),
			array('id_country', 'length', 'max'=>11),
			array('name', 'length', 'max'=>45),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, id_country, name', 'safe', 'on'=>'search'),
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
			'administrators' => array(self::HAS_MANY, 'Administrator', 'id_state'),
			'cities' => array(self::HAS_MANY, 'City', 'id_state'),
			'clients' => array(self::HAS_MANY, 'Client', 'id_state'),
			'engineers' => array(self::HAS_MANY, 'Engineer', 'id_state'),
			'profiles' => array(self::HAS_MANY, 'Profile', 'id_state'),
			'idCountry' => array(self::BELONGS_TO, 'Country', 'id_country'),
			'users' => array(self::HAS_MANY, 'User', 'id_state'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'id_country' => 'Id Country',
			'name' => 'Name',
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
		$criteria->compare('id_country',$this->id_country,true);
		$criteria->compare('name',$this->name,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return State the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
