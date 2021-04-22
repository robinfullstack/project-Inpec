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
{if (!Session::get('autenticado'))}
    <!-- Google font--><link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600" rel="stylesheet">
    <!-- Required Fremwork -->
    <link rel="stylesheet" type="text/css" href="{$_layoutParams.ruta_principal}files/bower_components/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="{$_layoutParams.ruta_principal}files/assets/icon/themify-icons/themify-icons.css">
    <link rel="stylesheet" type="text/css" href="{$_layoutParams.ruta_principal}files/assets/icon/icofont/css/icofont.css">
    <link rel="stylesheet" type="text/css" href="{$_layoutParams.ruta_principal}files/assets/icon/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="{$_layoutParams.ruta_principal}files/assets/css/style.css">

    <!-- Pre-loader start -->
    <div class="theme-loader">
        <div class="loader-track">
            <div class="loader-bar"></div>
        </div>
    </div>
    <!-- Pre-loader end -->
    <section class="login p-fixed d-flex text-center bg-primary common-img-bg">
        <!-- Container-fluid starts -->
        <div class="container">
            <div class="row">
                <div class="col-sm-8">
                    <!-- Authentication card start -->
                    <div class="login-card card-block auth-body mr-auto ml-auto">
                        <form class="md-float-material">
                            <div class="auth-box">
                                <div class="row m-b-20">
                                    <div class="col-md-12">
										<img src="{$_layoutParams.ruta_principal}files/assets/images/logo.png" alt="logo.png">
                                        <h3 class="text-left">Recuperar contraseña</h3>
                                    </div>
                                </div>
                                <p class="text-inverse b-b-default text-right">Volver al <a href="{$_layoutParams.root}login">Inicio de sesión.</a></p>
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Ingrese su correo electrónico">
                                    <span class="md-line"></span>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <button type="button" class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20" style="background-color: #d80650; border-color: #ff5e68;">Solicitar contraseña</button>
                                    </div>
                                </div>
                                <hr/>
                                <div class="row">
                                    <div class="col-md-10">
                                        <p class="text-inverse text-left m-b-0">Administrador para documentación.</p>
                                    </div>
                                    <div class="col-md-2">
                                        <img src="{$_layoutParams.ruta_principal}files/assets/images/auth/Logo-small-bottom.png" alt="small-logo.png">
                                    </div>
                                </div>
                            </div>
                        </form>
                        <!-- end of form -->
                    </div>
                    <!-- Authentication card end -->
                </div>
                <!-- end of col-sm-12 -->
				<div class="col-sm-4"></div>
            </div>
            <!-- end of row -->
        </div>
        <!-- end of container-fluid -->
    </section>
    <!-- Required Jquery -->
    <script  src="{$_layoutParams.ruta_principal}files/bower_components/jquery/js/jquery.min.js"></script>
    <script  src="{$_layoutParams.ruta_principal}files/assets/js/common-pages.js"></script>

	  <form method="post" action="login" data-parsley-validate="" novalidate="" style="display: none">
		<input type="hidden" value="1" name="enviar" />
		 <!-- START panel-->
		 <div class="panel panel-info">
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
		<!-- END widget-->
{/if}