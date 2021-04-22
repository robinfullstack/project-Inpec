myApp.controller('encuestasController', function($scope, $http) {
	$http.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=utf-8';
	//-------------------------------Inicio Creación de Nueva Factura---------------------------------------//
	var cliente = "123";
	var vendedor = "1";
	var observaciones = "";
	var terminos_de_pago = "1";
	var nombre_producto = $('#nombre_producto').val();

	var codigo_producto = $("#codigo_producto").val();

	var val_up = $("#val_up").val();

	var identificador_factura = $("#identificador_factura").val();
	$("#ver_facturas").html(identificador_factura);

		$(function() {
		 $(document).keydown(function(e){
		  var code = (e.keyCode ? e.keyCode : e.which);
		  if(code == 120) {
			$.ajax({
				  type : "POST",
				  url : _root_ + "factura/registrar",
				  dataType: 'json',
				  async:   false,
				  data: {
					action: 'insertarFactura',
					cliente: cliente,
					vendedor: vendedor,
					observaciones: observaciones,
					terminos_de_pago: terminos_de_pago
				},
				success: function (devolver){
					$('#identificador_factura').val(devolver.id_facturas);
					$("#ver_facturas").html(devolver.id_facturas);

					var ultimo_ = $("#ultimo_id_preguntas").val();
					var agregar_id = parseInt(ultimo_) + 1;

					$('#fact_trigger').trigger('click');
					$("#nuevo_registro_factura").addClass( "disabled" );
					$('#nuevo_registro_factura').attr("disabled", true);
					$( "#productos-factura" ).show();
					$( "#productos-factura-2" ).show();
					$( "#ocultar_datos_principales" ).hide("slow");
					$( "#codigo_producto" ).focus();
					$("#busqueda").hide();
					$("#busqueda1").hide();
					$("#val_up").val(0);

					$http({
						method : "POST",
						url : _root_ + "factura/registrar",
						data : "action=getTotal&identificador_factura="+devolver.id_facturas,
					}).success(function(data){ $scope.valortotal = data;  });

					$http({
						method : "POST",
						url : _root_ + "factura/registrar",
						data : "action=getProductos&identificador_factura="+devolver.id_facturas,
					}).success(function(data){ $scope.productos = data;  });
					
					$http({
						method : "POST",
						url : _root_ + "factura/registrar",
						data : "action=conteoProductos&identificador_factura="+devolver.id_facturas,
					}).success(function(data){ $scope.conteo = data;  });
					
					$http({
						method : "POST",
						url : _root_ + "factura/registrar",
						data : "action=getProductosb&identificador_factura="+devolver.id_facturas,
					}).success(function(data){ $scope.productosb = data;  });

					$http({
						method : "POST",
						url : _root_ + "factura/registrar",
						data : "action=nombreClienteid&identifier="+devolver.id_facturas,
					}).success(function(data){ $scope.nombre_cliente = data; });

					$http({
						method : "POST",
						url : _root_ + "factura/registrar",
						data : "action=consultaCredito&identifier="+devolver.id_facturas,
					}).success(function(data){ $scope.tipo_credito = data; });

					$http({
						method : "POST",
						url : _root_ + "factura/registrar",
						data : "action=consultarDomicilios",
					}).success(function(data){ $scope.domicilios = data;  });

					$http({
						method : "POST",
						url : _root_ + "factura/registrar",
						data : "action=facturasPendientes",
					}).success(function(data){ $scope.factura_pend = data;});
				}
			});
			}
		 });
		});

	if(val_up == 1)
	{
		if(identificador_factura == "" || identificador_factura == null){
			$.ajax({
				  type : "POST",
				  url : _root_ + "factura/registrar",
				  dataType: 'json',
				  async:   false,
				  data: {
					action: 'insertarFactura',
					cliente: cliente,
					vendedor: vendedor,
					observaciones: observaciones,
					terminos_de_pago: terminos_de_pago
				},
				success: function (devolver){
					$('#identificador_factura').val(devolver.id_facturas);
					$("#ver_facturas").html(devolver.id_facturas);
				}
			});
		}

		var ultimo_ = $("#ultimo_id_preguntas").val();
		var agregar_id = parseInt(ultimo_) + 1;

		$('#fact_trigger').trigger('click');

		$("#nuevo_registro_factura").addClass( "disabled" );

		$('#nuevo_registro_factura').attr("disabled", true);

		$( "#productos-factura" ).show();

		$( "#productos-factura-2" ).show();

		$( "#ocultar_datos_principales" ).hide("slow");

		$( "#codigo_producto" ).focus();
		//$( "#valor_apertura" ).focus();
		$("#busqueda").hide();
		$("#val_up").val(0);
	}
	//-------------------------------Fin Creación de Nueva Factura---------------------------------------//

	//-------------------------------Inserción Factura Pendiente---------------------------------------//
	$('#factura_pendiente').click(function(){
		$http({
			method : "POST",
			url : _root_ + "factura/registrar",
			data : "action=consultarIdfact",
		}).success(function(data){ 
			$.ajax({
					type : "POST",
					url : _root_ + "factura/registrar",
					dataType: 'json',
					data: {
					action: 'insertarFacturapendiente',
					id_factura_pendiente: data.ultimoId
				}
			});

			$("#_facturas_pendientes_").show("slow");
			$("#_definicion_clase_").removeClass("col-md-12");
			$("#_definicion_clase_").addClass("col-md-10");

			$http({
				method : "POST",
				url : _root_ + "factura/registrar",
				data : "action=facturasPendientes",
			}).success(function(data){ $scope.factura_pend = data;});

			$('#registro_aprobado_fact').trigger('click');

			$( "#codigo_producto" ).focus();
			$("#busqueda1").hide();
		});

	});
	//-------------------------------Fin Inserción Factura Pendiente---------------------------------------//

	var identifier = $("#identificador_factura").val();

	$('#asignar_tipo_pago').click(function(){
		var seleccion_debito = $('#__seleccion_debito__:checked').val();
		var seleccion_credito = $('#__seleccion_tcredito__:checked').val();

		if(seleccion_debito == 'on'){
			$.ajax({
				type: 'POST',
				url: _root_ + 'factura/registrar',
				dataType: 'json',
				data: {
					action: 'accionPago',
					select: 2,
					id_factura: identifier
				}
			});

			$('#debito').trigger('click');
		}

		if(seleccion_credito == 'on'){
			$.ajax({
				type: 'POST',
				url: _root_ + 'factura/registrar',
				dataType: 'json',
				data: {
					action: 'accionPago',
					select: 3,
					id_factura: identifier
				}
			});

			$('#credito').trigger('click');
		}

		$http({
			method : "POST",
			url : _root_ + "factura/registrar",
			data : "action=tipoPago&id_factura="+identifier,
		}).success(function(data){ $scope.tipo_pago = data; });

		$('#generar_factura').modal('toggle');
	});

	$http({
		method : "POST",
		url : _root_ + "factura/registrar",
		data : "action=getTotal&identificador_factura="+identifier,
	}).success(function(data){ $scope.valortotal = data;  });

	$http({
		method : "POST",
		url : _root_ + 'factura/vender',
		data : "action=categoriaProductos",
	}).success(function(data){
		$scope.categoriap = data;
		//console.log($scope.items);
	});

	/*
	$http({
		method : "POST",
		url : _root_ + "factura/vender",
		data : "action=categoriaProductos",
	}).success(function(data){ $scope.categoriap = data;  });
	*/

	$http({
		method : "POST",
		url : _root_ + "factura/registrar",
		data : "action=facturasPendientes",
	}).success(function(data){ $scope.factura_pend = data;});

	$("#_facturas_pendientes_").show("slow");
	$('#nuevo_domicilio').click(function(){
		var identifier = $("#identificador_factura").val();

		if(identifier == ""){
			alert("Ocurrió un error al tratar de actualizar el estado del domicilio!");
			$('#faltan_datos').trigger('click');
		}else{
			$.ajax({
				type : "POST",
				url : _root_ + "factura/registrar",
				dataType: 'json',
				async:   false,
				data: {
				action: 'estadoDomicilio',
				identifier: identifier,
				estado: 1
				}
			});

			$('#verificarDomicilio').modal('hide');
		}
	});

	$('#nueva_nota').click(function(){
		var identifier = $("#identificador_factura").val();

		if(identifier == ""){
			alert("Ocurrió un error al tratar de actualizar el estado del domicilio!");
			$('#faltan_datos').trigger('click');
		}else{
			$.ajax({
				type : "POST",
				url : _root_ + "factura/registrar",
				dataType: 'json',
				async:   false,
				data: {
				action: 'estadoDomicilio',
				identifier: identifier,
				estado: 2
				}
			});

			$('#verificarDomicilio').modal('hide');
		}
	});

	$http({
		method : "POST",
		url : _root_ + "factura/registrar",
	  data : "action=ultimoIdPreguntas",
	}).success(function(data){ $scope.ultimoid_factura = data; });

	var identificador_fact_p = $("#identificador_fact_p").val();

	if(identificador_fact_p != "" && identificador_fact_p != undefined ){
		var identificador_factura = $("#identificador_factura").val();

		$http({
		  method : "POST",
		  url : _root_ + "factura/registrar",
		  data : "action=getProductosb&identificador_factura="+identificador_factura,
		}).success(function(data){ $scope.productosb = data;  });

		$http({
			method : "POST",
			url : _root_ + "factura/registrar",
			data : "action=nombreClienteid&identifier="+identificador_factura,
		}).success(function(data){ $scope.nombre_cliente = data; });

		$http({
			method : "POST",
			url : _root_ + "factura/registrar",
			data : "action=consultaCredito&identifier="+identificador_factura,
		}).success(function(data){ $scope.tipo_credito = data; });

		$http({
			method : "POST",
			url : _root_ + "factura/registrar",
			data : "action=getTotal&identificador_factura="+identificador_factura,
		}).success(function(data){ $scope.valortotal = data;  });
	}

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
					  url : _root_ + "factura/registrar",
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

	$("#ingreso_cantidad_3").keypress(function(e) {
		if(e.which == 13) {
			var identificador_factura = $("#identificador_factura").val();
			var asignar_codigo = $('#asignar_codigo_2').val();
			var ingreso_cantidad = $('#ingreso_cantidad_3').val();

			if(ingreso_cantidad > 10000){
				alert('La cantidad suministrada debe ser menor a 10.001');
				$('#ingreso_cantidad_3').val('');
			}else if(ingreso_cantidad == ""){
				alert('Ingrese la cantidad!');
				$('#ingreso_cantidad_3').val('');
			}else if(ingreso_cantidad == 0){
				alert('Ingrese la cantidad!');
				$('#ingreso_cantidad_3').val('');
			}else{
				$.ajax({
					  type : "POST",
					  url : _root_ + "factura/registrar",
					  dataType: 'json',
					  async: false,
					  data: {
						action: 'insertarProductos',
						identificador_factura: identificador_factura,
						codigo_producto: asignar_codigo,
						cantidad_producto: ingreso_cantidad
					},
				});

				$( "#base_productos" ).show();

				$http({
				  method : "POST",
				  url : _root_ + "factura/registrar",
				  data : "action=getProductos&identificador_factura="+identificador_factura,
				}).success(function(data){ $scope.productos = data;  });

				$http({
					method : "POST",
					url : _root_ + "factura/registrar",
					data : "action=conteoProductos&identificador_factura="+identificador_factura,
				}).success(function(data){ $scope.conteo = data;  });

				$http({
				  method : "POST",
				  url : _root_ + "factura/registrar",
				  data : "action=getTotal&identificador_factura="+identificador_factura,
				}).success(function(data){ $scope.valortotal = data;  });

				$("#busqueda1").hide();
				$( "#codigo_producto" ).val('');
				$('#factura_ventana').modal('toggle'); 
				$( "#codigo_producto" ).focus();
				$("#ingreso_cantidad_3").val('');
			}
		}
	});

	var identificador_factura = $("#identificador_factura").val();
	if(identificador_factura != ""){
		$http({
		  method : "POST",
		  url : _root_ + "factura/registrar",
		  data : "action=getProductos&identificador_factura="+identificador_factura,
		}).success(function(data){ $scope.productos = data;  });

		$http({
			method : "POST",
			url : _root_ + "factura/registrar",
			data : "action=conteoProductos&identificador_factura="+identificador_factura,
		}).success(function(data){ $scope.conteo = data;  });

	}

	$("#codigo_producto").keypress(function(e) {
		if(e.which == 13) {
			var codigo_producto = $("#codigo_producto").val();
			var identificador_factura = $("#identificador_factura").val();

			if(codigo_producto == "")
				alert("Por favor ingrese el código del producto.");
			else
			{
				$.ajax({
					  type : "POST",
					  url : _root_ + "factura/registrar",
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
								  url : _root_ + "factura/registrar",
								  dataType: 'json',
								  async:   false,
								  data: {
									action: 'insertarProducto',
									identificador_factura: identificador_factura,
									codigo_producto: codigo_producto
								}
							});

							$http({
							  method : "POST",
							  url : _root_ + "factura/registrar",
							  data : "action=getProductos&identificador_factura="+identificador_factura,
							}).success(function(data){ $scope.productos = data;  });

							$http({
								method : "POST",
								url : _root_ + "factura/registrar",
								data : "action=conteoProductos&identificador_factura="+identificador_factura,
							}).success(function(data){ $scope.conteo = data;  });

							$http({
							  method : "POST",
							  url : _root_ + "factura/registrar",
							  data : "action=getTotal&identificador_factura="+identificador_factura,
							}).success(function(data){ $scope.valortotal = data;  });

						}
					}
				});

				$( "#base_productos" ).show();
				$("#busqueda1").hide(); 
				$("#busqueda1").html("");
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

			if(cantidad_producto == "" || precio_venta == "" || nombre_producto == "")
			{
				alert("Por favor ingrese la cantidad del producto, el nombre y el precio.");
			}
			else
			{
				$.ajax({
					type : "POST",
					url : _root_ + "factura/registrar",
					dataType: 'json',
					async:   false,
					data: {
					action: 'insertarProductob',
					identificador_factura: identificador_factura,
					nombre_producto: nombre_producto,
					cantidad_producto: cantidad_producto,
					precio_venta: precio_venta
					},
					
				});

				$( "#base_productos" ).show();

				$http({
					method : "POST",
					url : _root_ + "factura/registrar",
					data : "action=getProductosb&identificador_factura="+identificador_factura,
				}).success(function(data){ $scope.productosb = data;  });

				$http({
					method : "POST",
					url : _root_ + "factura/registrar",
					data : "action=getTotal&identificador_factura="+identificador_factura,
				}).success(function(data){ $scope.valortotal = data;  });

				$( "#nombre_producto" ).val('');
				$( "#nombre_producto" ).focus();
			}
		}
	});

	$("#num_apartamento").keypress(function(e) {
		if(e.which == 13) {
			var identificador_factura = $("#identificador_factura").val();
			var num_apartamento = $("#num_apartamento").val();
			$.ajax({
				type : "POST",
				url : _root_ + "factura/registrar",
				dataType: 'json',
				async:   false,
				data: {
				action: 'insertarApartamento',
				identificador_factura: identificador_factura,
				num_apartamento: num_apartamento
				}
			});

			$('#apartamento_ingresado').trigger('click');
			$('#verificarDomicilio').modal('show');
			$("#num_apartamento").val("");

			$http({
				method : "POST",
				url : _root_ + "factura/registrar",
				data : "action=consultarDomicilios",
			}).success(function(data){ $scope.domicilios = data;  });
		}
	});

	$scope.informacionTotal = function(index){
		var valor_total_ = $("#total_pago_f").val();
		$('#total_pago__').text('TOTAL A PAGAR: ' + valor_total_);
		$('#valor_dado__').focus();
	}

	$scope.eliminarProductob = function(index){
		var identificador_factura = $("#identificador_factura").val();
		$http({
			  method : "POST",
			  url : _root_ + "factura/registrar",
			  data : "action=eliminarProductob&id_producto="+$scope.productosb[index].id_detalle,
			});

		$http({
		  method : "POST",
		  url : _root_ + "factura/registrar",
		  data : "action=getProductosb&identificador_factura="+identificador_factura,
		}).success(function(data){ $scope.productosb = data;  });

		$http({
		  method : "POST",
		  url : _root_ + "factura/registrar",
		  data : "action=getTotal&identificador_factura="+identificador_factura,
		}).success(function(data){ $scope.valortotal = data;  });

		$( "#codigo_producto" ).val(''); 
		$( "#codigo_producto" ).focus();
	}

	$scope.add_devuelta_de_cinco = function(index){

		var total_pago_info = $("#total_pago_info").val();

		$.ajax({
			  type : "POST",
			  url : _root_ + "factura/registrar",
			  dataType: 'json',
			  data: {
				action: 'valorDevolucion',
				total_pago_info: total_pago_info
			},
			success: function (devolver){
				$('#valordev').val(devolver.id_devolucion_valor);
			}
		});
	}

	$scope.gastos_personales = function(index){

		var total_pago_info = $("#total_pago_info").val();

		$.ajax({
			  type : "POST",
			  url : _root_ + "factura/registrar",
			  dataType: 'json',
			  data: {
				action: 'valorDevolucion',
				total_pago_info: total_pago_info
			},
			success: function (devolver){
				$('#valordev').val(devolver.id_devolucion_valor);
			}
		});
	}

	$http({
		method : "POST",
		url : _root_ + "factura/registrar",
		data : "action=consultarDomicilios",
	}).success(function(data){ $scope.domicilios = data;  });

	$scope.updated_state_delivery = function(index){

		$.ajax({
			  type : "POST",
			  url : _root_ + "factura/registrar",
			  dataType: 'json',
			  data: {
				action: 'actualizarDomicilio',
				id_factura: $scope.domicilios[index].id_factura
			}
		});

		$http({
			method : "POST",
			url : _root_ + "factura/registrar",
			data : "action=consultarDomicilios",
		}).success(function(data){ $scope.domicilios = data;  });

	}

	$scope.updated_state_invoice = function(index){
		$http({
			method : "POST",
			url : _root_ + "factura/registrar",
			data : "action=borrarFactp&factura_p="+$scope.factura_pend[index].id_factura,
		}).success(function(data){ 
			//alert(data.id_factura);
			if(data.id_factura == "" || data.id_factura == null){
				$("#_facturas_pendientes_").hide("slow");
				$("#_definicion_clase_").removeClass("col-md-10");
				$("#_definicion_clase_").addClass("col-md-12");
			}
		});

		$http({
			method : "POST",
			url : _root_ + "factura/registrar",
			data : "action=facturasPendientes",
		}).success(function(data){ $scope.factura_pend = data; });

	}

	$scope.updated_invoice_cloud = function(index){

		$.ajax({
			  type : "POST",
			  url : _root_ + "factura/registrar",
			  dataType: 'json',
			  data: {
				action: 'actualizarDomicilio',
				id_factura: $scope.domicilios[index].id_factura
			}
		});

		$http({
		  method : "POST",
		  url : _root_ + "factura/registrar",
		  data : "action=consultarDomicilios",
		}).success(function(data){ $scope.domicilios = data;  });

	}

	$scope.add_devuelta_de_veinte = function(index){

		var total_pago_info = $("#total_pago_info").val();

		$.ajax({
			  type : "POST",
			  url : _root_ + "factura/registrar",
			  dataType: 'json',
			  data: {
				action: 'valorDevolucion2',
				total_pago_info: total_pago_info
			},
			success: function (devolver){
				$('#valordev').val(devolver.id_devolucion_valor);
			}
		});
	}

	$scope.add_devuelta_de_diez = function(index){

		var total_pago_info = $("#total_pago_info").val();

		$.ajax({
			  type : "POST",
			  url : _root_ + "factura/registrar",
			  dataType: 'json',
			  data: {
				action: 'valorDevolucion3',
				total_pago_info: total_pago_info
			},
			success: function (devolver){
				$('#valordev').val(devolver.id_devolucion_valor);
			}
		});
	}

	$scope.eliminarProducto = function(index){
		var identificador_factura = $("#identificador_factura").val();
		var cantidad_eliminar = $("#cantidad_pro" + $scope.productos[index].id_detalle).val();

		if(cantidad_eliminar == ""){
			alert("Por favor asigne la cantidad antes de borrar el producto!");
		}else{
			$.ajax({
				  type : "POST",
				  url : _root_ + "factura/registrar",
				  dataType: 'json',
				  async: false,
				  data: {
				  action: 'eliminarProducto',
				  id_producto: $scope.productos[index].id_detalle,
				  id_factura: identificador_factura,
				  cantidad_pr: cantidad_eliminar,
				  codigo_producto: $scope.productos[index].codigo
				  }
				});

				$http({
				  method : "POST",
				  url : _root_ + "factura/registrar",
				  data : "action=getProductos&identificador_factura="+identificador_factura,
				}).success(function(data){ $scope.productos = data;  });

				$http({
					method : "POST",
					url : _root_ + "factura/registrar",
					data : "action=conteoProductos&identificador_factura="+identificador_factura,
				}).success(function(data){ $scope.conteo = data;  });

				$http({
					method : "POST",
					url : _root_ + "factura/registrar",
					data : "action=getTotal&identificador_factura="+identificador_factura,
				}).success(function(data){ $scope.valortotal = data;  });

			$( "#codigo_producto" ).val(''); 
			$( "#codigo_producto" ).focus();
		}
	}

	//-------------------------------Función fecha para apertura de caja---------------------------------------//

	$.ajax({
		  type : "POST",
		  url : _root_ + "factura/registrar",
		  dataType: 'json',
		  async: false,
		  data: {
			  action: 'consultApertura'
		  },success: function (devolver){
				if(devolver.consulta_apertura == 0){
					$("#apertura_caja").modal();
					$( "#valor_apertura" ).blur(function() {
						$( "#valor_apertura" ).focus();
					});
					//alert(devolver.consulta_apertura);
				}
			}
	});

	$('#valor_apertura').on('input', function () { 
		this.value = this.value.replace(/[^0-9]/g,'');
	});

	$('#info-valor-apertura').hide();

	$("#valor_apertura").keyup(function(event){
		var valor = $("#valor_apertura").val();
		$('#info-valor-apertura').show();
		$('#total_valor_ap').text('VALOR INGRESADO: $ ' + valor);
	});

	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //Enero es 0!
	var ss = today.getSeconds(); //Enero es 0!

	var yyyy = today.getFullYear();
	if(dd<10){
		dd='0'+dd;
	} 
	if(mm<10){
		mm='0'+mm;
	} 
	if(ss<10){
		ss='0'+ss;
	}
	var today = yyyy+'-'+mm+'-'+dd+" "+ today.getHours() + ":" + today.getMinutes() + ":" + ss;
	$('#fecha_apertura').append(today);

	$scope.asignarApertura = function(index){
		var valor = $("#valor_apertura").val();

		$.ajax({
			  type : "POST",
			  url : _root_ + "factura/registrar",
			  dataType: 'json',
			  async: false,
			  data: {
				  action: 'asignarApertura',
				  valor: valor
			  }
		});

		$('#mensaje_apertura').trigger('click');
		$('#apertura_caja').modal('toggle'); 
	}
	//-------------------------------Fin Función fecha para apertura de caja---------------------------------------//

	$('body').on('focus','.act_cantidad',function(e){
		var id_detalle = $(this).attr('id');
		$( "input[name='cantidad_pro"+id_detalle+"']" ).val("");
	});

	$('body').on('keypress','.act_cantidad',function(e){
		if(e.which == 13) {
			var id_detalle = $(this).attr('id');
			var valor_cantidad = $( "input[name='cantidad_pro"+id_detalle+"']" ).val();

			var identificador_factura = $("#identificador_factura").val();

			$http({
				method : "POST",
				url : _root_ + "factura/registrar",
				data : "action=actualizarCantidad&id_detalle="+id_detalle+"&cantidad_pr="+valor_cantidad+"&id_factura="+identificador_factura
			});

			$http({
				method : "POST",
				url : _root_ + "factura/registrar",
				data : "action=conteoProductos&identificador_factura="+identificador_factura,
			}).success(function(data){ $scope.conteo = data;  });

			$http({
				method : "POST",
				url : _root_ + "factura/registrar",
				data : "action=getTotal&identificador_factura="+identificador_factura,
			}).success(function(data){ $scope.valortotal = data;  });

			$('#registro_aprobado_cantidad').trigger('click');
		}
	});

	$scope.focusCampo = function (index) {
		$("#cantidad_pro" + $scope.productos[index].id_detalle).val("");
	}

	$scope.konsoleLogs = function (index) {
		var valor_cantidad = $("#cantidad_pro" + $scope.productos[index].id_detalle).val();

		var identificador_factura = $("#identificador_factura").val();

		$http({
			method : "POST",
			url : _root_ + "factura/registrar",
			data : "action=actualizarCantidad&id_detalle="+$scope.productos[index].id_detalle+"&cantidad_pr="+valor_cantidad+"&id_factura="+identificador_factura
		});

		$http({
			method : "POST",
			url : _root_ + "factura/registrar",
			data : "action=getProductos&identificador_factura="+identificador_factura,
		}).success(function(data){ $scope.productos = data;  });

		$http({
			method : "POST",
			url : _root_ + "factura/registrar",
			data : "action=conteoProductos&identificador_factura="+identificador_factura,
		}).success(function(data){ $scope.conteo = data;  });

		$http({
			method : "POST",
			url : _root_ + "factura/registrar",
			data : "action=getTotal&identificador_factura="+identificador_factura,
		}).success(function(data){ $scope.valortotal = data;  });

		$('#registro_aprobado_cantidad').trigger('click');
	}

	$scope.activarCierre = function(index){
		$.ajax({
			  type : "POST",
			  url : _root_ + "factura/registrar",
			  dataType: 'json',
			  async: false,
			  data: {
				  action: 'consultaCaja'
			  },success: function (devolver){
				$('#hora_de_apertura').append(devolver.consulta_hora);
				$('#base_inicial').append(devolver.consulta_valor);
				$('#total_ventas_2').append(devolver.consulta_ventas);
			  }
		});
	}

	$scope.cerrarCaja = function(index){
		$.ajax({
			  type : "POST",
			  url : _root_ + "factura/registrar",
			  dataType: 'json',
			  async: false,
			  data: {
				  action: 'cerrarCaja'
			  }
		});

		$('#mensaje_cierre').trigger('click');
		$('#cierre_caja').modal('toggle'); 
	}

	$('#asignar_cliente_factura').click(function(){
		var abono = $("#abono_credito").val();
		var cliente = $("#asigne_cliente").val();
		var identificador_factura = $("#identificador_factura").val();

		if(abono == null || abono == "")
			abono = 0;

		if( $('#seleccion_credito').prop('checked') )
			var sel_credito = 1;
		else
			var sel_credito = 2;

		if(sel_credito == 1){
			$.ajax({
				type : "POST",
				url : _root_ + "factura/registrar",
				dataType: 'json',
				async: false,
				data: {
				action: 'actualizarCredito',
				identificador_factura: identificador_factura,
				sel_credito: 1,
				abono: abono
				}
			});

			$http({
				method : "POST",
				url : _root_ + "factura/registrar",
				data : "action=tipoCredito&id_credito=1&abono="+abono,
			}).success(function(data){ $scope.tipo_credito = data; });
		}else if(sel_credito == 2){
			$.ajax({
				type : "POST",
				url : _root_ + "factura/registrar",
				dataType: 'json',
				async: false,
				data: {
				action: 'actualizarCredito',
				identificador_factura: identificador_factura,
				sel_credito: 2,
				abono: abono
				}
			});

			$http({
				method : "POST",
				url : _root_ + "factura/registrar",
				data : "action=tipoCredito&id_credito=2&abono="+abono,
			}).success(function(data){ $scope.tipo_credito = data; });
		}

		$.ajax({
			  type : "POST",
			  url : _root_ + "factura/registrar",
			  dataType: 'json',
			  async: false,
			  data: {
				action: 'actualizarCliente',
				identificador_factura: identificador_factura,
				cliente: cliente
			}
		});

		$.ajax({
			  type : "POST",
			  url : _root_ + "factura/registrar",
			  dataType: 'json',
			  async: false,
			  data: {
				action: 'consultarCliente',
				identificador_factura: identificador_factura
			},
			success: function (devolver){
				$("#asigne_cliente").val(devolver.id_cliente);
				if(devolver.id_cliente != "" && devolver.id_cliente != 123 ){
					$.ajax({
						  type : "POST",
						  url : _root_ + "factura/registrar",
						  dataType: 'json',
						  async: false,
						  data: {
							action: 'actualizarCliente',
							identificador_factura: identificador_factura,
							cliente: cliente
						}
					});
					$('#registro_aprobado').trigger('click');
					$('#asignar_cliente').modal('toggle'); 
				}else
					alert('Por favor seleccione un cliente válido.');

				id_clientes = devolver.id_cliente;
				nombre_cliente = devolver.nombre;
				if(id_clientes == "123" || id_clientes == null ){
					alert('Ingrese por favor el cliente antes de continuar!');
				}else{
					$http({
						method : "POST",
						url : _root_ + "factura/registrar",
						data : "action=nombreCliente&id_clientes=" + id_clientes,
					}).success(function(data){ $scope.nombre_cliente = data; });
				}
			}
		});

	});
});