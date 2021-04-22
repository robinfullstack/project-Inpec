myApp.controller('encuestasController', function($scope, $http) {
	$http.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=utf-8';

	$http({
		method : "POST",
		url : _root_ + 'cliente/todos',
		data : "action=consultarTodos",
	}).success(function(data){ $scope.tabla_clientes = data;  });

	$scope.informacionCliente = function(index){
		$http({
			method : "POST",
			url : _root_ + 'cliente/todos',
			data : "action=informacionCliente&id_cliente="+$scope.tabla_clientes[index].id_cliente,
		}).success(function(data){ $scope.consulta_cliente = data;  });
	}

	$scope.btnEnviar = function(index){
		var dato_consulta = $("#encontrar").val();

		$http({
			method : "POST",
			url : _root_ + "cliente/busqueda",
			data : "action=busqueda&dato_consulta="+dato_consulta,
		}).success(function(data){ $scope.tabla_clientes = data;  });
	}

	$('#bloquear_seleccion').click(function(){
		var idArr = $("#valores input:checkbox").map(
					function(i, el) {
						if($(this).is(":checked")) {
							return $(el).attr("id"); 
						}
					}
			).get();

		var bloquearid = idArr.toString();

		if(bloquearid != "")
		{
			$.ajax({
				type: 'POST',
				url: _root_ + 'cliente/bloquear',
				dataType: 'json',
				data: {
					action: 'accionBloqueo',
					check: bloquearid
				}
			});

			$http({
				method : "POST",
				url : _root_ + 'cliente/todos',
				data : "action=consultarTodos",
			}).success(function(data){ $scope.tabla_clientes = data;  });

			$('#bloqueados').trigger('click');
		}
		else
		{
			$('#nobloqueados').trigger('click');
		}
	});
});