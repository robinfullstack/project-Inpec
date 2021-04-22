<?php

class usuariosModel extends Model
{
    public function __construct() {
        parent::__construct();
		$this->TablaUsuarios = 'usuarios';
    }
	
    public function getUsuarios()
	{
		$usuario = $this->_db->query(
					"SELECT id, nombre, usuario, email FROM " . $this->TablaUsuarios
					);
					
		return $usuario->FetchAll();
	}
	
	public function getUsuario($id)
	{
		$usuario = $this->_db->query(
					" SELECT nombre, usuario, email FROM " . $this->TablaUsuarios
					. " WHERE id = {$id}"
					);
					
		return $usuario->FetchAll();
	}
	
	public function actualizarUsuario($id, $nombre, $usuario, $email)
	{
		$this->_db->prepare("UPDATE " . $this->TablaUsuarios
						  . " SET nombre = '{$nombre}', usuario = '{$usuario}', email = '{$email}' WHERE id = :id ")
					->execute(
							array(
							   ':id' => $id
							));
	}
	
	public function eliminarUsuario($id_usuario)
    {
		$id_usuario = (int) $id_usuario;
		
		$this->_db->prepare("DELETE FROM " . $this->TablaUsuarios
						. " WHERE id = :id_usuario")
				->execute(
						array(
						   ':id_usuario' => $id_usuario
						));
	}
}

?>
