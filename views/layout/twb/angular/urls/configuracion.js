myApp.controller('encuestasController', function($scope, $http) {
	$http.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=utf-8';

	$('#cuenta_registro').click(function(){
		var descripcion_cuenta = $("#descripcion_cuenta").val();

		if(descripcion_cuenta != "" ){
			$.ajax({
				  type : "POST",
				  url : _root_ + "configuracion/cuenta",
				  dataType: 'json',
				  async:   false,
				  data: {
					action: 'insertarCuenta',
					descripcion_cuenta: descripcion_cuenta
				},
			});

			$('#registro_aprobado').trigger('click');

			$("#descripcion_cuenta").val("");
		}
		else
		{
			$('#faltan_datos').trigger('click');
		}
	});

});