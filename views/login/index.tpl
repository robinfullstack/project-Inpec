<div class="span8">
	<noscript><p>Para el correcto funcionamiento debe tener el soporte para javascript habilitado</p></noscript>

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

    <section class="login p-fixed d-flex text-center bg-primary common-img-bg">
        <!-- Container-fluid starts -->
        <div class="container">
            <div class="row">
                <div class="col-sm-8">
                    <!-- Authentication card start -->
                    <div class="login-card card-block auth-body">
						<form method="post" action="login" data-parsley-validate="" novalidate="" class="md-float-material" >
						<input type="hidden" value="1" name="enviar" />
                            <div class="auth-box">
                                <div class="row m-b-20">
                                    <div class="col-md-12">
										<img src="{$_layoutParams.ruta_principal}files/assets/images/logo.png" alt="logo.png" style="width: 44%;">
                                        <h3 class="text-left txt-primary">Accede a tu cuenta</h3>
										{if isset($_error)}
											<div class="alert alert-danger" style="margin-bottom: 0rem;">
												<button type="button" class="close" data-dismiss="alert" aria-label="Close">
													<i class="icofont icofont-close-line-circled"></i>
												</button>
												<strong>{$_error}</strong>
											</div>
										{/if}
                                    </div>
                                </div>
                                <hr/>
                                <div class="input-group">
                                    <input type="email" name="usuario" required class="form-control" placeholder="Correo electrónico">
                                    <span class="md-line"></span>
                                </div>
                                <div class="input-group">
                                    <input type="password" name="pass" required class="form-control" placeholder="Contraseña">
                                    <span class="md-line"></span>
                                </div>
                                <div class="row m-t-25 text-left">
                                    <div class="col-12">
                                        <div class="checkbox-fade fade-in-primary d-" style="display: none">
                                            <label>
                                                <input type="checkbox" value="">
                                                <span class="cr"><i class="cr-icon icofont icofont-ui-check txt-primary"></i></span>
                                                <span class="text-inverse">Recordar contraseña</span>
                                            </label>
                                        </div>
                                        <div class="forgot-phone text-right f-right">
                                            <a href="{$_layoutParams.root}login/recuperar" class="text-right f-w-600 text-inverse"> ¿Olvidaste tu contraseña?</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="row m-t-30">
                                    <div class="col-md-12">
                                        <button type="submit" class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20" style="background-color: #004964; border-color: #004964;">Ingresar</button>
										<p class="text-inverse b-b-default text-right" >¿Eres nuevo? <a href="{$_layoutParams.root}login/registro" 
											style="color: #d80650;font-weight: 600;">Regístrate!</a></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-8">
                                        <p class="text-inverse text-left m-b-0">Administrador para documentación.</p>
                                    </div>
                                    <div class="col-md-4">
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