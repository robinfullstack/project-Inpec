<?php

/**
 * Ortodoncia sin brackets.
 *
 * Proporciona acceso a datos de usuarios.
 *
 * @class 		usuariosModel
 * @extends		Model
 * @version		1.0.1
 * @package		Models
 * @author 		Robinson Pulgarin Torres
 */
 
class usuariosgestorModel extends Model
{
	public function __construct() {
		parent::__construct();
		$this->TablaGestor = 'tbl_gestor';
	}

	public function getUsuarios()
	{
		$usuario = $this->_db->query(
					"SELECT id, nombre, usuario, email FROM " . $this->TablaGestor
					);

		return $usuario->FetchAll();
	}

	public function getUsuario($id)
	{
		$usuario = $this->_db->query(
					" SELECT nombre, usuario, email FROM " . $this->TablaGestor
				  . " WHERE id = {$id}"
					);

		return $usuario->Fetch();
	}

	public function actualizarUsuario($id, $nombre, $usuario, $pass, $correo)
	{
		$this->_db->prepare("UPDATE " . $this->TablaGestor
							. " SET nombre = '{$nombre}', usuario = '{$usuario}', pass = :pass, email = '{$correo}' WHERE id = :id ")
					->execute(
							array(
							   ':id' => $id,
							   ':pass' => Hash::getHash('sha1', $pass, HASH_KEY)
							));
	}

	public function eliminarUsuario($id_usuario)
	{
		$id_usuario = (int) $id_usuario;

		$this->_db->prepare("DELETE FROM " . $this->TablaGestor
						. " WHERE id = :id_usuario")
				->execute(
						array(
							':id_usuario' => $id_usuario
						));
	}
}

?>
