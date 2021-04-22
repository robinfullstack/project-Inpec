<?php

class usuarioController extends Controller
{    
    public function __construct() 
    {
        parent::__construct();
		$this->_usuarios = $this->loadModel('usuarios');
		$this->_registro = $this->loadModel('registro');
		$this->_personalizar = $this->loadModel('personalizar');
		if(Session::get('autenticado')){
			$this->_view->color = $this->_personalizar->getColor();
		}
    }
    
    public function index()
	{
		$this->_view->titulo = 'Listado de usuarios';
        $this->_view->usuarios = $this->_usuarios->getUsuarios();
        $this->_view->renderizar('index', 'usuario');
	}

	public function editar($id)
	{	
		$this->_view->titulo = 'Actualizar usuario';
        
		if(isset($id)){
			$this->_view->usuario = $this->_usuarios->getUsuario($id);
		}
		
        if($this->getInt('enviar') == 1){
            $this->_view->datos = $_POST;
            
            if(!$this->getSql('nombre')){
                $this->_view->_error = 'Debe introducir el área de trabajo del usuario';
                $this->_view->renderizar('editar', 'usuario');
                exit;
            }
            
            if(!$this->getAlphaNum('usuario')){
                $this->_view->_error = 'Debe introducir el nombre del usuario a actualizar';
                $this->_view->renderizar('editar', 'usuario');
                exit;
            }
            
            if(!$this->validarEmail($this->getPostParam('email'))){
                $this->_view->_error = 'La direccion de email es inv&aacute;lida';
                $this->_view->renderizar('editar', 'usuario');
                exit;
            }
			
			 $this->_usuarios->actualizarUsuario(
					$id,
                    $this->getSql('nombre'),
                    $this->getAlphaNum('usuario'),
                    $this->getPostParam('email')
                    );
             
			
            $this->_view->datos = false;
            $this->_view->_mensaje = 'Usuario actualizado!';
			$this->redireccionar('usuario');
		}
		$this->_view->renderizar('editar', 'usuario');
	}
	
	public function eliminar($id)
	{
        $this->_usuarios->eliminarUsuario($id);
		$this->redireccionar('usuario');
	}
}

?>