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
	<button type="button" class="btn btn-labeled btn-primary pull-right" onclick="location.href='{$_layoutParams.root}usuarios/profesional/'" >
	<span class="btn-label"><i class="fa fa-plus-circle"></i>
	</span>Ir a la página anterior</button>

	<h3><a href="javascript:void(0);" class="btn btn-default"><strong>Bienvenid@ {Session::get('nombre')}</strong></a></h3>
	<div class="panel panel-default">
		<div class="panel-heading">Administración de permisos de usuario
		  <a href="#" data-perform="panel-dismiss" data-toggle="tooltip" title="Cerrar Panel" class="pull-right">
			 <em class="fa fa-times"></em>
		  </a>
		  <a href="#" data-perform="panel-collapse" data-toggle="tooltip" title="Cerrar Ventana" class="pull-right">
			 <em class="fa fa-minus"></em>
		  </a>
	   </div>
	   <!-- START table-responsive-->
	<form name="form1" method="post" action="">
		<input type="hidden" name="guardar" value="1" />
	{if isset($permisos) && count($permisos)}
		<div class="table-responsive">
			<table class="table table-bordered table-hover">
				 <thead>
					<tr>
						<th style="width: 1%">Permiso</th>
						<th style="width: 10%">Estado</th>
					</tr>
				 </thead>
				{foreach from=$permisos item=pr}
				{if $role.$pr.valor == 1}
					{assign var="v" value="habilitado"}
				{else}
					{assign var="v" value="denegado"}
				{/if}
				 <tbody >
					<tr>
						<td>{$usuario.$pr.permiso}</td>
						<td>
							<select name="perm_{$usuario.$pr.id}" style="width: 260px;" class="chosen-select">
								<option value="1"{if ($usuario.$pr.valor == 1 && $usuario.$pr.heredado == "")} selected="selected"{/if}>Habilitado</option>
								<option value=""{if ($usuario.$pr.valor == "" && $usuario.$pr.heredado == "")} selected="selected"{/if}>Denegado</option>
							</select>
						</td>
					</tr>
				 </tbody>
				{/foreach}
			</table>
		</div>
			<button type="submit" class="btn btn-labeled btn-info" data-dismiss="modal" >
				<span class="btn-label"><i class="fa fa-exclamation"></i></span>Guardar Actualización
			</button>
		</form>
{/if}
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