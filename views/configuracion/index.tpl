<link rel="stylesheet" href="{$_layoutParams.ruta_principal}app/css/bootstrap-select.css">
<link rel="stylesheet" href="{$_layoutParams.ruta_principal}app/css/bootstrap-formhelpers.css">
<link rel="stylesheet" href="{$_layoutParams.ruta_principal}app/css/bootstrap-formhelpers-countries.flags.css">
<link rel="stylesheet" href="{$_layoutParams.ruta_principal}app/css/bootstrap-formhelpers-currencies.flags.css">
<link rel="stylesheet" href="{$_layoutParams.ruta_principal}app/css/cargar-archivo.css" />
<link rel="stylesheet" href="{$_layoutParams.ruta_principal}app/css/semantic/semantic.min.css">

<div class="span8">
	<noscript><p>Para el correcto funcionamiento debe tener el soporte para javascript habilitado</p></noscript>
	{if isset($_error)}
		<div id="_errl" class="alert alert-error">
			<a class="close" data-dismiss="alert">x</a>
			{$_error}
		</div>
	{/if}

	{if isset($_mensaje)}
		<div id="_msgl" class="alert alert-success">
			<a class="close" data-dismiss="alert">x</a>
			{$_mensaje}
		</div>
	{/if}
</div>
{if (Session::get('autenticado'))}
	<div class="panel panel-default">
<div class="panel-body">
	<!-- Nav tabs -->
	<ul class="nav nav-pills">
	   <li class="active"><a href="#home-pills" data-toggle="tab" class="btn btn-default">Opciones principales</a>
	   </li>
	   <!--
	   <li class=""><a href="#profile-pills" data-toggle="tab" class="btn btn-default">Profile</a>
	   </li>
	   <li><a href="#messages-pills" data-toggle="tab" class="btn btn-default">Messages</a>
	   </li>
	   -->
	</ul>
	<!-- Tab panes -->
	<div class="tab-content">
	   <div id="home-pills" class="tab-pane fade active in">

	<!-- Nav tabs -->
	<ul class="nav nav-tabs" style="margin-top: 1%">
	   <li class="active"><a href="#home" data-toggle="tab">Información del negocio</a></li>
	</ul>
	<!-- Tab panes -->
	<div class="tab-content">
	   <div id="home" class="tab-pane fade  active in">
			<div class="row">
			   <div class="col-lg-4">
				  <!-- START panel-->
				  <div class="panel panel-default">
					 <div class="panel-heading">Logo de tu negocio
						<a href="javascript:void(0);" data-perform="panel-collapse" data-toggle="tooltip" title="" class="pull-right" data-original-title="Collapse Panel">
						   <em class="fa fa-minus"></em>
						</a>
					 </div>
					 <script>
					 {literal}
					 (function(e,t,n){var r=e.querySelectorAll("html")[0];r.className=r.className.replace(/(^|\s)no-js(\s|$)/,"$1js$2")})(document,window,0);
					 {/literal}
					 </script>
					 <div class="panel-wrapper collapse in" style="height: auto;"><div class="panel-body">
						<form id="form" action="ajaxupload.php" method="post" enctype="multipart/form-data">
							<input type="file" name="image" id="image" accept="image/*" class="inputfile inputfile-2" />
							<label for="image" style="width: 100%; margin-left: 10%;"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="17" viewBox="0 0 20 17"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/></svg> 
							<span>Seleccionar logo&hellip;</span></label>

							<div id="preview" style="text-align: center; margin-top: 8%">
							{if isset($consulta_imagen) && $consulta_imagen != ''}
								<img src="{$consulta_imagen}">
								{else}
								<em class="fa fa-cloud-upload" style="color: #2a9fda;font-size: 80px;"></em>
							{/if}
							</div><br>
							<input class="btn btn-success" type="submit" value="Upload" style="width: 100%;">
						</form>
						<div id="err"></div>
					 </div><div class="panel-footer"></div></div>
					 
				  </div>
				  <!-- END panel-->
			   </div>
			   <div class="col-lg-8">
				  <!-- START panel-->
				  <div class="panel panel-default">
					 <div class="panel-heading">Datos del negocio
						<a href="javascript:void(0);" data-perform="panel-dismiss" data-toggle="tooltip" title="" class="pull-right" data-original-title="Close Panel">
						   <em class="fa fa-times"></em>
						</a>
					 </div>
					 <form id="form_empresa" action="ajaxupload.php" method="post" enctype="multipart/form-data">
					 <div class="panel-body">
						<div class="col-md-6">
							<fieldset>
								<div class="form-group">
								   <label class="col-sm-3 control-label">Nombre </label>
								   <div class="col-sm-9">
									  <div class="input-group m-b">
										 <span class="input-group-addon"><em class="fa fa-info-circle"></em></span>
										 <input type="text" name="nombre_negocio" id="nombre_negocio" placeholder="Nombre Completo" class="form-control" required="required">
									  </div>
								   </div>
								</div>
							 </fieldset>

							<fieldset>
								<div class="form-group">
								   <label class="col-sm-3 control-label">NIT/RUT: </label>
								   <div class="col-sm-9">
									  <div class="input-group m-b">
										 <span class="input-group-addon"><em class="fa fa-info-circle"></em></span>
										 <input type="text" name="nit_rut" placeholder="Número de documento" class="form-control" required="required">
									  </div>
								   </div>
								</div>
							 </fieldset>

							<fieldset>
								<div class="form-group">
								   <label class="col-sm-3 control-label">Contacto: </label>
								   <div class="col-sm-9">
									  <div class="input-group m-b">
										 <span class="input-group-addon"><em class="fa fa-info-circle"></em></span>
										 <input type="text" name="nombre_contacto" placeholder="Nombre de contacto" class="form-control" required="required">
									  </div>
								   </div>
								</div>
							 </fieldset>

							<fieldset>
								<div class="form-group">
								   <label class="col-sm-3 control-label">Dirección: </label>
								   <div class="col-sm-9">
									  <div class="input-group m-b">
										 <span class="input-group-addon"><em class="fa fa-info-circle"></em></span>
										 <input type="text" name="direccion" placeholder="Del negocio" class="form-control" required="required">
									  </div>
								   </div>
								</div>
							 </fieldset>

							<fieldset style="padding-bottom: 0px; margin-bottom: 0px;">
								<div class="form-group">
								   <label class="col-sm-3 control-label">Régimen: </label>
								   <div class="col-sm-9">
									  <div class="input-group m-b">
										<select name="regimen" id="regimen" class="chosen-select">
											<option value="0">Seleccione</option>
											<option value="1">Régimen común</option>
											<option value="2">Régimen simplificado</option>
										 </select>
									  </div>
								   </div>
								</div>
							 </fieldset>
						</div>

						<div class="col-md-6">
							<fieldset>
								<div class="form-group">
								   <label class="col-sm-3 control-label">Teléfono: </label>
								   <div class="col-sm-9">
									  <div class="input-group m-b">
										 <span class="input-group-addon"><em class="fa fa-info-circle"></em></span>
										 <input type="text" name="telefono" placeholder="Del negocio o personal" class="form-control" required="required">
									  </div>
								   </div>
								</div>
							 </fieldset>

							<fieldset>
								<div class="form-group">
								   <label class="col-sm-3 control-label">Correo: </label>
								   <div class="col-sm-9">
									  <div class="input-group m-b">
										 <span class="input-group-addon"><em class="fa fa-info-circle"></em></span>
										 <input id="correo-electronico" name="email" type="text" placeholder="electrónico" class="form-control">
									  </div>
								   </div>
								</div>
							 </fieldset>

							<fieldset>
								<div class="form-group">
								   <label class="col-sm-3 control-label">País: </label>
								   <div class="col-sm-9">
									  <div class="input-group m-b">
										<div class="bfh-selectbox bfh-countries" data-country="CO" data-flags="true">
										  <input type="hidden" name="codigo_pais" value="">
										  <a class="bfh-selectbox-toggle" role="button" data-toggle="bfh-selectbox" href="#">
											<span class="bfh-selectbox-option input-medium" data-option=""></span>
											<b class="caret"></b>
										  </a>
										  <div class="bfh-selectbox-options">
											<input type="text" class="bfh-selectbox-filter">
											<div role="listbox">
											  <ul id="select-enlace" role="option">
											  </ul>
											</div>
										  </div>
										</div>
									  </div>
								   </div>
								</div>
							 </fieldset>

							<fieldset>
								<div class="form-group">
								   <label class="col-sm-3 control-label">Moneda</label>
								   <div class="col-sm-9">
									  <div class="input-group m-b">
										<div class="bfh-selectbox bfh-currencies" data-currency="COP" data-flags="true">
										  <input type="hidden" name="moneda" value="">
										  <a class="bfh-selectbox-toggle" role="button" data-toggle="bfh-selectbox" href="#">
											<span class="bfh-selectbox-option input-medium" data-option=""></span>
											<b class="caret"></b>
										  </a>
										  <div class="bfh-selectbox-options">
											<input type="text" class="bfh-selectbox-filter">
											<div role="listbox">
											<ul role="option" >
											</ul>
											</div>
										  </div>
										</div>
									  </div>
								   </div>
								</div>
							 </fieldset>

							<fieldset style="padding-bottom: 0px; margin-bottom: 0px;">
								<div class="form-group">
								   <label class="col-sm-3 control-label">Zona horaria: </label>
								   <div class="col-sm-9">
									  <div class="input-group m-b">
										<select name="zona_horaria" id="zona_horaria" data-value="" class="form-control m-b">
											<option value="">Seleccionar</option>
											<option value="Pacific/Midway">(GMT-11:00) Midway Island</option><option value="US/Samoa">(GMT-11:00) Samoa</option><option value="US/Hawaii">(GMT-10:00) Hawaii</option><option value="US/Alaska">(GMT-09:00) Alaska</option><option value="US/Pacific">(GMT-08:00) Pacific Time (US &amp; Canada)</option><option value="America/Tijuana">(GMT-08:00) Tijuana</option><option value="US/Arizona">(GMT-07:00) Arizona</option><option value="US/Mountain">(GMT-07:00) Mountain Time (US &amp; Canada)</option><option value="America/Chihuahua">(GMT-07:00) Chihuahua</option><option value="America/Mazatlan">(GMT-07:00) Mazatlan</option><option value="America/Mexico_City">(GMT-06:00) Mexico City</option><option value="America/Monterrey">(GMT-06:00) Monterrey</option><option value="Canada/Saskatchewan">(GMT-06:00) Saskatchewan</option><option value="US/Central">(GMT-06:00) Central Time (US &amp; Canada)</option><option value="US/Eastern">(GMT-05:00) Eastern Time (US &amp; Canada)</option><option value="US/East-Indiana">(GMT-05:00) Indiana (East)</option><option value="America/Bogota">(GMT-05:00) Bogota</option><option value="America/Lima">(GMT-05:00) Lima</option><option value="America/Caracas">(GMT-04:30) Caracas</option><option value="Canada/Atlantic">(GMT-04:00) Atlantic Time (Canada)</option><option value="America/La_Paz">(GMT-04:00) La Paz</option><option value="America/Santiago">(GMT-04:00) Santiago</option><option value="Canada/Newfoundland">(GMT-03:30) Newfoundland</option><option value="America/Buenos_Aires">(GMT-03:00) Buenos Aires</option><option value="Greenland">(GMT-03:00) Greenland</option><option value="Atlantic/Stanley">(GMT-02:00) Stanley</option><option value="Atlantic/Azores">(GMT-01:00) Azores</option><option value="Atlantic/Cape_Verde">(GMT-01:00) Cape Verde Is.</option><option value="Africa/Casablanca">(GMT) Casablanca</option><option value="Europe/Dublin">(GMT) Dublin</option><option value="Europe/Lisbon">(GMT) Lisbon</option><option value="Europe/London">(GMT) London</option><option value="Africa/Monrovia">(GMT) Monrovia</option><option value="Europe/Amsterdam">(GMT+01:00) Amsterdam</option><option value="Europe/Belgrade">(GMT+01:00) Belgrade</option><option value="Europe/Berlin">(GMT+01:00) Berlin</option><option value="Europe/Bratislava">(GMT+01:00) Bratislava</option><option value="Europe/Brussels">(GMT+01:00) Brussels</option><option value="Europe/Budapest">(GMT+01:00) Budapest</option><option value="Europe/Copenhagen">(GMT+01:00) Copenhagen</option><option value="Europe/Ljubljana">(GMT+01:00) Ljubljana</option><option value="Europe/Madrid">(GMT+01:00) Madrid</option><option value="Europe/Paris">(GMT+01:00) Paris</option><option value="Europe/Prague">(GMT+01:00) Prague</option><option value="Europe/Rome">(GMT+01:00) Rome</option><option value="Europe/Sarajevo">(GMT+01:00) Sarajevo</option><option value="Europe/Skopje">(GMT+01:00) Skopje</option><option value="Europe/Stockholm">(GMT+01:00) Stockholm</option><option value="Europe/Vienna">(GMT+01:00) Vienna</option><option value="Europe/Warsaw">(GMT+01:00) Warsaw</option><option value="Europe/Zagreb">(GMT+01:00) Zagreb</option><option value="Europe/Athens">(GMT+02:00) Athens</option><option value="Europe/Bucharest">(GMT+02:00) Bucharest</option><option value="Africa/Cairo">(GMT+02:00) Cairo</option><option value="Africa/Harare">(GMT+02:00) Harare</option><option value="Europe/Helsinki">(GMT+02:00) Helsinki</option><option value="Europe/Istanbul">(GMT+02:00) Istanbul</option><option value="Asia/Jerusalem">(GMT+02:00) Jerusalem</option><option value="Europe/Kiev">(GMT+02:00) Kyiv</option><option value="Europe/Minsk">(GMT+02:00) Minsk</option><option value="Europe/Riga">(GMT+02:00) Riga</option><option value="Europe/Sofia">(GMT+02:00) Sofia</option><option value="Europe/Tallinn">(GMT+02:00) Tallinn</option><option value="Europe/Vilnius">(GMT+02:00) Vilnius</option><option value="Asia/Baghdad">(GMT+03:00) Baghdad</option><option value="Asia/Kuwait">(GMT+03:00) Kuwait</option><option value="Africa/Nairobi">(GMT+03:00) Nairobi</option><option value="Asia/Riyadh">(GMT+03:00) Riyadh</option><option value="Europe/Moscow">(GMT+03:00) Moscow</option><option value="Asia/Tehran">(GMT+03:30) Tehran</option><option value="Asia/Baku">(GMT+04:00) Baku</option><option value="Europe/Volgograd">(GMT+04:00) Volgograd</option><option value="Asia/Muscat">(GMT+04:00) Muscat</option><option value="Asia/Tbilisi">(GMT+04:00) Tbilisi</option><option value="Asia/Yerevan">(GMT+04:00) Yerevan</option><option value="Asia/Kabul">(GMT+04:30) Kabul</option><option value="Asia/Karachi">(GMT+05:00) Karachi</option><option value="Asia/Tashkent">(GMT+05:00) Tashkent</option><option value="Asia/Kolkata">(GMT+05:30) Kolkata</option><option value="Asia/Kathmandu">(GMT+05:45) Kathmandu</option><option value="Asia/Yekaterinburg">(GMT+06:00) Ekaterinburg</option><option value="Asia/Almaty">(GMT+06:00) Almaty</option><option value="Asia/Dhaka">(GMT+06:00) Dhaka</option><option value="Asia/Novosibirsk">(GMT+07:00) Novosibirsk</option><option value="Asia/Bangkok">(GMT+07:00) Bangkok</option><option value="Asia/Jakarta">(GMT+07:00) Jakarta</option><option value="Asia/Krasnoyarsk">(GMT+08:00) Krasnoyarsk</option><option value="Asia/Chongqing">(GMT+08:00) Chongqing</option><option value="Asia/Hong_Kong">(GMT+08:00) Hong Kong</option><option value="Asia/Kuala_Lumpur">(GMT+08:00) Kuala Lumpur</option><option value="Australia/Perth">(GMT+08:00) Perth</option><option value="Asia/Singapore">(GMT+08:00) Singapore</option><option value="Asia/Taipei">(GMT+08:00) Taipei</option><option value="Asia/Ulaanbaatar">(GMT+08:00) Ulaan Bataar</option><option value="Asia/Urumqi">(GMT+08:00) Urumqi</option><option value="Asia/Irkutsk">(GMT+09:00) Irkutsk</option><option value="Asia/Seoul">(GMT+09:00) Seoul</option><option value="Asia/Tokyo">(GMT+09:00) Tokyo</option><option value="Australia/Adelaide">(GMT+09:30) Adelaide</option><option value="Australia/Darwin">(GMT+09:30) Darwin</option><option value="Asia/Yakutsk">(GMT+10:00) Yakutsk</option><option value="Australia/Brisbane">(GMT+10:00) Brisbane</option><option value="Australia/Canberra">(GMT+10:00) Canberra</option><option value="Pacific/Guam">(GMT+10:00) Guam</option><option value="Australia/Hobart">(GMT+10:00) Hobart</option><option value="Australia/Melbourne">(GMT+10:00) Melbourne</option><option value="Pacific/Port_Moresby">(GMT+10:00) Port Moresby</option><option value="Australia/Sydney">(GMT+10:00) Sydney</option><option value="Asia/Vladivostok">(GMT+11:00) Vladivostok</option><option value="Asia/Magadan">(GMT+12:00) Magadan</option><option value="Pacific/Auckland">(GMT+12:00) Auckland</option><option value="Pacific/Fiji">(GMT+12:00) Fiji</option>                                        </select>
									  </div>
								   </div>
								</div>
							</fieldset>
						</div>
						</div>
						<div class="panel-footer text-center">
							<button type="submit" class="btn btn-labeled btn-info" id="guardar_datos">
								<span class="btn-label"><i class="fa fa-exclamation"></i></span>Guardar datos
							</button>
						</div>
						</form>
				  </div>
				  <!-- END panel-->
			   </div>
			</div>
	   </div>
	   <div id="profile" class="tab-pane fade">
			<div id="accordion" class="panel-group">
			   <!-- START panel-->
			   <div class="panel panel-default" style="overflow: inherit;">
				  <div class="panel-heading">
					 <h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">Seleccionar empleado</a>
					 </h4>
				  </div>
				  <div id="collapseOne" class="panel-collapse collapse in">
					 <div class="panel-body">
						<div class="col-lg-2">
							<div class="brand-logo" >
								<img src="{$_layoutParams.ruta_principal}app/img/user/usuario-enlacepos.png" alt="Enlace POS" style="width: 80%"  />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="input-group m-b">
								{literal}
									<select name="seleccion-usuario" id="seleccion-usuario" class="form-control m-b" style="border-radius: 6px;" >
										<option value="0">Seleccione empleado</option>
										<option ng-repeat="i in items" value="{{i.id}}">{{i.name}}</option>
									</select>
								{/literal}
							</div>
						</div>
						<div class="col-lg-7">
							<button type="button" class="btn btn-labeled btn-default" data-toggle="modal" data-target="#registro_gestor">Crear Empleado
								<span class="btn-label btn-label-right" style="right: -8px;"><i class="fa fa-user"></i>
								</span>
							</button>
						</div>
					</div>
				  </div>
			   </div>
			   <!-- END panel-->
			   <!-- START panel-->
			   <div class="panel panel-default">
				  <div class="panel-heading">
					 <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">Configurar opciones</a>
					 </h4>
				  </div>
				  <div id="collapseTwo" class="panel-collapse collapse">
					 <div class="panel-body">Info</div>
				  </div>
			   </div>
			   <!-- END panel-->
			</div>
	   </div>
	   <div id="impresora" class="tab-pane fade">
		  <div class="panel-wrapper collapse in" style="height: auto;"><div class="table-responsive">
			<table class="table table-bordered table-hover" style="border: 1px solid #eeeeee;">
				<thead>
					<tr>
						<th style="width: 50%">Nombre Impresora</th>
						<th style="width: 50%">Fecha Registro</th>
					</tr>
				 </thead>
				 <!-- ngRepeat: impresora in tabla_impresora -->
				 <tbody ng-repeat="impresora in tabla_impresora">
					{literal}
						<tr>
							<td style="width: 50%; font-size: 21px;" >{{impresora.nombre_impresora}}</td>
							<td style="width: 50%">{{impresora.fecha_registro}}</td>
						</tr>
					{/literal}
				 </tbody>
			</table>
		</div><div class="panel-footer">
		  <div class="row">
			<div class="alert alert-info">
				Ingresa el nombre que asociaste al crear la impresora.
			</div>
		  </div>
		</div><center>
			<div class="panel widget" style="width: 200px;">
				<a href="javascript:void(0);" data-toggle="modal" data-target="#nombreImpresora" class="dropdown-toggle">
					<div class="panel-body bg-info text-center">
						<div class="radial-bar radial-bar-100 radial-bar radial-bar-danger m0">
						</div>
						<p>
							<strong>Ingresar o Actualizar Nombre de Impresora</strong>
						</p>
					</div>
				</a>
			</div>
		</center></div>
	   </div>
	   <div id="banco" class="tab-pane fade">
			<div class="panel-wrapper collapse in" style="height: auto;"><div class="table-responsive">
			<table class="table table-bordered table-hover" style="border: 1px solid #eeeeee;">
				<thead>
					<tr>
						<th style="width: 70%">Descripción Cuenta Bancaria APP</th>
						<th style="width: 10%">Fecha Registro</th>
					</tr>
				 </thead>
				 <!-- ngRepeat: cuenta in tabla_cuenta --><tbody ng-repeat="cuenta in tabla_cuenta" class="ng-scope">
						{literal}
							<tr>
								<td style="width: 50%; font-size: 21px;" >{{cuenta.descripcion_cuenta}}</td>
								<td style="width: 50%">{{cuenta.fecha_registro}}</td>
							</tr>
						{/literal}
				 </tbody>
				</table>
				</div>
				<div class="panel-footer">
				  <div class="row">
					<div class="alert alert-info">
						Ingresa la descripción que debe aparecer en la factura con el fin que el cliente pueda pagar por la cuenta bancaria APP. Ejemplo: APP BANCOLOMBIA AHORROS: 31676199881.
					</div>
				  </div>
				</div>
				<center>
				<div class="panel widget" style="width: 200px;">
					<a href="javascript:void(0);" data-toggle="modal" data-target="#cuentaBancaria" class="dropdown-toggle">
						<div class="panel-body bg-info text-center" style="background-color: #e9b734; font-size: 19px;">
							<div class="radial-bar radial-bar-100 radial-bar radial-bar-danger m0">
							</div>
							<p>
								<strong>Ingresar o Actualizar Descripción Cuenta Bancaria</strong>
							</p>
						</div>
					</a>
				</div>
			</center>
		</div>
	   </div>
	   <div id="domiciliarios" class="tab-pane fade">
			<div id="accordion" class="panel-group">
			   <!-- START panel-->
			   <div class="panel panel-default" style="overflow: inherit;">
				  <div class="panel-heading">
					 <h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">Seleccionar domiciliario</a>
					 </h4>
				  </div>
				  <div id="collapseOne" class="panel-collapse collapse in">
					 <div class="panel-body">
						<div class="col-lg-2">
							<div class="brand-logo" >
								<img src="{$_layoutParams.ruta_principal}app/img/user/domiciliario-200.png" alt="Enlace POS" style="width: 80%"  />
							</div>
						</div>
						<div class="col-lg-3">
							<div class="input-group m-b">
								{literal}
									<select name="seleccion-usuario" id="seleccion-usuario" class="form-control m-b" style="border-radius: 6px;" >
										<option value="0">Seleccione domiciliario</option>
										<option ng-repeat="i in items" value="{{i.id}}">{{i.name}}</option>
									</select>
								{/literal}
							</div>
						</div>
						<div class="col-lg-7">
							<button type="button" class="btn btn-labeled btn-default" data-toggle="modal" data-target="#registro_dom">Crear Domiciliario
							   <span class="btn-label btn-label-right" style="right: -8px;"><i class="fa fa-user"></i>
							   </span>
							</button>
						</div>
					</div>
				  </div>
			   </div>
			   <!-- END panel-->
			   <!-- START panel-->
			   <div class="panel panel-default">
				  <div class="panel-heading">
					 <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">Configurar opciones</a>
					 </h4>
				  </div>
				  <div id="collapseTwo" class="panel-collapse collapse">
					 <div class="panel-body">Info</div>
				  </div>
			   </div>
			   <!-- END panel-->
			</div>
	   </div>
	</div>

	   </div>
	   <!-- <div id="profile-pills" class="tab-pane fade">
		  <h4>Profile Tab</h4>
		  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
			 consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
	   </div>
	   <div id="messages-pills" class="tab-pane fade">
		  <h4>Messages Tab</h4>
		  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
			 consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
	   </div>
	   -->
	   <div id="settings-pills" class="tab-pane fade">
			<!-- Nav tabs -->
			<ul class="nav nav-tabs">
			   <li class="active"><a href="#home" data-toggle="tab">Seleccione</a></li>
			</ul>
			<!-- Tab panes -->
			<div class="tab-content">
			   <div id="home" class="tab-pane fade in active">
					<h3><a href="javascript:void(0);" class="btn btn-default"><strong>Bienvenid@ {Session::get('nombre')}</strong></a></h3>
					<div class="panel widget" >
						<div class="col-lg-6">
						<!-- START panel-->
						<div class="panel panel-default">
						<a href="{$_layoutParams.root}usuarios/profesional" class="dropdown-toggle">
							<div class="panel-body bg-info text-center" style="background-color: #eaeaea; color: #000">
								<div class="radial-bar radial-bar-100 radial-bar radial-bar-danger m0">
								</div>
								<p><strong>Administradores</strong></p>
								<p><span>Administradores encargados de las labores principales del sistema.</span></p>
							</div>
						</a>
						</div>
						</div>

						<div class="col-lg-6">
						<!-- START panel-->
						<div class="panel panel-default">
						<a href="{$_layoutParams.root}usuarios/gestor" class="dropdown-toggle">
							<div class="panel-body bg-info text-center" style="background-color: #eaeaea; color: #000">
								<div class="radial-bar radial-bar-100 radial-bar radial-bar-danger m0">
								</div>
								<p><strong>Gestor</strong></p>
								<p><span>Usuarios encargados de labores básicas en el sistema.</span></p>
							</div>
						</a>
						</div>
						</div>
					</div>
			   </div>
			</div>
	   </div>
	</div>
 </div>
		<!-- END widget-->
	</div>
{else}
	  <form method="post" data-parsley-validate="" novalidate="">
		<input type="hidden" value="1" name="enviar" />
		 <!-- START panel-->
		 <div class="panel panel-default">
			<div class="panel-heading">
			   <div class="panel-title">Iniciar Sesión</div>
			</div>
			<div class="panel-body">
			   <div class="form-group">
				  <label class="control-label">Usuario *</label>
				  <input type="text" name="usuario" required class="form-control">
			   </div>
			   <div class="form-group">
				  <label class="control-label">Contraseña *</label>
				  <input type="password" name="pass" required class="form-control">
			   </div>
			   <div class="required">* Campos requeridos</div>
			</div>
			<div class="panel-footer">
			   <button type="submit" class="btn btn-primary">Entrar</button>
			</div>
		 </div>
		 <!-- END panel-->
	  </form>
{/if}
<script src="{$_layoutParams.ruta_principal}jquery-1.10.1.min.js" type="text/javascript"></script>
<style>
@charset "utf-8";
/* CSS Document */


	body{
		background: #E7EDEE;
		width: 100%;
		margin: 0;
		padding: 0;
	}
	
	#preview {
		margin-top:10px;
	}
	#err{
		color: red;
	}
	#preview img{
		max-width: 100%;
		border: solid #cdcdcd 1px;
		padding:5px;
		border-radius: 3px;
		-webkit-box-shadow: 0px 2px 5px 0px rgba(0, 0, 0, .2);
		box-shadow: 0px 2px 5px 0px rgba(0, 0, 0, .2);
		overflow: hidden;
		width:200px;
		height:220px;
	}
	
</style>

<script type="text/javascript">
var _root_ = '{$_layoutParams.root}';
$(document).ready(function (e) {

//Ingreso de datos de la empresa
  $("#form_empresa").on('submit',(function(e) {
	e.preventDefault();
	$.ajax({
	   url: _root_ + "configuracion/insertarConfig",
	   type: "POST",
	   data:  new FormData(this),
	   contentType: false,
	   cache: false,
	   processData:false,
	   success: function(data){
		$('#empresa_ingreso').trigger('click');
		$("#form_empresa")[0].reset();
	   },error: function(e) {
		 $('#error_ingreso').trigger('click');
	   }          
	});
 }));

//Carga de imagen de la empresa
  $("#form").on('submit',(function(e) {
	e.preventDefault();
	$.ajax({
	   url: _root_ + "configuracion/ajaxUpload",
	   type: "POST",
	   data:  new FormData(this),
	   contentType: false,
	   cache: false,
	   processData:false,
	   success: function(data){
		if(data=='invalid'){
		 //Formato inválido.
		 $("#err").html("¡Formato inválido!").fadeIn();
		}
		else{
		 //Visualización de archivo cargado.
		 $("#preview").html(data).fadeIn();
		 $("#form")[0].reset(); 
		}
		},error: function(e){
			$('#error_ingreso').trigger('click');
		}
	});
 }));
});
</script>