<?php

class gestorController extends usuariosController
{
	private $_usuarios;

	public function __construct() 
	{
		parent::__construct();
		/**
		 * Definición de modelos necesarios para consulta y manipulación de datos.
		 *
		 * loadModel: Función heredada desde el controlador padre (application/Controller.php), línea 35
		 */
		$this->_usuario = $this->loadModel('usuariosgestor');
		$this->_usuarios = $this->loadModel('gestor');
	}

	public function index()
	{
		$this->url = explode("/", $_GET['url']);

		$this->_view->assign(array(
			'titulo' => 'Consultar Usuarios',
			'url' => $this->url[0]
		));

		$this->_view->setJs(array('prueba'));
		$this->_view->assign('titulo', 'Usuarios');
		$this->_view->assign('usuarios', $this->_usuarios->getUsuarios());
		$this->_view->renderizar('index', 'gestor');
	}

	public function permisos($usuarioID)
	{
		$id = $this->filtrarInt($usuarioID);

		if(!$id){
			$this->redireccionar('usuarios');
		}

		if($this->getInt('guardar') == 1){
			$values = array_keys($_POST);
			$replace = array();
			$eliminar = array();

			for($i = 0; $i < count($values); $i++){
				if(substr($values[$i],0,5) == 'perm_'){
					$permiso = (strlen($values[$i]) - 5);

					if($_POST[$values[$i]] == 'x'){
						$eliminar[] = array(
							'usuario' => $id,
							'permiso' => substr($values[$i], -$permiso)
						);
					}
					else{
						if($_POST[$values[$i]] == 1){
							$v = 1;
						}
						else{
							$v = 0;
						}

						$replace[] = array(
							'usuario' => $id,
							'permiso' => substr($values[$i], -$permiso),
							'valor' => $v
						);
					}
				}
			}

			for($i = 0; $i < count($eliminar); $i++){
				$this->_usuarios->eliminarPermiso(
						$eliminar[$i]['usuario'],
						$eliminar[$i]['permiso']);
			}
			
			for($i = 0; $i < count($replace); $i++){
				$this->_usuarios->editarPermiso(
						$replace[$i]['usuario'],
						$replace[$i]['permiso'],
						$replace[$i]['valor']);
			}
		}

		$permisosUsuario = $this->_usuarios->getPermisosUsuario($id);
		$permisosRole = $this->_usuarios->getPermisosRole($id);

		if(!$permisosUsuario || !$permisosRole){
			$this->redireccionar('usuarios');
		}

		$this->_view->assign('titulo', 'Permisos de usuario');
		$this->_view->assign('permisos', array_keys($permisosUsuario));
		$this->_view->assign('usuario', $permisosUsuario);
		$this->_view->assign('role', $permisosRole);
		$this->_view->assign('info', $this->_usuarios->getUsuario($id));

		$this->_view->renderizar('permisos', 'usuarios');
	}

	/**
	 * Edición de usuario.
	 *
	 * @param int $id
	 * @access public
	 * @return void
	 */
	public function editar($id)
	{
		$this->_view->assign('titulo', 'Actualizar usuario');

		if(isset($id)){
			$this->_view->assign('usuario', $this->_usuario->getUsuario($id));
		}

		//Verificación de datos enviados desde el formulario de la vista.
		if($this->getInt('enviar') == 1){
			$this->_view->assign('datos', $_POST);

			/*
			* Validaciones de datos suministrados para el registro.
			* Funciones de validación localizadas en controlador principal.
			* @Controller
			*/ 
			if(!$this->getSql('nombre')){
				$this->_view->assign('_error', 'Debe introducir el nombre');
				$this->_view->renderizar('editar', 'usuario');
				exit;
			}

			if(!$this->getAlphaNum('usuario')){
				$this->_view->assign('_error', 'Debe introducir el nombre del usuario a actualizar');
				$this->_view->renderizar('editar', 'usuario');
				exit;
			}

			if(!$this->validarEmail($this->getPostParam('email'))){
				$this->_view->assign('_error', 'La direccion de email es inv&aacute;lida');
				$this->_view->renderizar('editar', 'usuario');
				exit;
			}

			if(!$this->getAlphaNum('pass')){
				$this->_view->assign('_error', '¡Por favor, asigne la contraseña del usuario!');
				$this->_view->renderizar('editar', 'usuario');
				exit;
			}

			 $this->_usuario->actualizarUsuario(
					$id,
					$this->getSql('nombre'),
					$this->getAlphaNum('usuario'),
					$this->getAlphaNum('pass'),
					$this->getPostParam('email')
					);

			$this->_view->assign('datos', false);
			$this->_view->assign('_mensaje', 'Usuario actualizado!');
			$this->redireccionar('usuarios/gestor');
		}
		$this->_view->renderizar('editar', 'usuario');
	}

	public function eliminar($id)
	{
		$this->_usuario->eliminarUsuario($id);
		$this->redireccionar('usuarios/gestor');
	}
}

?>
