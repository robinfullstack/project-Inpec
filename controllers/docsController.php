<?php

class docsController extends Controller
{
	public function __construct() 
	{
		parent::__construct();
		$this->_docs = $this->loadModel('docs');

		if(!Session::get('autenticado')) {
			header('location:' . BASE_URL);
			exit;
		}
	}

	public function index()
	{
		$this->_view->assign('titulo', 'Docs');
		$this->_view->renderizar('index', 'docs');
	}

	public function registrar()
	{
		//Inclusión de librería javascript - angular.min.js
		$this->_view->setJs(array('angular.min'));
		$this->_view->setJs(array('tinyMCE'));

		$this->url = explode("/", $_GET['url']);

		$this->_view->assign(array(
			'titulo' => 'Registrar documentación',
			'url' => $this->url[0],
			'registrar' => $this->url[1]
		));

		if(isset($_POST) 
			AND $_SERVER['REQUEST_METHOD'] == "POST" 
			AND isset($_POST['action']) 
			AND $_POST['action'] == "insertarDocs") {

			echo $this->_docs->insertarDocs(
				$_POST['nombre_docs'],
				$_POST['contenido_docs']
			);

			exit;
		}

		$this->_view->renderizar('registrar', 'docs');
	}

	public function todos()
	{
		$this->_view->assign('titulo', 'Docs');

		//Inclusión de librería javascript - angular.min.js
		$this->_view->setJs(array('angular.min'));

		$this->_view->assign('getAll', $this->_docs->getAll());
		$this->_view->renderizar('todos', 'docs');
	}

	public function editar()
	{
		//Inclusión de librería javascript - angular.min.js
		$this->_view->setJs(array('angular.min'));
		$this->_view->setJs(array('tinyMCE'));

		$this->url = explode("/", $_GET['url']);

		$this->_view->assign(array(
			'titulo' => 'Editar Documento',
			'url' => $this->url[0],
			'editar' => $this->url[1]
		));

		if(!empty($this->url[2])) {
			$this->_view->assign('getUrl', $this->url[2]);
			$this->_view->assign('getEdit', $this->_docs->getEdit($this->url[2]));
		}

		if(isset($_POST) 
			AND $_SERVER['REQUEST_METHOD'] == "POST" 
			AND isset($_POST['action'])
			AND $_POST['action'] == "editarDoc") {

				echo $this->_docs->editarDoc(
					$_POST['idDoc'],
					$_POST['nombre_docs'],
					$_POST['contenido_docs']
				);

				exit;
		}

		$this->_view->renderizar('editar', 'docs');
	}

	public function ver()
	{
		//Inclusión de librería javascript - angular.min.js
		$this->_view->setJs(array('angular.min'));

		$this->url = explode("/", $_GET['url']);

		$this->_view->assign(array(
			'titulo' => 'Ver Documento',
			'url' => $this->url[0],
			'registrar' => $this->url[1]
		));

		if(!empty($this->url[2])) {
			$this->_view->assign('getUrl', $this->url[2]);
			$this->_view->assign('getView', $this->_docs->getEdit($this->url[2]));
		}

		$this->_view->renderizar('ver', 'docs');
	}

	public function upload()
	{
		//Inclusión de librería javascript - angular.min.js
		$this->_view->setJs(array('angular.min'));

		$this->url = explode("/", $_GET['url']);

		$this->_view->assign(array(
			'titulo' => 'Cargar imágenes',
			'url' => $this->url[0],
			'registrar' => $this->url[1]
		));

		if(!empty($_FILES)) {
            
			// Count total files
			$countfiles = count($_FILES['files']['name']);

			// Upload directory
			$upload_location = "uploads/";
			$path_location = "../uploads/";

			// To store uploaded files path
			$files_arr = array();

			// Loop all files
			for($index = 0;$index < $countfiles;$index++) {

				// File name
				$filename = $_FILES['files']['name'][$index];

				// Get extension
				$ext = pathinfo($filename, PATHINFO_EXTENSION);

				// Valid image extension
				$valid_ext = array("png","jpeg","jpg");

				// Check extension
				if(in_array($ext, $valid_ext)){

					// File path
					$path = $upload_location . $filename;
					$path_location = $path_location . $filename;

					// Upload file
					if(move_uploaded_file($_FILES['files']['tmp_name'][$index], $path)){
						$files_arr[] = $filename;
					}
				}
			}

			echo json_encode($files_arr);
			exit;
		}

		$this->_view->renderizar('upload', 'docs');
	}
}

?>