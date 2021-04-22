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
	<div class="panel panel-default" style="padding-left: 43px; padding-top: 10px">
		<div class="panel-heading">Documentación
		  <a href="#" data-perform="panel-dismiss" data-toggle="tooltip" title="Cerrar Panel" class="pull-right">
			 <em class="fa fa-times"></em>
		  </a>
		  <a href="#" data-perform="panel-collapse" data-toggle="tooltip" title="Cerrar Ventana" class="pull-right">
			 <em class="fa fa-minus"></em>
		  </a>
	   </div>
	   <!-- START table-responsive-->
		<table id="allDocs" class="ui celled table nowrap" >
			<thead>
				<tr>
					<th>ID Doc</th>
					<th>Nombre Documento</th>
					<th>Fecha Creación</th>
					<th>Editar</th>
					<th>Ver</th>
				</tr>
			</thead>
			{foreach from=$getAll item=docs}
				<tbody>
						<th>{$docs.idDocs}</th>
						<th>{$docs.nombre_docs}</th>
						<th>{$docs.created_at}</th>
						<th><a href="{$_layoutParams.root}docs/editar/{$docs.idDocs}" class="dropdown-toggle"><i class="fa fa-edit"></i></a></th>
						<th><a href="{$_layoutParams.root}docs/ver/{$docs.idDocs}" class="dropdown-toggle"><i class="fa fa-eye"></i></a></th>
				</tbody>
			{/foreach}
		</table>
		<!-- END table-responsive-->
		<div class="panel-footer">
		  <div class="row">
			<!-- START widget-->
					<div class="panel widget">
						<div class="row row-table row-flush">
							<div class="col-xs-4 bg-info text-center">
							</div>
						<div class="col-xs-8">
							<div class="panel-body text-center">
							</div>
						</div>
						</div>
					</div>
			  <!-- END widget-->
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