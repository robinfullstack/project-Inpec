myApp.controller('encuestasController', function($scope, $http) {
	$http.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=utf-8';

	$scope.btnEnviar = function(index){
		var dato_consulta = $("#encontrar").val();

		$http({
			method : "POST",
			url : _root_ + "distribuidor/busqueda",
			data : "action=busqueda&dato_consulta="+dato_consulta,
		}).success(function(data){ $scope.tabla_clientes = data;  });
	}

	$('#activar_seleccion').click(function(){
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
				url: _root_ + 'distribuidor/bloquear',
				dataType: 'json',
				data: {
					action: 'accionActivar',
					check: activarid
				}
			});

			$http({
				method : "POST",
				url : _root_ + 'distribuidor/clientesBloqueados',
				data : "action=clientesBloqueados",
			}).success(function(data){ $scope.tabla_clientes = data;  });

			$('#activos').trigger('click');
		}
		else
		{
			$('#noactivos').trigger('click');
		}
	});

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
				url: _root_ + 'distribuidor/bloquear',
				dataType: 'json',
				data: {
					action: 'accionBloqueo',
					check: bloquearid
				}
			});

			$http({
				method : "POST",
				url : _root_ + 'distribuidor/todos',
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