<link href="<?php echo $_layoutParams['ruta_css']; ?>jquery-ui-1.8.16.custom.css" rel="stylesheet" type="text/css" /> 
<link href="<?php echo $_layoutParams['ruta_css']; ?>jtable.css" rel="stylesheet" type="text/css" />
<style type="text/css">
div.jtable-main-container div.jtable-title {
  background: <?php echo $this->color[0]; ?>;
  background: -moz-linear-gradient(top, <?php echo $this->color[0]; ?> 0%, <?php echo $this->color[0]; ?> 100%);
  background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, <?php echo $this->color[0]; ?>), color-stop(100%, <?php echo $this->color[0]; ?>));
  background: -webkit-linear-gradient(top, <?php echo $this->color[0]; ?> 0%, <?php echo $this->color[0]; ?> 100%);
  background: -o-linear-gradient(top, <?php echo $this->color[0]; ?> 0%, <?php echo $this->color[0]; ?> 100%);
  background: -ms-linear-gradient(top, <?php echo $this->color[0]; ?> 0%, <?php echo $this->color[0]; ?> 100%);
  background: linear-gradient(to bottom, <?php echo $this->color[0]; ?> 0%, <?php echo $this->color[0]; ?> 100%);
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='<?php echo $this->color[0]; ?>', endColorstr='<?php echo $this->color[0]; ?>', GradientType=0);
  border-color: #2B5177;
} 
.btn-primary {
  color: #ffffff;
  background-color: <?php echo $this->color[0]; ?>;
  border-color: <?php echo $this->color[0]; ?>;
}
</style>
<center>
 <div class="panel panel-primary">
	<div class="panel-heading">
	  <h3 class="panel-title"></h3>
	</div>
	<div class="panel-body">
<?php if(isset($this->usuarios) && count($this->usuarios)): ?>
	<div id="TablerosTableContainer" style="width: 900px;">
	<div class="jtable-main-container">
		<div class="jtable-busy-panel-background" style="display: none;"></div>
		<div class="jtable-busy-message" style="display: none;"></div>
		<div class="jtable-title" style="text-align:center;">
			<div class="jtable-title-text"> Listado de usuarios </div>
		</div>
	<table class="jtable">
		<thead>
				<tr>
				<th class="jtable-column-header jtable-column-header-sortable jtable-column-header-sorted-asc" >
					<div class="jtable-column-header-container" style="text-align:center;"><span class="jtable-column-header-text">Área de trabajo</span><div class="jtable-column-resize-handler"></div></div>
				</th>
				<th class="jtable-column-header jtable-column-header-sortable">
					<div class="jtable-column-header-container" style="text-align:center;">
						<span class="jtable-column-header-text">Nombre de usuario</span>
						<div class="jtable-column-resize-handler"></div>
					</div>
				</th>
			    <th class="jtable-column-header jtable-column-header-sortable">
					<div class="jtable-column-header-container" style="text-align:center;">
						<span class="jtable-column-header-text">Correo electrónico</span>
						<div class="jtable-column-resize-handler"></div>
					</div>
				</th>
				<th class="jtable-column-header jtable-column-header-sortable">
					<div class="jtable-column-header-container" style="text-align:center;">
						<span class="jtable-column-header-text">Editar</span>
						<div class="jtable-column-resize-handler"></div>
					</div>
				</th>
				<th class="jtable-column-header jtable-column-header-sortable">
					<div class="jtable-column-header-container" style="text-align:center;">
						<span class="jtable-column-header-text">Eliminar</span>
						<div class="jtable-column-resize-handler"></div>
					</div>
				</th>
			</tr>
		</thead>
		<?php $class = "jtable-data-row"; ?>
		<?php foreach($this->usuarios as $user){ ?>
			<tbody>
				<tr class="<?php echo $class; ?> data-record-key="3" >
					<td style="text-align: center;"><?php echo $user['nombre']; ?></td>
					<td style="text-align: center;"><?php echo $user['usuario']; ?></td>
					<td style="text-align: center;"><?php echo $user['email']; ?></td>
					<td><a href="<?php echo $_layoutParams['root']; ?>usuario/editar/<?php echo $user['id']; ?>" style="height: 30px; margin-left: 30px"><li class="icon-pencil"> </li></a></td>
					<td><a href="<?php echo $_layoutParams['root']; ?>usuario/eliminar/<?php echo $user['id']; ?>" style="height: 30px; margin-left: 30px"><li class="icon-trash"> </li></a></td>
				</tr>
			</tbody>
			<?php
			 if ($class == "jtable-data-row")
				$class = "jtable-data-row jtable-row-even";
             else
				$class = "jtable-data-row";
			 ?>
		<?php } ?>
		</table>
	</div>
</div>

<?php endif; ?>
	<br />
	<p><button type="button" onclick="window.location.href='<?php echo $_layoutParams['root']; ?>registro'" class="btn btn-primary"><i class="icon-plus-sign icon-white"> </i>&nbsp;Agregar usuario</button>
</p>
	</div>
  </div>
</center>