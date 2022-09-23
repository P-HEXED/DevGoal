<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ยืนยันตัวตนและจัดการข้อมูลผู้ใช้งาน</title>
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
<style>
@media screen and (max-width:765px){
.table-container{
margin-top:45px;
}
}
</style>
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
			<div class="table-container table-responsive">
				<div class="abovetable">
					<h4>ยืนยันตัวตนและจัดการข้อมูลผู้ใช้งาน</h4>
				</div>
				<div class="table-overflow">
				<table class="table text-center" id="userDataTable">
					<thead class="table-dark text-white">
						<tr>
							<th>ชื่อ - นามสกุล</th>
							<th>สิทธิ์ผู้ใช้งาน</th>
							<th>สถานะ</th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody id="userData">
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

			<div class="modal fade" id="info">
				<div
					class="modal-dialog modal-xl modal-fullscreen-lg-down modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h5 id="infoName" class="modal-title"></h5>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col-lg-3 text-center">
									<img class="mb-5" id="infoImage" src="" alt="personal picture"
										style="width: 250px; height: 250px; border-radius: 20%;">
									<p style="font-size: 18px; color: red;">การแก้ไขรูปโปรไฟล์
										ให้เลือกอย่างใดอย้่างหนึ่ง</p>
									<p style="font-size: 16px; color: red;">1.อัปโหลดรูป
										2.กรอกชื่อไฟล์ใหม่ที่ผู้ใช้ร้องขอ</p>
								</div>
								<div class="col-lg-9">
									<form>
										<div class="card-body">
											<div class="tab-content" id="myTabContent">
												<div class="row">
													<div class="col-sm-12 col-md-12 col-lg-3 my-1">
														<p>เพศ</p>
														<div class="form-check">
															<input class="form-check-input" type="radio"
																name="flexRadioDefault" id="male_gender"> <label
																class="form-check-label" for="male_gender"> ชาย
															</label>
														</div>
														<div class="form-check">
															<input class="form-check-input" type="radio"
																name="flexRadioDefault" id="female_gender" checked>
															<label class="form-check-label" for="female_gender">
																หญิง </label>
														</div>
													</div>
													<div class="col-sm-12 col-md-6 col-lg-5 my-1">
														<p>ชื่อ</p>
														<input type="text" class="form-control"
															placeholder="ชื่อ (ไม่ต้องใส่คำนำหน้า)" aria-label="ชื่อ"
															aria-describedby="basic-addon1" id="firstname">
													</div>
													<div class="col-sm-12 col-md-6 col-lg-4 my-1">
														<p>นามสกุล</p>
														<input type="text" class="form-control"
															placeholder="นามสกุล" aria-label="นามสกุล"
															aria-describedby="basic-addon1" id="lastname">
													</div>
													<div class="col-sm-12 col-md-12 col-lg-4 my-1">
														<p style="margin: 0; display: inline; float: left">อัปโหลดรูปถ่ายหน้าตรง</p>
														<p></p>
														<p
															style="font-size: 12px; color: red; margin: 0; display: inline; float: right">(ไฟล์
															JPEG, PNG เท่านั้น)</p>
														<br> <input type="file" class="form-control"
															id="profile_image">
													</div>
													<div class="col-sm-12 col-md-4 col-lg-4 my-1"
														id="div_imageNameFile">
														<p>ชื่อรูปโปรไฟล์</p>
														<input type="text" class="form-control"
															placeholder="ชื่อรูปโปรไฟล์" aria-label="ชื่อรูปโปรไฟล์"
															aria-describedby="basic-addon1" min="1"
															id="imageNameFile">
													</div>
													<div class="col-sm-12 col-md-4 col-lg-4 my-1"
														id="div_student_code">
														<p>รหัสนิสิต/นักศึกษา</p>
														<input type="number" class="form-control"
															placeholder="รหัสนิสิต/นักศึกษา"
															aria-label="รหัสนิสิต/นักศึกษา"
															aria-describedby="basic-addon1" min="1" id="student_code">
													</div>
													<div class="col-sm-12 col-md-4 col-lg-3 my-2"
														id="div_user_type">
														<p>สิทธิ์การใช้งาน</p>
														<select class="form-select" id="user_type">
															<option value="1">นิสิต/นักศึกษา</option>
															<option value="2">อาจารย์</option>
															<option value="3">นายจ้าง</option>
															<option value="4">ผู้ดูแลระบบ</option>
														</select>
													</div>
													<div class="col-sm-12 col-md-4 col-lg-4 my-1">
														<p>เลขบัตรประชาชน</p>
														<input type="number" class="form-control"
															placeholder="เลขบัตรประชาชน" aria-label="เลขบัตรประชาชน"
															aria-describedby="basic-addon1" min="1" id="identified">
													</div>

													<div class="col-sm-12 col-md-4 col-lg-3 my-1">
														<p>เบอร์โทร</p>
														<input type="number" class="form-control"
															placeholder="เบอร์โทร" aria-label="เบอร์โทร"
															aria-describedby="basic-addon1" min="1" id="phone">
													</div>

													<div class="col-sm-12 col-md-4 col-lg-3 my-1">
														<p>วันเกิด (ข้อมูลเดิม)</p>
														<input type="text" class="form-control"
															placeholder="วันเกิด" aria-label="วันเกิด"
															aria-describedby="basic-addon1" min="1" id="age" disabled>
													</div>
												</div>
												<br>
												<div class="row">

													<div class="col-lg-2 col-sm-12 col-md-3">
														<p>เดือนเกิด</p>
														<select class="form-select" id="month">
															<option value="0">เดือน</option>
															<option value="1">มกราคม</option>
															<option value="2">กุมภาพันธ์</option>
															<option value="3">มีนาคม</option>
															<option value="4">เมษายน</option>
															<option value="5">พฤษภาคม</option>
															<option value="6">มิถุนายน</option>
															<option value="7">กรกฏาคม</option>
															<option value="8">สิงหาคม</option>
															<option value="9">กันยายน</option>
															<option value="10">ตุลาคม</option>
															<option value="11">พฤศจิกายน</option>
															<option value="12">ธันวาคม</option>
														</select>
													</div>

													<div class="col-lg-2 col-sm-12 col-md-3">
														<p>วันเกิด</p>
														<select class="form-select" id="day">
															<option value="0">วันที่</option>
														</select>
													</div>

													<div class="col-lg-2 col-sm-12 col-md-3">
														<p>ปีเกิด</p>
														<select class="form-select" id="years">
															<option value="0">ปี</option>
														</select>
													</div>

													<div class="col-sm-12 col-md-4 col-lg-3 my-1">
														<p>เวลาที่สมัคร</p>
														<input type="text" class="form-control"
															placeholder="เวลาที่สมัคร" aria-label="เวลาที่สมัคร"
															aria-describedby="basic-addon1" id="time_reg" disabled>
													</div>

												</div>


												<hr>
												<div class="row">
													<div class="col-sm-12 col-md-12 col-lg-4 my-2">
														<p>ชื่อที่พัก/ชื่อหมู่บ้าน</p>
														<input type="text" class="form-control"
															placeholder="ชื่อที่พัก/ชื่อหมู่บ้าน"
															aria-label="ชื่อที่พัก/ชื่อหมู่บ้าน"
															aria-describedby="basic-addon1" id="address_1">
													</div>
													<div class="col-sm-12 col-md-6 col-lg-2 my-2">
														<p>เลขที่</p>
														<input type="number" class="form-control"
															placeholder="เลขที่" aria-label="เลขที่"
															aria-describedby="basic-addon1" min="1" id="address_2">
													</div>
													<div class="col-sm-12 col-md-6 col-lg-2 my-2">
														<p>หมู่ที่</p>
														<input type="number" class="form-control"
															placeholder="หมู่ที่" aria-label="หมู่ที่"
															aria-describedby="basic-addon1" min="1" id="address_3">
													</div>
													<div class="col-sm-12 col-md-6 col-lg-4 my-2">
														<p>จังหวัด</p>
														<input type="text" class="form-control"
															placeholder="จังหวัด" aria-label="จังหวัด"
															aria-describedby="basic-addon1" id="address_6" disabled>
													</div>
													<div class="col-sm-12 col-md-6 col-lg-4 my-2">
														<p>อำเภอ/เขต</p>
														<input type="text" class="form-control"
															placeholder="อำเภอ" aria-label="อำเภอ"
															aria-describedby="basic-addon1" id="address_5" disabled>
													</div>
													<div class="col-sm-12 col-md-6 col-lg-4 my-2">
														<p>ตำบล/แขวง</p>
														<input type="text" class="form-control" placeholder="ตำบล"
															aria-label="ตำบล" aria-describedby="basic-addon1"
															id="address_4" disabled>
													</div>
													<div class="col-sm-12 col-md-6 col-lg-4 my-2">
														<p>รหัสไปรษณีย์</p>
														<input type="number" class="form-control"
															placeholder="รหัสไปรษณีย์" aria-label="รหัสไปรษณีย์"
															aria-describedby="basic-addon1" min="1" id="address_7" disabled>
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
													<div class="col-sm-12 col-md-12 col-lg-6 my-2">
														<p id="p_email">อีเมลมหาลัย</p>
														<input type="email" class="form-control"
															placeholder="อีเมลมหาลัย" aria-describedby="basic-addon1"
															id="email">
													</div>
													<div class="col-sm-12 col-md-12 col-lg-6 my-2"
														id="div_advisor">
														<p>ชื่ออาจารย์ที่ปรึกษา</p>
														<input type="text" class="form-control"
															placeholder="ชื่ออาจารย์ที่ปรึกษา (ใส่คำนำหน้า)"
															aria-label="อาจารย์ที่ปรึกษา"
															aria-describedby="basic-addon1" id="advisor">
													</div>
													<input type="hidden" id="user_id" />
												</div>
												</br>
												<div class="row">
													<div class="col-sm-12 col-md-6 col-lg-4 my-2">
														<p>มหาวิทยาลัย (ข้อมูลปัจจุบัน)</p>
														<input type="text" class="form-control"
															placeholder="มหาวิทยาลัย" aria-label="มหาวิทยาลัย"
															aria-describedby="basic-addon1" id="old_university"
															disabled> <input type="hidden"
															id="old_university_id" />
													</div>
													<div class="col-sm-12 col-md-6 col-lg-4 my-2">
														<p>คณะ (ข้อมูลปัจจุบัน)</p>
														<input type="text" class="form-control" placeholder="คณะ"
															aria-label="คณะ" aria-describedby="basic-addon1"
															id="old_faculty" disabled> <input type="hidden"
															id="old_faculty_id" />
													</div>
													<div class="col-sm-12 col-md-6 col-lg-4 my-2">
														<p>หลักสูตร (ข้อมูลปัจจุบัน)</p>
														<input type="text" class="form-control"
															placeholder="หลักสูตร" aria-label="หลักสูตร"
															aria-describedby="basic-addon1" id="old_course" disabled>
														<input type="hidden" id="old_course_id" />
													</div>
												</div>
												<div class="row">
													<div class="col-sm-12 col-md-4 col-lg-4 my-2"
														id="div_university">
														<p>มหาวิทยาลัย</p>
														<select class="form-select" id="university">
														</select>
													</div>

													<div class="col-sm-12 col-md-4 col-lg-4 my-2"
														id="div_faculty">
														<p>คณะ</p>
														<select class="form-select" id="faculty">
														</select>
													</div>

													<div class="col-sm-12 col-md-4 col-lg-4 my-2"
														id="div_course">
														<p>หลักสูตร</p>
														<select class="form-select" id="course">
														</select>
													</div>
												</div>
												<hr>
												<div class="row">
													<div class="col-sm-12 col-md-12 col-lg-12">
														<div class="card shadow p-3 rounded">
															<div
																class="card-header bg-dark shadow p-3 mb-5 rounded text-white fs-5">
																<i class="fa-solid fa-code fa-md"></i>
																ทักษะด้านโปรแกรมมิ่ง <i class="fa-solid fa-code fa-md"></i>
															</div>
															<div class="card-body">
																<div class="row">
																	<div class="col-sm-12 col-md-12 col-lg-5">
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
																	<div class="col-sm-12 col-md-12 col-lg-3">
																		<p>.</p>
																		<button class="btn btn-info"
																			onclick="addSkillDatatable()" type="button">เพิ่มข้อมูล</button>
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
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" onClick="updateUserData()"
								class="btn btn-primary" data-bs-dismiss="modal">บันทึก</button>
							<button type="button" class="btn btn-danger"
								data-bs-dismiss="modal">ปิด</button>
						</div>
					</div>
				</div>
			</div>

			<div class="modal fade" id="sendnotify">
				<div
					class="modal-dialog modal-xl modal-fullscreen-lg-down modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h5 id="notifyName" class="modal-title"></h5>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col-lg-4">
									<img id="notifyImage" src="" alt="personal picture"
										style="width: 250px; height: 250px; border-radius: 20%;">
								</div>
							</div>

							<div class="row">
								<div class="col-lg-3 col-md-12 col-sm-12">
									<label for="comment">ส่งไปที่</label> <input
										class="form-control" id="notifyEmail" type="text" disabled></input>
								</div>
								<div class="col-lg-8 col-md-12 col-sm-12">
									<label for="comment">หัวข้อ</label> <input class="form-control"
										id="notifyTitle" type="text"></input> <label for="comment">รายละเอียด</label>
								</div>
							</div>

							<div class="row">
								<div class="col-lg-3 col-md-12 col-sm-12"></div>
								<div class="col-lg-8 col-md-12 col-sm-12">
									<textarea class="form-control" rows="5" id="notifyText"
										name="text"></textarea>
									<input type="hidden" id="user_id" value=""></input>
								</div>
							</div>


							<div class="modal-footer">
								<button type="button" onClick="SendMail()"
									class="btn btn-primary">ส่งการแจ้งเตือน</button>
								<button type="button" class="btn btn-danger"
									data-bs-dismiss="modal">ยกเลิก</button>
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
				</div>
			</div>
		</section>
	</main>
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
$(function() {
	
	var date = new Date(); 
	var yearsVal = date.getFullYear() + 543
	
	for(var i = 0; i < 10; i++) {
		
		$('#years').append($('<option value="' + ((yearsVal-18)-i) + '">' + ((yearsVal-18)-i) + '</option>'));
		
	}
	
	axios({
		  method: "post",
		  url: "userDataForVerify",
		}).then(function (response) {
			
			$.each(response.data, function(i, data) {
				
					var newRow = document.createElement("tr")
					var newCell0 = document.createElement("td")
				    var newCell1 = document.createElement("td")
				    var newCell2 = document.createElement("td")
				    var newCell3 = document.createElement("td")
				    var newCell4 = document.createElement("td")
				    
				    var name = response.data[i].firstname +' '+response.data[i].lastname
				    
				    newCell0.innerHTML = "<div class='d-flex '><img src="+'resources/images/profile/'+response.data[i].profile_image+" class='rounded-circle'/><div class='ms-3'><p class='fw-bold mb-1'>"+name+"</p><p class='text-muted mb-0'>"+response.data[i].email+"</p></div></div>"
				    
				    
				    var type = ''
					    
				    if(response.data[i].user_type == "1") {
				    	
				    	type = "นิสิต/นักศึกษา"
				    	
				    }else if(response.data[i].user_type == "2") {
				    	
				    	type = "อาจารย์"
				    	
				    }else if(response.data[i].user_type == "3") {
				    	
				    	type = "นายจ้าง"
				    	
				    }else if(response.data[i].user_type == "4") {
				    	
				    	type = "ผู้ดูแลระบบ"
				    	
				    }
				    
				    
				    newCell1.innerHTML = "<p class='fw-normal mb-1'>"+type+"</p>"
				    var cell2 = ''
				    
				    if(response.data[i].status == "ไม่ผ่านการยืนยันตัวตน") {
				    	
				    	cell2 = "<span class='badge badge-danger rounded-pill d-inline'>"+response.data[i].status+"</span>"
				    	
				    }else if(response.data[i].status == "ยืนยันตัวตนแล้ว") {
				    	
				    	cell2 = "<span class='badge badge-success rounded-pill d-inline'>"+response.data[i].status+"</span>"
				    	
				    }else if(response.data[i].status == "รอการยืนยันตัวตน") {
				    	
				    	cell2 = "<span class='badge badge-warning rounded-pill d-inline'>"+response.data[i].status+"</span>"
				    	
				    }
				    newCell2.innerHTML = cell2
				    newCell3.innerHTML = "<button onClick='ShowUserData(\""+response.data[i].profile_image+"\",\""+ response.data[i].firstname+"\",\""+ response.data[i].lastname+"\",\""+ response.data[i].gender+"\",\""+ response.data[i].email+"\",\""+ response.data[i].identified_number+"\",\""+ response.data[i].student_code+"\",\""+ response.data[i].phone+"\",\""+ response.data[i].birthday+"\",\""+ response.data[i].university_name+"\",\""+ response.data[i].faculty_name+"\",\""+ response.data[i].course_name+"\",\""+ response.data[i].advisor+"\",\""+ response.data[i].status+"\",\""+ response.data[i].user_type+"\",\""+ response.data[i].time_reg+"\",\""+ response.data[i].address1+"\",\""+ response.data[i].address2+"\",\""+ response.data[i].address3+"\",\""+ response.data[i].address4+"\",\""+ response.data[i].address5+"\",\""+ response.data[i].address6+"\",\""+ response.data[i].address7+"\",\""+response.data[i].user_id+"\",\""+ response.data[i].university_id+"\",\""+ response.data[i].faculty_id+"\",\""+ response.data[i].course_id+"\")' class='btn btn-warning' data-bs-toggle='modal' data-bs-target='#info'>ดูข้อมูลส่วนตัว</button><button onClick='SendNotify(\""+name+"\",\""+ response.data[i].profile_image+"\",\""+ response.data[i].email+"\",\""+response.data[i].user_id+"\")' class='btn btn-primary' data-bs-toggle='modal' data-bs-target='#sendnotify'>ส่งการแจ้งเตือน</button>"
				    newCell4.innerHTML = "<button onClick='manegementStatus("+response.data[i].user_id+", 1)' class='btn btn-success'>ยืนยัน</button><button onClick='manegementStatus("+response.data[i].user_id+", 0)' class='btn btn-danger'>ปฏิเสธ</button>"
				    
				    newRow.append(newCell0)
				    newRow.append(newCell1)
				    newRow.append(newCell2)
				    newRow.append(newCell3)
				    newRow.append(newCell4)
				    document.getElementById("userData").appendChild(newRow)
            });
			$('#userDataTable').dataTable( {
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
			
			document.getElementById("address_6").value = e.options[e.selectedIndex].text
			document.getElementById("address_5").value = 'กรุณาเลือกอำเภอ'
			document.getElementById("address_4").value = 'กรุณาเลือกตำบล'
			document.getElementById("address_7").value = '0'

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
			
			document.getElementById("address_5").value = e.options[e.selectedIndex].text
			document.getElementById("address_4").value = 'กรุณาเลือกตำบล'
			document.getElementById("address_7").value = '0'

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
	
	document.getElementById("address_4").value = e.options[e.selectedIndex].text
	document.getElementById("address_7").value = zip_code
	
});
	
$('#month').change(function() {
	
	const nums31 = ['1', '3', '5', '7', '8', '10', '12']
	const nums30 = ['4', '6', '9', '11']
	const num29 = 2
	
	var e = document.getElementById("month");
	var month_val = e.options[e.selectedIndex].value;
	
	if(month_val != 0) {
		
		if(nums31.includes(month_val)) {
			
			$('#day').empty()
			$('#day').append($('<option value="0">วันที่</option>'));
			
			for(var i = 1; i <= 31; i++) {
				
				$('#day').append($('<option value="' + i + '">' + i + '</option>'));
			}
			
		}else if(nums30.includes(month_val)) {
			
			$('#day').empty()
			$('#day').append($('<option value="0">วันที่</option>'));
			
			for(var i = 1; i <= 30; i++) {
				
				$('#day').append($('<option value="' + i + '">' + i + '</option>'));
			}
			
		}else if(num29 == month_val) {
			
			$('#day').empty()
			$('#day').append($('<option value="0">วันที่</option>'));
			
			for(var i = 1; i <= 29; i++) {
				
				$('#day').append($('<option value="' + i + '">' + i + '</option>'));
			}
			
		}
		
	} else {
		$('#day').empty()
		$('#day').append($('<option value="0">วันที่</option>'));
	}
	
	
});
	
	function manegementStatus(user_id, status) {
		
		document.getElementById('spinner').style.display = 'block';
		$(':button').prop('disabled', true);
		
	const data = $.getJSON('https://api.ipify.org?format=json', function(data){
			
		ip = data.ip
			
		if(user_id != '' && ip != '') {
				
			axios({
				  method: "post",
				  url: "managementUserStatusByAdmin",
				  data: 'user_id=' + user_id +'&status=' +status +'&ip='+ip,
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
				
	function SendNotify(name, profile_image, email, user_id) {
		document.getElementById('notifyName').innerHTML = name
		document.getElementById("notifyImage").src = "resources/images/profile/"+profile_image
		document.getElementById('notifyEmail').value = email
		document.getElementById('user_id').value = user_id
	}
	
	function ShowUserData(profile_image, firstname, lastname, gender, email, identified_number, student_code, phone, birthday, university_name, faculty_name, course_name, advisor, status, user_type, time_reg, address1, address2, address3, address4, address5, address6, address7, user_id, university_id, faculty_id, course_id) {
		
		
		document.getElementById("infoImage").src = "resources/images/profile/"+profile_image
		document.getElementById("imageNameFile").value = profile_image
		document.getElementById('firstname').value = firstname
		document.getElementById('lastname').value = lastname
		document.getElementById('address_1').value = address1
		document.getElementById('address_2').value = address2
		document.getElementById('address_3').value = address3
		document.getElementById('address_4').value = address4
		document.getElementById('address_5').value = address5
		document.getElementById('address_6').value = address6
		document.getElementById('address_7').value = address7
		
		if(gender == "ชาย") {
			document.getElementById('male_gender').checked = true;
		} else if(gender == "หญิง") {
			document.getElementById('female_gender').checked = true;
		}
		
		$("#user_type").val(user_type).change();
		document.getElementById('email').value = email
		document.getElementById('identified').value = identified_number
		document.getElementById('phone').value = phone
		document.getElementById('age').value = birthday
		
		
		document.getElementById('time_reg').value = time_reg
		document.getElementById('infoName').innerHTML = firstname+' '+lastname
		document.getElementById('user_id').value = user_id
		
		if(university_name == 'undefined') {
			document.getElementById('old_university').value = ""
		} else {
			document.getElementById('old_university').value = university_name
		}
		if(faculty_name == 'undefined') {
			document.getElementById('old_faculty').value = ""
		} else {
			document.getElementById('old_faculty').value = faculty_name
		}
		if(course_name == 'undefined') {
			document.getElementById('old_course').value = ""
		} else {
			document.getElementById('old_course').value = course_name
		}
		if(university_id == 'undefined') {
			document.getElementById('old_university_id').value = ""
		} else {
			document.getElementById('old_university_id').value = university_id
		}
		if(faculty_id == 'undefined') {
			document.getElementById('old_faculty_id').value = ""
		} else {
			document.getElementById('old_faculty_id').value = faculty_id
		}
		if(course_id == 'undefined') {
			document.getElementById('old_course_id').value = ""
		} else {
			document.getElementById('old_course_id').value = course_id
		}
		if(advisor == 'undefined') {
			document.getElementById('advisor').value = ""
		} else {
			document.getElementById('advisor').value = advisor
		}
		if(student_code == 'undefined') {
			document.getElementById('student_code').value = ""
		} else {
			document.getElementById('student_code').value = student_code
		}
		
		skillData(user_id)
			  
	}

	function SendMail() {
		
		document.getElementById('spinner2').style.display = 'block';
		$(':button').prop('disabled', true);
		
		const data = $.getJSON('https://api.ipify.org?format=json', function(data){
			
			email = document.getElementById('notifyEmail').value
			title = document.getElementById('notifyTitle').value
			text = document.getElementById('notifyText').value
			ip = data.ip
			user_id = document.getElementById('user_id').value
			
			if(email != "" && title != "" && text != "" && ip != "") {
				
				axios({
					  method: "post",
					  url: "sendMailNotify",
					  data: 'email=' + email + '&title=' + title + '&ip=' + ip + '&text=' + text +'&user_id=' + user_id,
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
					  title: 'กรุณากรอกข้อมูลให้ครบ',
					  showConfirmButton: false,
					  timer: 3000
					})
					
					$(':button').prop('disabled', false);
				document.getElementById('spinner2').style.display = 'none';
			}
			
		});

	}
	
	$(function() {
		$('#university').append($('<option></option>'));
		axios({
			  method: "post",
			  url: "findUniversity",
			}).then(function (response) {
				$.each(response.data, function(i, data) {
	               	$('#university').append($('<option value="' + response.data[i].university_id + '">' + response.data[i].name + '</option>'));
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
	
	$('#university').change(function() {
		
		$("#faculty").empty();
		$("#course").empty();
		
		document.getElementById('old_faculty').value = ""
		document.getElementById('old_course').value = ""
		
		var university_id = $(this).val()
		
		var e = document.getElementById("university");
		var text = e.options[e.selectedIndex].text;
		
		document.getElementById('old_university_id').value = university_id
		document.getElementById('old_university').value = text

	    if (university_id !== '') {
	    	
	    	$('#faculty').append($('<option></option>'));
	    	
	    	axios({
				  method: "post",
				  url: "findFacultyByUniversity",
				  data: 'university_id='+university_id,
				}).then(function (response) {
					
					$.each(response.data, function(i, data) {
		                 $('#faculty').append($('<option value="' + response.data[i].faculty_id + '">' + response.data[i].name + '</option>'));
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
	
	$('#faculty').change(function() {
		
		$("#course").empty();
		document.getElementById('old_course').value = ""
		
		var faculty_id = $(this).val()
		
		var e = document.getElementById("faculty");
		var text = e.options[e.selectedIndex].text;
		
		document.getElementById('old_faculty_id').value = faculty_id
		document.getElementById('old_faculty').value = text
		
	    if (faculty_id !== '') {
	    	
	    	$('#course').append($('<option></option>'));
	    	
	    	axios({
				  method: "post",
				  url: "findCourseByFaculty",
				  data: 'faculty_id='+faculty_id,
				}).then(function (response) {
					
					$.each(response.data, function(i, data) {
		                 $('#course').append($('<option value="' + response.data[i].course_id + '">' + response.data[i].name + '</option>'));
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
	
	$('#course').change(function() {
		
		var e = document.getElementById("course");
		var value = e.options[e.selectedIndex].value;
		var text = e.options[e.selectedIndex].text;
		
		document.getElementById('old_course_id').value = value
		document.getElementById('old_course').value = text
		
	});


	function skillData(user_id) {
		
			
			axios({
				  method: "post",
				  url: "findSkillByUser",
				  data: 'user_id=' +user_id,
				}).then(function (response) {
					$("#data_language").empty()
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
					    newCell3.innerHTML = "<i class='fa fa-close' style='color: red'></i>"
					    
					    
					    newRow.append(newCell0)
					    newRow.append(newCell1)
					    newRow.append(newCell2)
					    newRow.append(newCell3)
					    document.getElementById("data_language").appendChild(newRow)
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
	
	
	function checkImageType(profile_image) {
		
		const  fileType = profile_image['type'];
		
		const validImageTypes = ['image/jpeg', 'image/png'];
		
		if (!validImageTypes.includes(fileType)) {
			Swal.fire({
					  icon: 'warning',
					  title: 'ไม่รองรับไฟล์รูปภาพ ใช้ได้แค่ PNG, JPG',
					  showConfirmButton: false,
					  timer: 3000
					})
		    return -1
		} else {
			return 0
		}
	}		
	
	function checkDataForm(address_2, address_3, address_7, student_code, identified, phone, user_type, email) {
		
		const regex_pattern = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		
		if(user_type == "1") {
			
			if(address_2 > 0 && address_3 > 0 && address_7 > 0 && student_code > 0 && phone > 0 && phone.length == 10 && identified > 0 && identified.length == 13 && regex_pattern.test(email)) {
				return 0
			} else {
				Swal.fire({
					  icon: 'warning',
					  title: 'กรุณาตรวจสอบข้อมูล (เลขที่, หมู่ที่, รหัสไปรษณีย์, รหัสนิสิต/นักศึกษา, เบอร์โทร, เลขบัตรประชาชน, อีเมล)',
					  showConfirmButton: false,
					  timer: 3000
					})
					$(':button').prop('disabled', false);
								document.getElementById('spinner1').style.display = 'none';
				return -1
			}
		} else {
			
			if(address_2 > 0 && address_3 > 0 && address_7 > 0 && phone > 0 && phone.length == 10 && identified > 0 && identified.length == 13 && regex_pattern.test(email)) {
				return 0
			} else {
				Swal.fire({
					  icon: 'warning',
					  title: 'กรุณาตรวจสอบข้อมูล (เลขที่, หมู่ที่, รหัสไปรษณีย์, เบอร์โทร, เลขบัตรประชาชน, อีเมล)',
					  showConfirmButton: false,
					  timer: 3000
					})
					$(':button').prop('disabled', false);
								document.getElementById('spinner1').style.display = 'none';
				return -1
			}
			
		}
		
	}
	
	function updateUserData(){
		
		document.getElementById('spinner1').style.display = 'block';
		$(':button').prop('disabled', true);
		
		const data = $.getJSON('https://api.ipify.org?format=json', function(data){
		
		var user_id = document.getElementById("user_id").value
		var male = document.getElementById("male_gender").checked
		var female = document.getElementById("female_gender").checked
		var gender = ""
		var firstname = document.getElementById("firstname").value
		var lastname = document.getElementById("lastname").value
		
		var d = document.getElementById("day");
		var day = d.options[d.selectedIndex].value;
		
		var m = document.getElementById("month");
		var month = m.options[m.selectedIndex].text;
		
		var y = document.getElementById("years");
		var years = y.options[y.selectedIndex].value;
		
		var age = ""
		
		if(day != "0" && month != "เดือน" && years != "0") {
			
			age = day +' '+ month +' '+ years
			
		} else {
			
			age = document.getElementById("age").value
			
		}
		
		var address_1 = document.getElementById("address_1").value
		var address_2 = document.getElementById("address_2").value
		var address_3 = document.getElementById("address_3").value
		var address_4 = document.getElementById("address_4").value
		var address_5 = document.getElementById("address_5").value
		var address_6 =  document.getElementById("address_6").value
		var address_7 = document.getElementById("address_7").value
		var email = document.getElementById("email").value
		var student_code = document.getElementById("student_code").value
		var phone = document.getElementById("phone").value
	    var identified = document.getElementById("identified").value
	 	var advisor = document.getElementById("advisor").value
		var university = document.getElementById("old_university_id").value
		var faculty = document.getElementById("old_faculty_id").value
		var course = document.getElementById("old_course_id").value
		var user_type = document.getElementById("user_type").value
		var skill = getValueSkillDatatable()
		var image_file = profile_image.files[0]
		var image_text = document.getElementById("imageNameFile").value
		var image = ""
		var ip = data.ip
		
		if(male == true) {
			gender = "1"
		} else if(female == true) {
			gender = "2"
		} else {
		Swal.fire({
					icon: 'warning',
					title: 'กรุณาเลือกเพศ',
					showConfirmButton: false,
					timer: 3000
				})
				$(':button').prop('disabled', false);
		document.getElementById('spinner1').style.display = 'none';
		}
		
		
		if(image_file != "" && image_file != null) {
			
			if(checkImageType(image_file) == 0) {
				
				image = image_file
			}
			
		} else if(image_text != "") {
			
			image = image_text
		}
		
		let formData = new FormData();
		
		if(image != "" && image != null) {
			
			if(user_type == "1") {
				
				if(ip != "" && gender != "" && firstname != "" && lastname != "" && age != "" && address_1 != "" && address_2 != "" && address_3 != "" && address_4 != "กรุณาเลือกตำบล" && address_5 != "กรุณาเลือกอำเภอ" && address_6 != "กรุณาเลือกจังหวัด" && address_7 != "0" && email != "" && student_code != "" && phone != "" && identified  != "" && advisor != "" && university != "" && faculty != "" && course != "" && user_id != "") {

					checkData = checkDataForm(address_2, address_3, address_7, student_code, identified, phone, user_type, email)
					
					if(checkData == 0) {
						
						if(checkIdentified(identified)) {
							
							formData.append("ip", ip);
							formData.append("gender", gender);
							formData.append("firstname", firstname);
							formData.append("lastname", lastname);
							formData.append("birthday", age);
							formData.append("address_1", address_1);
							formData.append("address_2", address_2);
							formData.append("address_3", address_3);
							formData.append("address_4", address_4);
							formData.append("address_5", address_5);
							formData.append("address_6", address_6);
							formData.append("address_7", address_7);
							formData.append("email", email);
							formData.append("student_code", student_code);
							formData.append("phone", phone);
							formData.append("identified", identified);
							formData.append("advisor", advisor);
							formData.append("university", university);
							formData.append("faculty", faculty);
							formData.append("course", course);
							formData.append("user_type", user_type);
							formData.append("skill", JSON.stringify(skill));
							formData.append("image", image);
							formData.append("image_text", image);
							formData.append("user_id", user_id);
							
							axios({
								  method: "post",
								  url: "updateUserData",
								  data: formData,
								})
								  .then(function (response) {
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
								  title: 'เลขบัตรประจำตัวประชาชนผิด',
								  showConfirmButton: false,
								  timer: 3000
								})
								$(':button').prop('disabled', false);
							document.getElementById('spinner1').style.display = 'none';
						}
						
				} 
				
			}else {
		Swal.fire({
					icon: 'warning',
					title: 'กรุณากรอกข้อมูลให้ครบ',
					showConfirmButton: false,
					timer: 3000
				})
				$(':button').prop('disabled', false);
			document.getElementById('spinner1').style.display = 'none';
			}
				
			} else if(user_type == "2") {
				
				if(ip != "" && gender != "" && firstname != "" && lastname != "" && age != "" && address_1 != "" && address_2 != "" && address_3 != "" && address_4 != "กรุณาเลือกตำบล" && address_5 != "กรุณาเลือกอำเภอ" && address_6 != "กรุณาเลือกจังหวัด" && address_7 != "0" && email != "" && phone != "" && identified  != "" && university != "" && faculty != "" && course != "" && user_id != "") {

					checkData = checkDataForm(address_2, address_3, address_7, "0", identified, phone, user_type, email)
					
					if(checkData == 0) {
						
						if(checkIdentified(identified)) {
							
							formData.append("ip", ip);
							formData.append("gender", gender);
							formData.append("firstname", firstname);
							formData.append("lastname", lastname);
							formData.append("birthday", age);
							formData.append("address_1", address_1);
							formData.append("address_2", address_2);
							formData.append("address_3", address_3);
							formData.append("address_4", address_4);
							formData.append("address_5", address_5);
							formData.append("address_6", address_6);
							formData.append("address_7", address_7);
							formData.append("email", email);
							formData.append("phone", phone);
							formData.append("identified", identified);
							formData.append("university", university);
							formData.append("faculty", faculty);
							formData.append("course", course);
							formData.append("user_type", user_type);
							formData.append("skill", JSON.stringify(skill));
							formData.append("image", image);
							formData.append("image_text", image);
							formData.append("user_id", user_id);
							
							axios({
								  method: "post",
								  url: "updateUserData",
								  data: formData,
								})
								  .then(function (response) {
									  var icon = ""
										  
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
								  title: 'เลขบัตรประจำตัวประชาชนผิด',
								  showConfirmButton: false,
								  timer: 3000
								})
								$(':button').prop('disabled', false);
							document.getElementById('spinner1').style.display = 'none';
						}
						
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
			} else if(user_type == "3") {
				
				if(ip != "" && gender != "" && firstname != "" && lastname != "" && age != "" && address_1 != "" && address_2 != "" && address_3 != "" && address_4 != "กรุณาเลือกตำบล" && address_5 != "กรุณาเลือกอำเภอ" && address_6 != "กรุณาเลือกจังหวัด" && address_7 != "0" && email != "" && phone != "" && identified  != "" && user_id != "") {

					checkData = checkDataForm(address_2, address_3, address_7, "0", identified, phone, user_type, email)
					
					if(checkData == 0) {
						
						if(checkIdentified(identified)) {
							
							formData.append("ip", ip);
							formData.append("gender", gender);
							formData.append("firstname", firstname);
							formData.append("lastname", lastname);
							formData.append("birthday", age);
							formData.append("address_1", address_1);
							formData.append("address_2", address_2);
							formData.append("address_3", address_3);
							formData.append("address_4", address_4);
							formData.append("address_5", address_5);
							formData.append("address_6", address_6);
							formData.append("address_7", address_7);
							formData.append("email", email);
							formData.append("phone", phone);
							formData.append("identified", identified);
							formData.append("user_type", user_type);
							formData.append("skill", JSON.stringify(skill));
							formData.append("image", image);
							formData.append("image_text", image);
							formData.append("user_id", user_id);
							
							axios({
								  method: "post",
								  url: "updateUserData",
								  data: formData,
								})
								  .then(function (response) {
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
								  title: 'เลขบัตรประจำตัวประชาชนผิด',
								  showConfirmButton: false,
								  timer: 3000
								})
								$(':button').prop('disabled', false);
							document.getElementById('spinner1').style.display = 'none';
						}
						
						
						
					}
					
					
				}  else {
					Swal.fire({
						  icon: 'warning',
						  title: 'กรุณากรอกข้อมูลให้ครบ',
						  showConfirmButton: false,
						  timer: 3000
						})
						
						$(':button').prop('disabled', false);
					document.getElementById('spinner1').style.display = 'none';
				}
				
			} else if(user_type == "4") {
				
				if(ip != "" && gender != "" && firstname != "" && lastname != "" && age != "" && address_1 != "" && address_2 != "" && address_3 != "" && address_4 != "กรุณาเลือกตำบล" && address_5 != "กรุณาเลือกอำเภอ" && address_6 != "กรุณาเลือกจังหวัด" && address_7 != "0" && email != "" && phone != "" && identified  != "" && user_id != "") {

					checkData = checkDataForm(address_2, address_3, address_7, "0", identified, phone, user_type, email)
					
					if(checkData == 0) {
						
						if(checkIdentified(identified)) {
							
							formData.append("ip", ip);
							formData.append("gender", gender);
							formData.append("firstname", firstname);
							formData.append("lastname", lastname);
							formData.append("birthday", age);
							formData.append("address_1", address_1);
							formData.append("address_2", address_2);
							formData.append("address_3", address_3);
							formData.append("address_4", address_4);
							formData.append("address_5", address_5);
							formData.append("address_6", address_6);
							formData.append("address_7", address_7);
							formData.append("email", email);
							formData.append("phone", phone);
							formData.append("identified", identified);
							formData.append("user_type", user_type);
							formData.append("skill", JSON.stringify(skill));
							formData.append("image", image);
							formData.append("image_text", image);
							formData.append("user_id", user_id);
							
							axios({
								  method: "post",
								  url: "updateUserData",
								  data: formData,
								})
								  .then(function (response) {
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
								  title: 'เลขบัตรประจำตัวประชาชนผิด',
								  showConfirmButton: false,
								  timer: 3000
								})
								$(':button').prop('disabled', false);
							document.getElementById('spinner1').style.display = 'none';
						}
						
						
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
			
		}
		
		
		});
		
	}
	
	function checkIdentified(identified_number) {

	    if(identified_number != ''){

	      if(Script_checkID(identified_number)){
	        
	        return true
	      }else{
	        
	        return false
	      }

	    }

	  }
	  
	  function Script_checkID(id){
	      if(! IsNumeric(id)) return false;
	      if(id.substring(0,1)== 0) return false;
	      if(id.length != 13) return false;
	      for(i=0, sum=0; i < 12; i++)
	          sum += parseFloat(id.charAt(i))*(13-i);
	      if((11-sum%11)%10!=parseFloat(id.charAt(12))) return false;
	      return true;
	  }
	  function IsNumeric(input){
	      var RE = /^-?(0|INF|(0[1-7][0-7]*)|(0x[0-9a-fA-F]+)|((0|[1-9][0-9]*|(?=[\.,]))([\.,][0-9]+)?([eE]-?\d+)?))$/;
	      return (RE.test(input));
	  }

</script>
