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
										<img src="{$_layoutParams.ruta_principal}files/assets/images/logo.png" alt="logo.png">
                                        <h3 class="text-left txt-primary">Seleccione opción:</h3>
										{if isset($_error)}
											<div class="alert alert-danger" style="margin-bottom: 0rem;">
												<button type="button" class="close" data-dismiss="alert" aria-label="Close">
													<i class="icofont icofont-close-line-circled"></i>
												</button>
												<strong>{$_error}</strong>
											</div>
										{/if}
										</br>
										<button class="btn btn-primary btn-outline-primary" style="width: 100%;"><i class="icofont icofont-user-alt-3"></i>Contacto telefónico</button>
										</br></br>
										<button class="btn btn-success btn-outline-success" style="width: 100%;"><i class="icofont icofont-check-circled" style="font-size: 22px;"></i>Seleccionar productos</button>
                                    </div>
                                </div>
								<div class="row">
                                    <div class="col-md-8">
                                        <p class="text-inverse text-left m-b-0">¿Cómo desea realizar su pedido?</p>
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
{/if}