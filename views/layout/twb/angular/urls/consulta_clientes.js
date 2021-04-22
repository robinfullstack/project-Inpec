myApp.controller('encuestasController', function($scope, $http) {
	$http.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=utf-8';

	var parametro_url = $("#parametro_url").val();
	$http({
		method : "POST",
		url : _root_ + 'cliente/todos',
		data : "action=consultarTodos&parametro_url="+parametro_url,
	}).success(function(data){ $scope.tabla_clientes = data;  });

	$scope.informacionCliente = function(index){
		$http({
			method : "POST",
			url : _root_ + 'cliente/todos',
			data : "action=informacionCliente&id_cliente="+$scope.tabla_clientes[index].id_cliente,
		}).success(function(data){ $scope.consulta_cliente = data;  });
	}

	$scope.editarCliente = function(index){
		$http({
			method : "POST",
			url : _root_ + 'cliente/todos',
			data : "action=informacionCliente&id_cliente="+$scope.tabla_clientes[index].id_cliente,
		}).success(function(data){ $scope.consulta_cliente = data;  });
	}

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