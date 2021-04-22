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
<section class="main-content">
	<h3 style="display: none">Administrador
	   <br>
	   <small>Bienvenid@ {Session::get('nombre')}</small>
	</h3>
	<div class="row">
	   <!-- START dashboard main content-->
	   <div class="col-md-9">
		  <!-- START Secondary Widgets-->
		   <div class="row">
			 <div class="col-md-12" style="background-color: #fff; padding-left: 74px !important; padding-top: 17px !important">

            <div class="tip-product-name">Introducción</div>
            <span class="label u-mobile-hide" data-js="product-section-label"></span>
            <p>
                Para un desarrollador y un Analista TI, siempre es imprescindible contar con documentación confiable. La
                presencia de documentación ayuda a realizar un seguimiento de todos los aspectos de una aplicación y
                mejora la calidad de un producto de software. Sus principales enfoques son el desarrollo, mantenimiento
                y transferencia de conocimiento a otros integrantes del equipo. </p>
            <ul>
                <li>La documentación exitosa hará que la información sea fácilmente accesible</li>
                <li>Ayudará a los nuevos usuarios a aprender rápidamente, simplificará el producto.</li>
                <li>Ayudará a reducir los costos de soporte.</li>
            </ul>

            <p>
                La documentación generalmente se centra en los siguientes componentes que conforman una aplicación:</p>

            <ul>
                <li>Entornos de servidor.</li>
                <li>Reglas de negocio.</li>
                <li>Base de datos / archivos.</li>
                <li>Resolución de problemas.</li>
                <li>Instalación de aplicaciones e implementación de código.</li>
            </ul>

            <blockquote class="dx-blockquote-note">
                <p>Para tal fin, es de gran importancia que la documentación, presente las siguientes
                    características:</p>

                <ul>
                    <li>Fácil acceso.</li>
                    <li>Organización adecuada de la información.</li>
                    <li>Fácil comprensión, como lo es la implementación de ayudas visuales.</li>
                    <li>Fácil búsqueda.</li>
                </ul>
            </blockquote>

            <p><strong>Fácil acceso:</strong> Ya que nuestro modelo es Software as a Service lo recomendable es poder
                acceder a la documentación a partir del sistema siendo este nuestro foco constante..</p>

            <p><strong>Organización adecuada de la información:</strong> Uso de menú que nos permita indexar de manera
                adecuada.</p>

            <p><strong>Fácil comprensión:</strong></p>

            <p><strong>Fácil búsqueda:</strong> Podremos brindar mejoras constantes que nos permita implementar opciones
                avanzadas de búsqueda.</p>

			 </div>

		  </div>

	   </div>
	   <!-- END dashboard main content-->
	   <!-- START dashboard sidebar-->
	   <div class="col-md-3">
		  <!-- START messages-->
	
		  <!-- END messages-->
		  <!-- START activity-->
		  <div class="panel panel-default2">
			 <div class="panel-heading">
				<div class="panel-title">Notas y Mensajes</div>
			 </div>
			{foreach from=$reporte_notas item=rn}
				 <!-- START list group-->
				 <div class="list-group">
					<!-- START list group item-->
					<div class="list-group-item">
					   <div class="media">
						  <div class="pull-left">
							 <span class="fa-stack fa-lg">
								<em class="fa fa-circle fa-stack-2x " 
								{if $rn.prioridad == 0} style="color: #48953d"
								{elseif $rn.prioridad == 1}style="color: #01b6ad"
								{elseif $rn.prioridad == 2}style="color: #3498db"
								{elseif $rn.prioridad == 3}style="color: #e9b734"
								{elseif $rn.prioridad == 4}style="color: #f6504d"{/if}
								></em>
								<em class="fa {if $rn.prioridad == 0} fa-archive
								{elseif $rn.prioridad == 1} fa-cloud-upload
								{elseif $rn.prioridad == 2} fa-dashboard
								{elseif $rn.prioridad == 3} fa-fire-extinguisher
								{elseif $rn.prioridad == 4} fa-exclamation {/if} fa-stack-1x fa-inverse text-white"></em>
							 </span>
						  </div>
						  <div class="media-body clearfix" id="id_notas_p">
							 <div class="media-heading m0" 
							 {if $rn.prioridad == 0} style="color: #48953d"
								{elseif $rn.prioridad == 1}style="color: #01b6ad"
								{elseif $rn.prioridad == 2}style="color: #3498db"
								{elseif $rn.prioridad == 3}style="color: #e9b734"
								{elseif $rn.prioridad == 4}style="color: #f6504d"{/if}>{$rn.titulo}
								<input  type="hidden" name="id_notas{$rn.id_notas}" id="id_notas{$rn.id_notas}" value="{$rn.id_notas}" />
								<span id="{$rn.id_notas}" style="cursor: pointer;" data-id='{$rn.id_notas}' data-toggle="tooltip" title="" data-original-title="Desactivar Nota" {if $rn.prioridad == 0} style="color: #48953d"
								{elseif $rn.prioridad == 1}style="color: #01b6ad"
								{elseif $rn.prioridad == 2}style="color: #3498db"
								{elseif $rn.prioridad == 3}style="color: #e9b734"
								{elseif $rn.prioridad == 4}style="color: #f6504d"{/if}>
								<small class="pull-right" style="margin-top: 8%;"><sup class="fa fa-times" style="font-size: 18px;"></sup></small></span></div>
							 <p class="m0">
								<small>{$rn.descripcion}</small>
								<div class="label pull-right" {if $rn.prioridad == 0} style="color: #48953d"
								{elseif $rn.prioridad == 1}style="color: #01b6ad"
								{elseif $rn.prioridad == 2}style="color: #3498db"
								{elseif $rn.prioridad == 3}style="color: #e9b734"
								{elseif $rn.prioridad == 4}style="color: #f6504d"{/if}> {if $rn.prioridad == 0} Sin Prioridad
								{elseif $rn.prioridad == 1} Baja
								{elseif $rn.prioridad == 2} Normal
								{elseif $rn.prioridad == 3} Importante
								{elseif $rn.prioridad == 4} Muy Importante{/if}</div>
								<div class="box-placeholder" style="margin-bottom: 0px; padding-bottom: 4px;">Hace: {$rn.fecha_registro}</div>
							 </p>
							 <!-- <small>Hace 5 minutos</small> -->
						  </div>

					   </div>
					</div>
					<!-- END list group item-->
				 </div>
			{/foreach}
			 <!-- END list group-->
			 <!-- START panel footer-->
			 <div class="panel-footer clearfix" data-toggle="modal" data-target="#agregarNota" class="pull-left" style="cursor: pointer; text-align: center; font-size: 20px; background-color: #ff5e68; border-color: #d80650; color: #fff">
				<small><i class="fa fa-plus-circle"></i> Agregar nueva Nota</small>
			 </div>
			 <!-- END panel-footer-->
		  </div>
	   </div>
	   <!-- END dashboard sidebar-->
	</div>
</section>
{else}
	  <form method="post" data-parsley-validate="" novalidate="">
		<input type="hidden" value="1" name="enviar" />
		 <!-- START panel-->
		 <div class="panel panel-default2">
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