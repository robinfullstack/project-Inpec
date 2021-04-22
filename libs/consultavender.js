$(document).ready(function(){
	/**
	*@desc- retrasa el evento keyup
	*@param fn - function
	*@param ms - milisegundos que queremos retrasar
	*/

	$.fn.delayPasteKeyUp = function(fn, ms)
	{
		var timer = 0;
		$(this).on("keyup paste", function()
		{
			clearTimeout(timer);
			timer = setTimeout(fn, ms);
		});
	};

	if ($("#codigo_producto__").val("")) {
		$("#busqueda1").show();
		$.ajax({
			type: "POST",
			url: _root_ + 'factura/autocompletado',
			data: "autocomplete="+$("input[name=codigo_producto__]").val(),
			success: function(data)
			{
				if(data)
				{
					var json = JSON.parse(data),
					html = '';
					if(json.res == 'full')
					{
						for(datos in json.data)
						{
							var cadena = json.data[datos].descr_referencia,
							inicio = 0,
							fin    = 26,
							cad_descr_referencia = cadena.substring(inicio, fin);
							var contar = cad_descr_referencia.length;
							if(contar > 25)
								cad_descr_referencia = cadena.substring(inicio, fin)+' ...';
							else
								cad_descr_referencia = cadena.substring(inicio, fin);

							html+= '<a href="javascript:void(0);" onclick="insertarP('+json.data[datos].id_referencia+',';
							html+= json.data[datos].precio_venta+','+'\''+json.data[datos].descr_referencia+'\',\''+json.data[datos].codigo+'\')" ';
							html+=' class="product-grid__product-wrapper"><div class="product-grid__product"><div class="product-grid__img-wrapper">';
							html+='<img src="' + _root_ + json.data[datos].imagen+'" alt="'+json.data[datos].descr_referencia+'" class="product-grid__img" /></div>';
							html+='<span class="product-grid__title">'+cad_descr_referencia+'</span>';
							html+='<span class="product-grid__price">$ '+json.data[datos].precio_venta+'</span>';
							html+='<div class="product-grid__extend-wrapper"><div class="product-grid__extend">';
							html+='<p class="product-grid__description">'+json.data[datos].caracteristicas_a+'</p><span class="product-grid__btn product-grid__add-to-cart">';
							html+='<i class="fa fa-cart-arrow-down"></i>Agregar</span>';
							html+='<span class="product-grid__btn product-grid__view"><i class="fa fa-eye"></i>Cantidad</span></div></div></div></a>';
						}
					}
					else
					{
						// html+='<a href="#" class="list-group-item">';
						// html+='<h4 class="list-group-item-heading">No se ha encontrado nada con '+$("input[name=nombre_producto]").val()+'</h4>';
						//html+='</a>';
					}
					html+='</div>';
					$("#busqueda1").html("").append(html);
				}
			}
		});
	}

	$("input[name=codigo_producto__]").delayPasteKeyUp(function()
	{
		$.ajax({
			type: "POST",
			url: _root_ + 'factura/autocompletado',
			data: "autocomplete="+$("input[name=codigo_producto__]").val(),
			success: function(data)
			{
				if(data)
				{
					var json = JSON.parse(data),
					html = '';
					if(json.res == 'full')
					{
						for(datos in json.data)
						{
							var cadena = json.data[datos].descr_referencia,
							inicio = 0,
							fin    = 26,
							cad_descr_referencia = cadena.substring(inicio, fin);
							var contar = cad_descr_referencia.length;
							if(contar > 25)
								cad_descr_referencia = cadena.substring(inicio, fin)+' ...';
							else
								cad_descr_referencia = cadena.substring(inicio, fin);

							html+= '<a href="javascript:void(0);" onclick="insertarP('+json.data[datos].id_referencia+',';
							html+= json.data[datos].precio_venta+','+'\''+json.data[datos].descr_referencia+'\',\''+json.data[datos].codigo+'\')" ';
							html+=' class="product-grid__product-wrapper"><div class="product-grid__product"><div class="product-grid__img-wrapper">';
							html+='<img src="' + _root_ + json.data[datos].imagen+'" alt="'+json.data[datos].descr_referencia+'" class="product-grid__img" /></div>';
							html+='<span class="product-grid__title">'+cad_descr_referencia+'</span>';
							html+='<span class="product-grid__price">$ '+json.data[datos].precio_venta+'</span>';
							html+='<div class="product-grid__extend-wrapper"><div class="product-grid__extend">';
							html+='<p class="product-grid__description">'+json.data[datos].caracteristicas_a+'</p><span class="product-grid__btn product-grid__add-to-cart">';
							html+='<i class="fa fa-cart-arrow-down"></i>Agregar</span>';
							html+='<span class="product-grid__btn product-grid__view"><i class="fa fa-eye"></i>Cantidad</span></div></div></div></a>';
						}
					}
					else
					{
						// html+='<a href="#" class="list-group-item">';
						// html+='<h4 class="list-group-item-heading">No se ha encontrado nada con '+$("input[name=nombre_producto]").val()+'</h4>';
						//html+='</a>';
					}
					html+='</div>';
					$("#busqueda1").html("").append(html);
				}
			}
		});
	}, 500);

	$("#codigo_producto__").keypress(function(e) {
		if(e.which == 13) {
			var codigo_producto = $("#codigo_producto__").val();
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
								  },success: function (devolver){
									$("#valores_totales__").hide("slow");	
									$("#mis_productos").append('<div id="bloque_productos" class="elemento_pro_' + devolver.insercionID + '" ><input class="form-control" type="hidden" name="descripcion_pro' + devolver.insercionID + '" id="descripcion_pro' + devolver.insercionID + '" value="'+ devolver.descr_referencia +'">'
									+ '<a href="javascript:void(0);" class="label label-info ng-binding">'+ devolver.descr_referencia +'</a>'
									+ '<input class="form-control act_cantidad" type="text" name="cantidad_pro' + devolver.insercionID + '" id="' + devolver.insercionID + '" value="1" custom-keypress="konsoleLogs($index)" ng-focus="focusCampo($index)" style="width: 13%; height: 27px;">'
									+ '<div id="organizar_datos__">'
									+ '<input class="form-control" type="hidden" readonly="" name="cantidad_peso' + devolver.insercionID + '" id="cantidad_peso' + devolver.insercionID + '" value="'+ precio_venta +'">'
									+ '<span id="cantidad_peso__" class="ng-binding">$ '+ devolver.precio_venta +'</span>'
									+ '<input type="hidden" name="precio_pro' + devolver.insercionID + '" id="precio_pro' + devolver.insercionID + '" value="'+ devolver.precio_venta +'">'
									+ '<input type="hidden" name="codigo_pro' + devolver.insercionID + '" id="codigo_pro' + devolver.insercionID + '" value="'+devolver.codigo_producto+'">'
									+ '<span id="precio_venta__" class="ng-binding">$ '+ devolver.precio_venta +'</span>'
									+ '</div>'
									+ '<div id="organizar_eliminar">'
									+ '<a onclick="eliminarP(' + devolver.insercionID + ')" ng-click="eliminarProducto($index);" href="#" style="height: 30px;"><em class="fa fa-times-circle-o fa-2x"></em></a>'
									+ '</div></div>');

									$( "#codigo_producto" ).val('');
									$( "#codigo_producto" ).focus();
								  }
							});

							consultarValores();
							conteoProductos();

						}
					}
				});

				$( "#base_productos" ).show();
				$( "#codigo_producto" ).val('');
				$( "#codigo_producto" ).focus();
			}
		}
	});
});

function insertarP(id_referencia, precio_venta, descr_referencia, codigo_producto)
{
	var identifier = $("#identificador_factura").val();

	$.ajax({
		  type : "POST",
		  url : _root_ + "factura/registrar",
		  dataType: 'json',
		  async: false,
		  data: {
			action: 'insertarProductos',
			identificador_factura: identifier,
			codigo_producto: codigo_producto,
			cantidad_producto: 1
		},success: function (devolver){
			$("#valores_totales__").hide("slow");	
			$("#mis_productos").append('<div id="bloque_productos" class="elemento_pro_' + devolver.insercionID + '" ><input class="form-control" type="hidden" name="descripcion_pro' + devolver.insercionID + '" id="descripcion_pro' + devolver.insercionID + '" value="'+ descr_referencia +'">'
			+ '<a href="javascript:void(0);" class="label label-info ng-binding">'+ descr_referencia +'</a>'
			+ '<input class="form-control act_cantidad" type="text" name="cantidad_pro' + devolver.insercionID + '" id="' + devolver.insercionID + '" value="1" custom-keypress="konsoleLogs($index)" ng-focus="focusCampo($index)" style="width: 13%; height: 27px;">'
			+ '<div id="organizar_datos__">'
			+ '<input class="form-control" type="hidden" readonly="" name="cantidad_peso' + devolver.insercionID + '" id="cantidad_peso' + devolver.insercionID + '" value="'+ precio_venta +'">'
			+ '<span id="cantidad_peso__" class="ng-binding">$ '+ precio_venta +'</span>'
			+ '<input type="hidden" name="precio_pro' + devolver.insercionID + '" id="precio_pro' + devolver.insercionID + '" value="'+ precio_venta +'">'
			+ '<input type="hidden" name="codigo_pro' + devolver.insercionID + '" id="codigo_pro' + devolver.insercionID + '" value="'+codigo_producto+'">'
			+ '<span id="precio_venta__" class="ng-binding">$ '+ precio_venta +'</span>'
			+ '</div>'
			+ '<div id="organizar_eliminar">'
			+ '<a onclick="eliminarP(' + devolver.insercionID + ')" ng-click="eliminarProducto($index);" href="#" style="height: 30px;"><em class="fa fa-times-circle-o fa-2x"></em></a>'
			+ '</div></div>');

			$( "#codigo_producto" ).val('');
			$( "#codigo_producto" ).focus();
		}
	});

	consultarValores();
	conteoProductos();

	$( "#codigo_producto" ).val('');
	$( "#codigo_producto" ).focus();
}

function eliminarP(id_elemento)
{
	var identifier = $("#identificador_factura").val();
	var codigo_pro = $("#codigo_pro"+id_elemento).val();

	$('.elemento_pro_' + id_elemento).hide('fast');
	$.ajax({
	  type : "POST",
	  url : _root_ + "factura/registrar",
	  dataType: 'json',
	  async: false,
	  data: {
		  action: 'eliminarProducto',
		  id_producto: id_elemento,
		  id_factura: identifier,
		  cantidad_pr: 1,
		  codigo_producto: codigo_pro
	  }
	});

	consultarValores();
	conteoProductos();
}

function consultarValores()
{
	var identifier = $("#identificador_factura").val();
	$.ajax({
	  type : "POST",
	  url : _root_ + "factura/registrar",
	  dataType: 'json',
	  async: false,
	  data: {
	  action: 'getTotal',
	  identificador_factura: identifier
	  },success: function(devolver){
		  devolver.forEach(function(element) {
		  $('#facturar span').empty();
		  $('#info_subtotal').empty();
		  $('#infop_total').empty();
		  $('#facturar span').append('Facturar  '+element.total_pago);
		  $('#info_subtotal').append('Subtotal: <span style="margin-left: 2%;">'+element.total_pago+'</span>');
		  $('#infop_total').append('Total: <span style="margin-left: 2%;">'+element.total_pago+'</span>');
		  $('#total_pago_info').val(element.total_pago_sin_formato);
		  $('#total_pago_f').val(element.total_pago);
		  //alert(element.total_pago);
		});
	  }
	});
}

function conteoProductos()
{
	var identifier = $("#identificador_factura").val();
	$.ajax({
	  type : "POST",
	  url : _root_ + "factura/registrar",
	  dataType: 'json',
	  async: false,
	  data: {
	  action: 'conteoProductos',
	  identificador_factura: identifier
	  },success: function(devolver){
		  $('#conteo_productos').empty();
		  $('#conteo_productos').append('Productos: <span style="margin-left: 2%;">'+devolver.conteo+'</span>');
	  }
	});
}