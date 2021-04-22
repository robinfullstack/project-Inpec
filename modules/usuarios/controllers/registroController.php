<?php

class registroController extends Controller
{
	private $_registro;

	public function __construct() {
		parent::__construct();

		$this->_registro = $this->loadModel('registro');
		$this->_view->setTemplate('twb');
		// $this->_view->setWidgetOptions('menu-top', array('top', 'top', true));
	}

	public function index()
	{
		$this->_view->assign('titulo', 'Registro');

		$this->_view->renderizar('index', 'registro');
	}

	public function activar($id, $codigo)
	{
		if(!$this->filtrarInt($id) || !$this->filtrarInt($codigo)){
			$this->_view->assign('_error', 'Esta cuenta no existe');
			$this->_view->renderizar('activar', 'registro');
			exit;   
			}

		$row = $this->_registro->getUsuario(
							$this->filtrarInt($id),
							$this->filtrarInt($codigo)
							);

		if(!$row){
			$this->_view->assign('_error', 'Esta cuenta no existe');
			$this->_view->renderizar('activar', 'registro');
			exit;
		}

		if($row['estado'] == 1){
			$this->_view->assign('_error', 'Esta cuenta ya ha sido activada');
			$this->_view->renderizar('activar', 'registro');
			exit;
		}

		$this->_registro->activarUsuario(
							$this->filtrarInt($id),
							$this->filtrarInt($codigo)
							);

		$row = $this->_registro->getUsuario(
							$this->filtrarInt($id),
							$this->filtrarInt($codigo)
							);

		if($row['estado'] == 0){
			$this->_view->assign('_error', 'Error al activar la cuenta, por favor intente mas tarde');
			$this->_view->renderizar('activar', 'registro');
			exit;
		}

		$this->_view->assign('_mensaje', 'Su cuenta ha sido activada');
		$this->_view->renderizar('activar', 'registro');
	}

	public function profesional()
	{
		if(!Session::get('autenticado')){
			$this->redireccionar();
		}

		$this->_view->assign('titulo', 'Registro');

		if($this->getInt('enviar') == 1){
			$this->_view->assign('datos', $_POST);

			if(!$this->getSql('nombre')){
				$this->_view->assign('_error', 'Debe introducir el nombre del profesional');
				$this->_view->renderizar('profesional', 'registro');
				exit;
			}

			if(!$this->getAlphaNum('usuario')){
				$this->_view->assign('_error', 'Debe introducir el usuario del profesional');
				$this->_view->renderizar('profesional', 'registro');
				exit;
			}

			if($this->_registro->verificarUsuario($this->getAlphaNum('usuario'))){
				$this->_view->assign('_error', 'El usuario ' . $this->getAlphaNum('usuario') . ' ya existe');
				$this->_view->renderizar('profesional', 'registro');
				exit;
			}

			if(!$this->getSql('pass')){
				$this->_view->assign('_error', 'Debe introducir su password');
				$this->_view->renderizar('profesional', 'registro');
				exit;
			}

			if($this->getPostParam('pass') != $this->getPostParam('confirmar')){
				$this->_view->assign('_error', 'Los passwords no coinciden');
				$this->_view->renderizar('profesional', 'registro');
				exit;
			}

			if(!$this->getInt('identificacion')){
				$this->_view->assign('_error', 'Debe introducir la identificación del ortodoncista');
				$this->_view->renderizar('profesional', 'registro');
				exit;
			}

			if(!$this->getTexto('tarjeta_profesional')){
				$this->_view->assign('_error', 'Debe introducir la identificación de su tarjeta profesional');
				$this->_view->renderizar('profesional', 'registro');
				exit;
			}

			if(!$this->getInt('telefono')){
				$this->_view->assign('_error', 'Debe introducir el número de teléfono del ortodoncista');
				$this->_view->renderizar('profesional', 'registro');
				exit;
			}

			if(!$this->getPostParam('correo')){
				$this->_view->assign('_error', 'Por favor ingrese la direccion de email');
				$this->_view->renderizar('profesional', 'registro');
				exit;
			}

			if($this->getPostParam('correo') != $this->getPostParam('correo1')){
				$this->_view->assign('_error', 'El correo electrónico suministrado no coincide');
				$this->_view->renderizar('profesional', 'registro');
				exit;
			}

			if(!$this->getTexto('universidad')){
				$this->_view->assign('_error', 'Debe introducir la universidad de posgrado');
				$this->_view->renderizar('profesional', 'registro');
				exit;
			}
			
			if(!$this->getInt('sexo')){
				$this->_view->assign('_error', 'Debe introducir el sexo');
				$this->_view->renderizar('profesional', 'registro');
				exit;
			}
			
			if(!$this->getTexto('consultorio1')){
				$this->_view->assign('_error', 'Debe introducir la dirección consultorio 1');
				$this->_view->renderizar('profesional', 'registro');
				exit;
			}
			
			if(!$this->getTexto('telefono1')){
				$this->_view->assign('_error', 'Debe introducir el teléfono 1');
				$this->_view->renderizar('profesional', 'registro');
				exit;
			}
			
			if(!$this->validarEmail($this->getPostParam('correo'))){
				$this->_view->assign('_error', 'La direccion de email es inv&aacute;lida');
				$this->_view->renderizar('profesional', 'registro');
				exit;
			}

			if($this->_registro->verificarEmail($this->getPostParam('correo'))){
				$this->_view->assign('_error', 'Esta direccion de correo ya esta registrada');
				$this->_view->renderizar('profesional', 'registro');
				exit;
			}
			
			if(!$this->getTexto('fecha_certificacion')){
				$this->_view->assign('_error', 'Debe introducir la fecha de certificación');
				$this->_view->renderizar('profesional', 'registro');
				exit;
			}

			$this->getLibrary('class.phpmailer');
			$mail = new PHPMailer();

		
			$this->_registro->insertarProfesional(
				$this->getPostParam('nombre'),
				$this->getPostParam('usuario'),
				$this->getPostParam('pass'),
				2,
				$this->getPostParam('identificacion'),
				$this->getPostParam('tarjeta_profesional'),
				$this->getPostParam('telefono'),
				$this->getPostParam('correo'),
				$this->getPostParam('universidad'),
				$this->getPostParam('sexo'),
				$this->getPostParam('consultorio1'),
				$this->getPostParam('telefono1'),
				$this->getPostParam('celular1'),
				$this->getPostParam('consultorio2'),
				$this->getPostParam('telefono2'),
				$this->getPostParam('consultorio3'),
				$this->getPostParam('telefono3'),
				$this->getPostParam('comentarios'),
				$this->getPostParam('fecha_certificacion')
			);

			$mail->From = 'www.ortolite.co';
			$mail->FromName = 'Ortolite';
			$mail->Subject = 'Nuevo registro Ortolite';
			$mail->Body = 'Bienvenido <strong>' . $this->getPostParam('nombre') . '</strong>,' 
			. utf8_decode('<br /> <br /> Su registro a Ortolite se ha completado con éxito, puede hacer uso de la plataforma a través del  siguiente link <a href="' . BASE_URL .'" > ' . BASE_URL .' </a>')
			. utf8_decode('<p>A continuación se informa usuario y contraseña de acceso: <br /> ')
			. utf8_decode('<br /> Usuario: ') . $this->getSql("usuario")
			. utf8_decode('<br /> Contraseña: ') . $this->getPostParam("pass")
			. utf8_decode(' <br /> <br /> Cualquier inquietud que tenga puede comunicarla al correo electrónico admin@ortolite.co ')
			. '<br /><br /> Saludos!';
			$mail->SetFrom('admin@ortolite.co', 'Ortolite');
			$mail->AltBody = 'Su servidor de correo no soporta html';
			$mail->AddAddress($this->getPostParam('correo'));
			$mail->AddCC('admin@ortolite.co');
			$mail->Send();

			$this->_view->assign('datos', false);
			$this->_view->assign('_mensaje', 'Registro Completado, Se ha enviado al correo el usuario y la contraseña de acceso.');
		}

		$this->_view->renderizar('profesional', 'registro');
	}

	public function gestor()
	{
		if(!Session::get('autenticado')){
			$this->redireccionar();
		}

		$this->_view->assign('titulo', 'Registro');

		if($this->getInt('enviar') == 1){
			$this->_view->assign('datos', $_POST);

			if(!$this->getSql('nombre')){
				$this->_view->assign('_error', 'Debe introducir su nombre');
				$this->_view->renderizar('index', 'gestor');
				exit;
			}

			if(!$this->getAlphaNum('usuario')){
				$this->_view->assign('_error', 'Debe introducir su nombre usuario');
				$this->_view->renderizar('index', 'gestor');
				exit;
			}

			if($this->_registro->verificarGestor($this->getAlphaNum('usuario'))){
				$this->_view->assign('_error', 'El usuario ' . $this->getAlphaNum('usuario') . ' ya existe');
				$this->_view->renderizar('index', 'registro');
				exit;
			}

			if(!$this->validarEmail($this->getPostParam('email'))){
				$this->_view->assign('_error', 'La direccion de email es inv&aacute;lida');
				$this->_view->renderizar('index', 'registro');
				exit;
			}

			if($this->_registro->verificarEmail($this->getPostParam('email'))){
				$this->_view->assign('_error', 'Esta direccion de correo ya esta registrada');
				$this->_view->renderizar('index', 'registro');
				exit;
			}

			if(!$this->getSql('pass')){
				$this->_view->assign('_error', 'Debe introducir su password');
				$this->_view->renderizar('index', 'registro');
				exit;
			}

			if($this->getPostParam('pass') != $this->getPostParam('confirmar')){
				$this->_view->assign('_error', 'Los passwords no coinciden');
				$this->_view->renderizar('index', 'registro');
				exit;
			}

			$this->getLibrary('class.phpmailer');
			$mail = new PHPMailer();

			$this->_registro->registrarGestor(
				$this->getSql('nombre'),
				$this->getAlphaNum('usuario'),
				$this->getSql('pass'),
				$this->getPostParam('email')
			);

			$usuario = $this->_registro->verificarGestor($this->getAlphaNum('usuario'));

			if(!$usuario){
				$this->_view->assign('_error', 'Error al registrar el usuario');
				$this->_view->renderizar('index', 'registro');
				exit;
			}

			$mail->From = 'www.ortolite.co';
			$mail->FromName = 'Ortolite';
			$mail->Subject = 'Nuevo registro de gestor Ortolite';
			$mail->Body = 'Bienvenido <strong>' . $this->getPostParam('nombre') . '</strong>,' 
			. utf8_decode('<br /> <br /> Su registro a Ortolite se ha completado con éxito, puede hacer uso de la plataforma a través del  siguiente link <a href="' . BASE_URL .'" > ' . BASE_URL .' </a>')
			. utf8_decode('<p>A continuación se informa usuario y contraseña de acceso: <br /> ')
			. utf8_decode('<br /> Usuario: ') . $this->getSql("usuario")
			. utf8_decode('<br /> Contraseña: ') . $this->getPostParam("pass")
			. utf8_decode(' <br /> <br /> Cualquier inquietud que tenga puede comunicarla al correo electrónico admin@ortolite.co ')
			. '<br /><br /> Saludos!';
			$mail->SetFrom('admin@ortolite.co', 'Ortolite');
			$mail->AltBody = 'Su servidor de correo no soporta html';
			$mail->AddAddress($this->getPostParam('email'));
			$mail->AddCC('admin@ortolite.co');
			$mail->Send();

			$this->_view->assign('datos', false);
			$this->_view->assign('_mensaje', 'Registro Completado, revise su email para activar su cuenta');
		}

		$this->_view->renderizar('gestor', 'registro');
	}

	public function nuevoEmpleado()
	{
		if(!Session::get('autenticado')){
			$this->redireccionar();
		}

		$this->_view->assign('titulo', 'Registro');

		//Inclusión de librería javascript - angular.min.js
		$this->_view->setJs(array('angular.min_1'));

		if(isset($_POST['action']) and $_POST['action'] == "consultaEmpleados"){
			echo $usuario = $this->_registro->consultaEmpleados();
			exit;
		}

		if(isset($_POST['action']) and $_POST['action'] == "accionEmpleado"){
			$data = array();
			if(!$this->getSql('nombre_empleado')){
				$data[] = array("mensaje_error" => 'Por favor, ingrese el nombre del empleado');

				echo json_encode($data);
				exit;
			}

			if(!$this->getAlphaNum('usuario_empleado')){
				$data[] = array("mensaje_error" => 'Por favor, ingrese el usuario del empleado');

				echo json_encode($data);
				exit;
			}

			if($this->_registro->verificarGestor($this->getAlphaNum('usuario_empleado'))){
				$data[] = array("mensaje_error" => 'El usuario ' . $this->getAlphaNum('usuario_empleado') . ' ya existe');

				echo json_encode($data);
				exit;
			}

			/*
			if($this->_registro->verificarEmail($this->getPostParam('email_empleado'))){
				$data[] = array("mensaje_error" => 'Esta dirección de correo ya esta registrada');

				echo json_encode($data);
				exit;
			}
			*/

			if(!$this->getSql('pass_empleado')){
				$data[] = array("mensaje_error" => 'Por favor, asigne una contraseña');

				echo json_encode($data);
				exit;
			}

			if($this->getPostParam('pass_empleado') != $this->getPostParam('confirmar_pass')){
				$data[] = array("mensaje_error" => 'Por favor, verifique la coincidencia de las contraseñas');

				echo json_encode($data);
				exit;
			}

			echo json_encode(array("aprobacion" => 1));
			echo $response = $this->_registro->registrarGestor(
				$this->getSql('nombre_empleado'),
				$this->getAlphaNum('usuario_empleado'),
				$this->getSql('pass_empleado'),
				$this->getPostParam('email_empleado')
			);
			exit;
		}
	}
}

?>