myApp.controller('encuestasController', function($scope, $http) {
	$http.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=utf-8';

	var parametro_url = $("#parametro_url").val();

	$http({
		method : "POST",
		url : _root_ + 'pedido/todos',
		data : "action=consultarTodos&parametro_url="+parametro_url,
	}).success(function(data){ $scope.tabla_facturas = data;  });

	$scope.informacionProductos = function(index){
		$http({
			method : "POST",
			url : _root_ + 'pedido/todos',
			data : "action=informacionProductos&id_factura="+$scope.tabla_facturas[index].id_factura,
		}).success(function(data){ $scope.informacion_productos = data;  });
	}

	$scope.eliminarPedido = function(index){
		var id_pedido = $scope.tabla_facturas[index].id_factura;

		if(id_pedido == ""){
			alert("Ocurrió un error al tratar de borrar el pedido!");
		}else{
			$.ajax({
				  type : "POST",
				  url : _root_ + "pedido/todos",
				  dataType: 'json',
				  async: false,
				  data: {
				  action: 'eliminarPedido',
				  id_pedido: id_pedido
				  }
				});

			$http({
				method : "POST",
				url : _root_ + 'pedido/todos',
				data : "action=consultarTodos&parametro_url="+parametro_url,
			}).success(function(data){ $scope.tabla_facturas = data;  });

			$('#pedido_desactivado').trigger('click');
		}
	}
});