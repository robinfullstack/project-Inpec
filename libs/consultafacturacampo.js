$(document).ready(function()
{
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

	$("input[name=codigo_producto]").delayPasteKeyUp(function()
	{
		$.ajax({
			type: "POST",
			url: _root_ + 'factura/autocompletado',
			data: "autocomplete="+$("input[name=codigo_producto]").val(),
			success: function(data)
			{
				if(data)
				{
					var json = JSON.parse(data),
						html = '<div class="list-group">';
					if(json.res == 'full')
					{
						for(datos in json.data)
						{
							html+='<a href="#" onclick="info(\''+json.data[datos].codigo+'\',\''+json.data[datos].descr_referencia+'\','+json.data[datos].precio_venta+',\''+json.data[datos].cantidad+'\')" class="list-group-item">';
							html+='<h4 class="list-group-item-heading">';
							html+=' ' + json.data[datos].descr_referencia+'</h4>';
							html+='</a>';
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

	$(document).on("click", "a", function()
	{
		$("a").removeClass("active");
		$(this).addClass("active");
	})

});

//al pulsar en los enlaces muestra su información
function info(id_referencia,descr_referencia,precio_venta,cantidad)
{
	$('#factura_ventana').modal('show');
	$("#ingreso_cantidad_3").focus();
	$('#asignar_codigo_2').val(id_referencia);
	$('#nombre_del_producto_2').val(descr_referencia);
	$('#asignar_preciove').val(precio_venta);
	$('#asignar_cantidad_2').val(cantidad);
	$('body').on('shown.bs.modal', '#factura_ventana', function () {
		$('input:visible:enabled:first', this).focus();
	});
	//alert( id_referencia + " Nombre del Producto: " + descr_referencia);
}