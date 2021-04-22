<?php

class loginController extends Controller
{
	public function __construct() {
		parent::__construct();
		$this->_login = $this->loadModel('login');
	}

	private function autenticacion(){
		if(Session::get('autenticado')){
			header('location:' . BASE_URL);
			exit;
		}
	}

	public function recuperar()
	{
		$this->autenticacion();
		$this->_view->assign('titulo', 'Recuperar contraseña');
		$this->_view->renderizar('contrasena', 'inicio');
	}

	public function registro()
	{
		$this->autenticacion();

		$this->_view->assign('titulo', 'Crear cuenta');

		if($this->getInt('enviar') == 1){
			$this->_view->assign('datos', $_POST);
			if(!$this->getAlphaNum('nombre_negocio')){
				$this->_view->assign('_error', '¡Por favor, ingrese el nombre del negocio!');
				$this->_view->renderizar('registro','inicio');
				exit;
			}

			if(!$this->validarEmail($_POST['correo'])){
				$this->_view->assign('_error', '¡Por favor, ingrese un correo electrónico válido!');
				$this->_view->renderizar('registro','inicio');
				exit;
			}

			if(!$this->getSql('contrasena')){
				$this->_view->assign('_error', '¡Por favor, ingrese su contraseña!');
				$this->_view->renderizar('registro','inicio');
				exit;
			}

			if($this->getSql('contrasena') != $this->getSql('validar_contrasena')){
				$this->_view->assign('_error', '¡Por favor, verifique las contraseñas, no coinciden!');
				$this->_view->renderizar('registro','inicio');
				exit;
			}

			$validar = 	$this->_login->validarNegocio($_POST['correo']);

			if($validar === 0){
				$this->_login->crearNegocio(
						$this->getAlphaNum('nombre_negocio'),
						$_POST['correo'],
						$this->getSql('contrasena')
					);
			}else{
				$this->_view->assign('_error', '¡El usuario ya existe!');
				$this->_view->renderizar('registro','inicio');
				exit;
			}

			$row = 	$this->_login->consultaLogin(
					$_POST['correo'],
					$this->getSql('contrasena')
				);

			if(!$row){
				$this->_view->assign('_error', '¡Usuario y/o contraseña incorrectos!');
				$this->_view->renderizar('registro','inicio');
				exit;
			}

			if($row['estado'] != 1){
				$this->_view->assign('_error', 'Este usuario no esta habilitado');
				$this->_view->renderizar('registro','inicio');
				exit;
			}

			Session::set('autenticado', true);
			Session::set('level', $row['role']);
			Session::set('usuario', $row['email']);
			Session::set('id_usuario', $row['id']);
			Session::set('id_empresa', $row['id_empresa']);
			Session::set('nombre', $row['nombre']);
			Session::set('tiempo', time());

			$this->redireccionar('index/inicio');
		}

		$this->_view->renderizar('registro', 'inicio');
	}

	public function index()
	{
		$this->autenticacion();
		$this->_view->assign('titulo', 'Portada');

		if(!Session::get('autenticado')){
			if($this->getInt('enviar') == 1){
				$this->_view->assign('datos', $_POST);
				if(!$this->validarEmail($_POST['usuario'])){
					$this->_view->assign('_error', '¡Por favor, ingrese un correo electrónico válido!');
					$this->_view->renderizar('index','inicio');
					exit;
				}

				if(!$this->getSql('pass')){
					$this->_view->assign('_error', 'Debe introducir su contraseña');
					$this->_view->renderizar('index','inicio');
					exit;
				}

				$row = $this->_login->consultaLogin(
						$_POST['usuario'],
						$this->getSql('pass')
						);

				if(!$row){
					$this->_view->assign('_error', 'Usuario y/o contaseña incorrectos');
					$this->_view->renderizar('index','inicio');
					exit;
				}

				if($row['estado'] != 1){
					$this->_view->assign('_error', 'Este usuario no esta habilitado');
					$this->_view->renderizar('index','inicio');
					exit;
				}

				Session::set('autenticado', true);
				Session::set('level', $row['role']);
				Session::set('usuario', $row['email']);
				Session::set('id_usuario', $row['id']);
				Session::set('id_empresa', $row['id_empresa']);
				Session::set('nombre', $row['nombre']);
				Session::set('tiempo', time());

			}
			//Inclusión de librería javascript - angular.min.js
			$this->_view->setJs(array('angular.min_1'));

		}
		$this->_view->renderizar('index', 'inicio');
	}

	public function cerrar()
	{
		Session::destroy();
		$this->redireccionar();
	}
}

?>