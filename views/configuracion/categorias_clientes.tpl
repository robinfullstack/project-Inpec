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
		<div class="panel-heading">Categorías de clientes
			<a href="#" data-perform="panel-dismiss" data-toggle="tooltip" title="Cerrar Panel" class="pull-right">
				<em class="fa fa-times"></em>
			</a>
			<a href="#" data-perform="panel-collapse" data-toggle="tooltip" title="Cerrar Ventana" class="pull-right">
			 <em class="fa fa-minus"></em>
			</a>
		</div>
		<!-- START table-responsive-->
		<div class="table-responsive">
			<table class="table table-bordered table-hover">
				<thead>
					<tr>
						<th style="width: 70%">Categoría</th>
						<th style="width: 10%">Tipo de Cambio</th>
						<th style="width: 10%">Modificar</th>
						<th style="width: 10%">Eliminar</th>
					</tr>
				 </thead>
				 <tbody ng-repeat="categorias in tabla_categorias">
						{literal}
							<tr>
								<td >{{categorias.nombre_categoria}}</td>
								<td>{{categorias.tipo_cambio}}</td>
								<td style="width: 20px; text-align: center;" >
									<a href="#"  ng-click="editarCategoria($index);" data-toggle="modal" data-target="#editar" class="dropdown-toggle"><i class="fa fa-edit"></i></a>
								</td>
								<td style="width: 20px; text-align: center;" >
									<a href="#"  ng-click="informacionCliente($index);" data-toggle="modal" data-target="#informacion" class="dropdown-toggle"><i class="fa fa-users"></i></a>
								</td>
							</tr>
						{/literal}
				 </tbody>
			</table>
		</div>
		<!-- END table-responsive-->
		<div class="panel-footer">
		  <div class="row">
			<div class="alert alert-info">
				Crea diferentes categorías para segmentar a tus clientes.
			</div>
		  </div>
		</div>
		<!-- START widget-->
		<center>
			<div class="panel widget" style="width: 200px;" >
				<a href="#"  data-toggle="modal" data-target="#agregarCategoria" class="dropdown-toggle">
					<div class="panel-body bg-info text-center">
						<div class="radial-bar radial-bar-100 radial-bar radial-bar-danger m0">
						</div>
						<p>
							<strong>Nueva categoría</strong>
						</p>
					</div>
				</a>
			</div>
		</center>
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