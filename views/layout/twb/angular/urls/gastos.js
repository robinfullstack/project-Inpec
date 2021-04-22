myApp.controller('encuestasController', function($scope, $http) {
	$http.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=utf-8';

	var parametro_url = $("#parametro_url").val();

	$scope.eliminarGasto = function(index){
		var id_gasto = $scope.tabla_gastos[index].id_gastos;

		if(id_gasto == ""){
			alert("Ha ocurrido un error al tratar de borrar el gasto!");
		}else{
			$.ajax({
				  type : "POST",
				  url : _root_ + "gastos/todos",
				  dataType: 'json',
				  async: false,
				  data: {
				  action: 'eliminarGasto',
				  id_gasto: id_gasto
				  }
				});

			$http({
				method : "POST",
				url : _root_ + 'gastos/todos',
				data : "action=consultarTodos&parametro_url="+parametro_url,
			}).success(function(data){ $scope.tabla_gastos = data;  });

			$('#gasto_eliminado').trigger('click');
		}
	}

	$http({
		method : "POST",
		url : _root_ + 'gastos/todos',
		data : "action=consultarTodos&parametro_url="+parametro_url,
	}).success(function(data){ $scope.tabla_gastos = data;  });
});