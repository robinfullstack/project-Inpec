$(document).on('ready', function(){

	var busqueda = function(){
		var encontrar = '&encontrar=' + $("#encontrar").val();

		$.post(_root_ + 'cliente/busqueda', encontrar, function(data){
			$("#lista_registros").html('');
			$("#lista_registros").html(data);
		});
	}

	$("#btnEnviar").click(function(){
		busqueda();
	});

});