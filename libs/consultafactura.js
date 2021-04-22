$(document).ready(function()
{
	$( "#datos-student" ).hide();
	var connection = new JsStore.Instance();
	window.onload = function () {
		initiateDb();
		/*
		$('#btnAddStudent').click(function () {
			window.location.href = 'add.html';
		})
		$('#tblGrid tbody').on('click', '.edit', function () {
			var StudentId = $(this).parents().eq(1).attr('itemid');
			getStudent(StudentId);
			$( "#datos-student" ).show();
		});
		$('#tblGrid tbody').on('click', '.delete', function () {
			var StudentId = $(this).parents().eq(1).attr('itemid');
			deleteData(StudentId);
		});
		*/
	};

	/*
	function deleteData(studentId) {
		connection.remove({
			from: 'Business',
			where: {
				Id: Number(studentId)
			}
		}).then(function (rowsDeleted) {
			console.log(rowsDeleted + ' rows deleted');
			if (rowsDeleted > 0) {
				showTableData();
			}
		}).catch(function (error) {
			console.log(err);
			alert(error.message);
		});
	}
	*/

	function initiateDb() {
		var DbName = "Businesspos";
		connection.isDbExist(DbName).then(function (isExist) {
			if (isExist) {
				/*
				//Eliminar base de datos
				connection.dropDb(DbName).then(function() {
					console.log('Db deleted successfully');
				}).catch(function(error) {
					console.log(error);
				});
				*/
				connection.openDb(DbName).then(function () {
					console.log('db opened');
				});
				showTableData();
			} else {
				var DataBase = getDatabase();
				connection.createDb(DataBase).then(function (tables) {
					console.log(tables);
				});
				//insertBusiness();
				showTableData();
			}
		}).catch(function (err) {
			console.log(err);
			alert(err.message);
		});
	}

	/*
	function insertBusiness() {
		var Businesspos = getBusiness();
		connection.insert({
			into: "Business",
			values: Businesspos
		}).then(function (rowsAdded) {
			if (rowsAdded > 0) {
				alert('Successfully added');
			}
		}).catch(function (err) {
			console.log(err);
			alert('Error Occured while adding data')
		});
	}
	*/

	function getDatabase() {
		var tblBusiness = {
			name: "Business",
			columns: [{
					name: "Id",
					primaryKey: true,
					autoIncrement: true
				},
				{
					name: "Description",
					notNull: true,
					dataType: "string"
				},
				{
					name: "Codigo",
					dataType: "string",
					notNull: true
				},
				{
					name: "Cantidad",
					notNull: true,
					dataType: "string"
				},
				{
					name: "Precioc",
					notNull: true,
					dataType: "string"
				},
				{
					name: "Preciov",
					notNull: true,
					dataType: "string"
				}
			]
		}
		var dataBase = {
			name: "Businesspos",
			tables: [tblBusiness]
		}

		return dataBase;
	}

	//This function refreshes the table
	function showTableData() {
		connection.select({
			from: "Business"
		}).then(function (businesspos) {
			var HtmlString = "";

			/*
			connection.remove({
				from: 'Business'
			}).then(function (rowsDeleted) {
				console.log(rowsDeleted + ' rows deleted');
			}).catch(function (error) {
				console.log(err);
			});
			*/
			if(businesspos == ""){
				$.ajax({
					type : "POST",
					url : _root_ + "producto/consultaProductos",
					dataType: 'json',
					async:   false,
					data: {
					action: 'consultarTodossinp'
					},
					success: function (devolver){
						$.each(devolver, function(i, item) {
							var codigo = item.codigo;
							var codigo_pr = codigo.toString();

							var precio = item.precioc;
							var precio_c = precio.toString();

							var Value = {
								Description: item.description,
								Codigo: codigo_pr,
								Cantidad: item.cantidad,
								Precioc: precio_c,
								Preciov: item.preciov
							};

							connection.insert({
								into: "Business",
								values: [Value]
							}).then(function (rowsAdded) {
								console.log(rowsAdded + " record Added");
							}).catch(function (err) {
								console.log(err);
							})
						});
					}
				});
			}

			businesspos.forEach(function (business) {
				HtmlString += "<tr ItemId=" + business.Id + "><td> " +
					business.Description + "</td><td>" +
					business.Codigo + "</td><td>" +
					business.Cantidad + "</td><td>" +
					business.Precioc + "</td><td>" +
					business.Preciov + "</td><td>" +
					"<a href='#' class='edit'>Edit</a></td>" +
					"<td><a href='#' class='delete''>Delete</a></td>";
			})
			$('#tblGrid tbody').html(HtmlString);
		}).catch(function (error) {
			console.log(error);
		});
	}

	/*
	function getBusiness() {
		//Business Array
		var Businesspos = [{
				Description: 'info',
				Codigo: 'info',
				Cantidad: 'info',
				Precioc: 'info',
				Preciov: 'info'
			}
		]
	}

	function getBusinessp(BusinessId) {
		//check if Query string param exist
		if (BusinessId) {
			connection.select({
				from: 'Business',
				where: {
					Id: Number(BusinessId)
				}
			}).then(function (results) {
				if (results.length > 0) {
					var Business = results[0];
					$('#txtds').val(Business.Id);
					$('#txtName').val(Business.Name);
					$("input[name='Gender'][value=" + Business.Gender + "]").prop('checked', true);
					$('#txtCountry').val(Business.Country);
					$('#txtCity').val(Business.City)
				} else {
					alert('Invalid student id');
				}

			}).catch(function (err) {
				console.log(err);
				alert(err.message);
			})
		}
	}

	$('#btnSubmit').click(function(){
		var StudentId = $('#txtds').val();
		var Value = {
			Name: $('#txtName').val(),
			Gender: $("input[name='Gender']:checked").val(),
			Country: $('#txtCountry').val(),
			City: $('#txtCity').val()
		};
		connection.update({ in: 'Business',
			set: Value,
			where: {
				Id: Number(StudentId)
			}
		}).then(function (rowsAffected) {
			//alert(rowsAffected + " record Updated");
			if (rowsAffected > 0) {
				$( "#datos-student" ).hide();
				showTableData();
			}
		}).catch(function (err) {
			console.log(err);
			alert(err.message);
		})
	});
	*/

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

	$("input[name=nombre_producto]").delayPasteKeyUp(function()
	{
		$.ajax({
			type: "POST",
			url: _root_ + 'factura/autocompletado',
			data: "autocomplete="+$("input[name=nombre_producto]").val(),
			success: function(data)
			{
				//console.log(data);
				if(data)
				{
					var json = JSON.parse(data),
						html = '<div class="list-group">';
					if(json.res == 'full')
					{
						for(datos in json.data)
						{
							//console.log(json.data[datos].codigo);
							html+='<a href="#" onclick="info(\''+json.data[datos].codigo+'\',\''+json.data[datos].descr_referencia+'\','+json.data[datos].precio_venta+',\''+json.data[datos].cantidad+'\')" class="list-group-item">';
							html+='<h4 class="list-group-item-heading">';
							html+=' ' + json.data[datos].descr_referencia+'</h4>';
							html+='</a>';
						}
					}
					html+='</div>';
					$("#busqueda").html("").append(html);
				}
			},
			error: function () {
				connection.select({
					from: "Business",
					where: {
						Codigo: {
							like: '%'+$("input[name=nombre_producto]").val()+'%'
						},
						or: {
							Description: {
								like: '%'+$("input[name=nombre_producto]").val()+'%'
							},
						},
						Cantidad: {
							'-': {
								Low: 1,
								High: 50000
							}
						}
					}
				}).then(function (businesspos) {
					html = '<div class="list-group">';
						businesspos.forEach(function (business) {
						//console.log(business.Codigo);
						html+='<a href="#" onclick="info(\''+business.Codigo+'\',\''+business.Description+'\','+business.Preciov+',\''+business.Cantidad+'\')" class="list-group-item">';
						html+='<h4 class="list-group-item-heading">';
						html+=' ' + business.Description+'</h4>';
						html+='</a>';
						})
					html+='</div>';
					$("#busqueda").html("").append(html);
				}).catch(function (error) {
					console.log(error);
				});
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