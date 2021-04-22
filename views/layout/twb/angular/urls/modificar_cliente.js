myApp.controller('encuestasController', function($scope, $http) {
	$http.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=utf-8';	
	$('#modificar_cliente_1').click(function(){
		var id_cliente_1 = $("#id_cliente_1").val();
		var nombre = $('#nombre_c').val();
		var numero_identificacion = $("#numero_identificacion").val();
		var direccion = $('#direccion_c').val();
		var correo = $('#email_c').val();
		var telefono_1 = $('#telefono_c1').val();
		var celular = $('#celular_c').val();

		//alert(id_cliente_1 + ' ' + numero_identificacion + ' ' + nombre);
		if(id_cliente_1 != "" && numero_identificacion != "" && nombre != "" ){
			$.ajax({
				  type : "POST",
				  url : _root_ + "cliente/modificar",
				  dataType: 'json',
				  data: {
					action: 'modificarCliente',
					id_cliente: id_cliente_1,
					nombre: nombre,
					numero_identificacion: numero_identificacion,
					direccion: direccion,
					correo: correo,
					telefono_1: telefono_1,
					celular: celular
				},
			});
			$('#registro_modificado').trigger('click');
			$http({
				method : "POST",
				url : _root_ + 'cliente/todos',
				data : "action=consultarTodos",
			}).success(function(data){ $scope.tabla_clientes = data;  });
		}
		else
		{
			$('#faltan_datos').trigger('click');
		}
	});
});