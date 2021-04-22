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
		<h3><a href="javascript:void(0);" class="btn btn-default"><strong>Bienvenid@ {Session::get('nombre')}</strong></a></h3>
	<div class="panel panel-default">
		<div class="panel-heading">Administración de Gestores
		  <a href="#" data-perform="panel-dismiss" data-toggle="tooltip" title="Cerrar Panel" class="pull-right">
			 <em class="fa fa-times"></em>
		  </a>
		  <a href="#" data-perform="panel-collapse" data-toggle="tooltip" title="Cerrar Ventana" class="pull-right">
			 <em class="fa fa-minus"></em>
		  </a>
	   </div>
	   <!-- START table-responsive-->
{if isset($usuarios) && count($usuarios)}
	   <div class="table-responsive">
			<table class="table table-bordered table-hover">
				 <thead>
					<tr>
						<th style="width: 1%">ID
						<input type="hidden" name="parametro_url" id="parametro_url" value="{$parametro_url}" /></th>
						<th style="width: 3%">Usuario</th>
						<th style="width: 10%">Nombre de Usuario</th>
						<th style="width: 3%">Rol o Función</th>
						<th style="width: 1%">Editar</th>
						<th style="width: 1%">Permisos</th>
						<th style="width: 1%">Eliminar</th>
					</tr>
				 </thead>
				 {foreach from=$usuarios item=us}
				 <tbody >
					<tr>
						<td>{$us.id}</td>
						<td>{$us.usuario}</td>
						<td>{$us.nombre}</td>
						<td><div class="label label-info pull-right" style="width: 100%">{$us.role}</div></td>
						<td style="width: 20px; text-align: center;">
							<a href="{$_layoutParams.root}usuarios/gestor/editar/{$us.id}" style="height: 30px; margin-left: 30px"><i class="fa fa-edit"></i></a>
						</td>
						<td style="width: 20px; text-align: center;">
							<a href="{$_layoutParams.root}usuarios/index/permisos/{$us.id}" style="height: 30px; margin-left: 30px"><i class="fa fa-lock"></i></a>
						</td>
						<td style="width: 20px; text-align: center;">
							<a href="{$_layoutParams.root}usuarios/gestor/eliminar/{$us.id}" style="height: 30px; margin-left: 30px"><i class="fa fa-trash-o"></i></a>
						</td>
					</tr>
				 </tbody>
				{/foreach}
			</table>
		</div>
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