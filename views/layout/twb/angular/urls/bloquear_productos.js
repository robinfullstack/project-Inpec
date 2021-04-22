myApp.controller('encuestasController', function($scope, $http) {
	$http.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=utf-8';

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
				url: _root_ + 'producto/bloquear',
				dataType: 'json',
				data: {
					action: 'accionBloqueo',
					check: bloquearid
				}
			});

		$http({
			method : "POST",
			url : _root_ + 'producto/todos',
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