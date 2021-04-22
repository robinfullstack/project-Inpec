{if isset($datos_encontrados) && count($datos_encontrados)}

	<div id="lista_registros" class="panel panel-default">
		<div class="panel-heading">Bloquear clientes
		  <a href="#" data-perform="panel-dismiss" data-toggle="tooltip" title="Cerrar Panel" class="pull-right">
			 <em class="fa fa-times"></em>
		  </a>
		  <a href="#" data-perform="panel-collapse" data-toggle="tooltip" title="Cerrar Ventana" class="pull-right">
			 <em class="fa fa-minus"></em>
		  </a>
		</div>
	   <!-- START table-responsive-->
	   <div class="table-responsive">
			<table class="table table-bordered table-hover">
				 <thead>
					<tr>
						<th style="width: 13%">Tarjeta</th>
						<th style="width: 25%">Nombre</th>
						<th style="width: 25%">Apellidos</th>
						<th>Correo</th>
						<th>Más información</th>
						<th style="width: 5%" class="check-all">
							<div data-toggle="tooltip" data-title="Seleccione todos" class="checkbox c-checkbox">
								<label>
									<input type="checkbox" />
									<span class="fa fa-check"></span>
								</label>
							</div>
						</th>
					</tr>
				 </thead>
				{foreach item=datos from=$datos_encontrados}
					<tbody >
							<tr>
								<td>{$datos.tarjeta} </td>
								<td>{$datos.nombre}</td>
								<td>{$datos.apellidos}</td>
								<td>{$datos.correo_electronico}</td>
								<td style="width: 20px; text-align: center;" >
									<a href="#"  ng-click="informacionCliente($index);" data-toggle="modal" data-target="#informacion" class="dropdown-toggle"><i class="fa fa-users"></i></a>
								</td>
								<td>
									<div class="checkbox c-checkbox">
										<label>
											<input name="elemento-{$datos.id_cliente}" id="elemento-{$datos.id_cliente}" type="checkbox" />
											<span class="fa fa-check"></span>
										</label>
									</div>
								</td>
							</tr>
					</tbody>
				 {/foreach}
			</table>
		</div>
		<!-- END table-responsive-->
		<div class="panel-footer">
			<div class="row">
				<div class="col-lg-8"></div>
				<!--
				<div class="col-lg-2">
					<div class="input-group pull-right">
						<select class="input-sm form-control">
							<option value="0">Bulk action</option>
							<option value="1">Delete</option>
							<option value="2">Clone</option>
							<option value="3">Export</option>
						</select>
						<span class="input-group-btn">
							<button class="btn btn-sm btn-default">Apply</button>
						</span>
					</div>
				</div>
				-->
			</div>
		</div>
	</div>
{else}
	<p><strong>No hay información!</strong></p>
{/if}