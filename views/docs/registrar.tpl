
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
 <!-- START Page content-->
 <section class="main-content">
<!-- START row-->
<div class="row">
   <div class="col-md-12">
		 <!-- START panel-->
		 <div class="panel panel-default">
			<form method="POST" name="form_docs" id="form_docs" data-parsley-validate="" novalidate="" class="form-horizontal">
			<div class="panel-heading">
				<div class="panel-title"><strong> Registrar documentación: </strong> Utilice esta opción para registrar una nueva página.
				</div>
			</div>
			<div class="panel-body">
					 <div class="table-responsive">
							<table class="table table-striped table-bordered table-hover">
								<tbody >
									<tr>
										<td>Nombre archivo</td>
										<td><input type="text" name="nombre_docs" id="nombre_docs" required="required" class="form-control" /></td>
									</tr>
									<tr>
										<td>Contenido</td>
										<td>

                                        <script src="https://cdn.tiny.cloud/1/4j3w128qxe12t5k6pikg2t0uagkjgvawiikatg5n1eh6h249/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>

										{literal}
										<textarea name="contenido_docs" id="contenido_docs" data-uk-markdownarea="{mode:'tab'}" placeholder="# Escriba aquí" onload="this.value='#Título'"></textarea>
										{/literal}

										</td>
									</tr>
								</tbody>
							</table>
					 </div>
			</div>

			<div class="panel-footer text-center">
					<button type="button" id="registrar_docs" class="btn btn-labeled btn-info" >
								<span class="btn-label"><i class="fa fa-exclamation"></i>
								</span>Registrar</button>
					<button id="cancelar" type="button" class="btn btn-labeled btn-warning">
							<span class="btn-label"><i class="fa fa-warning"></i>
							</span>Cancelar</button>
					<button id="limpiar" type="button" class="btn btn-labeled btn-default">
							<span class="btn-label"><i class="fa fa-default"></i>
							</span>Limpiar</button>
			</div>
			</form>
		 </div>
		 <!-- END panel-->
   </div>
</div>
<!-- END row-->
</section>
<!-- END Page content-->
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
{literal}
$('#registrar_docs').click(function() {
	var nombre_docs = $("#nombre_docs").val();

	if(nombre_docs != ""){
		$.ajax({
			  type : "POST",
			  url : _root_ + "docs/registrar",
			  dataType: 'json',
			  data: {
				action: 'insertarDocs',
				nombre_docs: nombre_docs,
				contenido_docs: tinyMCE.activeEditor.getContent()
			},
			success: function (devolver){
				$(location).attr('href', _root_ + 'docs/ver/' + devolver);
			}
		});

		$('#registro_aprobado').trigger('click');
	}
	else
	{
		$('#faltan_datos').trigger('click');
	}
});

$('#limpiar').click(function(){
	$("#nombre_docs").val("");
	$("#contenido_docs").val("");
});

$('#cancelar').click(function(){
	$(location).attr('href', _root_);
});

{/literal}
</script>