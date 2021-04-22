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
 <div class="panel panel-primary">
	<div class="panel-heading">
	  <h3 class="panel-title" style="text-align: center;" ></h3>
	</div>
	<div class="panel-body">
		<center>
		<form name="form1" method="post" action="" class="form">
			<div id="TablerosTableContainer" style="width: 680px;">
				<div class="jtable-main-container">
					<div class="jtable-busy-panel-background" style="display: none;"></div>
					<div class="jtable-busy-message" style="display: none;"></div>
					<div class="jtable-title">
						<div class="jtable-title-text" style="text-align:center;"> Actualizar usuario </div>
					</div>
				<table class="jtable">
					<thead>
							<tr>
							<th class="jtable-column-header jtable-column-header-sortable jtable-column-header-sorted-asc" >
								<div class="jtable-column-header-container" style="text-align:center;">
									<span class="jtable-column-header-text">Área de trabajo</span>
									<div class="jtable-column-resize-handler"></div>
								</div>
							</th>
							<th class="jtable-column-header jtable-column-header-sortable jtable-column-header-sorted-asc" >
								<div class="jtable-column-header-container" style="text-align:center;">
									<span class="jtable-column-header-text">Nombre de usuario</span>
									<div class="jtable-column-resize-handler"></div>
								</div>
							</th>
							<th class="jtable-column-header jtable-column-header-sortable jtable-column-header-sorted-asc" >
								<div class="jtable-column-header-container" style="text-align:center;">
									<span class="jtable-column-header-text">Email</span>
									<div class="jtable-column-resize-handler"></div>
								</div>
							</th>
							<tbody>
								<tr style="text-align:center;">
									<td><input type="text" name="nombre" style="height: 40px;" value="<?php if(isset($this->usuario[0])) echo $this->usuario[0]; ?>" /><input type="hidden" value="1" name="enviar" /></td>
									<td><input type="text" name="usuario" style="height: 40px;" value="<?php if(isset($this->usuario[1])) echo $this->usuario[1]; ?>" /></td>
									<td><input type="text" name="email" style="height: 40px;" value="<?php if(isset($this->usuario[2])) echo $this->usuario[2]; ?>" /></td>
								</tr>
							</tbody>
					</table>
				</div>
			</div>
			<br />
			<p><button type="submit" class="btn btn-primary"> <i class="icon-plus-sign icon-white"> </i> Enviar</button></p>
		</form>
		</center>
	</div>
</div>