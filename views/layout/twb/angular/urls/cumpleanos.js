myApp.controller('encuestasController', function($scope, $http) {
	$http.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=utf-8';

	$scope.cumpleEnero = function(index){
		$http({
			method : "POST",
			url : _root_ + "cumpleanos",
			data : "action=consultarCumple&fecha=01",
		}).success(function(data){ $scope.cumple_cliente = data; });
	}

	$scope.cumpleFebrero = function(index){
		$http({
			method : "POST",
			url : _root_ + "cumpleanos",
			data : "action=consultarCumple&fecha=02",
		}).success(function(data){ $scope.cumple_cliente = data; });
	}

	$scope.cumpleMarzo = function(index){
		$http({
			method : "POST",
			url : _root_ + "cumpleanos",
			data : "action=consultarCumple&fecha=03",
		}).success(function(data){ $scope.cumple_cliente = data; });
	}

	$scope.cumpleAbril = function(index){
		$http({
			method : "POST",
			url : _root_ + "cumpleanos",
			data : "action=consultarCumple&fecha=04",
		}).success(function(data){ $scope.cumple_cliente = data; });
	}

	$scope.cumpleMayo = function(index){
		$http({
			method : "POST",
			url : _root_ + "cumpleanos",
			data : "action=consultarCumple&fecha=05",
		}).success(function(data){ $scope.cumple_cliente = data; });
	}

	$scope.cumpleJunio = function(index){
		$http({
			method : "POST",
			url : _root_ + "cumpleanos",
			data : "action=consultarCumple&fecha=06",
		}).success(function(data){ $scope.cumple_cliente = data; });
	}

	$scope.cumpleJulio = function(index){
		$http({
			method : "POST",
			url : _root_ + "cumpleanos",
			data : "action=consultarCumple&fecha=07",
		}).success(function(data){ $scope.cumple_cliente = data; });
	}

	$scope.cumpleAgosto = function(index){
		$http({
			method : "POST",
			url : _root_ + "cumpleanos",
			data : "action=consultarCumple&fecha=08",
		}).success(function(data){ $scope.cumple_cliente = data; });
	}

	$scope.cumpleSeptiembre = function(index){
		$http({
			method : "POST",
			url : _root_ + "cumpleanos",
			data : "action=consultarCumple&fecha=09",
		}).success(function(data){ $scope.cumple_cliente = data; });
	}

	$scope.cumpleOctubre = function(index){
		$http({
			method : "POST",
			url : _root_ + "cumpleanos",
			data : "action=consultarCumple&fecha=10",
		}).success(function(data){ $scope.cumple_cliente = data; });
	}

	$scope.cumpleNoviembre = function(index){
		$http({
			method : "POST",
			url : _root_ + "cumpleanos",
			data : "action=consultarCumple&fecha=11",
		}).success(function(data){ $scope.cumple_cliente = data; });
	}

	$scope.cumpleDiciembre = function(index){
		$http({
			method : "POST",
			url : _root_ + "cumpleanos",
			data : "action=consultarCumple&fecha=12",
		}).success(function(data){ $scope.cumple_cliente = data; });
	}
	
});