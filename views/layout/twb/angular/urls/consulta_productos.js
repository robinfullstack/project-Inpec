myApp.controller('encuestasController', function($scope, $http) {
	$http.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=utf-8';

		var parametro_url = $("#parametro_url").val();

		$http({
			method : "POST",
			url : _root_ + 'producto/consultaProductos',
			data : "action=consultarTodos&parametro_url="+parametro_url,
		}).success(function(data){ $scope.tabla_clientes = data;  });
});