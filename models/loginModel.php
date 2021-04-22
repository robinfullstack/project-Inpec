<?php

class loginModel extends Model
{
	public function __construct() {
		parent::__construct();
		$this->TablaProfesional = "tbl_profesional";
		$this->TablaEmpresa = 'cdl_config_empresa';
	}

	public function getUsuario($usuario, $password)
	{
		$hash = Hash::getHash('sha1', $password, HASH_KEY);

		$sth = $this->_db->prepare(
				  " SELECT * FROM " . $this->TablaProfesional 
				. " WHERE email = :usuario"
				. " AND pass = :hash"
				);
		$sth->bindParam(':usuario', $usuario, PDO::PARAM_STR);
		$sth->bindParam(':hash', $hash, PDO::PARAM_STR);
		$sth->execute();
		return $sth->Fetch();
	}

	public function validarNegocio($correo)
	{
		$sth = $this->_db->prepare(
				  " SELECT email FROM " . $this->TablaProfesional 
				. " WHERE email = :correo"
				);
		$sth->bindParam(':correo', $correo, PDO::PARAM_STR);
		$sth->execute();

		$response = $sth->Fetch();
		$validacion = $response["email"];

		is_null($validacion) ? $validacion = 0 : $validacion;

		return $validacion;
	}

	public function crearNegocio($nombre_negocio, $correo, $pass)
	{
		$pass = Hash::getHash('sha1', $pass, HASH_KEY);

		$sth = $this->_db->prepare("INSERT INTO " . $this->TablaProfesional
		. " VALUES (NULL, :nombre_negocio, :correo, :pass, 1, 1, NULL, 0)");
		$sth->bindParam(':nombre_negocio', $nombre_negocio, PDO::PARAM_STR);
		$sth->bindParam(':correo', $correo, PDO::PARAM_STR);
		$sth->bindParam(':pass', $pass, PDO::PARAM_STR);
		$sth->execute();

		$sth = $this->_db->prepare("INSERT INTO " . $this->TablaEmpresa
		. " (`id_empresa`, `nombre`,`correo`, `estado`, `fecha_registro`) "
		. " VALUES (NULL, :nombre_negocio, :correo, 1, '0000-00-00 00:00:00.000000')");
		$sth->bindParam(':nombre_negocio', $nombre_negocio, PDO::PARAM_STR);
		$sth->bindParam(':correo', $correo, PDO::PARAM_STR);
		$sth->execute();

		//print_r($sth->errorInfo());
	}

	public function consultaLogin($correo, $pass)
	{
		$datos = $this->_db->query(
			"SELECT id, role, email, tp.nombre, id_empresa, tp.estado FROM " . $this->TablaProfesional . " tp "
			. " INNER JOIN " . $this->TablaEmpresa . " te "
			. " ON(tp.email = te.correo) "
			. " WHERE email = '$correo'"
			. " AND pass = '" . Hash::getHash('sha1', $pass, HASH_KEY) ."'"
		);

		return $datos->fetch();
	}
}

?>
