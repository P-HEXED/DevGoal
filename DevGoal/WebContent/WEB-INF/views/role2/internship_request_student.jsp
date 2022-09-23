<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>ข้อมูลสถานที่ฝึกงานที่สนใจนิสิต/นักศึกษา</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/stylecss/style_user.css">
<link href="resources/images/logo/devgoal_logo.png" size="16x16"
	rel="shortcut icon" type="image/png" />
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://unpkg.com/htmlincludejs"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/v/dt/dt-1.12.1/datatables.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
<script type="text/javascript" src="resources/js/loading.js"></script>
<link rel="stylesheet" href="resources/stylecss/loading_axios.css">
</head>
<body>
<div class="ring">DEVGOAL<span class="loading"></span></div>
	<main>
		<nav class="navbar navbar-expand d-flex flex-column " id="sidebar">
			<include src="resources/includeBody/role2/sidebar_admin.html"></include>
		</nav>
		<include src="resources/includeBody/role2/navbar_admin.html"></include>
		<section class="p-4 my-container">
			<button class="btn" id="menu-btn">
				<i class="fa-solid fa-list"></i>
			</button>
			<div class="table-container table-responsive">
				<div class="row abovetable ">
					<h4>ข้อมูลสถานที่ฝึกงานที่สนใจนิสิต/นักศึกษา</h4>
				</div>
				<div class="table-overflow">
				<table class="table  table-striped text-center"
					id="internshipDataTable">
					<thead class="table-dark">
						<tr>
							<th>ชื่อบริษัทรับนิสิต/นักศึกษาฝึกงาน</th>
							<th>ที่ตั้ง</th>
							<th>สถานะ</th>
							<th>เวลาที่บันทึก</th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody id="internshipTable">
					</tbody>
				</table>
				</div>
				<div id="pageNavPosition" class="pager-nav"></div>
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
			<div class="modal fade" id="internshipModal">
				<div
					class="modal-dialog modal-xl modal-fullscreen-lg-down modal-dialog-centered">
					<div class="modal-content" id="update">
						<div class="modal-header">
							<h5 class="modal-title">ข้อมูลสถานที่ฝึกงานที่สนใจนิสิต/นักศึกษา</h5>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col-lg-12">
									<form>
										<div class="row">
											<div class="col-sm-12 col-md-6 col-lg-4">
												<div class="form-floating ">
													<input type="text" class="form-control"
														id="internshipNameModal" placeholder="ชื่อสถานที่ฝึกงาน"
														name="internshipNameModal" disabled> <label
														for="name">ชื่อสถานที่ฝึกงาน</label>
												</div>
											</div>
											<div class="col-sm-12 col-md-6 col-lg-3">
												<div class="form-floating ">
													<input type="text" class="form-control"
														id="internshipEmailModal" placeholder="อีเมล"
														name="internshipEmailModal" disabled> <label
														for="initial">อีเมล</label>
												</div>
											</div>
											<div class="col-sm-12 col-md-6 col-lg-3">
												<div class="form-floating ">
													<input type="number" class="form-control"
														id="internshipPhoneModal" placeholder="เบอร์โทร"
														name="internshipPhoneModal" min="1" disabled> <label
														for="country">เบอร์โทร</label>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-12 col-md-6 col-lg-3">
												<div class="form-floating ">
													<input type="number" class="form-control"
														id="internshipReceiveModal" placeholder="จำนวนที่รับ"
														name="internshipReceiveModal" min="1" disabled> <label
														for="province">จำนวนที่รับ</label>
												</div>
											</div>
											<div class="col-sm-12 col-md-6 col-lg-3">
												<select class="form-select" id="internshipTypeModal"
													disabled>
													<option value="0">สถานที่ตั้ง</option>
													<option value="1">ในประเทศ</option>
													<option value="2">ต่างประเทศ</option>
												</select>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-12 col-md-6 col-lg-3">
												<div class="form-floating ">
													<input type="text" class="form-control"
														id="internshipAddress1Modal" placeholder="ประเทศ"
														name="internshipAddress1Modal" disabled> <label
														for="country">ประเทศ</label>
												</div>
											</div>
											<div class="col-sm-12 col-md-6 col-lg-3">
												<div class="form-floating ">
													<input type="text" class="form-control"
														id="internshipAddress2Modal" placeholder="จังหวัด"
														name="internshipAddress2Modal" disabled> <label
														for="province">จังหวัด</label>
												</div>
											</div>
											<div class="col-sm-12 col-md-6 col-lg-3">
												<div class="form-floating ">
													<input type="text" class="form-control"
														id="internshipAddress3Modal" placeholder="อำเภอ"
														name="internshipAddress3Modal" disabled> <label
														for="district">อำเภอ</label>
												</div>
											</div>
											<div class="col-sm-12 col-md-6 col-lg-3">
												<div class="form-floating ">
													<input type="text" class="form-control"
														id="internshipAddress4Modal" placeholder="ตำบล"
														name="internshipAddress4Modal" disabled> <label
														for="locality">ตำบล</label>
												</div>
											</div>
											<div class="col-sm-12 col-md-6 col-lg-3">
												<div class="form-floating ">
													<input type="number" class="form-control"
														id="internshipAddress5Modal" placeholder="รหัสไปรษณีย์"
														name="internshipAddress5Modal" min="1" disabled> <label
														for="zipcode">รหัสไปรษณีย์</label>
												</div>
											</div>
										</div>
										<hr>

										<div class="row">
											<div class="col-sm-12 col-md-6 col-lg-3">
												<div class="form-floating ">
													<input type="text" class="form-control"
														id="internshipTimeRegModal" placeholder="เวลาที่บันทึก"
														name="internshipTimeRegModal" disabled> <label
														for="zipcode">เวลาที่บันทึก</label>
												</div>
											</div>
											<div class="col-sm-12 col-md-6 col-lg-3">
												<div class="form-floating ">
													<input type="text" class="form-control"
														id="internshipStatusModal" placeholder="สถานะ"
														name="internshipStatusModal" disabled> <label
														for="locality">สถานะ</label>
												</div>
											</div>
											<input type="hidden" id="internshipIdModal">
										</div>
										<hr>
										<div class="row">
											<div class="col-sm-12 col-md-12 col-lg-6">
												<p>ทักษะด้านโปรแกรมมิ่งที่ต้องการ</p>
												<table id="datatable_report_language"
													class="table table-primary table-striped shadow p-3 mb-5 rounded"
													style="width: 100%">
													<thead>
														<tr>
															<th>ลำดับ</th>
															<th>ทักษะด้านโปรแกรมมิ่ง</th>
															<th>ระดับความชำนาญ</th>
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
								<button type="button" class="btn btn-danger"
									data-bs-dismiss="modal">ปิด</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
</body>
</html>
<script type="text/javascript" src="resources/js/sidebar.js"></script>
<script type="text/javascript">
$(function() {
	axios({
		  method: "post",
		  url: "findPlaceOfInternshipRequestStudent",
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
				    newCell4.innerHTML = "<button type='button' onClick='ShowInternshipModal(\""+ response.data[i].name +"\",\""+ response.data[i].email +"\",\""+ response.data[i].phone +"\",\""+ response.data[i].receive_total +"\",\""+ response.data[i].type +"\",\""+ response.data[i].status +"\",\""+ response.data[i].time_reg +"\",\""+ response.data[i].place_of_insternship_id +"\",\""+ response.data[i].address1 +"\",\""+ response.data[i].address2 +"\",\""+ response.data[i].address3 +"\",\""+ response.data[i].address4 +"\",\""+ response.data[i].address5 +"\")' class='btn btn-warning' data-bs-toggle='modal' data-bs-target='#internshipModal'>ดูรายละเอียด</button>"
				    newCell5.innerHTML = "<button id='confirm' onClick='manegementStatus("+response.data[i].place_of_insternship_id+", 1,\""+ response.data[i].student_email +"\",\""+ response.data[i].email +"\")' class='btn btn-success'>ยืนยัน</button><button onClick='manegementStatus("+response.data[i].place_of_insternship_id+", 0,\""+ response.data[i].student_email +"\",\""+ response.data[i].email +"\")' class='btn btn-danger' id='cancel'>ปฏิเสธ</button>"
				    	
				    newRow.append(newCell0)
				    newRow.append(newCell1)
				    newRow.append(newCell2)
				    newRow.append(newCell3)
				    newRow.append(newCell4)
				    newRow.append(newCell5)
				    document.getElementById("internshipTable").appendChild(newRow)
				    
            });
           
			$('#internshipDataTable').DataTable();
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
	
function ShowInternshipModal(name, email, phone, receive, type, status, time_reg, internship_id, address1, address2, address3, address4, address5) {
	
	axios({
		  method: "post",
		  url: "findSkillByInternship",
		  data: 'internship_id=' +internship_id,
		}).then(function (response) {
			$("#report_data_language").empty()
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
	
	document.getElementById('internshipNameModal').value = name
	document.getElementById('internshipEmailModal').value = email
	document.getElementById('internshipPhoneModal').value = phone
	document.getElementById('internshipReceiveModal').value = receive
	
	if(type == "ในประเทศ") {
		type = "1"
	} else if(type == "ต่างประเทศ") {
		type = "2"
	}

	$("#internshipTypeModal").val(type).change();
	document.getElementById('internshipStatusModal').value = status
	document.getElementById('internshipTimeRegModal').value = time_reg
	document.getElementById('internshipIdModal').value = internship_id
	document.getElementById('internshipAddress1Modal').value = address1
	document.getElementById('internshipAddress2Modal').value = address2
	document.getElementById('internshipAddress3Modal').value = address3
	document.getElementById('internshipAddress4Modal').value = address4
	document.getElementById('internshipAddress5Modal').value = address5
	
}

function manegementStatus(internship_id, status, student_email, email) {
	
	document.getElementById('spinner').style.display = 'block';
	$(':button').prop('disabled', true);
	
	const data = $.getJSON('https://api.ipify.org?format=json', function(data){
			
		ip = data.ip
			
		if(internship_id != '') {
				
			axios({
				  method: "post",
				  url: "managementInternshipRequestStatus",
				  data: 'internship_id=' + internship_id +'&status=' +status +'&ip='+ip +'&student_email='+student_email+'&email='+email,
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
				  title: 'กรุณาเลือกผู้ใช้งาน',
				  showConfirmButton: false,
				  timer: 3000
				})
				
				$(':button').prop('disabled', false);
				document.getElementById('spinner').style.display = 'none';
			}
			
		});
		
			
		}
</script>