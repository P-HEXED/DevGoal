<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">	 
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>จัดการข้อมูลสถานที่ทำงาน</title>
<link rel="stylesheet" href="resources/stylecss/style_user.css">
<link href="resources/images/logo/devgoal_logo.png" size="16x16"
	rel="shortcut icon" type="image/png" />
<script src="https://unpkg.com/htmlincludejs"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.2.0/mdb.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
<script type="text/javascript" src="resources/js/loading.js"></script>
<link rel="stylesheet" href="resources/stylecss/loading_axios.css">
</head>
<body>
	<div class="ring">
		DEVGOAL<span class="loading"></span>
	</div>
	<main>
		<nav class="navbar navbar-expand d-flex flex-column " id="sidebar">
			<include src="resources/includeBody/role4/sidebar_admin.html"></include>
		</nav>
		<include src="resources/includeBody/role4/navbar_admin.html"></include>

		<section class="p-4 my-container">
			<button class="btn" id="menu-btn">
				<i class="fa-solid fa-list"></i>
			</button>
				<div class="row table-responsive">
					<div class="card-container">
						&nbsp;&nbsp;
						<h4>จัดการข้อมูลสถานที่ทำงาน</h4>
						<div class="card" id="ins">
							<div class="card-header">เพิ่มสถานที่ทำงาน</div>
							<div class="card-body">
								<div class="row">
									<div class="col-lg-12">
										<form>
											<div class="row">
												<div class="col-sm-12 col-md-6 col-lg-4">
													<div class="form-floating ">
														<input type="text" class="form-control"
															id="overseasNameInsert" placeholder="ชื่อสถานที่ทำงาน"
															name="name"> <label for="name">ชื่อสถานที่ทำงาน</label>
													</div>
												</div>
												<div class="col-sm-12 col-md-6 col-lg-3">
													<div class="form-floating ">
														<input type="text" class="form-control"
															id="overseasEmailInsert" placeholder="อีเมลสถานที่ทำงาน"
															name="initial"> <label for="initial">อีเมลสถานที่ทำงาน</label>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-sm-12 col-md-6 col-lg-2">
													<div class="form-floating ">
														<input type="number" class="form-control"
															id="overseasPhoneInsert" placeholder="เบอร์โทร"
															name="zipcode" min="1"> <label for="zipcode">เบอร์โทร</label>
													</div>
												</div>
												<div class="col-sm-12 col-md-6 col-lg-2">
													<div class="form-floating ">
														<input type="number" class="form-control"
															id="overseasReceiveInsert" placeholder="จำนวนที่รับ"
															name="zipcode" min="1"> <label for="zipcode">จำนวนที่รับ</label>
													</div>
												</div>
												<div class="col-sm-12 col-md-6 col-lg-2">
													<select class="form-select" id="overseasTypeInsert">
														<option value="0">สถานที่ตั้ง</option>
														<option value="1">ในประเทศ</option>
														<option value="2">ต่างประเทศ</option>
													</select>
												</div>
											</div>
											<div class="row">
												<div class="col-sm-12 col-md-6 col-lg-2">
													<div class="form-floating ">
														<input type="text" class="form-control"
															id="overseasAddress1Insert" placeholder="ประเทศ"
															name="country"> <label for="country">ประเทศ</label>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-sm-12 col-md-6 col-lg-3 my-2">
													<p>จังหวัด</p>
													<select class="form-select" id="address_6">
														<option value="0">กรุณาเลือกจังหวัด</option>
													</select>
												</div>
												<div class="col-sm-12 col-md-6 col-lg-3 my-2">
													<p>อำเภอ/เขต</p>
													<select class="form-select" id="address_5">
														<option value="0">กรุณาเลือกอำเภอ</option>
													</select>
												</div>

												<div class="col-sm-12 col-md-6 col-lg-3 my-2">
													<p>ตำบล/แขวง</p>
													<select class="form-select" id="address_4">
														<option value="0">กรุณาเลือกตำบล</option>
													</select>
												</div>
												<div class="col-sm-12 col-md-6 col-lg-2 my-2">
													<p>รหัสไปรษณีย์</p>
													<input type="number" class="form-control"
														placeholder="รหัสไปรษณีย์" aria-label="รหัสไปรษณีย์"
														aria-describedby="basic-addon1" min="1" id="address_7">
												</div>
											</div>
											<div class="row">
												<div class="col-sm-12 col-md-12 col-lg-8">
													<div class="card shadow p-3 rounded">
														<div
															class="card-header bg-dark shadow p-3 mb-5 rounded text-white fs-5">
															<i class="fa-solid fa-code fa-md"></i>
															ทักษะด้านโปรแกรมมิ่ง <i class="fa-solid fa-code fa-md"></i>
														</div>
														<div class="card-body">
															<div class="row">
																<div class="col-sm-12 col-md-12 col-lg-6">
																	<p>ทักษะด้านโปรแกรมมิ่ง</p>
																	<select class="form-select" id="language">
																		<option value="0">เลือกทักษะด้านโปรแกรมมิ่ง</option>
																	</select>
																</div>
																<div class="col-sm-12 col-md-12 col-lg-4">
																	<p>ระดับความชำนาญ</p>
																	<select class="form-select" id="level">
																		<option value="0">เลือกระดับความชำนาญ</option>
																		<option value="1">ระดับเริ่มต้น</option>
																		<option value="2">ระดับปานกลาง</option>
																		<option value="3">ระดับสูง</option>
																	</select>
																</div>
																<div class="col-sm-12 col-md-12 col-lg-2">
																	<p>.</p>
																	<button type="button" class="btn btn-info"
																		onclick="addSkillDatatable()">เพิ่มข้อมูล</button>
																</div>
															</div>
															</br>
															<div class="table-overflow col-sm-12 col-md-12 col-lg-8">
																<table id="datatable_language"
																	class="table table-primary table-striped shadow p-3 mb-5 rounded"
																	style="width: 100%">
																	<thead>
																		<tr>
																			<th>ลำดับ</th>
																			<th>ทักษะด้านโปรแกรมมิ่ง</th>
																			<th>ระดับความชำนาญ</th>
																			<th>ลบ</th>
																		</tr>
																	</thead>
																	<tbody id="data_language">
																</table>
															</div>
														</div>
													</div>
												</div>
											</div>

											</br>
											<button type="button" onClick="insertOverseasWorkPlace()"
												class="btn btn-primary" style="float: right;">บันทึก</button>
										</form>
									</div>
								</div>
							</div>
						</div>
						<div class="lds-roller" id="spinner" style="display: none;">
							<div></div>
							<div></div>
							<div></div>
							<div></div>
							<div></div>
							<div></div>
							<div></div>
							<div></div>
						</div>
					</div>

					<div class="table-container col-sm-6 col-md-12 col-lg-12">
						<div class="row abovetable ">
							<h4>แก้ไขข้อมูลสถานที่ทำงาน</h4>
						</div>
						<div class="table-overflow">
						<table class="table  table-striped text-center "
							id="overseasDataTable">
							<thead class="table-dark">
								<tr>
									<th>ชื่อบริษัทรับนิสิต/นักศึกษาทำงาน</th>
									<th>ที่ตั้ง</th>
									<th>สถานะ</th>
									<th>เวลาที่บันทึก</th>
									<th></th>
									<th></th>
								</tr>
							</thead>
							<tbody id="overseasTable">
							</tbody>
						</table>
						</div>
						<div class="lds-roller" id="spinner2" style="display: none;">
							<div></div>
							<div></div>
							<div></div>
							<div></div>
							<div></div>
							<div></div>
							<div></div>
							<div></div>
						</div>
					</div>
				</div>

			<div class="modal fade" id="overseasModal">
				<div
					class="modal-dialog modal-xl modal-fullscreen-lg-down modal-dialog-centered">
					<div class="modal-content" id="update">
						<div class="modal-header">
							<h5 class="modal-title">แก้ไขข้อมูลสถานที่ทำงาน</h5>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col-lg-12">
									<form>
										<div class="row">
											<div class="col-sm-12 col-md-6 col-lg-4">
												<div class="form-floating ">
													<input type="text" class="form-control"
														id="overseasNameModal" placeholder="ชื่อสถานที่ทำงาน"
														name="overseasNameModal"> <label for="name">ชื่อสถานที่ทำงาน</label>
												</div>
											</div>
											<div class="col-sm-12 col-md-6 col-lg-3">
												<div class="form-floating ">
													<input type="text" class="form-control"
														id="overseasEmailModal" placeholder="อีเมล"
														name="overseasEmailModal"> <label for="initial">อีเมล</label>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-12 col-md-6 col-lg-3">
												<div class="form-floating ">
													<input type="number" class="form-control"
														id="overseasPhoneModal" placeholder="เบอร์โทร"
														name="overseasPhoneModal" min="1"> <label
														for="country">เบอร์โทร</label>
												</div>
											</div>
											<div class="col-sm-12 col-md-6 col-lg-3">
												<div class="form-floating ">
													<input type="number" class="form-control"
														id="overseasReceiveModal" placeholder="จำนวนที่รับ"
														name="overseasReceiveModal" min="1"> <label
														for="province">จำนวนที่รับ</label>
												</div>
											</div>
											<div class="col-sm-12 col-md-6 col-lg-3">
												<select class="form-select" id="overseasTypeModal">
													<option value="0">สถานที่ตั้ง</option>
													<option value="1">ในประเทศ</option>
													<option value="2">ต่างประเทศ</option>
												</select>
											</div>
											<div class="col-sm-12 col-md-6 col-lg-3">
												<div class="form-floating ">
													<input type="text" class="form-control"
														id="overseasStatusModal" placeholder="สถานะ"
														name="overseasStatusModal" disabled> <label
														for="locality">สถานะ</label>
												</div>
											</div>
											<div class="col-sm-12 col-md-6 col-lg-3">
												<div class="form-floating ">
													<input type="text" class="form-control"
														id="overseasTimeRegModal" placeholder="เวลาที่บันทึก"
														name="overseasTimeRegModal" disabled> <label
														for="zipcode">เวลาที่บันทึก</label>
												</div>
											</div>
											<div class="col-sm-12 col-md-6 col-lg-3">
												<div class="form-floating ">
													<input type="text" class="form-control"
														id="overseasUserNameModal" placeholder="ผู้บันทึกข้อมูล"
														name="overseasUserNameModal" disabled> <label
														for="zipcode">ผู้บันทึกข้อมูล</label>
												</div>
												<input type="hidden" id="overseasIdModal" value=""></input>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-12 col-md-6 col-lg-3">
												<div class="form-floating ">
													<input type="text" class="form-control"
														id="overseasAddress1Modal" placeholder="ประเทศ"
														name="overseasAddress1Modal"> <label for="country">ประเทศ</label>
												</div>
											</div>
											<div class="col-sm-12 col-md-6 col-lg-3">
												<div class="form-floating ">
													<input type="text" class="form-control"
														id="overseasAddress2Modal" placeholder="จังหวัด"
														name="overseasAddress2Modal" disabled> <label
														for="province">จังหวัด</label>
												</div>
											</div>
											<div class="col-sm-12 col-md-6 col-lg-3">
												<div class="form-floating ">
													<input type="text" class="form-control"
														id="overseasAddress3Modal" placeholder="อำเภอ"
														name="overseasAddress3Modal" disabled> <label
														for="district">อำเภอ</label>
												</div>
											</div>
											<div class="col-sm-12 col-md-6 col-lg-3">
												<div class="form-floating ">
													<input type="text" class="form-control"
														id="overseasAddress4Modal" placeholder="ตำบล"
														name="overseasAddress4Modal" disabled> <label
														for="locality">ตำบล</label>
												</div>
											</div>
											<div class="col-sm-12 col-md-6 col-lg-3">
												<div class="form-floating ">
													<input type="number" class="form-control"
														id="overseasAddress5Modal" placeholder="รหัสไปรษณีย์"
														name="overseasAddress5Modal" min="1" disabled> <label
														for="zipcode">รหัสไปรษณีย์</label>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-12 col-md-6 col-lg-3 my-2">
												<p>จังหวัด</p>
												<select class="form-select" id="address_6_update">
													<option value="0">กรุณาเลือกจังหวัด</option>
												</select>
											</div>

											<div class="col-sm-12 col-md-6 col-lg-3 my-2">
												<p>อำเภอ/เขต</p>
												<select class="form-select" id="address_5_update">
													<option value="0">กรุณาเลือกอำเภอ</option>
												</select>
											</div>

											<div class="col-sm-12 col-md-6 col-lg-3 my-2">
												<p>ตำบล/แขวง</p>
												<select class="form-select" id="address_4_update">
													<option value="0">กรุณาเลือกตำบล</option>
												</select>
											</div>

										</div>
										<hr>
										<div class="row">
											<div class="row">
												<div class="col-sm-12 col-md-12 col-lg-6">
													<p>ทักษะด้านโปรแกรมมิ่งที่ต้องการ</p>
													<select class="form-select" id="languageUpdate">
														<option value="0">เลือกทักษะด้านโปรแกรมมิ่ง</option>
													</select>
												</div>
												<div class="col-sm-12 col-md-12 col-lg-4">
													<p>ระดับความชำนาญ</p>
													<select class="form-select" id="levelUpdate">
														<option value="0">เลือกระดับความชำนาญ</option>
														<option value="1">ระดับเริ่มต้น</option>
														<option value="2">ระดับปานกลาง</option>
														<option value="3">ระดับสูง</option>
													</select>
												</div>
												<div class="col-sm-12 col-md-12 col-lg-2">
													<p>.</p>
													<button class="btn btn-primary" id="addSkillUpdate">เพิ่มข้อมูล</button>
												</div>
											</div>
											<div class="col-sm-12 col-md-12 col-lg-6">
												<table id="datatable_report_language"
													class="table table-primary table-striped shadow p-3 mb-5 rounded"
													style="width: 100%">
													<thead>
														<tr>
															<th>ลำดับ</th>
															<th>ทักษะด้านโปรแกรมมิ่ง</th>
															<th>ระดับความชำนาญ</th>
															<th>ลบ</th>
														</tr>
													</thead>
													<tbody id="report_data_language">
												</table>
											</div>
										</div>
									</form>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" onClick="updateOverseasWorkPlace()"
									class="btn btn-primary">บันทึก</button>
								<button type="button" class="btn btn-danger"
									data-bs-dismiss="modal">ยกเลิก</button>
							</div>
							<div class="lds-roller" id="spinner1" style="display: none;">
								<div></div>
								<div></div>
								<div></div>
								<div></div>
								<div></div>
								<div></div>
								<div></div>
								<div></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/js/bootstrap.min.js"
		integrity="sha384-5h4UG+6GOuV9qXh6HqOLwZMY4mnLPraeTrjT5v07o347pj6IkfuoASuGBhfDsp3d"
		crossorigin="anonymous"></script>
	<script type="text/javascript" src="resources/js/sidebar.js"></script>

</body>

</html>
<script type="text/javascript">

var i = 1
function addSkillDatatable() {
	var x = document.getElementById("language");
	var language = x.options[x.selectedIndex].text;
	 
	var e = document.getElementById("level");
	var level = e.options[e.selectedIndex].text;
	
	if(language != 'เลือกทักษะด้านโปรแกรมมิ่ง' && level != 'เลือกระดับความชำนาญ') {
		
		var newRow = document.createElement("tr")
		var newCell0 = document.createElement("td")
	    var newCell1 = document.createElement("td")
	    var newCell2 = document.createElement("td")
	    var newCell3 = document.createElement("td")
	    
	    newCell0.innerHTML = i++
	    newCell1.innerHTML = language
	    newCell2.innerHTML = level
	    newCell3.innerHTML = "<i id='close1' class='fa fa-close' style='color: red'></i>"
	    
	    newRow.append(newCell0)
	    newRow.append(newCell1)
	    newRow.append(newCell2)
	    newRow.append(newCell3)
	    document.getElementById("data_language").appendChild(newRow)
	    
	    x.remove(x.selectedIndex)
    
  		$("#language").val(0).change();
    	$("#level").val(0).change();
		
	} else {
		Swal.fire({
					  icon: 'warning',
					  title: 'กรุณากรอกข้อมูลความสามารถ',
					  showConfirmButton: false,
					  timer: 3000
					})
	}
	
}

var j = 1
document.getElementById("addSkillUpdate").addEventListener("click", function(event){
	  event.preventDefault()
	  
	var x = document.getElementById("languageUpdate");
	var language = x.options[x.selectedIndex].text;
	 
	var e = document.getElementById("levelUpdate");
	var level = e.options[e.selectedIndex].text;
	
	if(language != 'เลือกทักษะด้านโปรแกรมมิ่ง' && level != 'เลือกระดับความชำนาญ') {
		
		var newRow = document.createElement("tr")
		var newCell0 = document.createElement("td")
	    var newCell1 = document.createElement("td")
	    var newCell2 = document.createElement("td")
	    var newCell3 = document.createElement("td")
	    
	    newCell0.innerHTML = j++
	    newCell1.innerHTML = language
	    newCell2.innerHTML = level
	    newCell3.innerHTML = "<i id='close2' class='fa fa-close' style='color: red'></i>"
	    
	    newRow.append(newCell0)
	    newRow.append(newCell1)
	    newRow.append(newCell2)
	    newRow.append(newCell3)
	    document.getElementById("report_data_language").appendChild(newRow)
	    
	    x.remove(x.selectedIndex)
    
  		$("#languageUpdate").val(0).change();
    	$("#levelUpdate").val(0).change();
    	
		
	} else {
		Swal.fire({
					  icon: 'warning',
					  title: 'กรุณากรอกข้อมูลความสามารถ',
					  showConfirmButton: false,
					  timer: 3000
					})

	}
	
	});

function getValueSkillDatatable() {
	
	var skill = []
	var subSkill = []
	
	var table = $('#datatable_language')
	
	var i = 0
	table.children("tbody").find("td").each(function() {
		subSkill.push($(this).text())
		
		if(i == 3) {
			skill.push(subSkill.splice(1,2))
			subSkill = []
			i = 0
		} else {
			i++
		}
		
   });
	
	return skill
	
	
}

function getValueSkillDatatableUpdate() {
	
	var skill = []
	var subSkill = []
	
	var table = $('#datatable_report_language')
	
	var i = 0
	table.children("tbody").find("td").each(function() {
		subSkill.push($(this).text())
		
		if(i == 3) {
			skill.push(subSkill.splice(1,2))
			subSkill = []
			i = 0
		} else {
			i++
		}
		
   });
	
	return skill
	
	
}

$(document).on('click', 'i#close1', function () {
	var lang = $(this).closest('tr').find('td:eq(1)').text()
	$('#language').append($('<option>' + lang + '</option>'));
	
    $(this).closest('tr').remove();
    return false;
});


$(document).on('click', 'i#close2', function () {
	var lang = $(this).closest('tr').find('td:eq(1)').text()
	$('#languageUpdate').append($('<option>' + lang + '</option>'));
	
    $(this).closest('tr').remove();
    return false;
});

$(function() {
	axios({
		  method: "post",
		  url: "findOverseasWorkPlace",
		}).then(function (response) {
			
			$.each(response.data, function(i, data) {
				
					var newRow = document.createElement("tr")
					var newCell0 = document.createElement("td")
				    var newCell1 = document.createElement("td")
				    var newCell2 = document.createElement("td")
				    var newCell3 = document.createElement("td")
				    var newCell4 = document.createElement("td")
				    var newCell5 = document.createElement("td")
				    
				    newCell0.innerHTML = "<div class='d-flex '><div class='ms-3'><p class='fw-bold mb-1'>"+response.data[i].name+"</p><p class='text-muted mb-0'>"+response.data[i].email+"</p></div></div>"
				    newCell1.innerHTML = "<p>"+response.data[i].type+"</p>"
				    
				    
				    var cell2 = ''
					    
				    if(response.data[i].status == "ไม่ผ่านการยืนยัน") {
				    	
				    	cell2 = "<span class='badge badge-danger rounded-pill d-inline'>"+response.data[i].status+"</span>"
				    	
				    }else if(response.data[i].status == "ยืนยันแล้ว") {
				    	
				    	cell2 = "<span class='badge badge-success rounded-pill d-inline'>"+response.data[i].status+"</span>"
				    	
				    }else if(response.data[i].status == "รอการตรวจสอบ") {
				    	
				    	cell2 = "<span class='badge badge-warning rounded-pill d-inline'>"+response.data[i].status+"</span>"
				    	
				    }
				    
				    newCell2.innerHTML = cell2
				    newCell3.innerHTML = "<p>"+response.data[i].time_reg+"</p>"
				    newCell4.innerHTML = "<button type='button' onClick='ShowOverseasModal(\""+ response.data[i].name +"\",\""+ response.data[i].email +"\",\""+ response.data[i].phone +"\",\""+ response.data[i].receive_total +"\",\""+ response.data[i].type +"\",\""+ response.data[i].status +"\",\""+ response.data[i].time_reg +"\",\""+ (response.data[i].firstname +" "+response.data[i].lastname) +"\",\""+ response.data[i].overseas_work_place_id +"\",\""+ response.data[i].address1 +"\",\""+ response.data[i].address2 +"\",\""+ response.data[i].address3 +"\",\""+ response.data[i].address4 +"\",\""+ response.data[i].address5 +"\")' class='btn btn-warning' data-bs-toggle='modal' data-bs-target='#overseasModal'>ดูรายละเอียด</button>"
				    newCell5.innerHTML = "<button onClick='manegementStatus("+response.data[i].overseas_work_place_id+", 1)' class='btn btn-success'>ยืนยัน</button><button onClick='manegementStatus("+response.data[i].overseas_work_place_id+", 0)' class='btn btn-danger'>ปฏิเสธ</button>"
				    
				    newRow.append(newCell0)
				    newRow.append(newCell1)
				    newRow.append(newCell2)
				    newRow.append(newCell3)
				    newRow.append(newCell4)
				    newRow.append(newCell5)
				    document.getElementById("overseasTable").appendChild(newRow)
            });
           
			$('#overseasDataTable').DataTable();
		  })
		  .catch(function (response) {
			Swal.fire({
				icon: 'error',
				title: 'ไม่สามารถทำรายการได้ในขณะนี้',
				showConfirmButton: false,
				timer: 3000
			})
		  });
	
	axios({
		  method: "post",
		  url: "findSkill",
		}).then(function (response) {
		  $.each(response.data, function(i, data) {
		             $('#language').append($('<option value="' + (i+1) + '">' + response.data[i].detail + '</option>'));
		             $('#languageUpdate').append($('<option value="' + (i+1) + '">' + response.data[i].detail + '</option>'));     
		  });
		  
		  })
		  .catch(function (response) {
		  Swal.fire({
		    icon: 'error',
		    title: 'ไม่สามารถทำรายการได้ในขณะนี้',
		    showConfirmButton: false,
		    timer: 3000
		  })
		  });
	
	axios({
		  method: "post",
		  url: "findProvinces",
		}).then(function (response) {
			$.each(response.data, function(i, data) {
     	$('#address_6').append($('<option value="' + response.data[i].province_id + '">' + response.data[i].province_name + '</option>'));
     	$('#address_6_update').append($('<option value="' + response.data[i].province_id + '">' + response.data[i].province_name + '</option>'));
 });
			
		  })
		  .catch(function (response) {
			Swal.fire({
				icon: 'error',
				title: 'ไม่สามารถทำรายการได้ในขณะนี้',
				showConfirmButton: false,
				timer: 3000
			})
		  });
	
	});
	
$('#address_6').change(function() {
	
	var e = document.getElementById("address_6");
	var province_id = e.options[e.selectedIndex].value;
	
	axios({
		  method: "post",
		  url: "findAmphure",
		  data: "province_id="+province_id,
		}).then(function (response) {
			
			$("#address_5").empty();
			$("#address_4").empty();
			document.getElementById("address_7").value = ''

			$('#address_5').append('<option value="0">กรุณาเลือกอำเภอ</option>')
			$('#address_4').append('<option value="0">กรุณาเลือกตำบล</option>')
			
			$.each(response.data, function(i, data) {
				
           		$('#address_5').append($('<option value="' + response.data[i].amphure_id + '">' + response.data[i].amphure_name + '</option>'));
       });
			
		  })
		  .catch(function (response) {
			Swal.fire({
				icon: 'error',
				title: 'ไม่สามารถทำรายการได้ในขณะนี้',
				showConfirmButton: false,
				timer: 3000
			})
		  });
	
});


$('#address_5').change(function() {
	
	var e = document.getElementById("address_5");
	var amphure_id = e.options[e.selectedIndex].value;
	
	axios({
		  method: "post",
		  url: "findDistricts",
		  data: "amphure_id="+amphure_id,
		}).then(function (response) {
			
			$("#address_4").empty();
			document.getElementById("address_7").value = ''

			$('#address_4').append('<option value="0">กรุณาเลือกตำบล</option>')
			
			$.each(response.data, function(i, data) {
				
           		$('#address_4').append($('<option value="' + response.data[i].zip_code + '">' + response.data[i].districts_name + '</option>'));
       });
			
		  })
		  .catch(function (response) {
			Swal.fire({
				icon: 'error',
				title: 'ไม่สามารถทำรายการได้ในขณะนี้',
				showConfirmButton: false,
				timer: 3000
			})
		  });
	
});




$('#address_4').change(function() {
	
	var e = document.getElementById("address_4");
	var zip_code = e.options[e.selectedIndex].value;
	
	document.getElementById("address_7").value = zip_code
	
});
	
$('#address_6_update').change(function() {
	
	var e = document.getElementById("address_6_update");
	var province_id = e.options[e.selectedIndex].value;
	
	axios({
		  method: "post",
		  url: "findAmphure",
		  data: "province_id="+province_id,
		}).then(function (response) {
			
			$("#address_5_update").empty();
			$("#address_4_update").empty();
			
			document.getElementById("overseasAddress2Modal").value = e.options[e.selectedIndex].text
			document.getElementById("overseasAddress3Modal").value = 'กรุณาเลือกอำเภอ'
			document.getElementById("overseasAddress4Modal").value = 'กรุณาเลือกตำบล'
			document.getElementById("overseasAddress5Modal").value = '0'

			$('#address_5_update').append('<option value="0">กรุณาเลือกอำเภอ</option>')
			$('#address_4_update').append('<option value="0">กรุณาเลือกตำบล</option>')
			
			$.each(response.data, function(i, data) {
				
           		$('#address_5_update').append($('<option value="' + response.data[i].amphure_id + '">' + response.data[i].amphure_name + '</option>'));
       });
			
		  })
		  .catch(function (response) {
			Swal.fire({
				icon: 'error',
				title: 'ไม่สามารถทำรายการได้ในขณะนี้',
				showConfirmButton: false,
				timer: 3000
			})
		  });
	
});


$('#address_5_update').change(function() {
	
	var e = document.getElementById("address_5_update");
	var amphure_id = e.options[e.selectedIndex].value;
	
	axios({
		  method: "post",
		  url: "findDistricts",
		  data: "amphure_id="+amphure_id,
		}).then(function (response) {
			
			$("#address_4_update").empty();
			
			document.getElementById("overseasAddress3Modal").value = e.options[e.selectedIndex].text
			document.getElementById("overseasAddress4Modal").value = 'กรุณาเลือกตำบล'
			document.getElementById("overseasAddress5Modal").value = '0'

			$('#address_4_update').append('<option value="0">กรุณาเลือกตำบล</option>')
			
			$.each(response.data, function(i, data) {
				
           		$('#address_4_update').append($('<option value="' + response.data[i].zip_code + '">' + response.data[i].districts_name + '</option>'));
       });
			
		  })
		  .catch(function (response) {
			Swal.fire({
				icon: 'error',
				title: 'ไม่สามารถทำรายการได้ในขณะนี้',
				showConfirmButton: false,
				timer: 3000
			})
		  });
	
});




$('#address_4_update').change(function() {
	
	var e = document.getElementById("address_4_update");
	var zip_code = e.options[e.selectedIndex].value;
	
	document.getElementById("overseasAddress4Modal").value = e.options[e.selectedIndex].text
	document.getElementById("overseasAddress5Modal").value = zip_code
	
});
	
	function ShowOverseasModal(name, email, phone, receive, type, status, time_reg, user_name, overseas_id, address1, address2, address3, address4, adress5) {
		
		
		axios({
			  method: "post",
			  url: "findSkillByOverseas",
			  data: 'overseas_id=' +overseas_id,
			}).then(function (response) {
				$("#report_data_language").empty()
				$.each(response.data, function(i, data) {
					
					var newRow = document.createElement("tr")
					var newCell0 = document.createElement("td")
				    var newCell1 = document.createElement("td")
				    var newCell2 = document.createElement("td")
				    var newCell3 = document.createElement("td")
				    
				    newCell0.innerHTML = "<p>"+(i+1)+"</p>"
				    newCell1.innerHTML = "<p>"+response.data[i].detail+"</p>"
				    
				    var data = ''
					   
				    if(response.data[i].level == '1') {
				    	data = 'ระดับเริ่มต้น'
				    } else if(response.data[i].level == '2') {
				    	data = 'ระดับปานกลาง'
				    } else if(response.data[i].level == '3') {
				    	data = 'ระดับสูง'
				    }
				    
				    newCell2.innerHTML = "<p>"+data+"</p>"
				    newCell3.innerHTML = "<i id='close2' class='fa fa-close' style='color: red'></i>"
				    
				    newRow.append(newCell0)
				    newRow.append(newCell1)
				    newRow.append(newCell2)
				    newRow.append(newCell3)
				    document.getElementById("report_data_language").appendChild(newRow)
          });
				
			  })
			  .catch(function (response) {
				Swal.fire({
					icon: 'error',
					title: 'ไม่สามารถทำรายการได้ในขณะนี้',
					showConfirmButton: false,
					timer: 3000
				})
			  });
		
		document.getElementById('overseasNameModal').value = name
		document.getElementById('overseasEmailModal').value = email
		document.getElementById('overseasPhoneModal').value = phone
		document.getElementById('overseasReceiveModal').value = receive
		
		if(type == "ในประเทศ") {
			type = "1"
		} else if(type == "ต่างประเทศ") {
			type = "2"
		}
		
		$("#overseasTypeModal").val(type).change();
		document.getElementById('overseasStatusModal').value = status
		document.getElementById('overseasTimeRegModal').value = time_reg
		document.getElementById('overseasUserNameModal').value = user_name
		document.getElementById('overseasIdModal').value = overseas_id
		document.getElementById('overseasAddress1Modal').value = address1
		document.getElementById('overseasAddress2Modal').value = address2
		document.getElementById('overseasAddress3Modal').value = address3
		document.getElementById('overseasAddress4Modal').value = address4
		document.getElementById('overseasAddress5Modal').value = adress5
		
		
	}
	
	function updateOverseasWorkPlace() {
		
		document.getElementById('spinner1').style.display = 'block';
		$(':button').prop('disabled', true);
		
		const data = $.getJSON('https://api.ipify.org?format=json', function(data){
			
			name = document.getElementById('overseasNameModal').value
			email = document.getElementById('overseasEmailModal').value
			phone = document.getElementById('overseasPhoneModal').value
			receive = document.getElementById('overseasReceiveModal').value
			type = document.getElementById('overseasTypeModal').value
			overseas_id = document.getElementById('overseasIdModal').value
			address1 = document.getElementById('overseasAddress1Modal').value
			address2 = document.getElementById('overseasAddress2Modal').value
			address3 = document.getElementById('overseasAddress3Modal').value
			address4 = document.getElementById('overseasAddress4Modal').value
			address5 = document.getElementById('overseasAddress5Modal').value
			ip = data.ip
			skill = getValueSkillDatatableUpdate()
			
			if(name != '' && email != '' && phone != '' && receive != '' && type != '' && overseas_id != '' && address1 != '' && address2 != 'กรุณาเลือกจังหวัด' && address3 != 'กรุณาเลือกอำเภอ' && address4 != 'กรุณาเลือกตำบล' && address5 != '0' && ip != '') {
				
				if(checkDataForm(phone, receive, address5, email, type) == 0) {
				axios({
					  method: "post",
					  url: "overseasWorkPlaceUpdate",
					  data: "overseas_id="+overseas_id+"&overseas_name="+name+"&email="+email+"&phone="+phone+"&receive_total="+receive+"&type="+type+"&address1="+address1+"&address2="+address2+"&address3="+address3+"&address4="+address4+"&address5="+address5+"&ip="+ip+"&skill="+JSON.stringify(skill),
					}).then(function (response) {
						
						if(response.data.alert == "1") {
									  
						  Swal.fire({
						      icon: "success",
						    title: response.data.status,
						    showConfirmButton: false,
						    timer: 3000
						    })
						    .then(() => {
						      location.reload()
						    })
						  
						} else if(response.data.alert == "0"){
						  
						  Swal.fire({
						      icon: "error",
						    title: response.data.status,
						    showConfirmButton: false,
						    timer: 3000
						    })
						    
						    $(':button').prop('disabled', false);
						  document.getElementById('spinner1').style.display = 'none';
						} else if(response.data.alert == "2") {
						  
						  Swal.fire({
						      icon: "warning",
						    title: response.data.status,
						    showConfirmButton: false,
						    timer: 3000
						    })
						    
						    $(':button').prop('disabled', false);
						  document.getElementById('spinner1').style.display = 'none';
						}
						
					  })
					  .catch(function (response) {
						Swal.fire({
							  icon: 'error',
							  title: 'ไม่สามารถทำรายการได้ในขณะนี้',
							  showConfirmButton: false,
							  timer: 3000
							})
							$(':button').prop('disabled', false);
						document.getElementById('spinner1').style.display = 'none';
					  });
				} else {
					Swal.fire({
					  icon: 'warning',
					  title: 'กรุณาตรวจสอบความถูกต้องของ เบอร์โทร, จำนวนที่รับ, รหัสไปรษณีย์, อีเมล, สถานที่ตั้ง',
					  showConfirmButton: false,
					  timer: 3000
					})
					$(':button').prop('disabled', false);
					document.getElementById('spinner1').style.display = 'none';
				}
			} else {
				Swal.fire({
					  icon: 'warning',
					  title: 'กรุณากรอกข้อมูลให้ครบ',
					  showConfirmButton: false,
					  timer: 3000
					})
					$(':button').prop('disabled', false);
				document.getElementById('spinner1').style.display = 'none';
			}
			
		});
	}
	
	
	function insertOverseasWorkPlace() {
		
		document.getElementById('spinner').style.display = 'block';
		$(':button').prop('disabled', true);
		
		const data = $.getJSON('https://api.ipify.org?format=json', function(data){
			
			name = document.getElementById('overseasNameInsert').value
			email = document.getElementById('overseasEmailInsert').value
			phone = document.getElementById('overseasPhoneInsert').value
			receive = document.getElementById('overseasReceiveInsert').value
			type = document.getElementById('overseasTypeInsert').value
			address1 = document.getElementById('overseasAddress1Insert').value
			
			var o = document.getElementById("address_4");
			var address4 = o.options[o.selectedIndex].text;

			var n = document.getElementById("address_5");
			var address3 = n.options[n.selectedIndex].text;

			var p = document.getElementById("address_6");
			var address2 = p.options[p.selectedIndex].text;
			
			address5 = document.getElementById('address_7').value
			
			ip = data.ip
			skill = getValueSkillDatatable()
			
			if(name != '' && email != '' && phone != '' && receive != '' && type != '' && address1 != '' && address2 != 'กรุณาเลือกจังหวัด' && address3 != 'กรุณาเลือกอำเภอ' && address4 != 'กรุณาเลือกตำบล' && address5 != '' && ip != '' && skill.length > 0) {
				
				if(checkDataForm(phone, receive, address5, email, type) == 0) {
					
					axios({
						  method: "post",
						  url: "overseasWorkPlaceInsert",
						  data: "overseas_name="+name+"&email="+email+"&phone="+phone+"&receive_total="+receive+"&type="+type+"&address1="+address1+"&address2="+address2+"&address3="+address3+"&address4="+address4+"&address5="+address5+"&ip="+ip+"&skill="+JSON.stringify(skill),
						}).then(function (response) {
							
							if(response.data.alert == "1") {
									  
						  Swal.fire({
						      icon: "success",
						    title: response.data.status,
						    showConfirmButton: false,
						    timer: 3000
						    })
						    .then(() => {
						      location.reload()
						    })
						  
						} else if(response.data.alert == "0"){
						  
						  Swal.fire({
						      icon: "error",
						    title: response.data.status,
						    showConfirmButton: false,
						    timer: 3000
						    })
						    
						    $(':button').prop('disabled', false);
						  document.getElementById('spinner').style.display = 'none';
						} else if(response.data.alert == "2") {
						  
						  Swal.fire({
						      icon: "warning",
						    title: response.data.status,
						    showConfirmButton: false,
						    timer: 3000
						    })
						    
						    $(':button').prop('disabled', false);
						  document.getElementById('spinner').style.display = 'none';
						}
							
							
						  })
						  .catch(function (response) {
							Swal.fire({
							  icon: 'error',
							  title: 'ไม่สามารถทำรายการได้ในขณะนี้',
							  showConfirmButton: false,
							  timer: 3000
							})
							$(':button').prop('disabled', false);
							document.getElementById('spinner').style.display = 'none';
						  }); 
					
				} else {
					Swal.fire({
					  icon: 'warning',
					  title: 'กรุณาตรวจสอบความถูกต้องของ เบอร์โทร, จำนวนที่รับ, รหัสไปรษณีย์, อีเมล, สถานที่ตั้ง',
					  showConfirmButton: false,
					  timer: 3000
					})
					$(':button').prop('disabled', false);
					document.getElementById('spinner').style.display = 'none';
				}
			} else {
				Swal.fire({
					  icon: 'warning',
					  title: 'กรุณากรอกข้อมูลให้ครบ',
					  showConfirmButton: false,
					  timer: 3000
					})
					$(':button').prop('disabled', false);
				document.getElementById('spinner').style.display = 'none';
			}
			
		});
		
	}
		
	
	function checkDataForm(phone, receive, zipcode, email, type) {
		
		const regex_pattern = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		
		if(phone > 0 && receive > 0 && zipcode > 0 && regex_pattern.test(email) && phone.length > 8 && phone.length < 11 && type != '0') {
			
			return 0
		} else {
			
			return -1
		}
		
	}
	
	function manegementStatus(overseas_id, status) {
		
		document.getElementById('spinner2').style.display = 'block';
		$(':button').prop('disabled', true);
		
		const data = $.getJSON('https://api.ipify.org?format=json', function(data){
				
			ip = data.ip
				
			if(overseas_id != '') {
					
				axios({
					  method: "post",
					  url: "managementOverseasStatusByAdmin",
					  data: 'overseas_id=' + overseas_id +'&status=' +status +'&ip='+ip,
					}).then(function (response) {
						
						if(response.data.alert == "1") {
									  
						  Swal.fire({
						      icon: "success",
						    title: response.data.status,
						    showConfirmButton: false,
						    timer: 3000
						    })
						    .then(() => {
						      location.reload()
						    })
						  
						} else if(response.data.alert == "0"){
						  
						  Swal.fire({
						      icon: "error",
						    title: response.data.status,
						    showConfirmButton: false,
						    timer: 3000
						    })
						    
						    $(':button').prop('disabled', false);
						  document.getElementById('spinner2').style.display = 'none';
						} else if(response.data.alert == "2") {
						  
						  Swal.fire({
						      icon: "warning",
						    title: response.data.status,
						    showConfirmButton: false,
						    timer: 3000
						    })
						    
						    $(':button').prop('disabled', false);
						  document.getElementById('spinner2').style.display = 'none';
						}
						
						
					  })
					  .catch(function (response) {
						Swal.fire({
							  icon: 'error',
							  title: 'ไม่สามารถทำรายการได้ในขณะนี้',
							  showConfirmButton: false,
							  timer: 3000
							})
							$(':button').prop('disabled', false);
						document.getElementById('spinner2').style.display = 'none';
					  });
				} else {
					Swal.fire({
					  icon: 'warning',
					  title: 'กรุณาเลือกผู้ใช้งาน',
					  showConfirmButton: false,
					  timer: 3000
					})
					$(':button').prop('disabled', false);
					document.getElementById('spinner2').style.display = 'none';
				}
				
			});
			
				
			}
</script>