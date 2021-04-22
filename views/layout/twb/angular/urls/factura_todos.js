myApp.controller('encuestasController', function($scope, $http) {
	$http.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=utf-8';

	var parametro_url = $("#parametro_url").val();

	$http({
		method : "POST",
		url : _root_ + 'factura/todos',
		data : "action=consultarTodos&parametro_url="+parametro_url,
	}).success(function(data){ $scope.tabla_facturas = data;  });

	$scope.informacionProductos = function(index){
		$http({
			method : "POST",
			url : _root_ + 'factura/todos',
			data : "action=informacionProductos&id_factura="+index,
		}).success(function(data){ $scope.informacion_productos = data;  });

		$http({
			method : "POST",
			url : _root_ + 'factura/todos',
			data : "action=informacionProductosb&id_factura="+$scope.tabla_facturas[index].id_factura,
		}).success(function(data){ $scope.informacion_productosb = data;  });
	}
});