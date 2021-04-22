myApp.controller('encuestasController', function($scope, $http) {
	$http.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=utf-8';

	$scope.categoriaProducto = function(index){
		var descripcion_categoria = $("#descripcion_categoria").val();
		$.ajax({
			  type : "POST",
			  url : _root_ + "producto/registrar",
			  dataType: 'json',
			  async: false,
			  data: {
				action: 'insertarCategoria',
				descripcion_categoria: descripcion_categoria
			},
			success: function (){
				$('#registro_aprobado').trigger('click');
			}
		});
	}
});