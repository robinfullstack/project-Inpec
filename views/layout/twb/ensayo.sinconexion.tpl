<form id="datos-student" class="form-horizontal" data-student-id="" role="form" >
<div class="form-group">
	<label class="control-label col-sm-3" for="txtName">Name:</label>
	<div class="col-sm-7">
	 <input type="hidden" class="form-control" id="txtds" />
		<input type="text" class="form-control" id="txtName" />
	</div>
</div>
<div class="form-group">
	<label class="control-label col-sm-3" for="txtLastName">Gender:</label>
	<div class="col-sm-7">
		<label class="radio-inline">
			<input type="radio" value="male" name="Gender" />Male</label>
		<label class="radio-inline">
			<input type="radio" value="female" name="Gender" />FeMale</label>
	</div>
</div>
<div class="form-group">
	<label class="control-label col-sm-3" for="txtCountry">Country:</label>
	<div class="col-sm-7">
		<input type="text" class="form-control" id="txtCountry" />
	</div>
</div>
<div class="form-group">
	<label class="control-label col-sm-3" for="txtCity">City:</label>
	<div class="col-sm-7">
		<input type="text" class="form-control" id="txtCity" />
	</div>
</div>
<div class="form-group">
	<div class="col-sm-12" style="text-align:center;margin-top:30px;">
		<button id="btnSubmit" type="button" class="btn btn-primary" style="padding:9px 15px 9px 15px;">
			<i class="fa fa-check" aria-hidden="true"></i>
			<span>Submit</span>
		</button>
		<button id="btnCancel " type="button" class="btn btn-primary " style="padding:9px 15px 9px 15px;margin-left:10px; ">
			<i class="fa fa-times" aria-hidden="true"></i> Cancel
		</button>
	</div>
</div>
</form>
<button id="btnAddStudent" class="btn btn-success"><i class="fa fa-plus" aria-hidden="true"></i> Add Student</button>
<table id="tblGrid" style="margin-left: 5%;">
<caption style="text-align:center;padding:7px 0px 7px 0px;background:#4f4f86;color:white;font-family:cursive;font-size:18px; ">Student's Details</caption>
<thead>
	<tr>
		<th>Name</th>
		<th>Gender</th>
		<th>Country</th>
		<th>City</th>
		<th></th>
		<th></th>
	</tr>
</thead>
<tbody></tbody>
</table>