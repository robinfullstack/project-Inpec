<?php

class chartController extends Controller
{
	public function __construct() 
	{
		parent::__construct();
		$this->_chart = $this->loadModel('chart');

		if(!Session::get('autenticado')){
			header('location:' . BASE_URL);
			exit;
		}

		$this->url = explode("/", $_GET['url']);

		if(isset($this->url[1]) and $this->url[1] == 1){
			echo $response = $this->_chart->reporteFactura();
			exit;
		}
	}

	public function index()
	{}

}

?>