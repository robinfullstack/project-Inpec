<div class="span8">
	<noscript><p>Para el correcto funcionamiento debe tener el soporte para javascript habilitado</p></noscript>
	{if isset($_error)}
		<br>
		<div class="alert alert-danger">{$_error}</div>
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
		<h3><a href="javascript:void(0);" class="btn btn-default"><strong>Bienvenid@ {Session::get('nombre')}</strong></a></h3>
	<div class="panel panel-default">
		<div class="panel-heading">Actualizar Usuario
		  <a href="#" data-perform="panel-dismiss" data-toggle="tooltip" title="Cerrar Panel" class="pull-right">
			 <em class="fa fa-times"></em>
		  </a>
		  <a href="#" data-perform="panel-collapse" data-toggle="tooltip" title="Cerrar Ventana" class="pull-right">
			 <em class="fa fa-minus"></em>
		  </a>
	   </div>
	   <!-- START table-responsive-->
	   <div class="table-responsive">
		<form name="form1" method="POST" action="" class="form">
			<table class="table table-bordered table-hover">
				 <thead>
					<tr>
						<th style="width: 7%">Nombre</th>
						<th style="width: 4%">Nombre de usuario</th>
						<th style="width: 3%">Contraseña</th>
						<th style="width: 10%">Correo</th>
					</tr>
				 </thead>
				 <tbody >
					<tr>
						<td>
							<div class="input-group m-b">
                                <span class="input-group-addon"><em class="fa fa-user"></em></span>
                                <input type="text" name="nombre" required="required" class="form-control" value="{$usuario.nombre|default:""}" />
								<input type="hidden" value="1" name="enviar" />
                            </div>
						</td>
						<td>
							<div class="input-group m-b">
                                <span class="input-group-addon"><em class="fa fa-check"></em></span>
                                <input type="text" name="usuario" required="required" class="form-control" value="{$usuario.usuario|default:""}" />
                            </div>
						</td>
						<td>
							<div class="input-group m-b">
                                <span class="input-group-addon"><em class="fa fa-lock"></em></span>
                                <input type="password" name="pass" class="form-control" value="" />
                            </div>
						</td>
						<td>
							<div class="input-group m-b">
                                <span class="input-group-addon"><em class="fa fa-check"></em></span>
                                <input type="text" name="email" required="required" class="form-control" value="{$usuario.email|default:""}" />
                            </div>
						</td>
					</tr>
				 </tbody>
			</table>
			<button type="submit" class="btn btn-labeled btn-info" data-dismiss="modal" >
				<span class="btn-label"><i class="fa fa-exclamation"></i></span>Modificar
			</button>
		</form>
		</div>
  </div>
</div>
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