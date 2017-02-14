<?php

class Node
{
	private $id;
	private $address;
	private $username;
	private $password;
	private $serial;
	private $name;
	private $cluster;

	public function __construct($id, $address, $username = null, $password = null, $serial = null, $name = null, $cluster = null)
	{
		$this->id = $id;
		$this->address = $address;
		$this->username = $username;
		$this->password = $password;
		$this->serial = $serial;
		$this->name = $name;
		$this->cluster = $cluster;
	}

	public function soap($async = false, $username = null, $password = null, $serial = null)
	{
		$session = Session::Get();

		if($username === null) $username = $session->getSOAPUsername() ?: $this->getUsername();
		if($password === null) $password = $session->getSOAPPassword() ?: $this->getPassword();

		$options = array(
			'location' => $this->getAddress().'/remote/',
			'uri' => 'urn:halon',
			'login' => $username,
			'password' => $password,
			'connection_timeout' => 5,
			'features' => SOAP_SINGLE_ELEMENT_ARRAYS,
			'compression' => SOAP_COMPRESSION_ACCEPT | (SOAP_COMPRESSION_GZIP | 0)
			);
		$options['stream_context'] = stream_context_create(array('ssl' => array(
			'verify_peer' => true,
			'verify_peer_name' => false, // TODO Get a propper cert!
		)));

		if ($async)
			return new SoapClientAsync($options['location'].'?wsdl', $options);
		return new SoapClient($options['location'].'?wsdl', $options);
	}

	public function getId()
	{
		return $this->id;
	}

	public function getAddress()
	{
		return $this->address;
	}

	public function getUsername()
	{
		return $this->username;
	}

	public function getPassword()
	{
		return $this->password;
	}

	public function getSerial($autoload = false)
	{
		if(!$this->serial && $autoload)
			$this->serial = $this->soap()->getSerial()->result;
		return $this->serial;
	}

	public function getName()
	{
		return $this->name;
	}

	public function getCluster()
	{
		return $this->cluster;
	}
}
