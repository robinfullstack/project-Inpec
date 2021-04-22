<?php

class indexController extends Controller
{
	public function __construct() {
		parent::__construct();
		$this->_login = $this->loadModel('login');
		$this->_chart = $this->loadModel('chart');

		if(!Session::get('autenticado')){
			header('location:' . BASE_URL . 'login');
			exit;
		}
	}

	public function index()
	{
		$this->_view->setJs(array('angular.min'));
		$this->_view->setJs(array('codemirror'));
		$this->_view->setJs(array('overlay'));
		$this->_view->setJs(array('xml'));
		$this->_view->setJs(array('gfm'));
		$this->_view->setJs(array('marked'));
		$this->_view->setJs(array('moment-with-langs.min'));
		$this->_view->setJs(array('bootstrap-datetimepicker.min'));
		$this->_view->setJs(array('bootstrap-tagsinput.min'));
		$this->_view->assign('titulo', 'Portada');

		if(isset($_GET['url']))
			$this->url = explode("/", $_GET['url']);
		else
			$_GET['url'] = "";


		$this->url = explode("/", $_GET['url']);

		$this->_view->assign(array(
			'titulo' => 'Index Sistema',
			'url' => $this->url[0]
		));

		if(empty($this->url[0]))
			$this->redireccionar('index');

		if(!Session::get('autenticado')){
			if($this->getInt('enviar') == 1){
				$this->_view->assign('datos', $_POST);
				if(!$this->getAlphaNum('usuario')){
					$this->_view->assign('_error', 'Debe introducir su nombre de usuario');
					$this->_view->renderizar('index','inicio');
					exit;
				}

				if(!$this->getSql('pass')){
					$this->_view->assign('_error', 'Debe introducir su contraseña');
					$this->_view->renderizar('index','inicio');
					exit;
				}

				$row = $this->_login->getUsuario(
						$this->getAlphaNum('usuario'),
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
				Session::set('usuario', $row['usuario']);
				Session::set('id_usuario', $row['id']);
				Session::set('nombre', $row['nombre']);
				Session::set('tiempo', time());

				$this->redireccionar('index/inicio');
			}
		}

		$this->_view->assign('reporte_notas', $this->_chart->reporteNotas());

		$this->_view->renderizar('index', 'inicio');
	}

	public function registro()
	{
		if(isset($_POST) and $_SERVER['REQUEST_METHOD'] == "POST" and isset($_POST['action']) and $_POST['action'] == "registroNota"){
			echo $response = $this->_chart->registroNota($_POST['titulo_nota'], $_POST['descripcion_nota']
			, $_POST['prioridad_nota']);
			exit;
		}
	}

	public function desactivarNota()
	{
		if(isset($_POST) and $_SERVER['REQUEST_METHOD'] == "POST" and isset($_POST['action']) and $_POST['action'] == "desactivarNota"){
			echo $response = $this->_chart->desactivarNota($_POST['id_notas']);
			exit;
		}
	}

	public function tareaProgramada()
	{
		$fecha_programada = date('Y/m/d', strtotime("+1 day"));
		exit;
		$this->_chart->ejecutarTarea();
	}

	public function cerrar()
	{
		Session::destroy();
		$this->redireccionar();
	}
}

?>