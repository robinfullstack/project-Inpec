myApp.controller('encuestasController', function($scope, $http) {
	$http.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=utf-8';

	var parametro_url = $("#parametro_url").val();
	$http({
		method : "POST",
		url : _root_ + 'cliente/clientesBloqueados',
		data : "action=consultarTodos&parametro_url="+parametro_url,
	}).success(function(data){ $scope.tabla_clientes = data;  });

	$scope.informacionCliente = function(index){
		$http({
			method : "POST",
			url : _root_ + 'cliente/clientesBloqueados',
			data : "action=informacionCliente&id_cliente="+$scope.tabla_clientes[index].id_cliente,
		}).success(function(data){ $scope.consulta_cliente = data;  });
	}

	$scope.eliminarCliente = function(index){
		$http({
			method : "POST",
			url : _root_ + 'cliente/clientesBloqueados',
			data : "action=eliminarCliente&id_cliente="+$scope.tabla_clientes[index].id_cliente + "&activo=0",
		}).success(function(data){ $scope.tabla_clientes = data;  });
	}

	$('#btnDesbloquear').click(function(){
		var dato_consulta = $("#desbloquear").val();

		$http({
			method : "POST",
			url : _root_ + "cliente/busqueda",
			data : "action=desbloquear&dato_consulta="+dato_consulta,
		}).success(function(data){ $scope.tabla_clientes = data;  });
	});

	$('#activar_seleccion_1').click(function(){
		var idArr = $("#activar input:checkbox").map(
					function(i, el) {
						if($(this).is(":checked")) {
							return $(el).attr("id"); 
						}
					}
			).get();

		var activarid = idArr.toString();

		if(activarid != "")
		{
			$.ajax({
				type: 'POST',
				url: _root_ + 'cliente/bloquear',
				dataType: 'json',
				data: {
					action: 'accionActivar',
					check: activarid
				}
			});

			$http({
				method : "POST",
				url : _root_ + 'cliente/clientesBloqueados',
				data : "action=clientesBloqueados",
			}).success(function(data){ $scope.tabla_clientes = data; });

			$('#activos').trigger('click');
		}
		else
		{
			$('#noactivos').trigger('click');
		}
	});
});