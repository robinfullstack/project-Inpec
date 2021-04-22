$(document).ready(function(){
   //$("#tipo_de_negocio").modal();
});

$('#mercado-retail').click(function(){
	$.ajax({
		  type : "POST",
		  url : _root_ + "factura/registrar",
		  dataType: 'json',
		  async:   false,
		  data: {
			action: 'selecNegocio',
			tiponegocio: 1
		}
		/*
		,
		success: function (devolver){
			$('#identificador_factura').val(devolver.id_facturas);
			$("#ver_facturas").html(devolver.id_facturas);
		}
		*/
	});
	$('#tipo_de_negocio').modal('toggle'); 
});
$('#restaurante').click(function(){
	$.ajax({
		  type : "POST",
		  url : _root_ + "factura/registrar",
		  dataType: 'json',
		  async:   false,
		  data: {
			action: 'selecNegocio',
			tiponegocio: 2
		}
	});
	$('#tipo_de_negocio').modal('toggle'); 
});
$('#ropa').click(function(){
	$.ajax({
		  type : "POST",
		  url : _root_ + "factura/registrar",
		  dataType: 'json',
		  async:   false,
		  data: {
			action: 'selecNegocio',
			tiponegocio: 3
		}
	});
	$('#tipo_de_negocio').modal('toggle'); 
});

$("#valor_final_m").hide();
$("#valor_final_error").hide();

$("#valor_dado__").keyup(function(event){
	var total = $("#total_pago_info").val();
	var valor_dado = $("#valor_dado__").val();
	var valor_final = total - valor_dado;
	var pendiente = valor_dado - total;
	if(valor_final < 0){
		$('#valor_final__').text('CAMBIO: $ ' + pendiente);
		$("#valor_final_error").hide();
		$("#valor_final_m").show();
	}
	else{
		$('#mensaje_error__').text('PENDIENTE POR PAGAR: $ ' + valor_final);
		$("#valor_final_m").hide();
		$("#valor_final_error").show();
	}
});

myApp.directive('customKeypress', function () {
    return function (scope, element, attrs) {
        element.bind("keydown keypress", function (event) {
            if(event.which === 13) {
                scope.$apply(function (){
                    scope.$eval(attrs.customKeypress);
                });

                event.preventDefault();
            }
        });
    };
});

myApp.controller('encuestasController', function($scope, $http) {
	$http.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=utf-8';

	$('#clic_apertura').click(function(){
		$http({
			method : "POST",
			url : _root_ + 'usuarios/registro/nuevoEmpleado',
			data : "action=consultaEmpleados",
		}).success(function(data){
			$scope.items = data;
			//console.log($scope.items);
		});
	});

	$('#asignar_empleado').click(function(){
		var nombre_empleado = $('#nombre_empleado').val();
		var usuario_empleado = $('#usuario_empleado').val();
		var email_empleado = $('#email_empleado').val();
		var pass_empleado = $('#pass_empleado').val();
		var confirmar_pass = $('#confirmar_pass').val();

		$http({
			method : "POST",
			url : _root_ + 'usuarios/registro/nuevoEmpleado',
			data : "action=accionEmpleado&nombre_empleado="+nombre_empleado+"&usuario_empleado="+usuario_empleado+
			"&email_empleado="+email_empleado+"&pass_empleado="+pass_empleado+"&confirmar_pass="+confirmar_pass,
		}).success(function(data){ 
			$scope.ingreso_em = data;

			if(data.aprobacion == 1){
				$('#registro_empleado').trigger('click'); 
				$('#registro_gestor').modal('toggle'); 
			}
		});

		$http({
			method : "POST",
			url : _root_ + 'usuarios/registro/nuevoEmpleado',
			data : "action=consultaEmpleados",
		}).success(function(data){ 
			$scope.datos_empleados = data;
		});
	});
});

$('#nuevo_registro_cliente').click(function(){
	var numero_identificacion = $("#numero_identificacion").val();
	var nombre = $("#nombre").val();
	var nombre_comercial = $('#nombre_comercial').val();
	var telefono = $('#telefono').val();
	var celular = $('#celular').val();
	var direccion = $('#direccion').val();
	var ciudad = $('#ciudad').val();
	var correo = $('#correo').val();
	var lista_precio = $('#lista_precio').val();

   if(numero_identificacion !== "" && nombre !== ""){
		$.ajax({
			  type : "POST",
			  url : _root_ + "login/registrar",
			  dataType: 'json',
			  data: {
				action: 'insertarCliente',
				numero_identificacion: numero_identificacion,
				nombre: nombre,
				nombre_comercial: nombre_comercial,
				telefono: telefono,
				celular: celular,
				direccion: direccion,
				ciudad: ciudad,
				correo: correo,
				lista_precio: lista_precio
			},
		});
		$('#registro_aprobado_1').trigger('click');
	}
	else
	{
		$('#faltan_datos').trigger('click');
	}
});

$('#cancelar').click(function(){
	$(location).attr('href', _root_);
});

$('#re_agregar_nota').click(function(){

	var titulo_nota = $("#titulo_nota").val();
	var descripcion_nota = $(".uk-markdownarea-preview").html();
	var prioridad_nota = $("#prioridad_nota").val();

	if(titulo_nota == "" || descripcion_nota == ""){
		alert("Ingrese por favor los campos faltantes!");
		$('#faltan_datos').trigger('click');
	}else{
		$.ajax({
			  type : "POST",
			  url : _root_ + "index/registro",
			  dataType: 'json',
			  data: {
				action: 'registroNota',
				titulo_nota: titulo_nota,
				descripcion_nota: descripcion_nota,
				prioridad_nota: prioridad_nota
			},
		});

		alert("Nota Ingresada de manera satisfactoria!");

		location.reload();
	}
});

	//////////////////////////////////////////////////////////////////////////////////////////////
	//-------------------------------Registro de Página Inicio---------------------------------------//
	//////////////////////////////////////////////////////////////////////////////////////////////

	$('#id_notas_p span').click(function(){
		var id_notas = $(this).attr('id');

		if(id_notas == ""){
			alert("Ocurrió un error al tratar de borrar el registro!");
			$('#faltan_datos').trigger('click');
		}else{
			$.ajax({
				  type : "POST",
				  url : _root_ + "index/desactivarNota",
				  dataType: 'json',
				  async:   false,
				  data: {
					action: 'desactivarNota',
					id_notas: id_notas
				},
			});

			alert("Nota desactivada de manera satisfactoria!");

			location.reload();
		}
	});

	//////////////////////////////////////////////////////////////////////////////////////////////
	//-------------------------------Fin Registro de Página Inicio---------------------------------------//
	//////////////////////////////////////////////////////////////////////////////////////////////

function fullScreen(element) {
  if(element.requestFullscreen) {
    element.requestFullscreen();
  } else if(element.mozRequestFullScreen) {
    element.mozRequestFullScreen();
  } else if(element.webkitRequestFullscreen) {
    element.webkitRequestFullscreen();
  } else if(element.msRequestFullscreen) {
    element.msRequestFullscreen();
  }
}

function fullwin(){
	fullScreen(document.documentElement);
}

$(document).ready(function (e) {
	$("#producto_form").on('submit',(function(e) {
		e.preventDefault();
		$.ajax({
			url: _root_ + "producto/insertarProducto",
			type: "POST",
			data:  new FormData(this),
			contentType: false,
			cache: false,
			processData:false,
			beforeSend : function()
			{
				//$("#preview").fadeOut();
				$("#err").fadeOut();
			},
			success: function(data)
			{
				$('#registro_aprobado').trigger('click');
				$('#asignar_producto').modal('toggle'); 
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
				}
			},error: function(e) 
			{
				$("#err").html(e).fadeIn();
			}          
		});
	}));

	$('#cancelar_registro_p').click(function(){
		$(location).attr('href', _root_);
	});
});

$("#precio_compra_2").keyup(function(event){
	var p_compra = $("#precio_compra_2").val();
	var p_porcentaje = $("#precio_porcentaje").val();
	//alert(total);
	if ($('#validacion_porcentaje').is(':checked')) {
		var obt_porcentaje = p_compra * p_porcentaje / 100;
		var valor_final = parseInt(obt_porcentaje) + parseInt(p_compra);

		if(isNaN(valor_final))
			valor_final = 0;
	
		$('#precio_venta_2').val(valor_final);
	}
});

$('#cancel_fact').click(function(){
	$('#generar_factura').modal('toggle'); 
});

$('#cancelar_apertura').click(function(){
	$('#apertura_caja').modal('toggle'); 
});

$('#cancelar_cierre').click(function(){
	$('#cierre_caja').modal('toggle'); 
});

$('#cancelar_re_gestor').click(function(){
	$('#registro_gestor').modal('toggle'); 
});