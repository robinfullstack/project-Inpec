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

		<link rel="stylesheet" type="text/css" href="{$_layoutParams.ruta_principal}app/css/docs_codef.css">
		<script src="{$_layoutParams.ruta_principal}app/js/require.js"
				data-main="js/master"></script>
	</head>

<body class="dx-docs">
<header class="header vx_globalNav-main" id="header">
    <a class="header__block header__brand" href="{$_layoutParams.configs.url_web}"
       aria-label="Codef Developer"></a>
    <a class="header__block dx-trigger-nav-0" data-trigger-nav="dx-nav-open-0"
       aria-label="Toggle top-level navigation"></a>
    <div class="dx-trigger-nav-2" data-trigger-nav="dx-nav-open-2" data-product="Codef">Proceso para migración
        de servidor
    </div>

    <div class="header__nav">
        <div class="header__nav--left">
            <ul class="dx-nav-0 dx-nav-0-docs">
                <li class="dx-nav-0-item ">
                    <a class="dx-nav-0-link" href="#">APIs</a>
                    <ul class="dx-nav-0-sub">
                        <li class="dx-nav-0-sub-item">
                            <a class="dx-nav-0-sub-link" href="#">Integración SAML 2.0</a>
                            <span class="dx-nav-0-desc">SSO - Single Sign On</span>
                        </li>
                        <li class="dx-nav-0-sub-item">
                            <a class="dx-nav-0-sub-link" href="#" target="_blank">Integración P8</a>
                            <span class="dx-nav-0-desc">Consulta de documentos en sistema de archivos Sura.</span>
                        </li>
                        <li class="dx-nav-0-sub-item">
                            <a class="dx-nav-0-sub-link" href="#" target="_blank">Integración ViaFirma</a>
                            <span class="dx-nav-0-desc">Firma de documentos.</span>
                        </li>
                    </ul>
                </li>
                <li class="dx-nav-0-item ">
                    <a class="dx-nav-0-link" href="#">Soporte</a>
                    <ul class="dx-nav-0-sub">
                        <li class="dx-nav-0-sub-item dx-nav-0-sub-index">
                            <a class="dx-nav-0-sub-link" href="#">Soporte General</a>
                        </li>
                        <li class="dx-nav-0-sub-item">
                            <a class="dx-nav-0-sub-link" href="#">Comunidad de soporte técnico</a>
                            <span class="dx-nav-0-desc">Plantea preguntas técnicas y de integración con nuestros ingenieros y otros.</span>
                        </li>
                    </ul>
                </li>
                <li class="dx-nav-0-item ">
                    <a class="dx-nav-0-link" href="/documentation/bancolombia/laravel.html">Laravel</a>
                </li>
            </ul>

            <form class="header__search dx-form-search" id="siteSearch" name="search" action="/search" method="get">
                <!-- <label class="sr-only" for="">Enter search term</label>-->
                <input type="hidden" class="dx-search-input" placeholder="Search">
            </form>
        </div>

        <div class="header__nav--right">
            <div class="dx-auth-block profile__container">
                <div class="dx-auth-logged-out">
                    <a class="dx-auth-login dx-btn dx-btn-primary" data-js="auth-btn" href="{$_layoutParams.root}docs/todos"
                       data-dxa="login,nav-click,nav-login">Ver documentos</a>

                </div>
            </div>
        </div>
    </div>
</header>

<main class="dx-main vx_foreground-container">
    <div class="dx-flex">
        <div class="dx-main-nav-slug"></div>
        <div class="dx-main-nav dx-mobile-nav">
            <nav class="tip-nav">
                <ul>
                    <li><a >Documentación</a></li>
                </ul>
            </nav>
        </div>
        <article class="content dx-content ">
			<!-- START Page content-->
			{include file=$_contenido}
			<!-- END Page content-->
		</article>
    </div>

    <footer class="footer">
        <section class="section">
            <div class="section__content">
                <div class="grid">
                    <div class="grid__item grid__item--6">
                        <ul class="footer__legal">
                            <li><a href="#" rel="nofollow">Item 1</a></li>
                            <li><a href="#" rel="nofollow">Item 2</a></li>
                            <li><a href="#" rel="nofollow">Item 3</a></li>
                        </ul>
                    </div>
                    <div class="grid__item grid__item--6">
                        <p class="footer__copyright">2020</p>
                    </div>
                </div>
            </div>
        </section>
    </footer>
</main>
<div class="fbt">
    <a class="fbt-link" href="https://codigoefimero.com" target="_blank">Código Efímero</a>
</div>

<div class="dx-search-panel u-hide">
    <button class="dx-search-panel-close">╳</button>
    <div class="dx-search-panel-content">
        <div class="dx-search-input-wrapper grid">
            <input id="siteQ" class="dx-search-panel-input grid__item grid__item--10" type="text" name="q" type="search"
                   value="" key="search_placeholder" placeholder="" autocomplete="off">
            <button class="dx-btn-search grid__item grid__item--2"></button>
            <button class="dx-btn-clear-x trigger-clear u-hide"></button>
        </div>

    </div>
    <div class="dx-search-panel-custom-view u-hide">
        <div class="dx-search-panel-content">
            <div class="dx-search-panel-search-results">
                <div class="dx-search-items"></div>
                <button class="dx-btn dx-btn-load-more"> Leer Más</button>
            </div>
            <div class="dx-search-panel-search-no-results u-hide">
                <p class="no-results"></p>
                <button class="dx-btn dx-btn-clear trigger-clear"> Limpiar todo</button>
            </div>
        </div>
    </div>
</div>

<div class="dx-search-panel-overlay u-hide"></div>
</body>
</html>