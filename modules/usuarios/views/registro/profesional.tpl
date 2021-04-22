<link href="http://code.jquery.com/ui/1.10.3/themes/flick/jquery-ui.css" rel="stylesheet" type="text/css" />
<script src="{$_layoutParams.ruta_js}jquery-1.9.1.js"></script>
<script src="{$_layoutParams.ruta_js}jquery-ui.js"></script>
<script src="{$_layoutParams.ruta_js}jquery.ui.datepicker-es.js"></script>
<script type="text/javascript" >
{literal}

$(function() {
	$( "#fecha_certificacion" ).datepicker({
	  changeMonth: true,
	  yearRange: '2000:2014',
	  dateFormat: 'yy-mm-dd',
	  changeYear: true
	});
});

{/literal}
</script>

<div class="alert alert-success">
	<strong>Registro del profesional!</strong>
</div>

<div class="well span5" style="margin-left: 80px; width: 400px">
	<form name="form1" method="post" action="" class="form">
		<input type="hidden" value="1" name="enviar" />

		<p>
			<label style="margin-right: 105px" >Nombre: </label> 
			<input type="text" name="nombre" value="{$datos.nombre|default:""}" />
		</p>

		<p>
			<label style="margin-right: 105px">Usuario: </label>
			<input type="text" name="usuario" value="{$datos.usuario|default:""}" />
		</p>

		<p>
			<label style="margin-right: 80px">Contraseña: </label>
			<input type="password" name="pass" />
		</p>

		<p>
			<label style="margin-right: 90px">Confirmar: </label>
			<input type="password" name="confirmar" />
		</p>

		<p>
			<label style="margin-right: 10px" >Nro. de Identificación: </label> 
			<input type="text" name="identificacion" value="{$datos.identificacion|default:""}" />
		</p>

		<p>
			<label style="margin-right: 30px">Tarjeta profesional: </label>
			<input type="text" name="tarjeta_profesional" value="{$datos.tarjeta_profesional|default:""}" />
		</p>

		<p>
			<label style="margin-right: 100px">Teléfono: </label>
			<input type="text" name="telefono" value="{$datos.telefono|default:""}" />
		</p>

		<p>
			<label style="margin-right: 115px">Correo: </label>
			<input type="text" name="correo" value="{$datos.correo|default:""}" />
		</p>

		<p>
			<label style="margin-right: 45px">Confirmar correo: </label>
			<input type="text" name="correo1" value="{$datos.correo1|default:""}" />
		</p>

		<p>
			<label >Universidad de posgrado: </label>
			<input style="width: 190px" type="text" name="universidad" value="{$datos.universidad|default:""}" />
		</p>

		<p>
			<label style="margin-right: 110px">Sexo: </label>
			<div class="well well-small">
				<input type="radio" name="sexo" id="femenino" value="1">&nbsp;&nbsp; <strong>Femenino</strong>
				<br>
				<input type="radio" name="sexo" id="masculino" value="2">&nbsp;&nbsp; <strong>Masculino</strong>
				<br>
			</div>
		</p>

		<p>
			<label >Dirección consultorio 1: </label>
			<input type="text" name="consultorio1" value="{$datos.consultorio1|default:""}" />
		</p>

		<p>
			<label >Telefono consultorio 1: </label>
			<input type="text" name="telefono1" value="{$datos.telefono1|default:""}" />
		</p>

		<p>
			<label >Número celular: </label>
			<input style="margin-left: 55px; width: 200px " type="text" name="celular1" value="{$datos.celular1|default:""}" />
		</p>

		<p>
			<label >Dirección consultorio 2: </label>
			<input type="text" name="consultorio2" value="{$datos.consultorio2|default:""}" />
		</p>

		<p>
			<label >Telefono consultorio 2: </label>
			<input type="text" name="telefono2" value="{$datos.telefono2|default:""}" />
		</p>

		<p>
			<label >Dirección consultorio 3: </label>
			<input type="text" name="consultorio3" value="{$datos.consultorio3|default:""}" />
		</p>

		<p>
			<label >Telefono consultorio 3: </label>
			<input type="text" name="telefono3" value="{$datos.telefono3|default:""}" />
		</p>

		<p>
			<label style="margin-right: 70px">Comentarios: </label>
			<textarea rows="4" cols="50"></textarea>
		</p>

                <p>
			<label >Fecha de certificación: </label>
			<input type="text" id="fecha_certificacion" name="fecha_certificacion" value="{$datos.fecha_certificacion|default:""}">
		</p>
		
		<p>
			<center><button type="submit" class="btn btn-success">Enviar</button></center>
		</p>
	</form>
</div>