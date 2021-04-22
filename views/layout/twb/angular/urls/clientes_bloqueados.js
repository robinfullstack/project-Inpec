myApp.controller('encuestasController', function($scope, $http) {
	$http.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=utf-8';
		$http({
			method : "POST",
			url : _root_ + 'distribuidor/clientesBloqueados',
			data : "action=consultarTodos&parametro_url="+parametro_url,
		}).success(function(data){ $scope.tabla_clientes = data;  });
});