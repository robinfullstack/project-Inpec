<!DOCTYPE html>
<html lang="es-ES" prefix="og: http://ogp.me/ns#">
	<head>
		<!-- Meta-->
		<meta charset="utf-8">
		<link rel="profile" href="http://gmpg.org/xfn/11"/>
		<link rel="pingback" href="{$_layoutParams.root}xmlrpc.php"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
		<meta name="description" content="Administrador de documentación Código Efímero">
		<meta name="author" content="Robinson Pulgarin Torres">

		<meta property="og:locale" content="es_ES" />
		<meta property="og:type" content="website" />
		<meta property="og:title" content="Código Efímero | Blog de programación" />
		<meta property="og:description" content="Linux, PHP, Laravel, Javascript, Git..." />
		<meta property="og:url" content="{$_layoutParams.root}" />
		<meta property="og:site_name" content="{$_layoutParams.configs.app_name}" />
		<!-- <meta property="og:image" content="" /> -->
		<!-- <meta property="og:image:secure_url" content="" /> -->

	<link rel="icon" sizes="32x32" href="{$_layoutParams.ruta_img}favicon/32p.png">
	<link rel="apple-touch-icon-precomposed" sizes="152x152" href="{$_layoutParams.ruta_img}favicon/152p.png">
	<link rel="apple-touch-icon-precomposed" sizes="144x144" href="{$_layoutParams.ruta_img}favicon/144p.png">
	<link rel="apple-touch-icon-precomposed" sizes="120x120" href="{$_layoutParams.ruta_img}favicon/120p.png">
	<link rel="apple-touch-icon-precomposed" sizes="114x114" href="{$_layoutParams.ruta_img}favicon/114p.png">
	<link rel="apple-touch-icon-precomposed" href="{$_layoutParams.ruta_img}favicon/57p.png">

		<title>{$_layoutParams.configs.app_name}</title>
		<!-- Modernizr JS Script-->
		{if (Session::get('autenticado'))}
			<script src="{$_layoutParams.ruta_principal}vendor/modernizr/modernizr.js" type="application/javascript"></script>
			<!-- FastClick for mobiles-->
			<script src="{$_layoutParams.ruta_principal}vendor/fastclick/fastclick.js" type="application/javascript"></script>
			<script src="{$_layoutParams.ruta_principal}app/js/jquery.js" type="text/javascript"></script>
			<script type="text/javascript">
				$(window).load(function() {
					$(".loader").fadeOut("slow");
				});
			</script>
			<!-- Bootstrap CSS-->
			<link rel="stylesheet" href="{$_layoutParams.ruta_principal}app/css/bootstrap.css">
			<link rel="stylesheet" href="{$_layoutParams.ruta_principal}app/css/codemirror.css">
			<!-- Vendor CSS-->
			<link rel="stylesheet" href="{$_layoutParams.ruta_principal}vendor/fontawesome/css/font-awesome.min.css">
			<link rel="stylesheet" href="{$_layoutParams.ruta_principal}vendor/animo/animate+animo.css">
			<!-- App CSS-->
			<link rel="stylesheet" href="{$_layoutParams.ruta_principal}app/css/app.css">
			<link rel="stylesheet" href="{$_layoutParams.ruta_principal}app/css/bootstrap-tagsinput.css">
			<script src="{$_layoutParams.ruta_principal}js/jsstore.worker.min.js"></script>
			<script src="{$_layoutParams.ruta_principal}js/jsstore.min.js"></script>

			<link rel="stylesheet" type="text/css" href="{$_layoutParams.ruta_principal}app/css/docs_codef.css">

		{/if}
	</head>
	<body>
	{if (Session::get('autenticado'))}
	<div class="loader"></div>
	{literal}
	<div ng-app="app" id="ng-app" >
		<div ng-controller="encuestasController">
	{/literal}
		<!-- START Main wrapper-->
		<section class="wrapper" >
			<!-- START Top Navbar-->
			<nav role="navigation" class="navbar navbar-default navbar-top navbar-fixed-top" 
				{if isset($url) && ($url == 'factura' || $url == 'pedido')}style="display: none"{/if}>
				<!-- START navbar header-->
				<div class="navbar-header">
				<a href="{$_layoutParams.root}" class="navbar-brand">
					<div class="brand-logo" ><img src="{$_layoutParams.ruta_principal}app/img/user/codef-color.png" alt="{$_layoutParams.configs.app_name}" style="width: 62%; margin-top: -3%;" />
					</div>
					<div class="brand-logo-collapsed">
						<img src="{$_layoutParams.ruta_principal}app/img/user/codigo-efimero.png" alt="Código Efímero" class="img-thumbnail img-circle" >
					</div>
				</a>
				</div>
				<!-- END navbar header-->
			 <!-- START Nav wrapper-->
			 <div class="nav-wrapper">
				<!-- START Left navbar-->
				<ul class="nav navbar-nav">
					<li>
						<a href="#" data-toggle="aside">
						 <em class="fa fa-align-left"></em>
						</a>
					</li>
					<li>
					</li>
				</ul>
				<!-- END Left navbar-->
				<!-- START Right Navbar-->
				<ul class="nav navbar-nav navbar-right">
					<!-- START User menu-->
					<li class="dropdown" >
						<button type="button" class="btn btn-labeled btn-primary pull-right" onclick="location.href='{$_layoutParams.configs.url_web}'" style="background-color: #ff5e68; border-color: #d80650;margin-top: 7%; font-size: 15px;" >
						<span class="btn-label"><i class="fa fa-plus-circle"></i>
						</span>Ir a sitio web</button></li>
					<li class="dropdown">
					  <a href="#" data-toggle="dropdown" data-play="bounceIn" class="dropdown-toggle">
						 <em class="fa fa-user"></em>
						</a>
						<!-- START Dropdown menu-->
						<ul class="dropdown-menu">
						 <li>
							<div class="p">
								<p>Avance</p>
								<div class="progress progress-striped progress-xs m0">
									<div role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%;" class="progress-bar progress-bar-success">
										<span class="sr-only">80% Complete</span>
									</div>
								</div>
							</div>
						 </li>
						 <li class="divider"></li>
						 <li><a href="{$_layoutParams.root}index/cerrar">Cerrar sesión</a>
						 </li>
					  </ul>
					  <!-- END Dropdown menu-->
					</li>
					<!-- END User menu-->
				</ul>
				<!-- END Right Navbar-->
			 </div>
			 <!-- END Nav wrapper-->
			</nav>
			<!-- END Top Navbar-->
			<!-- START aside-->
			<aside class="aside" {if isset($url) && ($url == 'factura' || $url == 'pedido')}style="margin-top: 0px;"{/if}>
			 <!-- START Sidebar (left)-->
				{include file=$_vsidebar}
			 <!-- END Sidebar (left)-->
		  </aside>
		  <!-- End aside-->
			<!-- START Main section-->
			<section id="seccion_principal__" {if isset($url) && ($url == 'factura' || $url == 'pedido')}style="padding-top: 0px"{/if}  >
				{/if}
				<!-- START Page content-->
				{include file=$_contenido}
				<!-- END Page content-->
				{if (Session::get('autenticado'))}
			</section>
			<!-- END Main section-->
		</section>
		<!-- END Main wrapper-->

		<!-- Inclusión de ventanas Modal -->
		{include file=$_vmodal}

		<!-- Inclusión de notificaciones  -->
		{include file=$_vmensajes}
		</div>
	</div>
	<!-- START Scripts-->
	<script type="text/javascript">
		var _root_ = '{$_layoutParams.root}';
	</script>

	<script type="text/javascript">
		{literal}
			$('#chat').click(function(){
				$('.offsidebar').css({"display":"true"});
			});
		{/literal}
	</script>

	{if isset($_layoutParams.js_plugin) && count($_layoutParams.js_plugin)}
		{foreach item=plg from=$_layoutParams.js_plugin}
			<script src="{$plg}" type="text/javascript"></script>
		{/foreach}
	{/if}

	{if isset($_layoutParams.js) && count($_layoutParams.js)}
		{foreach item=js from=$_layoutParams.js}
			<script src="{$js}" type="text/javascript"></script>
		{/foreach}
	{/if}

	<!-- Contenedor principal de solicitudes Angular y Jquery -->
	<script>
		var myApp = angular.module('app', []);
		myApp.controller('encuestasController', function($scope, $http) {});
	</script>

	<script src="{$_layoutParams.ruta_principal}js/script.general.js" type="text/javascript"></script>

	<!-- Cargar funciones Angular y Jquery para el archivo -->

	{if isset($url) && $url == 'configuracion'}
		<script src="{$_layoutParams.ruta_principal}angular/urls/configuracion.js" type="text/javascript"></script>
	{/if}

	{if isset($bloqueado) && $bloqueado == 'clientesBloqueados'}
		{if isset($url) && $url == 'distribuidor'}
			<script src="{$_layoutParams.ruta_principal}angular/urls/clientes_bloqueados.js" type="text/javascript"></script>
		{/if}
		{if isset($url) && $url == 'cliente'}
			<script src="{$_layoutParams.ruta_principal}angular/urls/cliente.js" type="text/javascript"></script>
		{/if}
	{/if}

	<!-- Main vendor Scripts-->
	<script src="{$_layoutParams.ruta_principal}vendor/jquery/jquery.min.js"></script>
	<script src="{$_layoutParams.ruta_principal}app/js/semantic/semantic.min.js" type="text/javascript"></script>
	<script src="{$_layoutParams.ruta_principal}app/js/semantic/jquery.dataTables.min.js" type="text/javascript"></script>
	<script src="{$_layoutParams.ruta_principal}app/js/semantic/dataTables.semanticui.min.js" type="text/javascript"></script>
	<script src="{$_layoutParams.ruta_principal}app/js/semantic/dataTables.responsive.min.js" type="text/javascript"></script>
	<script src="{$_layoutParams.ruta_principal}app/js/semantic/responsive.semanticui.min.js" type="text/javascript"></script>
	<script>
		$(document).ready(function() {
			$('#visualizar_datatable').DataTable( {
				"processing": true,
				"serverSide": true,
				"ajax": _root_ + "producto/todosDatatable",
				"deferRender": true,
				"language": {
					"url": _root_ + "json/Spanish.json"
				},
				responsive: {
					details: {
						display: $.fn.dataTable.Responsive.display.modal( {
							header: function ( row ) {
								var data = row.data();
								return 'Details for '+data[0]+' '+data[1];
							}
						} ),
						renderer: $.fn.dataTable.Responsive.renderer.tableAll( {
							tableClass: 'ui table'
						} )
					}
				}
			} );

			$('#factura_datatable').DataTable( {
				"processing": true,
				"deferRender": true,
				"language": {
					"url": _root_ + "json/Spanish.json"
				},
				responsive: {
					details: {
						display: $.fn.dataTable.Responsive.display.modal( {
							header: function ( row ) {
								var data = row.data();
								return 'Details for '+data[0]+' '+data[1];
							}
						} ),
						renderer: $.fn.dataTable.Responsive.renderer.tableAll( {
							tableClass: 'ui table'
						} )
					}
				}
			} );
		} );
	</script>
	<script src="{$_layoutParams.ruta_principal}vendor/bootstrap/js/bootstrap.min.js"></script>
	<!-- Plugins-->
	<script src="{$_layoutParams.ruta_principal}vendor/chosen/chosen.jquery.min.js"></script>
	<link rel="stylesheet" href="{$_layoutParams.ruta_principal}vendor/chosen/chosen.min.css">
	<script src="{$_layoutParams.ruta_principal}vendor/slider/js/bootstrap-slider.js"></script>
	<script src="{$_layoutParams.ruta_principal}vendor/filestyle/bootstrap-filestyle.min.js"></script>
	<!-- Animo-->
	<script src="{$_layoutParams.ruta_principal}vendor/animo/animo.min.js"></script>
	<!-- Sparklines-->
	<script src="{$_layoutParams.ruta_principal}vendor/sparklines/jquery.sparkline.min.js"></script>
	<!-- START Page Custom Script-->
	<!--  Flot Charts-->

	<script src="{$_layoutParams.ruta_principal}vendor/flot/jquery.flot.min.js"></script>
	<script src="{$_layoutParams.ruta_principal}vendor/flot/jquery.flot.tooltip.min.js"></script>
	<script src="{$_layoutParams.ruta_principal}vendor/flot/jquery.flot.resize.min.js"></script>
	<script src="{$_layoutParams.ruta_principal}vendor/flot/jquery.flot.pie.min.js"></script>
	<script src="{$_layoutParams.ruta_principal}vendor/flot/jquery.flot.time.min.js"></script>
	<script src="{$_layoutParams.ruta_principal}vendor/flot/jquery.flot.categories.min.js"></script>

	<!-- Form Validation-->
	<script src="{$_layoutParams.ruta_principal}vendor/parsley/parsley.min.js"></script>
	<!--[if lt IE 8]><script src="js/excanvas.min.js"></script><![endif]-->
	<!-- END Page Custom Script-->
   <!-- MomentJs and Datepicker-->
   <script src="{$_layoutParams.ruta_principal}vendor/moment/min/moment-with-langs.min.js"></script>
   <script src="{$_layoutParams.ruta_principal}vendor/datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
	<!-- App Main-->
	<script src="{$_layoutParams.ruta_principal}app/js/app.js"></script>
	<!-- <script src="{$_layoutParams.ruta_principal}js/offline.min.js" type="text/javascript"></script>
	<link rel="stylesheet" href="{$_layoutParams.ruta_principal}css/offline-language-es.css">-->
	{/if}

	<!-- END Scripts-->
	</body>
</html>