<?php

class Model
{
    private $_registry;
    protected $_db;

	protected $_user = DB_USER;
	protected $_pass = DB_PASS;
	protected $_database = DB_NAME;
	protected $_host = DB_HOST;

    public function __construct() {
        $this->_registry = Registry::getInstancia();
        $this->_db = $this->_registry->_db;
    }

    protected function datatableQuery() {
        $connect = array(
			'user' => $this->_user,
			'pass' => $this->_pass,
			'database' => $this->_database,
			'host' => $this->_host
		);

		return $connect;
    }
}

?>
