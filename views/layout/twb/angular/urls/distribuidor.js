myApp.controller('encuestasController', function($scope, $http) {
	$http.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=utf-8';

	$scope.btnDesbloquear = function(index){
		var dato_consulta = $("#desbloquear").val();

		$http({
			method : "POST",
			url : _root_ + "distribuidor/busqueda",
			data : "action=desbloquear&dato_consulta="+dato_consulta,
		}).success(function(data){ $scope.tabla_clientes = data;  });
	}

	$http({
		method : "POST",
		url : _root_ + 'distribuidor/todos',
		data : "action=consultarTodos",
	}).success(function(data){ $scope.tabla_clientes = data;  });

	$scope.informacionCliente = function(index){
		$http({
			method : "POST",
			url : _root_ + 'distribuidor/todos',
			data : "action=informacionCliente&id_cliente="+$scope.tabla_clientes[index].id_distribuidor,
		}).success(function(data){ $scope.consulta_cliente = data;  });
	}

	$scope.editarCliente = function(index){
		$http({
			method : "POST",
			url : _root_ + 'distribuidor/todos',
			data : "action=informacionCliente&id_cliente="+$scope.tabla_clientes[index].id_distribuidor,
		}).success(function(data){ $scope.consulta_cliente = data;  });
	}

	$('#modificar_cliente').click(function(){
		var id_cliente = $("#id_cliente").val();
		var nombre = $("#nombre").val();
		var tarjeta = $('#tarjeta').val();
		var masculino = $('#masculino:checked').val();
		var femenino = $('#femenino:checked').val();
		var correo = $('#correo').val();
		var celular = $('#celular').val();
		var c_celular = $('#c_celular').val();
		var direccion = $('#direccion').val();
		var ciudad = $('#ciudad').val();
		var telefono_domicilio = $('#telefono_domicilio').val();

		if(masculino == 1)
			var sexo = 1;
		else
			var sexo = 2;

		if(id_cliente != "" && nombre != "" && sexo != ""){
			$.ajax({
				  type : "POST",
				  url : _root_ + "distribuidor/modificar",
				  dataType: 'json',
				  data: {
					action: 'modificarCliente',
					id_cliente: id_cliente,
					nombre: nombre,
					tarjeta: tarjeta,
					sexo: sexo,
					correo: correo,
					celular: celular,
					direccion: direccion,
					ciudad: ciudad,
					telefono_domicilio: telefono_domicilio
				},
			});

			$('#registro_modificado').trigger('click');

			$http({
				method : "POST",
				url : _root_ + 'distribuidor/todos',
				data : "action=consultarTodos",
			}).success(function(data){ $scope.tabla_clientes = data;  });
		}
		else
		{
			$('#faltan_datos').trigger('click');
		}
	});

});