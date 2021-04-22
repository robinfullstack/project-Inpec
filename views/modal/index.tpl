{if (Session::get('autenticado'))}
<div id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" class="modal fade">
	<div class="modal-dialog">
	 <div class="modal-content">
		<div class="modal-header">
			<button type="button" data-dismiss="modal" aria-hidden="true" class="close">×</button>
			<h4 id="myModalLabel" class="modal-title">{$_layoutParams.configs.app_name}</h4>
		</div>
		<div class="modal-body"><center><strong>Buscar cliente </strong><br /> <br /> 
		Tipo de Búsqueda: 
		<select name="tipo" id="tipo">
			<option selected value="1">Nombre</option>
			<option value="2">Apellido</option>
			<option value="3">Tarjeta</option>
			<option value="4">Email</option>
		</select> 
		<br /> 
		<div class="checkbox c-checkbox">
			<label>
				<input type="checkbox" name="agreements" required data-parsley-error-message="Please read and agree the terms">
				<span class="fa fa-check"></span><a href="#">Seleccionar como tipo predeterminado.</a>
			</label>
		 </div>
		 <br />
			<select style="height: 260px; height: 70px;" class="chosen-select">
				<option value="AK">Alaska</option>
				<option value="HI">Hawaii</option>
				<option value="CA">California</option>
				<option value="NV">Nevada</option>
				<option value="OR">Oregon</option>
				<option value="WA">Washington</option>
			</select>
		<br />
			<!-- Success button with label -->
		</center></div>
		<div class="modal-footer">
			<button type="button" data-dismiss="modal" class="btn btn-default">Cancelar</button>
			<button type="button" class="btn btn-primary">Aceptar</button>
		</div>
	 </div>
</div>
</div>

<div id="tipo_de_negocio" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"  aria-hidden="true" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" data-dismiss="modal" aria-hidden="true" class="close">×</button>
				<h4 id="myModalLabel" class="modal-title">{$_layoutParams.configs.app_name}</h4>
			</div>
			<div class="modal-body">
					<!-- START panel-->
					<div class="panel panel-default2">
						<div class="panel-heading" style="font-size: 16px">Selecciona tu tipo de negocio
						<a href="#" data-perform="panel-dismiss" data-toggle="tooltip" title="Cerrar Panel" class="pull-right">
							<em class="fa fa-times"></em>
						</a>
						<a href="#" data-perform="panel-collapse" data-toggle="tooltip" title="Minimizar Panel" class="pull-right">
							<em class="fa fa-minus"></em>
						</a>
						</div>
						<!-- START table-responsive-->
						<div class="row">
						 <div class="col-sm-4">
							<!-- START widget-->
							<div id="mercado-retail" class="panel widget" style="cursor: pointer;" >
							   <div class="panel-body bg-danger text-center">
								  <div class="radial-bar radial-bar-0 radial-bar radial-bar-danger m0">
									 <em class="fa fa-shopping-cart fa-2x" style="margin-top: 26%; color: #2a9fda"></em>
								  </div>
								  <p style="margin-top: 5%">
									 <strong style="font-size: 20px;">Mercado retail</strong></p>
								</div>
							</div>
							<!-- END table-responsive-->
							</div>

						 <div class="col-sm-4">
							<!-- START widget-->
							<div id="restaurante" class="panel widget" style="cursor: pointer;">
							   <div class="panel-body bg-danger text-center">
								  <div class="radial-bar radial-bar-0 radial-bar radial-bar-danger m0">
									 <em class="fa fa-cutlery fa-2x" style="margin-top: 26%; color: #2a9fda"></em>
								  </div>
								  <p style="margin-top: 5%">
									 <strong style="font-size: 20px;">Restaurante</strong></p>
								</div>
							</div>					 <!-- END table-responsive-->
							</div>

						 <div class="col-sm-4">
							<!-- START widget-->
							<div id="ropa" class="panel widget" style="cursor: pointer;">
							   <div class="panel-body bg-danger text-center">
								  <div class="radial-bar radial-bar-0 radial-bar radial-bar-danger m0">
									 <em class="fa fa-female fa-2x" style="margin-top: 26%; color: #2a9fda"></em>
								  </div>
								  <p style="margin-top: 5%">
									 <strong style="font-size: 20px;">Ropa y/o calzado</strong></p>
								</div>
							</div>
							<!-- END table-responsive-->
							</div>
						</div>
					</div>
				</div>
			<div class="modal-footer"></div>
		 </div>
	</div>
</div>

<div id="informacion" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" data-dismiss="modal" aria-hidden="true" class="close">×</button>
				<h4 id="myModalLabel" class="modal-title">{$_layoutParams.configs.app_name}</h4>
			</div>
			<div class="modal-body">
					<!-- START panel-->
					<div class="panel panel-default2">
						<div class="panel-heading">Datos generales
						<a href="#" data-perform="panel-dismiss" data-toggle="tooltip" title="Close Panel" class="pull-right">
							<em class="fa fa-times"></em>
						</a>
						<a href="#" data-perform="panel-collapse" data-toggle="tooltip" title="Collapse Panel" class="pull-right">
							<em class="fa fa-minus"></em>
						</a>
						</div>
						<!-- START table-responsive-->
					 <div class="table-responsive">
						<table class="table table-striped table-bordered table-hover">
							<tbody ng-repeat="consulta in consulta_cliente">
								<tr>
									<td>Nombre</td>
									<td><div class="label label-success">{literal}{{consulta.nombre}}{/literal}</div></td>
								</tr>
								<tr>
									<td>Número de identificación</td>
									<td><div class="label label-success">{literal}{{consulta.tarjeta}}{/literal}</div></td>
								</tr>
								<tr>
									<td>Dirección</td>
									<td><div class="label label-success">{literal}{{consulta.direccion}}{/literal}</div></td>
								</tr>
								<tr>
									<td>Email</td>
									<td><div class="label label-success">{literal}{{consulta.correo_electronico}}{/literal}</div></td>
								</tr>
								<tr>
									<td>Teléfono</td>
									<td><div class="label label-success">{literal}{{consulta.telefono_domicilio}}{/literal}</div></td>
								</tr>
								<tr>
									<td>Teléfono Celular</td>
									<td><div class="label label-success">{literal}{{consulta.telefono_celular}}{/literal}</div></td>
								</tr>
								<tr>
									<td>Ciudad</td>
									<td><div class="label label-success">{literal}{{consulta.ciudad}}{/literal}</div></td>
								</tr>
							</tbody>
						</table>
					 </div>
					 <!-- END table-responsive-->
				  </div>
			</div>
			<div class="modal-footer"></div>
		 </div>
	</div>
</div>


<div id="informacion_1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" data-dismiss="modal" aria-hidden="true" class="close">×</button>
				<h4 id="myModalLabel" class="modal-title">{$_layoutParams.configs.app_name}</h4>
			</div>
			<div class="modal-body">
					<!-- START panel-->
					<div class="panel panel-default2">
						<div class="panel-heading">Datos generales
						<a href="#" data-perform="panel-dismiss" data-toggle="tooltip" title="Close Panel" class="pull-right">
							<em class="fa fa-times"></em>
						</a>
						<a href="#" data-perform="panel-collapse" data-toggle="tooltip" title="Collapse Panel" class="pull-right">
							<em class="fa fa-minus"></em>
						</a>
						</div>
						<!-- START table-responsive-->
					 <div class="table-responsive">
						<table class="table table-striped table-bordered table-hover">
							<tbody ng-repeat="consulta in consulta_cliente">
								<tr>
									<td>Nombre</td>
									<td><div class="label label-success">{literal}{{consulta.nombre}}{/literal}</div></td>
								</tr>
								<tr>
									<td>Número de identificación</td>
									<td><div class="label label-success">{literal}{{consulta.numero_identificacion}}{/literal}</div></td>
								</tr>
								<tr>
									<td>Dirección</td>
									<td><div class="label label-success">{literal}{{consulta.direccion}}{/literal}</div></td>
								</tr>
								<tr>
									<td>Email</td>
									<td><div class="label label-success">{literal}{{consulta.correo_electronico}}{/literal}</div></td>
								</tr>
								<tr>
									<td>Teléfono</td>
									<td><div class="label label-success">{literal}{{consulta.telefono1}}{/literal}</div></td>
								</tr>
								<tr>
									<td>Teléfono Celular</td>
									<td><div class="label label-success">{literal}{{consulta.celular}}{/literal}</div></td>
								</tr>
								<tr>
									<td>Observaciones</td>
									<td><div class="label label-success">{literal}{{consulta.observaciones}}{/literal}</div></td>
								</tr>
							</tbody>
						</table>
					 </div>
					 <!-- END table-responsive-->
				  </div>
			</div>
			<div class="modal-footer"></div>
		 </div>
	</div>
</div>

<div id="informacion_productos" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" data-dismiss="modal" aria-hidden="true" class="close">×</button>
				<h4 id="myModalLabel" class="modal-title">{$_layoutParams.configs.app_name}</h4>
			</div>
			<div class="modal-body">
					<!-- START panel-->
					<div class="panel panel-default2">
						<div class="panel-heading">Productos Factura
						<a href="#" data-perform="panel-dismiss" data-toggle="tooltip" title="Close Panel" class="pull-right">
							<em class="fa fa-times"></em>
						</a>
						<a href="#" data-perform="panel-collapse" data-toggle="tooltip" title="Collapse Panel" class="pull-right">
							<em class="fa fa-minus"></em>
						</a>
						</div>
						<!-- START table-responsive-->
					 <div class="table-responsive">
						<table class="table table-striped table-bordered table-hover">
							<tbody ng-repeat="consulta in informacion_productos">
								<tr>
									<td>Nombre</td>
									<td><div class="label label-success">{literal}{{consulta.descr_producto}} {{consulta.caracteristicas}}{/literal}</div></td>
									
									<td>Cantidad</td>
									<td><div class="label label-success">{literal}{{consulta.cantidad_pr}}{/literal}</div></td>

									<td>Precio</td>
									<td><div class="label label-success">{literal}{{consulta.precio_venta}}{/literal}</div></td>
								</tr>
							</tbody>

							<tbody ng-repeat="consulta in informacion_productosb">
								<tr>
									<td>Nombre</td>
									<td><div class="label label-success">{literal}{{consulta.nombre_producto}}{/literal}</div></td>
									
									<td>Cantidad</td>
									<td><div class="label label-success">{literal}{{consulta.cantidad_pr}}{/literal}</div></td>

									<td>Precio</td>
									<td><div class="label label-success">{literal}{{consulta.precio_venta}}{/literal}</div></td>
								</tr>
							</tbody>
						</table>
					 </div>
					 <!-- END table-responsive-->
				  </div>
			</div>
			<div class="modal-footer"></div>
		 </div>
	</div>
</div>

<div id="informacion_productos2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" data-dismiss="modal" aria-hidden="true" class="close">×</button>
				<h4 id="myModalLabel" class="modal-title">{$_layoutParams.configs.app_name}</h4>
			</div>
			<div class="modal-body">
					<!-- START panel-->
					<div class="panel panel-default2">
						<div class="panel-heading">Productos Pedido
						<a href="#" data-perform="panel-dismiss" data-toggle="tooltip" title="Close Panel" class="pull-right">
							<em class="fa fa-times"></em>
						</a>
						<a href="#" data-perform="panel-collapse" data-toggle="tooltip" title="Collapse Panel" class="pull-right">
							<em class="fa fa-minus"></em>
						</a>
						</div>
						<!-- START table-responsive-->
					 <div class="table-responsive">
						<table class="table table-striped table-bordered table-hover">
							<tbody ng-repeat="consulta in informacion_productos">
								<tr>
									<td>Nombre</td>
									<td><div class="label label-success">{literal}{{consulta.descr_producto}} {{consulta.caracteristicas}}{/literal}</div></td>
									
									<td>Cantidad</td>
									<td><div class="label label-success">{literal}{{consulta.cantidad_pr}}{/literal}</div></td>

									<td>Precio Unitario</td>
									<td><div class="label label-success">{literal}{{consulta.precio_compra}}{/literal}</div></td>
									<td>Precio Final</td>
									<td><div class="label label-success">{literal}{{consulta.precio_cantidad}}{/literal}</div></td>
								</tr>
							</tbody>
						</table>
					 </div>
					 <!-- END table-responsive-->
				  </div>
			</div>
			<div class="modal-footer"></div>
		 </div>
	</div>
</div>

<div id="edicion" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" data-dismiss="modal" aria-hidden="true" class="close">×</button>
				<h4 id="myModalLabel" class="modal-title">{$_layoutParams.configs.app_name}</h4>
			</div>
			<div class="modal-body">
					<!-- START panel-->
					<div class="panel panel-default2">
						<div class="panel-heading">Datos generales
						<a href="#" data-perform="panel-dismiss" data-toggle="tooltip" title="Cerrar Panel" class="pull-right">
							<em class="fa fa-times"></em>
						</a>
						<a href="#" data-perform="panel-collapse" data-toggle="tooltip" title="Minimizar Panel" class="pull-right">
							<em class="fa fa-minus"></em>
						</a>
						</div>
						<!-- START table-responsive-->
					 <div class="table-responsive">
						<table class="table table-striped table-bordered table-hover">
							<tbody ng-repeat="consulta in consulta_cliente">
								<tr>
									<td>Nombre comercial</td>
									<td>
										<input type="text" name="nombre" id="nombre" required="required" class="form-control" value="{literal}{{consulta.contacto}}{/literal}" />
										<input type="hidden" name="id_cliente" id="id_cliente" value="{literal}{{consulta.id_distribuidor}}{/literal}" />
									</td>
								</tr>
								<tr>
									<td>Nit o cédula</td>
									<td><input type="text" name="tarjeta" id="tarjeta" class="form-control" value="{literal}{{consulta.tarjeta}}{/literal}" /></td>
								</tr>
								<tr>
									<td>Régimen</td>
									<td>
										<div class="form-group">
												<div class="col-sm-6" ng-if="consulta.codigo_sexo == 1">
													<label class="radio-inline c-radio" >
															<input id="masculino" type="radio" name="sexo_1" value="1" checked="" >
															<span class="fa fa-user"></span>Simplificado
													</label>
													<label class="radio-inline c-radio" style="margin-left: -1px" >
															<input id="femenino" type="radio" name="sexo_1" value="2" >
															<span class="fa fa-user"></span>Común
													</label>
												</div>
												<div class="col-sm-6" ng-if="consulta.codigo_sexo == 2">
													<label class="radio-inline c-radio" >
															<input id="masculino" type="radio" name="sexo_2"  value="1" >
															<span class="fa fa-user"></span>Simplificado
													</label>
													<label class="radio-inline c-radio" style="margin-left: -1px" >
															<input id="femenino" type="radio" name="sexo_2"  value="2" checked="" >
															<span class="fa fa-user"></span>Común
													</label>
												</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Correo electrónico</td>
									<td><input type="email" name="correo" id="correo" data-parsley-type="email" class="form-control" value="{literal}{{consulta.correo_electronico}}{/literal}" /></td>
								</tr>
								<tr>
									<td>Teléfono celular</td>
									<td><input type="text" name="celular" id="celular" data-parsley-type="number" class="form-control" value="{literal}{{consulta.telefono_celular}}{/literal}" /></td>
								</tr>
								<tr>
									<td>Dirección</td>
									<td><input type="text" name="direccion" id="direccion" class="form-control" value="{literal}{{consulta.direccion}}{/literal}" /></td>
								</tr>
								<tr>
									<td>Ciudad</td>
									<td><input type="text" name="ciudad" id="ciudad" class="form-control" value="{literal}{{consulta.ciudad}}{/literal}" /></td>
								</tr>
								<tr>
									<td>Telefono domicilio</td>
									<td><input type="text" name="telefono_domicilio" id="telefono_domicilio" class="form-control" value="{literal}{{consulta.telefono_domicilio}}{/literal}" /></td>
								</tr>
							</tbody>
						</table>
					 </div>
					 <!-- END table-responsive-->
				  </div>
			</div>
			<div class="modal-footer">
				<center>
					<button type="submit" class="btn btn-labeled btn-info" data-dismiss="modal" id="modificar_cliente" >
						<span class="btn-label"><i class="fa fa-exclamation"></i></span>Modificar
					</button>
					<button id="cancelar" type="button" class="btn btn-labeled btn-warning" data-dismiss="modal">
						<span class="btn-label"><i class="fa fa-warning"></i></span>Cancelar
					</button>
				</center>
			</div>
		 </div>
	</div>
</div>

<div id="asignar_cliente" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" data-dismiss="modal" aria-hidden="true" class="close">×</button>
				<h4 id="myModalLabel" class="modal-title">Enlace POS</h4>
			</div>
			<div class="modal-body">
					<!-- START panel-->
					<div class="panel panel-default2" style="margin-bottom: 0px;">
						<div class="panel-heading">Asignar Cliente <a href="{$base_url}cliente/registrar" target="_blank">Nuevo</a>
						<a href="#" data-perform="panel-dismiss" data-toggle="tooltip" title="Close Panel" class="pull-right">
							<em class="fa fa-times"></em>
						</a>
						<a href="#" data-perform="panel-collapse" data-toggle="tooltip" title="Collapse Panel" class="pull-right">
							<em class="fa fa-minus"></em>
						</a>
						</div>
						<!-- START table-responsive-->
					 <div class="table-responsive">
						<table class="table table-striped table-bordered table-hover">
							<tbody >
								<tr>
									<td><div class="label label-info pull-right" id="label-cliente" data-tip="Seleccionar cliente!" >Cliente: &nbsp; <code>*</code></div></td>
									<td><select name="asigne_cliente" id="asigne_cliente" style="width: 260px;" class="chosen-select">
										<option value="123">Seleccione</option>
										{foreach from=$clientes item=ct}
											<option value="{$ct.id_cliente}">{$ct.nombre}</option>
										{/foreach}
									 </select></td>
								</tr>
								<tr>
									<td>
										<div class="label label-info pull-right" id="label-cliente" data-tip="Habilitar método de pago crédito!" >¿Crédito?: &nbsp; <code>*</code></div>
									</td>
									<td>
										<label class="switch"><input type="checkbox" id="seleccion_credito" ><span></span></label>
									</td>
								</tr>
								<tr>
									<td>
										<div class="label label-info pull-right" id="label-cliente" data-tip="Realizar un abono al crédito!">¿Abono?: &nbsp; <code>*</code></div>
									</td>
									<td>
										<input class="form-control" type="text" name="abono_credito" id="abono_credito" value="" placeholder="Ingrese el valor sin puntos ni comas">
									</td>
								</tr>
							</tbody>
						</table>
					 </div>
					 <!-- END table-responsive-->
				  </div>
			</div>
			<div class="modal-footer"><button type="button" class="btn btn-labeled btn-info" id="asignar_cliente_factura" >
					<span class="btn-label"><i class="fa fa-exclamation"></i>
					</span>Asignar Cliente</button></div>
		 </div>
	</div>
</div>

<div id="edicion_1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" data-dismiss="modal" aria-hidden="true" class="close">×</button>
				<h4 id="myModalLabel" class="modal-title">{$_layoutParams.configs.app_name}</h4>
			</div>
			<div class="modal-body">
					<!-- START panel-->
					<div class="panel panel-default2">
						<div class="panel-heading">Datos generales
						<a href="#" data-perform="panel-dismiss" data-toggle="tooltip" title="Cerrar Panel" class="pull-right">
							<em class="fa fa-times"></em>
						</a>
						<a href="#" data-perform="panel-collapse" data-toggle="tooltip" title="Minimizar Panel" class="pull-right">
							<em class="fa fa-minus"></em>
						</a>
						</div>
						<!-- START table-responsive-->
					 <div class="table-responsive">
						<table class="table table-striped table-bordered table-hover">
							<tbody ng-repeat="consulta in consulta_cliente">
								<tr>
									<td>Nombre</td>
									<td><input type="text" name="nombre_c" id="nombre_c" required="required" class="form-control" value="{literal}{{consulta.nombre}}{/literal}" /></td>
								</tr>
								<tr>
									<td>Número de identificación</td>
									<td>
										<input type="hidden" name="id_cliente_1" id="id_cliente_1" required="required" class="form-control" value="{literal}{{consulta.id_cliente}}{/literal}" />
										<input type="text" name="numero_identificacion" id="numero_identificacion" required="required" class="form-control" value="{literal}{{consulta.numero_identificacion}}{/literal}" />
									</td>
								</tr>
								<tr>
									<td>Dirección</td>
									<td><input type="text" name="direccion_c" id="direccion_c" data-parsley-type="email" class="form-control" value="{literal}{{consulta.direccion}}{/literal}" /></td>
								</tr>
								<tr>
									<td>Correo electrónico</td>
									<td><input type="email" name="email_c" id="email_c" data-parsley-type="email" class="form-control" value="{literal}{{consulta.correo_electronico}}{/literal}" /></td>
								</tr>
								<tr>
									<td>Teléfono</td>
									<td><input type="text" name="telefono_c1" id="telefono_c1" class="form-control" value="{literal}{{consulta.telefono1}}{/literal}" /></td>
								</tr>
								<tr>
									<td>Celular</td>
									<td><input type="text" name="celular_c" id="celular_c" class="form-control" value="{literal}{{consulta.celular}}{/literal}" /></td>
								</tr>
							</tbody>
						</table>
					 </div>
					 <!-- END table-responsive-->
				  </div>
			</div>
			<div class="modal-footer">
				<center>
					<button type="submit" class="btn btn-labeled btn-info" data-dismiss="modal" id="modificar_cliente_1" >
						<span class="btn-label"><i class="fa fa-exclamation"></i></span>Modificar
					</button>
					<button id="cancelar__2" type="button" class="btn btn-labeled btn-warning" data-dismiss="modal">
						<span class="btn-label"><i class="fa fa-warning"></i></span>Cancelar
					</button>
				</center>
			</div>
		 </div>
	</div>
</div>

<div id="asignar_producto" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" class="modal fade" >
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" data-dismiss="modal" aria-hidden="true" class="close">×</button>
				<h4 id="myModalLabel" class="modal-title">Enlace POS</h4>
			</div>
			<div class="modal-body">
					<!-- START panel-->
					<div class="panel panel-default2" style="margin-bottom: 0px;">
						<div class="panel-heading">Asignar Producto
						<a href="#" data-perform="panel-dismiss" data-toggle="tooltip" title="Close Panel" class="pull-right">
							<em class="fa fa-times"></em>
						</a>
						<a href="#" data-perform="panel-collapse" data-toggle="tooltip" title="Collapse Panel" class="pull-right">
							<em class="fa fa-minus"></em>
						</a>
						</div>
						<!-- START table-responsive-->
							 <div action="" class="panel panel-default2">
								<form id="producto_form" action="ajaxupload.php" method="post" enctype="multipart/form-data">
								<div class="panel-heading">
									<div class="panel-title"><strong> Registrar producto: </strong> Utilice esta opción para registrar sus productos
									</div>
								</div>
								<div class="panel-body">
									<fieldset>
										<div class="form-group">
											<label class="col-sm-2 control-label">Nombre del Producto:</label>
											<div class="col-sm-4">
											<input type="text" name="descripcion_producto" id="descripcion_producto_2" class="form-control" required="required">
											</div>

											<label class="col-sm-2 control-label">Marca:</label>
											<div class="col-sm-4">
											<input type="text" name="marca" id="marca" class="form-control" required="required">
											</div>
										</div>
									</fieldset>

								   <fieldset>
									  <div class="form-group">
										 <label class="col-sm-2 control-label"> Categoría: </label>
										 <div class="col-sm-4">
											<select name="categoria" id="categoria_pro" style="width: 160px;" class="form-control m-b">
												<option value="">Seleccione</option>
												<option ng-repeat="datos in categoriap" value="{literal}{{datos.descripcion}}{/literal}">
													{literal}{{datos.descripcion}}{/literal}
												</option>
											 </select>
										 </div>

										 <label class="col-sm-2 control-label">Cantidad</label>
										 <div class="col-sm-4">
											<input type="text" name="cantidad" id="cantidad" required="required" class="form-control">
										 </div>

									  </div>
								   </fieldset>
									<fieldset>
										<div class="form-group">
											<label class="col-sm-2 control-label">Precio Compra:</label>
											<div class="col-sm-4">
												<input type="text" name="precio_compra" id="precio_compra_2" class="form-control">
											</div>

											<label class="col-sm-1 control-label corregir_padding" >Precio Venta:</label>
											<div class="col-sm-2 corregir_padding">
												<input type="text" name="precio_venta" id="precio_venta_2" class="form-control">
											</div>
											<div class="col-sm-3 corregir_padding_2" >
												<span class="checkbox c-checkbox display_check">
													<label>
													   <input id="validacion_porcentaje" name="validacion_porcentaje" type="checkbox" checked />
													   <span class="fa fa-check"></span></label>
												 </span>
												<div id="definicion_porcentaje" class="input-group m-b">
													 <input type="text" class="form-control" name="precio_porcentaje" id="precio_porcentaje" value="20" />
													 <span id="span_porcentaje" class="input-group-addon">%</span>
												</div>
											</div>
										</div>
									</fieldset>

								   <fieldset class="omitir_espacios_">
									  <div class="form-group">
										 <label class="col-sm-2 control-label"> Características Adicionales: </label>
										 <div class="col-sm-4">
											<textarea name="caracteristicas_a" id="caracteristicas_a" class="form-control form-control-rounded"></textarea>
										 </div>

									 <label class="col-sm-2 control-label"> Imagen del producto: </label>
									<div class="col-sm-4">
										<link rel="stylesheet" href="{$_layoutParams.ruta_principal}app/css/cargar-archivo.css" />
										<script>
											{literal}
												(function(e,t,n){var r=e.querySelectorAll("html")[0];r.className=r.className.replace(/(^|\s)no-js(\s|$)/,"$1js$2")})(document,window,0);
											{/literal}
										</script>
										<input type="file" name="image" id="image_2" accept="image/*" class="inputfile inputfile-2" />
										<label for="image_2" style="width: 100%; margin-left: 10%;"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="17" viewBox="0 0 20 17"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/></svg> 
										<span>Seleccionar imagen&hellip;</span></label>

										<div id="preview" style="text-align: center; margin-top: 2%">
											<em class="fa fa-cloud-upload" style="color: #2a9fda;font-size: 40px;" ></em>
										</div>
										<script src="{$_layoutParams.ruta_principal}js/custom-file-input.js" type="text/javascript"></script>
									</div>
									  </div>
								   </fieldset>

									<fieldset class="omitir_espacios_">
										<div class="form-group">
											<label class="col-sm-2 control-label">Código:</label>
											<div class="col-sm-4">
											<input type="text" name="codigo" id="codigo" class="form-control" required="required">
											</div>
										</div>
									</fieldset>
								</div>

								<div class="panel-footer text-center">
										<button type="submit" class="btn btn-labeled btn-info" >
													<span class="btn-label"><i class="fa fa-exclamation"></i>
													</span>Registrar</button>
										<button id="cancelar_registro_p" type="button" class="btn btn-labeled btn-warning">
												<span class="btn-label"><i class="fa fa-warning"></i>
												</span>Cancelar</button>
								</div>
								</form>
							 </div>
					 <!-- END table-responsive-->
				  </div>
			</div>
		 </div>
	</div>
</div>

<div id="generar_factura" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" data-dismiss="modal" aria-hidden="true" class="close">×</button>
				<h4 id="myModalLabel" class="modal-title">Enlace POS - Pagar Factura de Venta</h4>
			</div>
			<div class="modal-body">
					<!-- START panel-->
					<div class="panel panel-default2" style="margin-bottom: 0px;">
						<div class="panel-heading">Seleccione a continuación el método de pago.
						<a href="#" data-perform="panel-dismiss" data-toggle="tooltip" title="Close Panel" class="pull-right">
							<em class="fa fa-times"></em>
						</a>
						<a href="#" data-perform="panel-collapse" data-toggle="tooltip" title="Collapse Panel" class="pull-right">
							<em class="fa fa-minus"></em>
						</a>
						</div>
						<!-- START table-responsive-->
					 <div class="table-responsive">
						<table class="table table-striped table-bordered table-hover">
							<tbody >
								<tr>
									<td><div class="label label-info pull-right" id="label-cliente" data-tip="Dinero dado por el cliente!" >Valor dado por el cliente: &nbsp; <code>*</code></div></td>
									<td><input type="text" placeholder="$ 0" name="valor_dado__" id="valor_dado__" autofocus class="form-control" onkeypress="return isNumberKey(event)" /></td>
								</tr>
								<tr>
									<td><div class="label label-info pull-right" id="label-cliente" data-tip="Dinero dado por el cliente!" >Efectivo: &nbsp; <code>*</code></div></td>
									<td style="width: 80%"><label class="switch"><input type="checkbox" id="__seleccion_efectivo__" ><span></span></label></td>
								</tr>
								<tr>
									<td>
										<div class="label label-info pull-right" id="label-cliente" data-tip="Tarjeta usada en el datáfono!" >Tarjeta débito: &nbsp; <code>*</code></div>
									</td>
									<td style="width: 80%">
										<label class="switch"><input type="checkbox" id="__seleccion_debito__" ><span></span></label>
									</td>
								</tr>
								<tr>
									<td>
										<div class="label label-info pull-right" id="label-cliente" data-tip="Tarjeta usada en el datáfono!">Tarjeta crédito: &nbsp; <code>*</code></div>
									</td>
									<td style="width: 80%">
										<label class="switch"><input type="checkbox" id="__seleccion_tcredito__" ><span></span></label>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<div class="label label-info pull-right" id="label-cliente-2" style="font-size: 18px"><div id="total_pago__"></div> </div>
									</td>
								</tr>
								<tr id="valor_final_m">
									<td colspan="2" >
										<div class="label label-info pull-right" id="label-cliente-2" style="font-size: 18px"><div id="valor_final__"></div> </div>
									</td>
								</tr>
								<tr id="valor_final_error">
									<td colspan="2" >
										<div class="label label-danger pull-right" id="label-cliente-2" style="font-size: 18px"><div id="mensaje_error__"></div> </div>
									</td>
								</tr>
							</tbody>
						</table>
					 </div>
					 <!-- END table-responsive-->
				  </div>
			</div>
			<div class="modal-footer"><button type="button" class="btn btn-labeled btn-warning" id="cancel_fact" >
					<span class="btn-label"><i class="fa fa-exclamation"></i>
					</span>CANCELAR</button>
					<button type="button" class="btn btn-labeled btn-success" id="asignar_tipo_pago" >
					<span class="btn-label"><i class="fa fa-money"></i>
					</span>PAGAR</button></div>
		 </div>
	</div>
</div>

<div id="edicion_productos" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form id="actualizar_productos" action="ajaxupload.php" method="post" enctype="multipart/form-data">
			<div class="modal-header">
				<button type="button" data-dismiss="modal" aria-hidden="true" class="close">×</button>
				<h4 id="myModalLabel" class="modal-title">Enlace POS</h4>
			</div>
			<div class="modal-body">
					<!-- START panel-->
					<div class="panel panel-default2">
						<div class="panel-heading">Datos generales
						<a href="#" data-perform="panel-dismiss" data-toggle="tooltip" title="Cerrar Panel" class="pull-right">
							<em class="fa fa-times"></em>
						</a>
						<a href="#" data-perform="panel-collapse" data-toggle="tooltip" title="Minimizar Panel" class="pull-right">
							<em class="fa fa-minus"></em>
						</a>
						</div>
						<!-- START table-responsive-->
					 <div class="table-responsive">
						<table class="table table-striped table-bordered table-hover">
							<tbody ng-repeat="consulta in consulta_producto">
								<tr>
									<td>Descripción de producto</td>
									<td><input type="text" name="descripcion_producto" id="descripcion_producto" required="required" class="form-control" value="{literal}{{consulta.descr_referencia}}{/literal}" /></td>
								</tr>
								<tr>
									<td>Código del producto</td>
									<td><input type="text" name="codigo_producto" id="codigo_producto" required="required" class="form-control" value="{literal}{{consulta.codigo_producto}}{/literal}" /></td>
								</tr>
								<tr>
									<td>Precio de Compra</td>
									<td>
										<input type="hidden" name="precio_compra_p" id="precio_compra_p" required="required" class="form-control" value="{literal}{{consulta.id_referencia}}{/literal}" />
										<input type="text" name="precio_compra" id="precio_compra" required="required" class="form-control" value="{literal}{{consulta.precio_compra}}{/literal}" />
									</td>
								</tr>
								<tr>
									<td>Cantidad</td>
									<td><input type="text" name="cantidad_producto" id="cantidad_producto" class="form-control" value="{literal}{{consulta.cantidad}}{/literal}" /></td>
								</tr>
								<tr>
									<td>Precio de Venta</td>
									<td>
										<input type="hidden" name="id_producto" id="id_producto" required="required" class="form-control" value="{literal}{{consulta.id_referencia}}{/literal}" />
										<input type="text" name="precio_venta" id="precio_venta" required="required" class="form-control" value="{literal}{{consulta.precio_venta}}{/literal}" />
									</td>
								</tr>
								<tr>
									<td>Imagen</td>
									<td>
										<link rel="stylesheet" href="{$_layoutParams.ruta_principal}app/css/cargar-archivo.css" />
										<script>
											{literal}
												(function(e,t,n){var r=e.querySelectorAll("html")[0];r.className=r.className.replace(/(^|\s)no-js(\s|$)/,"$1js$2")})(document,window,0);
											{/literal}
										</script>
										<input type="file" name="image" id="image" accept="image/*" class="inputfile inputfile-2" />
										<label for="image" style="width: 100%; margin-left: 10%;"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="17" viewBox="0 0 20 17"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/></svg> 
										<span>Seleccionar imagen&hellip;</span></label>

										<div id="preview" style="text-align: center; margin-top: 2%">
												<img src="{$_layoutParams.root}{literal}{{consulta.imagen}}{/literal}" width="200px" height="200px" ng-if='consulta.imagen != ""'>

												<em class="fa fa-cloud-upload" style="color: #2a9fda;font-size: 80px;" ng-if='consulta.imagen == ""'></em>
										</div>
										<script src="{$_layoutParams.ruta_principal}js/custom-file-input.js" type="text/javascript"></script>
									</td>
								</tr>
							</tbody>
						</table>
					 </div>
					 <!-- END table-responsive-->
				  </div>
			</div>
			<div class="modal-footer">
				<center>
					<button type="submit" class="btn btn-labeled btn-info"  >
						<span class="btn-label"><i class="fa fa-exclamation"></i></span>Modificar
					</button>
					<button id="cancelar__3" type="button" class="btn btn-labeled btn-warning" data-dismiss="modal">
						<span class="btn-label"><i class="fa fa-warning"></i></span>Cancelar
					</button>
				</center>
			</div>
			</form>
		 </div>
	</div>
</div>

<div id="apertura_caja" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" class="modal fade" >
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" data-dismiss="modal" aria-hidden="true" class="close">×</button>
				<h4 id="myModalLabel" class="modal-title">Enlace POS - Apertura de Caja</h4>
			</div>
			<div class="modal-body">
					<!-- START panel-->
					<div class="panel panel-default2" style="margin-bottom: 0px;">
						<div class="panel-heading">Ingrese a continuación el valor de la apertura.
						<a href="#" data-perform="panel-dismiss" data-toggle="tooltip" title="Close Panel" class="pull-right">
							<em class="fa fa-times"></em>
						</a>
						<a href="#" data-perform="panel-collapse" data-toggle="tooltip" title="Collapse Panel" class="pull-right">
							<em class="fa fa-minus"></em>
						</a>
						</div>
						<!-- START table-responsive-->
					 <div class="table-responsive">
						<form method="post" name="form1" action="" data-parsley-validate="" novalidate="">
						<input type="hidden" value="1" name="enviar" />
						<table class="table table-striped table-bordered table-hover">
							<tbody >
								<tr>
									<td><div class="label label-info pull-right" id="label-cliente" data-tip="Campo informativo!" >Fecha apertura:</div></td>
									<td><button type="button" class="btn btn-default apertura_informativo"><div id="fecha_apertura"></div>
									</button></td>
								</tr>
								<tr>
									<td>
										<div class="label label-info pull-right" id="label-cliente" data-tip="Quien va a manejar la caja!" >Usuario asignado: </div></td>
									<td style="width: 80%"><button type="button" class="btn btn-default apertura_informativo">
										<div id="usuario_asignado">{Session::get('nombre')}</div></button>
										</td>
								</tr>
								<tr>
									<td>
										<div class="label label-info pull-right" id="label-cliente" data-tip="Campo informativo!" >Sede:</div>
									</td>
									<td style="width: 80%">
										<button type="button" class="btn btn-default apertura_informativo"><div id="usuario_asignado">Sabaneta</div></button>
									</td>
								</tr>
								<tr>
									<td>
										<div class="label label-info pull-right" id="label-cliente" data-tip="Dinero en caja!">Valor apertura: &nbsp; <code>*</code></div>
									</td>
									<td style="width: 80%">
										<div class="input-group m-b">
											 <span class="input-group-addon">$</span>
											 <input id="valor_apertura" name="valor_apertura" autofocus type="number" class="form-control">
											 <span class="input-group-addon">.00</span>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<div class="label label-info pull-right" id="info-valor-apertura">
										<div id="total_valor_ap"></div> </div>
									</td>
								</tr>
							</tbody>
						</table>
						</form>
					 </div>
					 <!-- END table-responsive-->
				  </div>
			</div>
			<div class="modal-footer"><button type="button" class="btn btn-labeled btn-warning" id="cancelar_apertura" >
					<span class="btn-label"><i class="fa fa-exclamation"></i>
					</span>CANCELAR</button>
					<button type="button" class="btn btn-labeled btn-success" id="asignar_apertura" ng-click="asignarApertura($index);" >
					<span class="btn-label"><i class="fa fa-money"></i>
					</span>REGISTRAR</button></div>
		 </div>
	</div>
</div>

<div id="mostar_valor_devolver" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" data-dismiss="modal" aria-hidden="true" class="close">×</button>
				<h4 id="myModalLabel" class="modal-title">Enlace POS</h4>
			</div>
			<div class="modal-body">
					<!-- START panel-->
					<div class="panel panel-default2">
						<div class="panel-heading">Datos generales
						<a href="#" data-perform="panel-dismiss" data-toggle="tooltip" title="Cerrar Panel" class="pull-right">
							<em class="fa fa-times"></em>
						</a>
						<a href="#" data-perform="panel-collapse" data-toggle="tooltip" title="Minimizar Panel" class="pull-right">
							<em class="fa fa-minus"></em>
						</a>
						</div>
						<!-- START table-responsive-->
					 <div class="table-responsive">
						<table class="table table-striped table-bordered table-hover">
							<tbody >
								<tr>
									<td>Devolución de Compra</td>
									<td><input type="text" name="valordev" id="valordev" required="required" class="form-control" value="" style="color: #4b850c; font-size: 32px;" /></td>
								</tr>
							</tbody>
						</table>
					 </div>
					 <!-- END table-responsive-->
				  </div>
			</div>
			<div class="modal-footer">
				<center>
				</center>
			</div>
		 </div>
	</div>
</div>

<div id="cierre_caja" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" class="modal fade" >
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" data-dismiss="modal" aria-hidden="true" class="close">×</button>
				<h4 id="myModalLabel" class="modal-title">Enlace POS - Cierre de Caja</h4>
			</div>
			<div class="modal-body">
					<!-- START panel-->
					<div class="col-lg-12">
						<!-- START table-responsive-->
					 <div class="table-responsive">
					  
				  <div class="col-lg-2">
					<img src="{$_layoutParams.ruta_principal}app/img/user/usuario-enlacepos.png" style="width: 120px; height: auto;" alt="Image" class="img-thumbnail img-circle">
                  </div>
				  <!-- START widget-->
				  <div class="col-lg-10">
                  <div class="panel widget">
                     <div class="panel-body text-center">
                        <h3 class="m0">Hola, {Session::get('nombre')}</h3>
                        <p class="text-muted">Gestor</p>
                        <p>A continuación, brindaremos información de tu interés para el cierre.</p>
                     </div>
                     <div class="panel-body text-center bg-gray-lighter">
                        <div class="row row-table">
                           <div class="col-xs-4">
                              <h3 id="hora_de_apertura" class="m0"></h3>
                              <p class="m0">Hora de apertura</p>
                           </div>
                           <div class="col-xs-4">
                              <h3 id="base_inicial" class="m0"></h3>
                              <p class="m0">Base Inicial</p>
                           </div>
                           <div class="col-xs-4">
                              <h3 id="total_ventas_2" class="m0"></h3>
                              <p class="m0">Total ventas</p>
                           </div>
                        </div>
                     </div>
                  </div></div></div>
                  <!-- END widget-->
					 <!-- END table-responsive-->
				  </div>
			</div>
			<div class="modal-footer"><button type="button" class="btn btn-labeled btn-warning" id="cancelar_cierre" >
					<span class="btn-label"><i class="fa fa-exclamation"></i>
					</span>CANCELAR</button>
					<button type="button" class="btn btn-labeled btn-success" id="asignar_cierre" ng-click="cerrarCaja($index);" >
					<span class="btn-label"><i class="fa fa-power-off"></i>
					</span>CERRAR CAJA</button></div>
		 </div>
	</div>
</div>

<div id="registro_gestor" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" data-dismiss="modal" aria-hidden="true" class="close">×</button>
				<h4 id="myModalLabel" class="modal-title">Enlace POS - Registro Empleado</h4>
			</div>
			<div class="modal-body">
					<!-- START panel-->
					<div class="panel panel-default2" style="margin-bottom: 0px;">
						<!-- START table-responsive-->
		<form method="post" name="form1" action="" data-parsley-validate="" novalidate="">
			<input type="hidden" value="1" name="enviar" />
			 <!-- START panel-->
			 <div class="panel panel-default2">
				<div class="panel-heading">
				   <div class="panel-title">Ingrese a continuación la información de su nuevo empleado.
				   <span id="ingreso_em" ng-repeat="datos in ingreso_em" >
						<div class="alert alert-danger">{literal}{{datos.mensaje_error}}{/literal}</div>
					</span>
					</div>
				</div>
				<div class="panel-body" style="padding-bottom: 0px;">
					<div class="form-group">
					  <label class="control-label">Nombre *</label>
					  <input id="nombre_empleado" type="text" name="nombre_empleado" required="" class="form-control" data-parsley-id="0734">
					  <ul class="parsley-errors-list" id="parsley-id-0734"></ul>
				   </div>
				   <div class="form-group">
					  <label class="control-label">Usuario *</label>
					  <input id="usuario_empleado" type="text" name="usuario_empleado" required="" class="form-control" data-parsley-id="0734">
					  <ul class="parsley-errors-list" id="parsley-id-0734"></ul>
				   </div>
				   <div class="form-group">
					  <label class="control-label">Correo electrónico</label>
					  <input type="text" name="email_empleado" id="email_empleado" required="" class="form-control" data-parsley-id="0800"><ul class="parsley-errors-list" id="parsley-id-0800"></ul>
				   </div>
				   <div class="form-group">
					  <label class="control-label">Contraseña *</label>
					  <input id="pass_empleado" type="password" name="pass_empleado" required="" class="form-control" data-parsley-id="0734"><ul class="parsley-errors-list" id="parsley-id-0734"></ul>
				   </div>
				   <div class="form-group">
					  <label class="control-label">Confirmar contraseña *</label>
					  <input type="password" id="confirmar_pass" name="confirmar_pass" required="" data-parsley-equalto="#id-password" class="form-control" data-parsley-id="2473"><ul class="parsley-errors-list" id="parsley-id-2473"></ul>
				   </div>
				</div>
			<div class="modal-footer" style="margin-top: 0px;"><button type="button" class="btn btn-labeled btn-warning" id="cancelar_re_gestor" >
					<span class="btn-label"><i class="fa fa-exclamation"></i>
					</span>CANCELAR</button>
					<button type="button" class="btn btn-labeled btn-success" id="asignar_empleado" >
					<span class="btn-label"><i class="fa fa-user"></i>
					</span>REGISTRAR</button></div>
			 </div>
			 <!-- END panel-->
		  </form>
					 <!-- END table-responsive-->
				  </div>
			</div>

		 </div>
	</div>
</div>

<div id="mostrar_devuelta" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" data-dismiss="modal" aria-hidden="true" class="close">×</button>
				<h4 id="myModalLabel" class="modal-title">{$_layoutParams.configs.app_name}</h4>
			</div>
			<div class="modal-body">
					<!-- START panel-->
					<div class="panel panel-default2">
						<div class="panel-heading" style="font-size: 17px; font-weight: 500;">Devuelta
						<a href="#" data-perform="panel-dismiss" data-toggle="tooltip" title="Cerrar Panel" class="pull-right">
							<em class="fa fa-times"></em>
						</a>
						<a href="#" data-perform="panel-collapse" data-toggle="tooltip" title="Minimizar Panel" class="pull-right">
							<em class="fa fa-minus"></em>
						</a>
						</div>
						<!-- START table-responsive-->
					 <div class="table-responsive">
						<table class="table table-striped table-bordered table-hover">
							<tbody >
								<tr>
									<td>Valor a Devolver</td>
									<td><input type="text" name="valor_devuelta" id="valor_devuelta" required="required" class="form-control" value="" style="color: #4b850c; font-size: 32px;" /></td>
								</tr>
							</tbody>
						</table>
					 </div>
					 <!-- END table-responsive-->
				  </div>
			</div>
			<div class="modal-footer">
				<center>
				</center>
			</div>
		 </div>
	</div>
</div>

<div id="registro_dom" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" data-dismiss="modal" aria-hidden="true" class="close">×</button>
				<h4 id="myModalLabel" class="modal-title">Enlace POS - Registro Domiciliario</h4>
			</div>
			<div class="modal-body">
					<!-- START panel-->
					<div class="panel panel-default2" style="margin-bottom: 0px;">
						<!-- START table-responsive-->
		<form method="post" name="form1" action="" data-parsley-validate="" novalidate="">
			<input type="hidden" value="1" name="enviar" />
			 <!-- START panel-->
			 <div class="panel panel-default2">
				<div class="panel-heading">
					<div id="_mierror" class="alert alert-error" style="display: none"></div>
				   <div class="panel-title">Ingrese a continuación la información del nuevo domiciliario.
				   <span id="ingreso_em" ng-repeat="datos in ingreso_em" >
						<div class="alert alert-danger">{literal}{{datos.mensaje_error}}{/literal}</div>
					</span>
					</div>
				</div>
				<div class="panel-body" style="padding-bottom: 0px;">
					<div class="form-group">
					  <label class="control-label">Nombre *</label>
					  <input id="nombre_dom" type="text" name="nombre_dom" required="" class="form-control" data-parsley-id="0734">
					  <ul class="parsley-errors-list" id="parsley-id-0734"></ul>
				   </div>
					<div class="form-group">
					  <label class="control-label">Apellidos *</label>
					  <input id="apellidos_dom" type="text" name="apellidos_dom" required="" class="form-control" data-parsley-id="0734">
					  <ul class="parsley-errors-list" id="parsley-id-0734"></ul>
				   </div>
				   <div class="form-group">
					  <label class="control-label">Dirección *</label>
					  <input id="direccion_dom" type="text" name="direccion_dom" required="" class="form-control" data-parsley-id="0734">
					  <ul class="parsley-errors-list" id="parsley-id-0734"></ul>
				   </div>
				   <div class="form-group">
					  <label class="control-label">Teléfono</label>
					  <input id="telefono_dom" type="text" name="telefono_dom" required="" class="form-control" data-parsley-id="0734">
					  <ul class="parsley-errors-list" id="parsley-id-0734"></ul>
				   </div>
				   <div class="form-group">
					  <label class="control-label">Celular</label>
					  <input id="celular_dom" type="text" name="celular_dom" required="" class="form-control" data-parsley-id="0734">
					  <ul class="parsley-errors-list" id="parsley-id-0734"></ul>
				   </div>
				   <div class="form-group">
					  <label class="control-label">Correo electrónico</label>
					  <input type="text" name="email_dom" id="email_dom" required="" class="form-control" data-parsley-id="0800"><ul class="parsley-errors-list" id="parsley-id-0800"></ul>
				   </div>
				   <div class="form-group">
					  <label class="control-label">Contraseña *</label>
					  <input type="password" id="pass_dom" name="pass_dom" required="" class="form-control" data-parsley-id="0734"><ul class="parsley-errors-list" id="parsley-id-0734"></ul>
				   </div>
				   <div class="form-group">
					  <label class="control-label">Confirmar contraseña *</label>
					  <input type="password" id="con_pass_dom" name="con_pass_dom" required="" data-parsley-equalto="#id-password" class="form-control" data-parsley-id="2473"><ul class="parsley-errors-list" id="parsley-id-2473"></ul>
				   </div>
				</div>
			<div class="modal-footer" style="margin-top: 0px;">
					<button type="button" class="btn btn-labeled btn-success" id="asign_dom" >
					<span class="btn-label"><i class="fa fa-user"></i>
					</span>REGISTRAR</button></div>
			 </div>
			 <!-- END panel-->
		  </form>
					 <!-- END table-responsive-->
				  </div>
			</div>

		 </div>
	</div>
</div>

<div id="producto_no_existe" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" data-dismiss="modal" aria-hidden="true" class="close">×</button>
				<h4 id="myModalLabel" class="modal-title">{$_layoutParams.configs.app_name}</h4>
			</div>
			<div class="modal-body">
					<!-- START panel-->
					<div class="panel panel-default2">
						<div class="panel-heading" style="font-size: 17px; font-weight: 500;">Mensaje de Fallo
						<a href="#" data-perform="panel-dismiss" data-toggle="tooltip" title="Cerrar Panel" class="pull-right">
							<em class="fa fa-times"></em>
						</a>
						<a href="#" data-perform="panel-collapse" data-toggle="tooltip" title="Minimizar Panel" class="pull-right">
							<em class="fa fa-minus"></em>
						</a>
						</div>
						<!-- START table-responsive-->
					 <div class="table-responsive">
						<div class="alert alert-danger" style=" height: 80px; margin-top: 24px; font-size: 18px; ">El producto no se encuentra registrado en el sistema! <a href="javascript:void(0);" class="alert-link">Información</a>.</div>
					 </div>
					 <!-- END table-responsive-->
				  </div>
			</div>
			<div class="modal-footer">
				<center>
				</center>
			</div>
		 </div>
	</div>
</div>

<div id="ingreso_cantidad" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" data-dismiss="modal" aria-hidden="true" class="close">×</button>
				<h4 id="myModalLabel" class="modal-title">{$_layoutParams.configs.app_name}</h4>
				<div class="alert alert-info" id="mensaje_precio_compra" style="display: none; margin-bottom: 0px;    font-size: 16px; margin-top: 1%;">
				<button type="button" data-dismiss="alert" aria-hidden="true" class="close">×</button> ¡El precio de compra ha sido actualizado de manera satisfactoria!</div>

				<div class="alert alert-info" id="mensaje_precio_venta" style="display: none; margin-bottom: 0px;    font-size: 16px; margin-top: 1%;">
				<button type="button" data-dismiss="alert" aria-hidden="true" class="close">×</button> ¡El precio de venta ha sido actualizado de manera satisfactoria!</div>

			</div>
			<div class="modal-body">
					<!-- START panel-->
					<div class="panel panel-default2">
						<div class="panel-heading" style="font-size: 17px; font-weight: 500;">Datos del Producto
						<a href="#" data-perform="panel-dismiss" data-toggle="tooltip" title="Cerrar Panel" class="pull-right">
							<em class="fa fa-times"></em>
						</a>
						<a href="#" data-perform="panel-collapse" data-toggle="tooltip" title="Minimizar Panel" class="pull-right">
							<em class="fa fa-minus"></em>
						</a>
						</div>
						<!-- START table-responsive-->
					 <div class="table-responsive">
						<table class="table table-striped table-bordered table-hover">
								<tbody >
									<tr>
										<td>Cantidad a asignar</td>
										<td><input type="number" name="ingreso_cantidad_2" id="ingreso_cantidad_2" required="required" class="form-control" value="" style="color: #4b850c; font-size: 32px;" /></td>
									</tr>

									<tr>
										<td>Nombre del Producto</td>
										<td><input type="text" name="nombre_del_producto" id="nombre_del_producto" required="required" class="form-control" value="" style="color: #4b850c; font-size: 25px;"  /></td>
									</tr>

									<tr>
										<td>Precio de Compra</td>
										<td><input type="text" name="asignar_preciov" id="asignar_preciov" required="required" class="form-control" value="" style="color: #4b850c; font-size: 32px;"  /></td>
									</tr>

									<tr>
										<td>Cantidad en Inventario</td>
										<td><input type="text" name="asignar_cantidad" id="asignar_cantidad" required="required" class="form-control" value="" style="color: #4b850c; font-size: 25px;"  /></td>
									</tr>

									<tr>
										<td>Precio de Venta</td>
										<td><input type="text" name="precioventa" id="precioventa" required="required" class="form-control" value="" style="color: #4b850c; font-size: 32px;"  /></td>
									</tr>

									<tr>
										<td>Código Producto</td>
										<td><input type="text" name="asignar_codigo" id="asignar_codigo" required="required" class="form-control" value="" style="color: #4b850c; font-size: 12px;" readonly="readonly" /></td>
									</tr>
								</tbody>
							</table>
					 </div>
					 <!-- END table-responsive-->
				  </div>
			</div>
			<div class="modal-footer">
				<center>
				</center>
			</div>
		 </div>
	</div>
</div>


<div id="factura_ventana" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" data-dismiss="modal" aria-hidden="true" class="close">×</button>
				<h4 id="myModalLabel" class="modal-title">{$_layoutParams.configs.app_name}</h4>
			</div>
			<div class="modal-body">
					<!-- START panel-->
					<div class="panel panel-default2">
						<div class="panel-heading" style="font-size: 17px; font-weight: 500;">Datos del Producto
						<a href="#" data-perform="panel-dismiss" data-toggle="tooltip" title="Cerrar Panel" class="pull-right">
							<em class="fa fa-times"></em>
						</a>
						<a href="#" data-perform="panel-collapse" data-toggle="tooltip" title="Minimizar Panel" class="pull-right">
							<em class="fa fa-minus"></em>
						</a>
						</div>
						<!-- START table-responsive-->
					 <div class="table-responsive">
						<table class="table table-striped table-bordered table-hover">
								<tbody >
									<tr>
										<td id="texto_fac_ven">Cantidad a asignar</td>
										<td><input type="number" name="ingreso_cantidad_3" id="ingreso_cantidad_3" required="required" class="form-control" value="" style="color: #4b850c; font-size: 32px;"  /></td>
									</tr>

									<tr>
										<td id="texto_fac_ven">Nombre del Producto</td>
										<td><input type="text" name="nombre_del_producto_2" id="nombre_del_producto_2" required="required" class="form-control" value="" style="color: #4b850c; font-size: 25px;"  /></td>
									</tr>

									<tr>
										<td id="texto_fac_ven">Precio de Venta</td>
										<td><input type="text" name="asignar_preciove" id="asignar_preciove" required="required" class="form-control" value="" style="color: #4b850c; font-size: 32px;"  /></td>
									</tr>

									<tr>
										<td id="texto_fac_ven">Cantidad en Inventario</td>
										<td><input type="text" name="asignar_cantidad_2" id="asignar_cantidad_2" required="required" class="form-control" value="" style="color: #4b850c; font-size: 25px;"  /></td>
									</tr>

									<tr>
										<td id="texto_fac_ven">Código Producto</td>
										<td><input type="text" name="asignar_codigo_2" id="asignar_codigo_2" required="required" class="form-control" value="" style="color: #4b850c; font-size: 12px;" readonly="readonly" /></td>
									</tr>
								</tbody>
							</table>
					 </div>
					 <!-- END table-responsive-->
				  </div>
			</div>
			<div class="modal-footer">
				<center>
				</center>
			</div>
		 </div>
	</div>
</div>

<div id="cumple" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" class="modal fade" >
	<div class="modal-dialog">
		<div class="modal-content" style="width: 800px; margin-left: -100px;">
			<div class="modal-header">
				<button type="button" data-dismiss="modal" aria-hidden="true" class="close">×</button>
				<h4 id="myModalLabel" class="modal-title">Cumpleaños Clientes</h4>
			</div>
			<div class="modal-body">
					<!-- START panel-->
					<div class="panel panel-default2">
						<div class="panel-heading">Datos generales
						<a href="#" data-perform="panel-dismiss" data-toggle="tooltip" title="Close Panel" class="pull-right">
							<em class="fa fa-times"></em>
						</a>
						<a href="#" data-perform="panel-collapse" data-toggle="tooltip" title="Collapse Panel" class="pull-right">
							<em class="fa fa-minus"></em>
						</a>
						</div>
						<!-- START table-responsive-->
					 <div class="table-responsive" ng-show="cumple_cliente.length">
						<table class="table table-striped table-bordered table-hover" >
							<thead>
								<tr>
									<th>Nombre</th>
									<th>Teléfono</th>
									<th>Celular</th>
									<th>Correo</th>
									<th>Día cumpleaños</th>
								</tr>
							</thead>
							<tbody ng-repeat="cumple in cumple_cliente">
								<tr>
									<td><div class="label label-success">{literal}{{cumple.nombre}} {{cumple.apellidos}}{/literal}</div></td>
									<td><div class="label label-success">{literal}{{cumple.telefono}}{/literal}</div></td>
									<td><div class="label label-success">{literal}{{cumple.telefono_celular}}{/literal}</div></td>
									<td><div class="label label-success">{literal}{{cumple.correo_electronico}}{/literal}</div></td>
									<td><div class="label label-success">{literal}{{cumple.dia_nacimiento}}{/literal}</div></td>
								</tr>
							</tbody>
						</table>
					 </div>
					 <div ng-show="!cumple_cliente.length"> <div class="alert alert-danger"> No hay cumpleaños para el mes seleccionado </div></div>
					 <!-- END table-responsive-->
				  </div>
			</div>
			<div class="modal-footer"></div>
		 </div>
	</div>
</div>

<div id="agregarCategoria" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" data-dismiss="modal" aria-hidden="true" class="close">×</button>
				<h4 id="myModalLabel" class="modal-title">{$_layoutParams.configs.app_name}</h4>
			</div>
			<div class="modal-body">
					<!-- START panel-->
					<div class="panel panel-default2">
						<div class="panel-heading">Agregar categoría
						<a href="#" data-perform="panel-dismiss" data-toggle="tooltip" title="Cerrar Panel" class="pull-right">
							<em class="fa fa-times"></em>
						</a>
						<a href="#" data-perform="panel-collapse" data-toggle="tooltip" title="Minimizar Panel" class="pull-right">
							<em class="fa fa-minus"></em>
						</a>
						</div>
						<!-- START table-responsive-->
					 <div class="table-responsive">
						<form id="agregar_categoria" name="agregar_categoria" action="" method="POST" >
							<table class="table table-striped table-bordered table-hover">
								<tbody >
									<tr>
										<td>Descripción categoría</td>
										<td><input type="text" name="descripcion_categoria" id="descripcion_categoria" required="required" class="form-control" /></td>
									</tr>
								</tbody>
							</table>
							<br />
							<center>
							<button type="submit" class="btn btn-labeled btn-info" ng-click="categoriaProducto($index);" data-dismiss="modal" >
								<span class="btn-label"><i class="fa fa-exclamation"></i>
								</span>Registrar</button>
							</center>
						</form>
					 </div>
					 <!-- END table-responsive-->
				  </div>
			</div>
			<div class="modal-footer"></div>
		 </div>
	</div>
</div>

<div id="nombreImpresora" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" data-dismiss="modal" aria-hidden="true" class="close">×</button>
				<h4 id="myModalLabel" class="modal-title">{$_layoutParams.configs.app_name}</h4>
			</div>
			<div class="modal-body">
					<!-- START panel-->
					<div class="panel panel-default2">
						<div class="panel-heading">Ingresar Nombre
						<a href="#" data-perform="panel-dismiss" data-toggle="tooltip" title="Cerrar Panel" class="pull-right">
							<em class="fa fa-times"></em>
						</a>
						<a href="#" data-perform="panel-collapse" data-toggle="tooltip" title="Minimizar Panel" class="pull-right">
							<em class="fa fa-minus"></em>
						</a>
						</div>
						<!-- START table-responsive-->
					 <div class="table-responsive">
						<form id="nombre_impresora_form" name="nombre_impresora_form" action="" method="POST" >
							<table class="table table-striped table-bordered table-hover">
								<tbody >
									<tr>
										<td>Nombre de Impresora</td>
										<td><input type="text" name="nombre_impresora" id="nombre_impresora" required="required" class="form-control" /></td>
									</tr>
								</tbody>
							</table>
							<br />
							<center>
							<button type="submit" class="btn btn-labeled btn-info" id="nombre_impresora_registro" data-dismiss="modal" >
								<span class="btn-label"><i class="fa fa-exclamation"></i>
								</span>Registrar</button>
							</center>
						</form>
					 </div>
					 <!-- END table-responsive-->
				  </div>
			</div>
			<div class="modal-footer"></div>
		 </div>
	</div>
</div>

<div id="verificarDomicilio" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" data-dismiss="modal" aria-hidden="true" class="close">×</button>
				<h4 id="myModalLabel" class="modal-title">{$_layoutParams.configs.app_name}</h4>
			</div>
			<div class="modal-body">
					<!-- START panel-->
					<div class="panel panel-default2">
						<div class="panel-heading">Verificar Domicilio
						<a href="#" data-perform="panel-dismiss" data-toggle="tooltip" title="Cerrar panel" class="pull-right">
							<em class="fa fa-times"></em>
						</a>
						<a href="#" data-perform="panel-collapse" data-toggle="tooltip" title="Minimizar Panel" class="pull-right">
							<em class="fa fa-minus"></em>
						</a>
						</div>
						<!-- START table-responsive-->
					 <div class="table-responsive" style="margin-top: 2%; margin-bottom: 2%;">
						<form id="agregar_domicilio" name="agregar_domicilio" action="" method="POST" >
							<center>
							<button type="button" class="btn btn-labeled btn-info" id="nuevo_domicilio" data-dismiss="modal" style="font-size: 22px;" >
								<span class="btn-label"><i class="fa fa-exclamation"></i>
								</span>Domicilio</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

								<button type="button" id="nueva_nota" class="btn btn-labeled btn-success" style="font-size: 22px;">
								<span class="btn-label"><i class="fa fa-check"></i>
								</span>Nueva Nota</button>
							</center>
						</form>
					 </div>
					 <!-- END table-responsive-->
				  </div>
			</div>
			<div class="modal-footer"></div>
		 </div>
	</div>
</div>

<div id="cuentaBancaria" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" data-dismiss="modal" aria-hidden="true" class="close">×</button>
				<h4 id="myModalLabel" class="modal-title">{$_layoutParams.configs.app_name}</h4>
			</div>
			<div class="modal-body">
					<!-- START panel-->
					<div class="panel panel-default2">
						<div class="panel-heading">Ingresar Cuenta Bancaria
						<a href="#" data-perform="panel-dismiss" data-toggle="tooltip" title="Cerrar Panel" class="pull-right">
							<em class="fa fa-times"></em>
						</a>
						<a href="#" data-perform="panel-collapse" data-toggle="tooltip" title="Minimizar Panel" class="pull-right">
							<em class="fa fa-minus"></em>
						</a>
						</div>
						<!-- START table-responsive-->
					 <div class="table-responsive">
						<form id="nombre_cuenta_form" name="nombre_cuenta_form" action="" method="POST" >
							<table class="table table-striped table-bordered table-hover">
								<tbody >
									<tr>
										<td>Descripción de Cuenta Bancaria</td>
										<td><input type="text" name="descripcion_cuenta" id="descripcion_cuenta" required="required" class="form-control" /></td>
									</tr>
								</tbody>
							</table>
							<br />
							<center>
							<button type="submit" class="btn btn-labeled btn-info" id="cuenta_registro" data-dismiss="modal" >
								<span class="btn-label"><i class="fa fa-exclamation"></i>
								</span>Registrar</button>
							</center>
						</form>
					 </div>
					 <!-- END table-responsive-->
				  </div>
			</div>
			<div class="modal-footer"></div>
		 </div>
	</div>
</div>

<div id="agregarVendedor" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" data-dismiss="modal" aria-hidden="true" class="close">×</button>
				<h4 id="myModalLabel" class="modal-title">{$_layoutParams.configs.app_name}</h4>
			</div>
			<div class="modal-body">
					<!-- START panel-->
					<div class="panel panel-default2">
						<div class="panel-heading">Agregar vendedor
						<a href="#" data-perform="panel-dismiss" data-toggle="tooltip" title="Cerrar panel" class="pull-right">
							<em class="fa fa-times"></em>
						</a>
						<a href="#" data-perform="panel-collapse" data-toggle="tooltip" title="Minimizar Panel" class="pull-right">
							<em class="fa fa-minus"></em>
						</a>
						</div>
						<!-- START table-responsive-->
					 <div class="table-responsive">
						<form id="agregar_vendedor" name="agregar_vendedor" action="" method="POST" >
							<table class="table table-striped table-bordered table-hover">
								<tbody >
									<tr>
										<td>Nombre de vendedor</td>
										<td><input type="text" name="nombre_vendedor" id="nombre_vendedor" required="required" class="form-control" /></td>
									</tr>
								</tbody>
							</table>
							<br />
							<center>
							<button type="submit" class="btn btn-labeled btn-info" ng-click="insertar_vendedor($index);" id="nuevo_vendedor" data-dismiss="modal" >
								<span class="btn-label"><i class="fa fa-exclamation"></i>
								</span>Registrar</button>
							</center>
						</form>
					 </div>
					 <!-- END table-responsive-->
				  </div>
			</div>
			<div class="modal-footer"></div>
		 </div>
	</div>
</div>

<div id="agregarNota" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" data-dismiss="modal" aria-hidden="true" class="close">×</button>
				<h4 id="myModalLabel" class="modal-title">{$_layoutParams.configs.app_name}</h4>
			</div>
			<div class="modal-body">
					<!-- START panel-->
					<div class="panel panel-default2">
						<div class="panel-heading">Agregar nota
						<a href="#" data-perform="panel-dismiss" data-toggle="tooltip" title="Cerrar Panel" class="pull-right">
							<em class="fa fa-times"></em>
						</a>
						<a href="#" data-perform="panel-collapse" data-toggle="tooltip" title="Minimizar Panel" class="pull-right">
							<em class="fa fa-minus"></em>
						</a>
						</div>
						<!-- START table-responsive-->
					 <div class="table-responsive">
						<form id="agregar_nota_form" name="agregar_nota_form" action="" method="POST" >
							<table class="table table-striped table-bordered table-hover">
								<tbody >
									<tr>
										<td>Título Nota</td>
										<td><input type="text" name="titulo_nota" id="titulo_nota" required="required" class="form-control" /></td>
									</tr>
									<tr>
										<td>Descripción</td>
										<td>
										  {if isset($url)}
											{if $url == '' || $url == 'index'}
										<style>
											.CodeMirror.cm-s-default.CodeMirror-wrap{
											height: 100px !important;
											}
										</style>
											{/if}
										{/if}
										{if isset($url)}
											{if $url == '' || $url == 'index'}
												{literal}
												<textarea name="descripcion_nota" id="descripcion_nota" data-uk-markdownarea="{mode:'tab'}" placeholder="# Escriba aquí" onload="this.value='#Título'"></textarea>
												{/literal}
											{/if}
										{/if}
										</td>
									</tr>
									<tr>
										<td>Prioridad</td>
										<td>
											<select name="prioridad_nota" id="prioridad_nota" style="width: 260px;" class="chosen-select">
											<option value="0">Sin prioridad</option>
											<option value="1">Baja</option>
											<option value="2">Normal</option>
											<option value="3">Importante</option>
											<option value="4">Muy Importante</option>
											</select>
										</td>
									</tr>
								</tbody>
							</table>
							<br />
							<center>
							<button type="submit" class="btn btn-labeled btn-info" id="re_agregar_nota" data-dismiss="modal" >
								<span class="btn-label"><i class="fa fa-exclamation"></i>
								</span>Registrar</button>
							</center>
						</form>
					 </div>
					 <!-- END table-responsive-->
				  </div>
			</div>
			<div class="modal-footer"></div>
		 </div>
	</div>
</div>
{/if}