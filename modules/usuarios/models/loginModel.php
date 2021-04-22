<?php

class loginModel extends Model
{
	public function __construct() {
		parent::__construct();

		$this->TablaProfesional = 'tbl_profesional';
	}

	public function getUsuario($usuario, $password)
	{
		$datos = $this->_db->query(
			"SELECT * FROM " . $this->TablaProfesional
			. " WHERE email = '$correo'"
			. " AND pass = '" . Hash::getHash('sha1', $password, HASH_KEY) ."'"
		);

		return $datos->fetch();
	}
}

?>
