<div class="alert alert-success">
        <strong>¡Registro del gestor!</strong>
      </div>
		<div class="col-lg-12">
		  <form method="post" name="form1" action="" data-parsley-validate="" novalidate="">
			<input type="hidden" value="1" name="enviar" />
			 <!-- START panel-->
			 <div class="panel panel-default">
				<div class="panel-heading">
				   <div class="panel-title">Registro de Empleado</div>
				</div>
				<div class="panel-body">
					<div class="form-group">
					  <label class="control-label">Nombre *</label>
					  <input id="nombre" type="text" name="nombre" required="" class="form-control" data-parsley-id="0734">
					  <ul class="parsley-errors-list" id="parsley-id-0734"></ul>
				   </div>
				   <div class="form-group">
					  <label class="control-label">Usuario *</label>
					  <input id="usuario" type="text" name="usuario" required="" class="form-control" data-parsley-id="0734">
					  <ul class="parsley-errors-list" id="parsley-id-0734"></ul>
				   </div>
				   <div class="form-group">
					  <label class="control-label">Correo electrónico *</label>
					  <input type="text" name="email" required="" class="form-control" data-parsley-id="0800"><ul class="parsley-errors-list" id="parsley-id-0800"></ul>
				   </div>
				   <div class="form-group">
					  <label class="control-label">Contraseña *</label>
					  <input id="id-password" type="password" name="pass" required="" class="form-control" data-parsley-id="0734"><ul class="parsley-errors-list" id="parsley-id-0734"></ul>
				   </div>
				   <div class="form-group">
					  <label class="control-label">Confirmar contraseña *</label>
					  <input type="password" name="confirmar" required="" data-parsley-equalto="#id-password" class="form-control" data-parsley-id="2473"><ul class="parsley-errors-list" id="parsley-id-2473"></ul>
				   </div>
				   <div class="required">* Campos requeridos</div>
				</div>
				<div class="panel-footer">
				   <div class="clearfix">
					  <div class="pull-left">
						 <div class="checkbox c-checkbox">
							<label>
							   <!-- <input type="checkbox" name="agreements" required="" data-parsley-error-message="Please read and agree the terms" data-parsley-multiple="agreements" data-parsley-id="2291">
							   <span class="fa fa-check"></span>I agree with the <a href="javascript:void(0);">terms</a>-->
							</label><ul class="parsley-errors-list" id="parsley-id-multiple-agreements"></ul>
						 </div>
					  </div>
					  <div class="pull-right">
						 <button type="submit" class="btn btn-primary">Registrar</button>
					  </div>
				   </div>
				</div>
			 </div>
			 <!-- END panel-->
		  </form>
		</div>