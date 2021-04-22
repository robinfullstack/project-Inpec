<?php

class registroModel extends Model
{
	public function __construct() {
		parent::__construct();

		$this->TablaProfesional = 'tbl_profesional';
		$this->TablaGestor = 'tbl_gestor';
	}

	public function verificarUsuario($usuario)
	{
		$id = $this->_db->query(
			"SELECT id FROM " . $this->TablaProfesional
			. " WHERE email = '$correo'"
		);

		return $id->Fetch();
	}

	public function verificarGestor($usuario)
	{
		$id = $this->_db->query(
			"SELECT id FROM " . $this->TablaGestor
			. " WHERE usuario = '{$usuario}'"
		);

		return $id->Fetch();
	}

	public function consultaEmpleados()
	{
		$empleados = $this->_db->query(
			"SELECT id, nombre FROM " . $this->TablaGestor
			. " ORDER BY id ASC"
		);

		$response =  $empleados->FetchAll();

		$data = array();
		foreach($response as $rows){
			$data[] = array(
				"id" => $rows['id'],
				"name" => $rows['nombre']
			);
		}
		
		return json_encode($data);
	}

	public function verificarEmail($email)
	{
		$id = $this->_db->query(
			"SELECT id FROM " . $this->TablaProfesional
			. " WHERE email = '{$email}'"
		);

		if($id->Fetch()){
			return true;
		}

		return false;
	}

/*
	public function registrarUsuario($nombre, $usuario, $password, $email)
	{
		$random = rand(1782598471, 9999999999);

		$this->_db->prepare(
				"INSERT INTO " . $this->TablaProfesional . " VALUES " .
				"(null, :nombre, :usuario, :password, :email, 4, 0, now(), :codigo)"
				)
				->execute(array(
					':nombre' => $nombre,
					':usuario' => $usuario,
					':password' => Hash::getHash('sha1', $password, HASH_KEY),
					':email' => $email,
					':codigo' => $random
				));
	}

	public function registrarPaciente($nombre, $usuario, $password, $email)
	{
		$random = rand(1782598471, 9999999999);

		$this->_db->prepare(
				"INSERT INTO " . $this->TablaPaciente . " VALUES " .
				"(null, :nombre, :usuario, :password, :email, 4, 0, now(), :codigo)"
				)
				->execute(array(
					':nombre' => $nombre,
					':usuario' => $usuario,
					':password' => Hash::getHash('sha1', $password, HASH_KEY),
					':email' => $email,
					':codigo' => $random
				));
	}

	public function getUsuario($id, $codigo)
	{
		$usuario = $this->_db->query(
					"SELECT * FROM " . $this->TablaProfesional . " WHERE id = $id AND codigo = '$codigo'"
					);
					
		return $usuario->fetch();
	}

	public function activarUsuario($id, $codigo)
	{
		$this->_db->query(
					"UPDATE " . $this->TablaProfesional . " SET estado = 1 " .
					"WHERE id = $id AND codigo = '$codigo'"
					);
	}
*/
	public function registrarGestor($nombre, $usuario, $password, $email)
	{
		$random = rand(1782598471, 9999999999);

		$this->_db->prepare(
				"INSERT INTO " . $this->TablaGestor . " VALUES " .
				"(null, :nombre, :usuario, :password, :email, 3, 1, now(), :codigo)"
				)
				->execute(array(
					':nombre' => $nombre,
					':usuario' => $usuario,
					':password' => Hash::getHash('sha1', $password, HASH_KEY),
					':email' => $email,
					':codigo' => $random
				));
	}
	
	public function insertarProfesional($nombre, $usuario, $password, $role, $identificacion, $tarjeta_profesional, $telefono, $correo, $universidad
										, $sexo, $consultorio1, $telefono1, $celular, $consultorio2, $telefono2, $consultorio3, $telefono3, $comentarios, $fecha_certificacion)
	{

		$this->_db->prepare(
			"INSERT INTO " . $this->TablaProfesional . " VALUES"
						. " (NULL, :nombre, :usuario, :password, :role, :identificacion, :tarjeta_profesional, :telefono, :correo, :universidad,"
						. " :sexo, :consultorio1, :telefono1, {$celular}, :consultorio2, :telefono2, :consultorio3, :telefono3, :comentarios, 1, :fecha_certificacion, NOW())"
				)
				->execute(array(
					':nombre' => $nombre,
					':usuario' => $usuario,
					':password' => Hash::getHash('sha1', $password, HASH_KEY),
					':role' => $role,
					':identificacion' => $identificacion,
					':tarjeta_profesional' => $tarjeta_profesional,
					':telefono' => $telefono,
					':correo' => $correo,
					':universidad' => $universidad,
					':sexo' => $sexo,
					':consultorio1' => $consultorio1,
					':telefono1' => $telefono1,
					':consultorio2' => $consultorio2,
					':telefono2' => $telefono2,
					':consultorio3' => $consultorio3,
					':telefono3' => $telefono3,
					':comentarios' => $comentarios,
					':fecha_certificacion' => $fecha_certificacion
				));
	}
}

?>