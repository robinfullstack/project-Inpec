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
			if ($('#codigo_producto').val().length > 0) {
				clearTimeout(timer);
				timer = setTimeout(fn, ms);
			}
		});
	};

	$("input[name=codigo_producto]").delayPasteKeyUp(function()
	{
		var dato_busqueda = $("input[name=codigo_producto]").val();
		if(dato_busqueda != ''){
		$.ajax({
			type: "POST",
			url: _root_ + 'pedido/autocompletado',
			data: "autocomplete="+$("input[name=codigo_producto]").val(),
			success: function(data)
			{
				if(data != "")
				{
					var json = JSON.parse(data),
						html = '<div class="list-group">';
						if(json.res == 'empty'){
							$("#busqueda").hide();
						}else{
							$("#busqueda").show();
						}
					if(json.res == 'full')
					{
						for(datos in json.data)
						{
							html+='<a href="#" onclick="info(\''+json.data[datos].codigo+'\',\''+json.data[datos].descr_referencia+'\','+json.data[datos].precio_compra+','+json.data[datos].cantidad+','+json.data[datos].precio_venta+')" class="list-group-item">';
							html+='<h4 class="list-group-item-heading">';
							html+=' ' + json.data[datos].descr_referencia+'</h4>';
							html+='</a>';
						}
						html+='</div>';
							$("#busqueda").html("").append(html);
					}
					else
					{
						// html+='<a href="#" class="list-group-item">';
						// html+='<h4 class="list-group-item-heading">No se ha encontrado nada con '+$("input[name=codigo_producto]").val()+'</h4>';
						//html+='</a>';
					}
				}
			}
		});
		}
	}, 500);

	$(document).on("click", "a", function()
	{
		$("a").removeClass("active");
		$(this).addClass("active");
	})

});

//al pulsar en los enlaces muestra su información
function info(id_referencia,descr_referencia,precio_compra,cantidad, precio_venta)
{
	$('#ingreso_cantidad').modal('show');
	$("#ingreso_cantidad_2").focus();
	$('#asignar_codigo').val(id_referencia);
	$('#nombre_del_producto').val(descr_referencia);
	$('#asignar_preciov').val(precio_compra);
	$('#asignar_cantidad').val(cantidad);
	$('#precioventa').val(precio_venta);
	$('body').on('shown.bs.modal', '#ingreso_cantidad', function () {
		$('input:visible:enabled:first', this).focus();
	});
	//alert( id_referencia + " Nombre del Producto: " + descr_referencia);
}