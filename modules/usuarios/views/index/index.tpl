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
<style>
.bg-info:hover{
	background-color: #e9b734;
}
</style>
<div class="panel panel-default">
	<div class="panel-body">
	<h3><a href="javascript:void(0);" class="btn btn-default"><strong>Bienvenid@ {Session::get('nombre')}</strong></a></h3>

 <div class="panel panel-primary">
	<div class="panel-heading">
	  <h3 class="panel-title">Seleccione</h3>
	</div>
	<div class="panel-body">
	<div class="panel widget" >
		<div class="col-lg-6">
		<!-- START panel-->
		<div class="panel panel-default">
		<a href="{$_layoutParams.root}usuarios/profesional" class="dropdown-toggle">
			<div class="panel-body bg-info text-center">
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
			<div class="panel-body bg-info text-center">
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