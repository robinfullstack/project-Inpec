 <nav class="sidebar">
 {if (Session::get('autenticado'))}
	<ul class="nav" {if isset($url) && $url == 'credito'}style='background-color: #ce5642 !important'{/if} >
		<!-- START user info-->
		<li class="active">
			 <!-- Name and Role-->
			 <div class="user-block-info" style="display: none">
				<span class="user-block-name item-text">Bienvenid@, {$_layoutParams.configs.app_name}</span>
				<span class="user-block-role">Administrador</span>
				<!-- START Dropdown to change status-->
				<div class="btn-group user-block-status">
					<button type="button" data-toggle="dropdown" data-play="fadeIn" data-duration="0.2" class="btn btn-xs dropdown-toggle">
						<div class="point point-success"></div>En línea</button>
					<ul class="dropdown-menu text-left pull-right">
						<li>
						 <a href="#">
							<div class="point point-success"></div>En línea</a>
						</li>
						<li>
						 <a href="#">
							<div class="point point-warning"></div>Ausente</a>
						</li>
					  <li>
						 <a href="#">
							<div class="point point-danger"></div>Desconectado</a>
						</li>
					</ul>
				</div>
				<!-- END Dropdown to change status-->
			 </div>
			<!-- </div> -->
			<!-- START User links collapse-->
			<ul class="nav collapse" style="display: none">
			 <li><a href="#">Perfil</a>
			 </li>
			 <li><a href="#">Configuraciones</a>
			 </li>
			 <li><a href="#">Notificaciones<div class="label label-danger pull-right">12</div></a>
			 </li>
			 <li><a href="#">Mensajes<div class="label label-success pull-right">3</div></a>
			 </li>
			 <li class="divider"></li>
			 <li><a href="{$_layoutParams.root}index/cerrar" data-toggle="tooltip" data-title="Cerrar sesión" title="Cerrar sesión" data-toggle="" class="btn btn-link">Cerrar sesión</a>
			 </li>
		  </ul>
		  <!-- END User links collapse-->
		</li>
		<!-- END user info-->
		<!-- START Menu-->
		<li class="active">
		  <a href="#" title="Productos" data-toggle="collapse-next" class="has-submenu">
			 <em class="fa fa-plus" id="aumentar-t"></em>
			 <div class="label label-success pull-right"></div>
			 <span class="item-text">Documentación</span>
			</a>
			<!-- START SubMenu item-->
			<ul class="nav collapse {if isset($url) && $url == 'docs'}in{/if}" {if isset($url) && $url == 'docs' }style="height: auto;"{/if} >

			 <li>
				<a href="{$_layoutParams.root}docs/todos" title="Ver todos" data-toggle="" class="no-submenu">
					<span class="item-text" {if isset($url_todos) && $url_todos == 'todos'}style="color: #fff;"{/if} >Ver todos</span>
				</a>
			 </li>
			 <li>
				<a href="{$_layoutParams.root}docs/registrar" title="Registrar" data-toggle="" class="no-submenu">
					<span class="item-text" {if isset($registrar) && $registrar == 'registrar'}style="color: #fff;"{/if} >Registrar</span>
				</a>
			 </li>
		  </ul>
	</li>
	<!-- Fin Menú de distribuidores -->
		<li>
			<a href="{$_layoutParams.root}configuracion" title="Configuración" >
				<em class="fa fa-wrench" id="aumentar-t"></em>
				<span class="item-text">Configuración</span>
			</a>
	   </li>
		<li>
			<a href="{$_layoutParams.root}docs/upload" title="Upload" >
				<em class="fa fa-upload" ></em>
				<span class="item-text">Imágenes</span>
			</a>
	   </li>

	   <!-- END Menu-->
	   <!-- Sidebar footer    -->
	   <li class="nav-footer" style="display: none !important">
		  <div class="nav-footer-divider"></div>
		  <!-- START button group-->
		  <div class="btn-group text-center">
			 <button type="button" data-toggle="tooltip" data-title="Agregar contacto" class="btn btn-link">
				<em class="fa fa-user text-muted"><sup class="fa fa-plus"></sup>
				</em>
			 </button>
			 <button type="button" data-toggle="tooltip" data-title="Configuraciones" class="btn btn-link">
				<em class="fa fa-cog text-muted"></em>
			 </button>
			 <a href="{$_layoutParams.root}index/cerrar" data-toggle="tooltip" data-title="Cerrar sesión" title="Cerrar sesión" data-toggle="" class="btn btn-link">
				<em class="fa fa-sign-out text-muted"></em>
			 </a>
		  </div>
		  <!-- END button group-->
	   </li>
	</ul>
	{/if}
 </nav>