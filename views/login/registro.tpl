<div class="span8">
	<noscript><p>Para el correcto funcionamiento debe tener el soporte para javascript habilitado</p></noscript>
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
    <!-- Pre-loader end -->
    <section class="login p-fixed d-flex text-center bg-primary common-img-bg">
        <!-- Container-fluid starts -->
        <div class="container">
            <div class="row">
                <div class="col-sm-8">
                    <!-- Authentication card start -->
                    <div class="login-card card-block auth-body" >
                        <form method="post" action="" data-parsley-validate="" novalidate="" class="md-float-material" >
						<input type="hidden" value="1" name="enviar" />
                            <div class="auth-box">
                                <div class="row m-b-20">
                                    <div class="col-md-12">
										<img src="{$_layoutParams.ruta_principal}files/assets/images/logo.png" alt="logo.png">
                                        <h3 class="text-center txt-primary">¡Regístrate! Es fácil y rápido.</h3>
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
                                    <input type="text" class="form-control" name="nombre_negocio" required placeholder="Nombre completo" value="{$datos.nombre_negocio|default:""}">
                                    <span class="md-line"></span>
                                </div>
                                <div class="input-group">
                                    <input type="email" class="form-control" name="correo" required placeholder="Correo electrónico" value="{$datos.correo|default:""}">
                                    <span class="md-line"></span>
                                </div>
                                <div class="input-group">
                                    <input type="password" class="form-control" name="contrasena" required placeholder="Ingresa tu contraseña">
                                    <span class="md-line"></span>
                                </div>
                                <div class="input-group">
                                    <input type="password" class="form-control" name="validar_contrasena" required placeholder="Repite la contraseña">
                                    <span class="md-line"></span>
                                </div>
                                <div class="row m-t-25 text-left">
                                    <div class="col-md-12">
                                        <div class="checkbox-fade fade-in-primary">
                                            <label>
                                                <input type="checkbox" value="" checked>
                                                <span class="cr"><i class="cr-icon icofont icofont-ui-check txt-primary"></i></span>
                                                <span class="text-inverse">Yo he leído y acepto los <a href="#">Términos &amp; Condiciones.</a></span>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-md-12" style="display: none">
                                        <div class="checkbox-fade fade-in-primary" >
                                            <label>
                                                <input type="checkbox" value="">
                                                <span class="cr"><i class="cr-icon icofont icofont-ui-check txt-primary"></i></span>
                                                <span class="text-inverse">Permitir <a href="#!">suscripción</a>.</span>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row m-t-30">
                                    <div class="col-md-12">
                                        <button type="submit" class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20" style="background-color: #d80650; border-color: #ff5e68;">Regístrate ahora</button>
										<p class="text-inverse b-b-default text-right">¿Ya tienes cuenta? <a href="{$_layoutParams.root}login" 
											style="color: #d80650;font-weight: 600;" >Ingres aquí!</a></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-10">
                                        <p class="text-inverse text-left"><b>¡Administrador para documentación!</b></p>
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
                </div><div class="col-sm-4"></div>
                <!-- end of col-sm-12 -->
            </div>
            <!-- end of row -->
        </div>
        <!-- end of container-fluid -->
    </section>
		<!-- END widget-->
{/if}