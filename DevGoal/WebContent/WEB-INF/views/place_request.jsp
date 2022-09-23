<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Devgoal | นิสิต/นักศึกษา</title>
<link type="text/css" rel="stylesheet"
	href="resources/stylecss/style_user.css">
<link href="resources/images/logo/devgoal_logo.png" size="16x16"
	rel="shortcut icon" type="image/png" />
<script src="https://unpkg.com/htmlincludejs"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
		<section class="p-4 my-container">
			<div class="table-container table-responsive">
				<div class="abovetable">
					<h4>นิสิต/นักศึกษา</h4>
				</div>

				<div class="col col-sm-6 col-md-6 col-lg-3">
					<select class="form-select" id="zone">
						<option>จัดเรียงตามภูมิภาค</option>
						<option value="1">ภาคเหนือ</option>
						<option value="2">ภาคตะวันออกเฉียงเหนือ</option>
						<option value="3">ภาคกลาง</option>
						<option value="4">ภาคตะวันออก</option>
						<option value="5">ภาคตะวันตก</option>
						<option value="6">ภาคใต้</option>
					</select>
				</div>
				<div class="table-overflow">
					<table class="table text-center" id="userDataTable">
						<thead class="table-dark text-white">
							<tr>
								<th></th>
								<th>ชื่อ - นามสกุล</th>
								<th>มหาวิทยาลัย</th>
								<th>จังหวัด</th>
								<th></th>
							</tr>
						</thead>
						<tbody id="userData">
						</tbody>
					</table>
				</div>
				<div id="pageNavPosition" class="pager-nav"></div>
				<hr>
				<button type="button" class='btn btn-primary' style="float: right;"
					data-bs-toggle="modal" data-bs-target="#internshipModal">ส่งข้อมูล</button>
			</div>
			<div class="modal fade" id="info">
				<div
					class="modal-dialog modal-xl modal-fullscreen-lg-down modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h5 id="infoName" class="modal-title"></h5>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col col-sm-12 col-md-12 col-lg-4">
									<img id="userImage" src="" alt="personal picture"
										style="width: 250px; height: 250px; border-radius: 20%;">
								</div>
							</div>
							<div class="row">
								<div class="col col-sm-12 col-md-12 col-lg-3">
									<label for="comment">ชื่อ - นามสกุล</label> <input
										class="form-control" id="userName" type="text" disabled></input>
								</div>

								<div class="col col-sm-12 col-md-12 col-lg-1">
									<label for="comment">เพศ</label> <input class="form-control"
										id="userGender" type="text" disabled></input>
								</div>

								<div class="col col-sm-12 col-md-12 col-lg-3">
									<label for="comment">วันเกิด</label> <input
										class="form-control" id="userAge" type="text" disabled></input>
								</div>

								<div class="col col-sm-12 col-md-12 col-lg-3">
									<label for="comment">จังหวัด</label> <input
										class="form-control" id="userAddress" type="text" disabled></input>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col col-sm-12 col-md-12 col-lg-3">
									<label for="comment">หลักสูตร</label> <input
										class="form-control" id="userCourse" type="text" disabled></input>
								</div>
								<div class="col col-sm-12 col-md-12 col-lg-3">
									<label for="comment">คณะ</label> <input class="form-control"
										id="userFaculty" type="text" disabled></input>
								</div>
								<div class="col col-sm-12 col-md-12 col-lg-3">
									<label for="comment">มหาวิทยาลัย</label> <input
										class="form-control" id="userUniversity" type="text" disabled></input>
								</div>
							</div>
							<hr>
							<h5>ทักษะด้านโปรแกรมมิ่ง</h5>
							<div class="card-body">
								<div class="col-sm-12 col-md-12 col-lg-8">
									<table id="datatable_language_user"
										class="table table-primary table-striped shadow p-3 mb-5 rounded"
										style="width: 100%">
										<thead>
											<tr>
												<th>ลำดับ</th>
												<th>ทักษะด้านโปรแกรมมิ่ง</th>
												<th>ระดับความชำนาญ</th>
											</tr>
										</thead>
										<tbody id="data_language_user">
									</table>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-danger"
								data-bs-dismiss="modal">ปิด</button>
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade" id="internshipModal">
				<div
					class="modal-dialog modal-xl modal-fullscreen-lg-down modal-dialog-centered">
					<div class="modal-content">
						<div class="card-container">
							<div class="card" id="ins">
								<div class="card-header">
									<h5>เพิ่มข้อมูลสถานที่ฝึกงาน</h5>
								</div>
								<div class="card-body">
									<div class="row">
										<div class="col-lg-12">
											<form>
												<div class="row">
													<div class="col-sm-12 col-md-6 col-lg-4">
														<div class="form-floating ">
															<input type="text" class="form-control"
																id="internshipNameInsert"
																placeholder="ชื่อสถานที่ฝึกงาน" name="name"> <label
																for="name">ชื่อสถานที่ฝึกงาน</label>
														</div>
													</div>
													<div class="col-sm-12 col-md-6 col-lg-3">
														<div class="form-floating ">
															<input type="text" class="form-control"
																id="internshipEmailInsert"
																placeholder="อีเมลสถานที่ฝึกงาน" name="initial">
															<label for="initial">อีเมลสถานที่ฝึกงาน</label>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-sm-12 col-md-6 col-lg-2">
														<div class="form-floating ">
															<input type="number" class="form-control"
																id="internshipPhoneInsert" placeholder="เบอร์โทร"
																name="zipcode" min="1"> <label for="zipcode">เบอร์โทร</label>
														</div>
													</div>
													<div class="col-sm-12 col-md-6 col-lg-2">
														<div class="form-floating ">
															<input type="number" class="form-control"
																id="internshipReceiveInsert" placeholder="จำนวนที่รับ"
																name="zipcode" min="1"> <label for="zipcode">จำนวนที่รับ</label>
														</div>
													</div>

													<div class="col-sm-12 col-md-6 col-lg-2">
														<select class="form-select" id="internshipTypeInsert">
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
																id="internshipAddress1Insert" placeholder="ประเทศ"
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
													<div class="col-sm-12 col-md-12 col-lg-9">
														<div class="card shadow p-3 rounded">
															<div
																class="card-header bg-dark shadow p-3 mb-5 rounded text-white fs-5">
																<i class="fa-solid fa-code fa-md"></i>
																ทักษะด้านโปรแกรมมิ่งที่ต้องการ <i
																	class="fa-solid fa-code fa-md"></i>
															</div>
															<div class="card-body">
																<div class="row">
																	<div class="col-sm-12 col-md-12 col-lg-6">
																		<p>ทักษะด้านโปรแกรมมิ่ง</p>
																		<select class="form-select" id="language">
																			<option value="0">เลือกทักษะด้านโปรแกรมมิ่ง</option>
																		</select>
																	</div>
																	<div class="col-sm-12 col-md-12 col-lg-3">
																		<p>ระดับความชำนาญ</p>
																		<select class="form-select" id="level">
																			<option value="0">เลือกระดับความชำนาญ</option>
																			<option value="1">ระดับเริ่มต้น</option>
																			<option value="2">ระดับปานกลาง</option>
																			<option value="3">ระดับสูง</option>
																		</select>
																	</div>
																	<div class="col-sm-12 col-md-12 col-lg-3">
																		<p>.</p>
																		<button type="button" class="btn btn-info"
																			onclick="addSkillDatatable()">เพิ่มข้อมูล</button>
																	</div>
																</div>
																</br>
																<div class="table-overflow col-sm-12 col-md-12 col-lg-9">
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
												<button type="button" onClick="insertPlaceOfInternship()"
													class="btn btn-primary" style="float: right;">ร้องขอนิสิต/นักศึกษา</button>
											</form>
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
									</div>
								</div>
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
</body>
</html>
<script type="text/javascript">

var table = ''

$(function() {
	
	axios({
		  method: "post",
		  url: "studentDataForPlaceRequest",
		}).then(function (response) {
			
			$.each(response.data, function(i, data) {
				
					var newRow = document.createElement("tr")
					var newCell = document.createElement("td")
					var newCell0 = document.createElement("td")
				    var newCell1 = document.createElement("td")
				    var newCell2 = document.createElement("td")
				    var newCell3 = document.createElement("td")
				    
				    var name = response.data[i].firstname +' '+response.data[i].lastname
				    
				    newCell.innerHTML = "<input id='checkBox' type='checkbox' value='"+response.data[i].user_id+"'/>"
				    newCell0.innerHTML = "<div class='d-flex '><img src="+'resources/images/profile/'+response.data[i].profile_image+" class='rounded-circle'/><div class='ms-3'><p class='fw-bold mb-1'>"+name+"</p></div></div>"
				    
				    newCell1.innerHTML = "<p class='fw-normal mb-1'>"+response.data[i].university_name+"</p>"
				    newCell2.innerHTML = "<p class='fw-normal mb-1'>"+response.data[i].province+"</p>"
				    newCell3.innerHTML = "<button type='button' onClick='ShowUserData(\""+response.data[i].profile_image+"\",\""+ response.data[i].firstname+"\",\""+ response.data[i].lastname+"\",\""+ response.data[i].gender+"\",\""+ response.data[i].birthday+"\",\""+ response.data[i].university_name+"\",\""+ response.data[i].faculty_name+"\",\""+ response.data[i].course_name+"\",\""+response.data[i].user_id+"\",\""+response.data[i].province+"\")' class='btn btn-info' data-bs-toggle='modal' data-bs-target='#info'>ดูข้อมูลส่วนตัว</button>"
				    
				    newRow.append(newCell)
				    newRow.append(newCell0)
				    newRow.append(newCell1)
				    newRow.append(newCell2)
				    newRow.append(newCell3)
				    document.getElementById("userData").appendChild(newRow)
				    
				    
            });
			 table = $('#userDataTable').dataTable( {
				"aaSorting": []
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
		  url: "findSkill",
		}).then(function (response) {
		  $.each(response.data, function(i, data) {
		             $('#language').append($('<option value="' + (i+1) + '">' + response.data[i].detail + '</option>'));
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
	
				
	function ShowUserData(profile_image, firstname, lastname, gender, birthday, university_name, faculty_name, course_name, user_id, province) {
		
		axios({
			  method: "post",
			  url: "findSkillByUser",
			  data: 'user_id=' +user_id,
			}).then(function (response) {
				
				$("#data_language_user").empty()
				$.each(response.data, function(i, data) {
					
					var newRow = document.createElement("tr")
					var newCell0 = document.createElement("td")
				    var newCell1 = document.createElement("td")
				    var newCell2 = document.createElement("td")
				    
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
				    
				    
				    newRow.append(newCell0)
				    newRow.append(newCell1)
				    newRow.append(newCell2)
				    document.getElementById("data_language_user").appendChild(newRow)
				    
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
		
		
		document.getElementById("userImage").src = "resources/images/profile/"+profile_image
		document.getElementById("infoName").value = firstname +' '+ lastname
		document.getElementById('userName').value = firstname +' '+ lastname
		document.getElementById('userGender').value = gender
		document.getElementById('userAge').value = birthday
		document.getElementById('userCourse').value = course_name
		document.getElementById('userFaculty').value = faculty_name
		document.getElementById('userUniversity').value = university_name
		document.getElementById('userAddress').value = province
		
	}
	
	$('#zone').change(function() {
		
		var e = document.getElementById("zone");
		var zone_value = e.options[e.selectedIndex].value;
		
		if(zone_value != '') {
			
			axios({
				  method: "post",
				  url: "findStudentByZone",
				  data: "zone_value="+zone_value,
				}).then(function (response) {
					
					$("#userDataTable").DataTable().clear().draw();
			        $("#userDataTable").dataTable().fnDestroy();
			        
					$.each(response.data, function(i, data) {
						
						var newRow = document.createElement("tr")
						var newCell = document.createElement("td")
						var newCell0 = document.createElement("td")
					    var newCell1 = document.createElement("td")
					    var newCell2 = document.createElement("td")
					    var newCell3 = document.createElement("td")
					    
					    var name = response.data[i].firstname +' '+response.data[i].lastname
					    
					    newCell.innerHTML = "<input id='checkBox' type='checkbox' value='"+response.data[i].user_id+"'/>"
					    newCell0.innerHTML = "<div class='d-flex '><img src="+'resources/images/profile/'+response.data[i].profile_image+" class='rounded-circle'/><div class='ms-3'><p class='fw-bold mb-1'>"+name+"</p></div></div>"
					    
					    newCell1.innerHTML = "<p class='fw-normal mb-1'>"+response.data[i].university_name+"</p>"
					    newCell2.innerHTML = "<p class='fw-normal mb-1'>"+response.data[i].province+"</p>"
					    newCell3.innerHTML = "<button type='button' onClick='ShowUserData(\""+response.data[i].profile_image+"\",\""+ response.data[i].firstname+"\",\""+ response.data[i].lastname+"\",\""+ response.data[i].gender+"\",\""+ response.data[i].birthday+"\",\""+ response.data[i].university_name+"\",\""+ response.data[i].faculty_name+"\",\""+ response.data[i].course_name+"\",\""+response.data[i].user_id+"\",\""+response.data[i].province+"\")' class='btn btn-info' data-bs-toggle='modal' data-bs-target='#info'>ดูข้อมูลส่วนตัว</button>"
					    
					    newRow.append(newCell)
					    newRow.append(newCell0)
					    newRow.append(newCell1)
					    newRow.append(newCell2)
					    newRow.append(newCell3)
					    document.getElementById("userData").appendChild(newRow)
						    
		            });
					
					table = $('#userDataTable').dataTable( {
						"aaSorting": [],
						"columnDefs": [
						    { "width": "23%", "targets": 4 }
						  ]
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
		}
		
	});
	
	function getUserId() {
		
		var user_id = []
		
		$(table.$('input[type="checkbox"]').map(function () {
			if($(this).prop("checked")){
			
				user_id.push($(this).prop("value"))
			}
		}));
		
		return user_id
	}
	
function insertPlaceOfInternship() {
	
	document.getElementById('spinner').style.display = 'block';
	$(':button').prop('disabled', true);
		
		const data = $.getJSON('https://api.ipify.org?format=json', function(data){
			
			name = document.getElementById('internshipNameInsert').value
			email = document.getElementById('internshipEmailInsert').value
			phone = document.getElementById('internshipPhoneInsert').value
			receive = document.getElementById('internshipReceiveInsert').value
			type = document.getElementById('internshipTypeInsert').value
			address1 = document.getElementById('internshipAddress1Insert').value
			
			var o = document.getElementById("address_4");
			var address4 = o.options[o.selectedIndex].text;

			var n = document.getElementById("address_5");
			var address3 = n.options[n.selectedIndex].text;

			var p = document.getElementById("address_6");
			var address2 = p.options[p.selectedIndex].text;
			
			address5 = document.getElementById('address_7').value
			
			ip = data.ip
			skill = getValueSkillDatatable()
			user_id = getUserId()
			
			if(name != '' && email != '' && phone != '' && receive != '' && type != '' && address1 != '' && address2 != 'กรุณาเลือกจังหวัด' && address3 != 'กรุณาเลือกอำเภอ' && address4 != 'กรุณาเลือกตำบล' && address5 != '' && ip != '' && skill.length > 0 && user_id.length > 0) {
				
				if(checkDataForm(phone, receive, address5, email, type) == 0) {
					
				axios({
						  method: "post",
						  url: "insertPlaceOfInternshipNoRole",
						  data: "internship_name="+name+"&email="+email+"&phone="+phone+"&receive_total="+receive+"&type="+type+"&address1="+address1+"&address2="+address2+"&address3="+address3+"&address4="+address4+"&address5="+address5+"&ip="+ip+"&skill="+JSON.stringify(skill)+"&user_id="+JSON.stringify(user_id),
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
	    newCell3.innerHTML = "<i class='fa fa-close' style='color: red'></i>"
	    
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

$(document).on('click', 'i', function () {
	var lang = $(this).closest('tr').find('td:eq(1)').text()
	$('#language').append($('<option>' + lang + '</option>'));
	
    $(this).closest('tr').remove();
    return false;
});

function checkDataForm(phone, receive, zipcode, email, type) {
	
	const regex_pattern = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	
	if(phone > 0 && receive > 0 && zipcode > 0 && regex_pattern.test(email) && phone.length > 8 && phone.length < 11 && type != '0') {
		
		return 0
	} else {
		
		return -1
	}
	
}
	
</script>
