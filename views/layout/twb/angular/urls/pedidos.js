myApp.controller('encuestasController', function($scope, $http) {
	$http.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=utf-8';

	$http({
	  method : "POST",
		url : _root_ + "pedido/registrar",
	  data : "action=ultimoIdPreguntas",
	}).success(function(data){ $scope.ultimoid_factura = data; });

	$("#devuelta_cliente").keypress(function(e) {
		if(e.which == 13) {
			var total_pago_info = $("#total_pago_info").val();
			var devuelta_cliente = $("#devuelta_cliente").val();
			if(total_pago_info == "" || devuelta_cliente == "")
			{
				alert("No se ha definido un valor total o el valor a devolver!");
			}
			else
			{
				$.ajax({
					  type : "POST",
					  url : _root_ + "pedido/registrar",
					  dataType: 'json',
					  async:   false,
					  data: {
						action: 'devolucionManual',
						total_pago_info: total_pago_info,
						devuelta_cliente: devuelta_cliente
					},
					success: function (devolver){
						$('#valor_devuelta').val(devolver.id_devolucion_valor);
							$('#mostrar_devuelta').modal('show');
							//alert(devolver.id_devolucion_valor);
					}
				});
			}
		}
	});

	$("#asignar_preciov").keypress(function(e) {
		if(e.which == 13) {
			var identificador_factura = $("#identificador_factura").val();
			var asignar_codigo = $('#asignar_codigo').val();
			var precio_de_compra = $('#asignar_preciov').val();

			if(precio_de_compra > 8000000){
				alert('El precio de compra debe ser menor a 8.000.000');
				$('#asignar_preciov').val('');
			}else if(precio_de_compra == ""){
				alert('Ingrese el precio de compra!');
				$('#asignar_preciov').val('');
			}else if(precio_de_compra == 0){
				alert('Ingrese el precio de compra!');
				$('#asignar_preciov').val('');
			}else{
				$.ajax({
					  type : "POST",
					  url : _root_ + "pedido/registrar",
					  dataType: 'json',
					  async:   false,
					  data: {
						action: 'updateCompra',
						codigo_producto: asignar_codigo,
						precio_de_compra: precio_de_compra
					},
				});

				//$( "#base_productos" ).show();

				$('#mensaje_precio_compra').show();
				$("#mensaje_precio_compra").css('display','block!important');

			}
		}
	});

	$("#precioventa").keypress(function(e) {
		if(e.which == 13) {
			var identificador_factura = $("#identificador_factura").val();
			var asignar_codigo = $('#asignar_codigo').val();
			var precio_de_venta = $('#precioventa').val();

			if(precio_de_venta > 8000000){
				alert('El precio de venta debe ser menor a 8.000.000');
				$('#precioventa').val('');
			}else if(precio_de_venta == ""){
				alert('Ingrese el precio de venta!');
				$('#precioventa').val('');
			}else if(precio_de_venta == 0){
				alert('Ingrese el precio de venta!');
				$('#precioventa').val('');
			}else{
				$.ajax({
					  type : "POST",
					  url : _root_ + "pedido/registrar",
					  dataType: 'json',
					  async:   false,
					  data: {
						action: 'updateVenta',
						codigo_producto: asignar_codigo,
						precio_de_venta: precio_de_venta
					},
					
				});

				$('#mensaje_precio_venta').show();
				$("#mensaje_precio_venta").css('display','block!important');

			}
		}
	});

	$("#ingreso_cantidad_2").keypress(function(e) {
		if(e.which == 13) {
			var identificador_factura = $("#identificador_factura").val();
			var asignar_codigo = $('#asignar_codigo').val();
			var ingreso_cantidad = $('#ingreso_cantidad_2').val();

			if(ingreso_cantidad > 10000){
					alert('La cantidad suministrada debe ser menor a 10.000');
					$('#ingreso_cantidad_2').val('');
				}else if(ingreso_cantidad == ""){
					alert('Ingrese la cantidad!');
					$('#ingreso_cantidad_2').val('');
				}else if(ingreso_cantidad == 0){
					alert('Ingrese la cantidad!');
					$('#ingreso_cantidad_2').val('');
				}else{
					$.ajax({
						  type : "POST",
						  url : _root_ + "pedido/registrar",
						  dataType: 'json',
						  async:   false,
						  data: {
							action: 'insertarProducto',
							identificador_factura: identificador_factura,
							codigo_producto: asignar_codigo,
							cantidad_producto: ingreso_cantidad
						},
						
					});

					$( "#base_productos" ).show();
					
					$http({
					  method : "POST",
					  url : _root_ + "pedido/registrar",
					  data : "action=getProductos&identificador_factura="+identificador_factura,
					}).success(function(data){ $scope.productos = data;  });

					$http({
					  method : "POST",
					  url : _root_ + "pedido/registrar",
					  data : "action=getTotal&identificador_factura="+identificador_factura,
					}).success(function(data){ $scope.valortotal = data;  });

					$( "#asignar_codigo" ).val('');
					$('#ingreso_cantidad').modal('toggle'); 
					$( "#asignar_codigo" ).focus();
					$("#ingreso_cantidad_2").val('');
					$("#busqueda").hide(); 
				}
			}
		});

	$("#cantidad_producto").keypress(function(e) {
		if(e.which == 13) {
				var codigo_producto = $("#codigo_producto").val();
				var cantidad_producto = $("#cantidad_producto").val();
				var identificador_factura = $("#identificador_factura").val();
				
				if(cantidad_producto == "" || codigo_producto == "")
					alert("Por favor ingrese la cantidad del producto y el código.");
				else if(cantidad_producto >= 200)
				{
					alert('¡La cantidad debe ser menor a 200!');
					$("#cantidad_producto").val('');
				}
				else
				{
						var ultimo_ = $("#ultimo_id_preguntas").val();
						var agregar_id = parseInt(ultimo_) + 1;

						$.ajax({
							  type : "POST",
							  url : _root_ + "pedido/registrar",
							  dataType: 'json',
							  async:   false,
							  data: {
								action: 'existenciaProducto',
								codigo_producto: codigo_producto
							},
							success: function (devolver){
								$('#existenciap').val(devolver.id_devolucion_valor);
								if(devolver.id_devolucion_valor == "" || devolver.id_devolucion_valor == null){
									$('#producto_no_existe').modal('show');
								}else{
									$.ajax({
										  type : "POST",
										  url : _root_ + "pedido/registrar",
										  dataType: 'json',
										  async:   false,
										  data: {
											action: 'insertarProducto',
											identificador_factura: identificador_factura,
											codigo_producto: codigo_producto,
											cantidad_producto: cantidad_producto
										},
										
									});

									$http({
									  method : "POST",
									  url : _root_ + "pedido/registrar",
									  data : "action=getProductos&identificador_factura="+identificador_factura,
									}).success(function(data){ $scope.productos = data;  });

									$http({
									  method : "POST",
									  url : _root_ + "pedido/registrar",
									  data : "action=getTotal&identificador_factura="+identificador_factura,
									}).success(function(data){ $scope.valortotal = data;  });
								}
								//alert(devolver.id_devolucion_valor);
							}
						});

						$( "#codigo_producto" ).val('');
						$( "#codigo_producto" ).focus();
				}
			}
		});

	$("#precio_venta").keypress(function(e) {
		if(e.which == 13) {
			var identificador_factura = $("#identificador_factura").val();
			var nombre_producto = $("#nombre_producto").val();
			var cantidad_producto = $("#cantidad_producto_2").val();
			var precio_venta = $("#precio_venta").val();
		}
	});

	$scope.eliminarProducto = function(index){
		var identificador_factura = $("#identificador_factura").val();

		$.ajax({
			  type : "POST",
			  url : _root_ + "pedido/registrar",
			  dataType: 'json',
			  async:   false,
			  data: {
			  action: 'eliminarProducto',
			  id_producto: $scope.productos[index].id_detalle,
			  id_factura: identificador_factura,
			  cantidad_pr: $scope.productos[index].cantidad_pr,
			  codigo_producto: $scope.productos[index].codigo
			  }
			});

		$http({
		  method : "POST",
		  url : _root_ + "pedido/registrar",
		  data : "action=getProductos&identificador_factura="+identificador_factura,
		}).success(function(data){ $scope.productos = data;  });

		$http({
			method : "POST",
			url : _root_ + "pedido/registrar",
			data : "action=getTotal&identificador_factura="+identificador_factura,
		}).success(function(data){ $scope.valortotal = data;  });
	}

	var identificador_fact_p = $("#identificador_fact_p").val();

	if(identificador_fact_p != "" && identificador_fact_p != undefined ){
		var identificador_factura = $("#identificador_factura").val();

		$http({
		  method : "POST",
		  url : _root_ + "pedido/registrar",
		  data : "action=getProductos&identificador_factura="+identificador_factura,
		}).success(function(data){ $scope.productos = data;  });

		$http({
			method : "POST",
			url : _root_ + "pedido/registrar",
			data : "action=getTotal&identificador_factura="+identificador_factura,
		}).success(function(data){ $scope.valortotal = data;  });
	}

});