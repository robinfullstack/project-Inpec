myApp.controller('encuestasController', function($scope, $http) {
	$http.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=utf-8';

	var parametro_url = $("#parametro_url").val();

	$http({
		method : "POST",
		url : _root_ + 'gastos/dia',
		data : "action=consultarDia&parametro_url="+parametro_url,
	}).success(function(data){ $scope.tabla_gastos = data;  });
});