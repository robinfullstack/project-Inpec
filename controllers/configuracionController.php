<?php

class configuracionController extends Controller
{
	public function __construct() 
	{
		parent::__construct();
		if(!Session::get('autenticado')){
			header('location:' . BASE_URL . 'login');
			exit;
		}

		$this->_impresora = $this->loadModel('configuracion');
	}

	private function consultaImagen()
	{
		$this->consulta = $this->_impresora->getImagen();

		if($this->consulta !== 0)
			$this->_view->assign('consulta_imagen', BASE_URL . $this->consulta);
	}

	public function index()
	{
		$this->url = explode("/", $_GET['url']);

		$this->_view->assign(array(
			'titulo' => 'Configuración',
			'url' => $this->url[0]
		));

		$this->consultaImagen();
		//Inclusión de librería javascript - angular.min.js
		$this->_view->setJs(array('angular.min'));
		$this->_view->setJs(array('bootstrap-formhelpers-countries.en_US'));
		$this->_view->setJs(array('bootstrap-formhelpers-countries'));
		$this->_view->setJs(array('bootstrap-formhelpers-selectbox'));
		$this->_view->setJs(array('bootstrap-formhelpers-currencies.en_US'));
		$this->_view->setJs(array('bootstrap-formhelpers-currencies'));
		$this->_view->setJs(array('custom-file-input'));
		$this->_view->assign('titulo', 'Configuracion');
		$this->_view->renderizar('index', 'configuracion');
	}

	public function insertarConfig()
	{
		if(isset($_POST) and $_SERVER['REQUEST_METHOD'] == "POST"){
			echo $this->_impresora->insertarConfig(
				$_POST['nombre_negocio'],
				$_POST['nit_rut'],
				$_POST['nombre_contacto'],
				$_POST['direccion'],
				$_POST['regimen'],
				$_POST['telefono'],
				$_POST['email'],
				$_POST['codigo_pais'],
				$_POST['moneda'],
				$_POST['zona_horaria']
			);
		}
	}

	public function ajaxUpload()
	{
		$valid_extensions = array('jpeg', 'jpg', 'png', 'gif', 'bmp' , 'pdf' , 'doc' , 'ppt'); // valid extensions
		$path = 'uploads/'; // upload directory

		if(!empty($_FILES['image']))
		{
			$img = $_FILES['image']['name'];
			$tmp = $_FILES['image']['tmp_name'];

			// get uploaded file's extension
			$ext = strtolower(pathinfo($img, PATHINFO_EXTENSION));

			// can upload same image using rand function
			$final_image = rand(1000,1000000).$img;

			// check's valid format
			if(in_array($ext, $valid_extensions)) 
			{
				$path = $path.strtolower($final_image); 

				if(move_uploaded_file($tmp,$path)) 
				{
					echo "<img src='".BASE_URL."$path' />";

					$this->_impresora->insertarImagen($path);
				}
			} 
			else 
			{
				echo 'invalid';
			}
		}
	}
}

?>