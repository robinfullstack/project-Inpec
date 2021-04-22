myApp.controller('encuestasController', function($scope, $http) {
	$http.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=utf-8';
	$scope.informacionCliente = function(index){
		$http({
			method : "POST",
			url : _root_ + 'distribuidor/todos',
			data : "action=informacionCliente&id_cliente="+$scope.tabla_clientes[index].id_distribuidor,
		}).success(function(data){ $scope.consulta_cliente = data;  });
	}

	$scope.editarCliente = function(index){
		$http({
			method : "POST",
			url : _root_ + 'distribuidor/todos',
			data : "action=informacionCliente&id_cliente="+$scope.tabla_clientes[index].id_distribuidor,
		}).success(function(data){ $scope.consulta_cliente = data;  });
	}

	$('#btnProducto').click(function(){
		var dato_consulta = $("#busqueda_producto").val();

		$http({
			method : "POST",
			url : _root_ + "producto/busqueda",
			data : "action=busquedap&dato_consulta="+dato_consulta,
		}).success(function(data){ $scope.tabla_productos = data;  });
	});

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
			success: function (data){
				//alert("mensaje");
			}
		});
	}

	var parametro_url = $("#parametro_url").val();
	
	$http({
		method : "POST",
		url : _root_ + 'producto/todos',
		data : "action=consultarTodos&parametro_url="+parametro_url,
	}).success(function(data){ console.log(data); $scope.tabla_productos = data;  });

	$('body').on('click','.ed_producto_1',function(){
		var id_producto = $(this).attr('id');
		$http({
			method : "POST",
			url : _root_ + 'producto/todos',
			data : "action=edicionProducto&id_producto="+id_producto,
		}).success(function(data){ $scope.consulta_producto = data;  });
	});

	$('body').on('click','.elim_prod_1',function(){
		var id_producto = $(this).attr('id');
		$http({
			method : "POST",
			url : _root_ + 'producto/todos',
			data : "action=eliminarProducto&id_producto="+id_producto,
		})

		$('#registro_eliminado').trigger('click');

		window.setTimeout('location.reload()', 1000);
	});

	$scope.edicionProducto = function(index){
		alert('hola');
		$http({
			method : "POST",
			url : _root_ + 'producto/todos',
			data : "action=edicionProducto&id_producto="+index,
		}).success(function(data){ $scope.consulta_producto = data;  });
	}

	$scope.eliminarProducto = function(index){
		$http({
			method : "POST",
			url : _root_ + 'producto/todos',
			data : "action=eliminarProducto&id_producto="+index,
		})

		$http({
			method : "POST",
			url : _root_ + 'producto/todos',
			data : "action=consultarTodos&parametro_url="+parametro_url,
		}).success(function(data){ $scope.tabla_productos = data;  });

		$('#registro_eliminado').trigger('click');
	}

	$(document).ready(function (e) {
		$("#actualizar_productos").on('submit',(function(e) {
			var id_producto = $("#id_producto").val();
			var descripcion_producto = $('#descripcion_producto').val();
			var codigo_producto = $('#codigo_producto').val();
			var cantidad_producto = $("#cantidad_producto").val();
			var precio_compra = $('#precio_compra').val();
			var precio_venta = $('#precio_venta').val();

			e.preventDefault();
			$.ajax({
				url: _root_ + "producto/modificar",
				type: "POST",
				data:  new FormData(this),
				contentType: false,
				cache: false,
				processData:false,
				beforeSend : function()
				{
					$("#err").fadeOut();
				},
				success: function(data)
				{
					$('#registro_modificado').trigger('click');
					var parametro_url = $("#parametro_url").val();
					$http({
						method : "POST",
						url : _root_ + 'producto/todos',
						data : "action=consultarTodos&parametro_url="+parametro_url,
					}).success(function(data){ $scope.tabla_productos = data;  });
					$('#edicion_productos').modal('toggle'); 

					//alert(data);
					if(data=='invalid')
					{
						// invalid file format.
						$("#err").html("Invalid File !").fadeIn();
					}
					else
					{
						// view uploaded file.
						$("#preview").html(data).fadeIn();
						//$("#form")[0].reset(); 
					}
				},error: function(e) 
				{
					$('#faltan_datos').trigger('click');
				}          
			});
		}));
	});

});