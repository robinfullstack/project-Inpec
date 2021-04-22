<?php

class gestorModel extends Model
{
	public function __construct()
	{
		parent::__construct();

		$this->TablaGestor = 'tbl_gestor';
	}

	public function getUsuarios()
	{
		$usuarios = $this->_db->query(
			"SELECT u.*,r.role FROM " . $this->TablaGestor
			 . " u, roles r ".
			"WHERE u.role = r.id_role"
		);
		return $usuarios->fetchAll(PDO::FETCH_ASSOC);
	}

	public function getUsuario($usuarioID)
	{
		$usuarios = $this->_db->query(
			"SELECT u.usuario,r.role FROM " . $this->TablaGestor
			. " u, roles r ".
			"WHERE u.role = r.id_role AND u.id = {$usuarioID}"
		);
		return $usuarios->fetch();
	}

	public function getPermisosUsuario($usuarioID)
	{
		$acl = new ACL($usuarioID);
		return $acl->getPermisos();
	}

	public function getPermisosRole($usuarioID)
	{
		$acl = new ACL($usuarioID);
		return $acl->getPermisosRole();
	}

	public function eliminarPermiso($usuarioID, $permisoID)
	{
		$this->_db->query(
			"DELETE FROM permisos_usuario WHERE ".
			"usuario = {$usuarioID} AND permiso = {$permisoID}"
		);
	}

	public function editarPermiso($usuarioID, $permisoID, $valor)
	{
		$this->_db->query(
			"REPLACE INTO permisos_usuario SET ".
			"usuario = {$usuarioID} , permiso = {$permisoID}, valor ='{$valor}'"
		);
	}
}

?>
