<center>
 <div class="panel panel-success">
	<div class="panel-heading">
	  <h3 class="panel-title">Usuarios</h3>
	</div>
	<div class="panel-body">
<?php if(isset($this->roles) && count($this->roles)): ?>
    <table class="table table-bordered table-condensed table-striped" style="width: 400px;" >
        <tr>
            <th style="text-align: center;">ID</th>
            <th style="text-align: center;">Role</th>
            <th></th>
        </tr>
        
        <?php foreach($this->roles as $rl){ ?>
            <tr>
                <td style="text-align: center;"><?php echo $rl['id_role']; ?></td>
                <td style="text-align: center;"><?php echo $rl['role']; ?></td>
                <td style="text-align: center;">
                   <button type="button" class="btn btn-default" onclick="window.location.href='<?php echo $_layoutParams['root']; ?>acl/permisos_role/<?php echo $rl['id_role']; ?>'">Permisos</button>
                </td>
            </tr>
        <?php } ?>
    </table>
<?php endif; ?>

<p><a class="btn btn-primary" href="<?php echo $_layoutParams['root']; ?>acl/nuevo_role" style="margin-left: 420px;"><i class="icon-plus-sign icon-white"> </i> Agregar Role</a></p>
</div>
</div>
</center>