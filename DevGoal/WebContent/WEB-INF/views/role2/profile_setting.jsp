<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>โปรไฟล์</title>
<link rel="stylesheet" href="resources/stylecss/style_user.css">
<link href="resources/images/logo/devgoal_logo.png" size="16x16"
	rel="shortcut icon" type="image/png" />
<script src="https://unpkg.com/htmlincludejs"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript" src="resources/js/loading.js"></script>
<link rel="stylesheet" href="resources/stylecss/loading_axios.css">
</head>
<body>
	<div class="ring">
		DEVGOAL<span class="loading"></span>
	</div>
	<main>
		<nav class="navbar navbar-expand d-flex flex-column " id="sidebar">
			<include src="resources/includeBody/role2/sidebar_admin.html"></include>
		</nav>
		<include src="resources/includeBody/role2/navbar_admin.html"></include>

		<section class="p-4 my-container">
			<button class="btn" id="menu-btn">
				<i class="fa-solid fa-list"></i>
			</button>

			<div class="card-container" id="somecard">
				<div class="card">
					<div class="card-header" id="infoName"></div>
					<div class="card-body">
						<div class="row">
							<div class="col-lg-3 text-center mb-4">
								<img src="" id="infoImage" alt="personal picture"
									style="width: 250px; height: 250px; border-radius: 20%;">	
							</div>
							<div class="col-lg-9">
								<form>
									<div class="row">
										<div class="col-sm col-md-5 col-lg-5">
											<div class="form-floating ">
												<input type="text" class="form-control" id="infoFirstname"
													placeholder="ชื่อ" name="name" disabled> <label
													for="name">ชื่อ</label>
											</div>
										</div>
										<div class="col-sm  col-md-5 col-lg-5">
											<div class="form-floating ">
												<input type="text" class="form-control" id="infoLastname"
													placeholder="นามสกุล" name="surname" disabled> <label
													for="surname">นามสกุล</label>
											</div>
										</div>
										<div class="col-sm col-md-2 col-lg-2">
											<div class="form-floating ">
												<input type="text" class="form-control" id="infoGender"
													placeholder="เพศสภาพ" name="gender" disabled> <label
													for="gender">เพศสภาพ</label>
											</div>
										</div>
									</div>
									<div class="col-sm col-md-12 col-lg-12">
										<div class="form-floating ">
											<input type="text" class="form-control" id="infoAddress"
												placeholder="ชื่อที่พัก/ชื่อหมู่บ้าน" name="address"
												disabled> <label for="address">ที่อยู่</label>
										</div>
									</div>
									<div class="row">
										<div class="col-sm col-md-6 col-lg-6">
											<div class="form-floating ">
												<input type="text" class="form-control" id="infoEmail"
													placeholder="อีเมล" name="email" disabled> <label
													for="email">อีเมล</label>
											</div>
										</div>
										<div class="col-sm col-md-6 col-lg-6">
											<div class="form-floating ">
												<input type="text" class="form-control"
													id="infoIdentified_number"
													placeholder="เลขบัตรประจำตัวประชาชน" name="id" disabled>
												<label for="id">เลขบัตรประจำตัวประชาชน</label>
											</div>
										</div>
									</div>
									<div class="row">
										<div class=" col-md-5 col-lg-5">
											<div class="form-floating ">
												<input type="text" class="form-control"
													id="infoStudent_code" placeholder="รหัสนิสิต / นักศึกษา"
													name="student_code" disabled> <label
													for="student_code">รหัสนิสิต / นักศึกษา</label>
											</div>
										</div>
										<div class=" col-md-5 col-lg-5">
											<div class="form-floating ">
												<input type="text" class="form-control" id="infoPhone"
													placeholder="ใส่เบอร์โทรศัพท์" name="phone" disabled>
												<label for="phone">เบอร์โทรศัพท์</label>
											</div>
										</div>
										<div class="col-md-2 col-lg-2">
											<div class="form-floating ">
												<input type="text" class="form-control" id="infoAge"
													placeholder="วันเกิด" name="age" disabled> <label
													for="age">วันเกิด</label>
											</div>
										</div>
									</div>
									<div class="row">
										<div class=" col-md-4 col-lg-4">
											<div class="form-floating ">
												<input type="text" class="form-control" id="infoUniversity"
													placeholder="ชื่อมหาวิทยาลัย" name="university" disabled>
												<label for="university">ชื่อมหาวิทยาลัย</label>
											</div>
										</div>
										<div class="col-md-4 col-lg-4">
											<div class="form-floating ">
												<input type="text" class="form-control" id="infoFaculty"
													placeholder="คณะ" name="faculty" disabled> <label
													for="faculty">คณะ</label>
											</div>
										</div>
										<div class=" col-md-4 col-lg-4">
											<div class="form-floating ">
												<input type="text" class="form-control" id="infoCourse"
													placeholder="สาขา" name="course" disabled> <label
													for="course">สาขา</label>
											</div>
										</div>
									</div>
									<div class="col-md-12 col-lg-6">
										<div class="form-floating ">
											<input type="text" class="form-control" id="infoAdvisor"
												placeholder="ชื่ออาจารย์ที่ปรึกษา" name="advisor" disabled>
											<label for="advisor">ชื่ออาจารย์ที่ปรึกษา</label>
										</div>
									</div>
									<div class="row">
										<div class="col-md-4 col-lg-4">
											<div class="form-floating ">
												<input type="text" class="form-control" id="infoStatus"
													placeholder="สถานะ" name="status" disabled> <label
													for="status">สถานะ</label>
											</div>
										</div>
										<div class=" col-md-4 col-lg-4">
											<div class="form-floating ">
												<input type="text" class="form-control" id="infoUser_type"
													placeholder="สิทธิ์ผู้ใช้งาน" name="user_type" disabled>
												<label for="user_type">สิทธิ์ผู้ใช้งาน</label>
											</div>
										</div>
										<div class="col-md-4 col-lg-4">
											<div class="form-floating ">
												<input type="text" class="form-control" id="infoTime_reg"
													placeholder="เวลาที่สมัคร" name="time_reg" disabled>
												<label for="time_reg">เวลาที่สมัคร</label>
											</div>
										</div>
										<input type="hidden" class="form-control" id="infoUserId">
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="card-footer">
						<button type="button" class="btn btn-warning"
							data-bs-toggle="modal" data-bs-target="#info">แก้ไขข้อมูลส่วนตัว</button>
						<a type="button" class="btn btn-info" href="requestForm">ขอแก้ไขข้อมูลสำคัญ</a>
						<button type="button" class="btn btn-primary"
							data-bs-toggle="modal" data-bs-target="#passwordUpdate">ตั้งค่ารหัสผ่าน</button>
						<button type="button" class="btn btn-success"
							data-bs-toggle="modal" data-bs-target="#skillUpdate"
							onClick="skillData()">ตั้งค่าความสามารถ</button>
					</div>
				</div>
			</div>

			<div class="modal fade" id="info">
				<div
					class="modal-dialog modal-xl modal-fullscreen-lg-down modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">แก้ไขข้อมูลส่วนตัว</h5>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col-lg-3 text-center">
									<img src="" id="imageModal" alt="personal picture"
										style="width: 250px; height: 250px; border-radius: 20%;">
									</br> </br> </br>
									<div class="row">
										<input type="file" class="form-control" id="imageFileModal" />
										<input type="hidden" id="imageTextModal" />
									</div>
								</div>
								<div class="col-lg-9">
									<form>
										<div class="row">
											<div class="col-sm-12 col-md-12 col-lg-4">
												<div class="form-floating ">
													<input type="text" class="form-control" id="address1Modal"
														placeholder="ชื่อที่พัก/ชื่อหมู่บ้าน" name="address1">
													<label for="housename">ชื่อที่พัก/ชื่อหมู่บ้าน</label>
												</div>
											</div>
											<div class="col-sm-12 col-md-12 col-lg-2">
												<div class="form-floating ">
													<input type="number" class="form-control"
														id="address2Modal" placeholder="เลขที่" name="housenumber"
														min="1"> <label for="housenumber">เลขที่</label>
												</div>
											</div>
											<div class="col-sm-12 col-md-12 col-lg-2">
												<div class="form-floating ">
													<input type="number" class="form-control"
														id="address3Modal" placeholder="หมู่ที่" name="address3"
														min="1"> <label for="housegroupnumber">หมู่ที่</label>
												</div>
											</div>
										</div>
										
										<div class="row">
										<div class="col-sm-12 col-md-12 col-lg-3">
												<div class="form-floating ">
													<input type="number" class="form-control" id="phoneModal"
														placeholder="เบอร์โทรศัพท์" name="phone" min="1">
													<label for="phone">เบอร์โทรศัพท์</label>
												</div>
											</div>
											
										</div>
										
										<div class="row">
											<div class="col-sm-12 col-md-12 col-lg-4">
												<div class="form-floating ">
													<input type="text" class="form-control" id="address6Modal"
														placeholder="จังหวัด" name="address6" disabled> <label
														for="housegroupnumber">จังหวัด</label>
												</div>
											</div>
											
											<div class="col-sm-12 col-md-12 col-lg-4">
												<div class="form-floating ">
													<input type="text" class="form-control" id="address5Modal"
														placeholder="อำเภอ" name="address5" disabled> <label
														for="housegroupnumber">อำเภอ</label>
												</div>
											</div>
											
											<div class="col-sm-12 col-md-12 col-lg-4">
												<div class="form-floating ">
													<input type="text" class="form-control" id="address4Modal"
														placeholder="ตำบล" name="address4" disabled> <label
														for="housegroupnumber">ตำบล</label>
												</div>
											</div>
											
											<div class="col-sm-12 col-md-12 col-lg-3">
												<div class="form-floating ">
													<input type="number" class="form-control"
														id="address7Modal" placeholder="รหัสไปรษณีย์"
														name="address7" min="1" disabled> <label
														for="housegroupnumber" >รหัสไปรษณีย์</label>
												</div>
											</div>
										</div>
										
										<hr>
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
									</form>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" onClick="updateUserData()"
								class="btn btn-primary" id="sendUserData">บันทึก</button>
							<button type="button" class="btn btn-danger"
								data-bs-dismiss="modal" id="closeSendUserData">ยกเลิก</button>
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade" id="passwordUpdate">
				<div
					class="modal-dialog modal-l modal-fullscreen-lg-down modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">ตั้งค่ารหัสผ่าน</h5>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col-sm-12 col-md-12 col-lg-12">
									<form>
										<div class="form-floating ">
											<input type="password" class="form-control"
												id="passwordModal" placeholder="รหัสผ่าน" name="password">
											<label for="password">รหัสผ่าน</label>
										</div>
										<div class="form-floating ">
											<input type="password" class="form-control"
												id="confirmPasswordModal" placeholder="ยืนยันรหัสผ่าน"
												name="password"> <label for="password">ยืนยันรหัสผ่าน</label>
										</div>
										<div class="form-check">
											<input class="form-check-input mt-2" type="checkbox"
												onclick="showPassword()" id="flexCheckDefault"> <label
												class="form-check-label mt-1" for="flexCheckDefault">
												แสดงรหัสผ่าน </label>
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
									</form>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" onClick="updateUserPassword()"
								class="btn btn-primary" id="sendPassword">บันทึก</button>
							<button type="button" class="btn btn-danger"
								data-bs-dismiss="modal" id="closeSendPassword">ยกเลิก</button>
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade" id="skillUpdate">
				<div
					class="modal-dialog modal-xl modal-fullscreen-lg-down modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">ตั้งค่าความสามารถ</h5>
						</div>
						<div class="modal-body">
							<div class="row">
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
										<button class="btn btn-primary" onclick="addSkillDatatable()">เพิ่มข้อมูล</button>
									</div>
								</div>
								<div class="col-sm-12 col-md-12 col-lg-6">
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
						<div class="modal-footer">
							<button type="button" onClick="updateUserSkill()"
								class="btn btn-primary" id="sendSkill">บันทึก</button>
							<button type="button" class="btn btn-danger"
								data-bs-dismiss="modal" id="closeSendSkill">ยกเลิก</button>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.2.0/mdb.min.js"></script>
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
			
	axios({
		  method: "post",
		  url: "profileSetting",
		}).then(function (response) {
			document.getElementById('infoName').innerHTML = response.data[0].firstname + ' ' + response.data[0].lastname
			document.getElementById("infoImage").src = "resources/images/profile/"+response.data[0].profile_image
			document.getElementById('infoFirstname').value = response.data[0].firstname
			document.getElementById('infoLastname').value = response.data[0].lastname
			document.getElementById('infoGender').value = response.data[0].gender
			document.getElementById('infoAddress').value = response.data[0].address1+' '+response.data[0].address2+' '+response.data[0].address3+' '+response.data[0].address4+' '+response.data[0].address5+' '+response.data[0].address6+' '+response.data[0].address7
			document.getElementById('infoEmail').value = response.data[0].email
			document.getElementById('infoIdentified_number').value = response.data[0].identified_number
			
			if(response.data[0].university == undefined) {
				document.getElementById('infoUniversity').value = "ไม่มีข้อมูล"
			} else {
				document.getElementById('infoUniversity').value = response.data[0].university
			}
			if(response.data[0].faculty == undefined) {
				document.getElementById('infoFaculty').value = "ไม่มีข้อมูล"
			} else {
				document.getElementById('infoFaculty').value = response.data[0].faculty
			}
			if(response.data[0].course == undefined) {
				document.getElementById('infoCourse').value = "ไม่มีข้อมูล"
			} else {
				document.getElementById('infoCourse').value = response.data[0].course
			}
			if(response.data[0].advisor == undefined) {
				document.getElementById('infoAdvisor').value = "ไม่มีข้อมูล"
			} else {
				document.getElementById('infoAdvisor').value = response.data[0].advisor
			}
			if(response.data[0].student_code == undefined) {
				document.getElementById('infoStudent_code').value = "ไม่มีข้อมูล"
			} else {
				document.getElementById('infoStudent_code').value = response.data[0].student_code
			}
			document.getElementById('infoPhone').value = response.data[0].phone
			document.getElementById('infoAge').value = response.data[0].birthday
			document.getElementById('infoStatus').value = response.data[0].status
			
			var user_type = response.data[0].user_type
			
			if(user_type == "1") {
				
				user_type = "นิสิต/นักศึกษา"
			} else if(user_type == "2") {
				
				user_type = "อาจารย์"
			} else if(user_type == "3") {
				
				user_type = "นายจ้าง"
			} else if(user_type == "4") {
				
				user_type = "ผู้ดูแลระบบ"
			}
			
			document.getElementById('infoUser_type').value = user_type
			
			document.getElementById('infoTime_reg').value = response.data[0].time_reg
			document.getElementById('infoUserId').value = response.data[0].user_id
			
			document.getElementById('imageModal').src = "resources/images/profile/"+response.data[0].profile_image
			document.getElementById('imageTextModal').value = response.data[0].profile_image
			document.getElementById('address1Modal').value = response.data[0].address1
			document.getElementById('address2Modal').value = response.data[0].address2
			document.getElementById('address3Modal').value = response.data[0].address3
			document.getElementById('address4Modal').value = response.data[0].address4
			document.getElementById('address5Modal').value = response.data[0].address5
			document.getElementById('address6Modal').value = response.data[0].address6
			document.getElementById('address7Modal').value = response.data[0].address7
			document.getElementById('phoneModal').value = response.data[0].phone
			document.getElementById('passwordModal').value = ''
			document.getElementById('confirmPasswordModal').value = ''
			
			
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
			
			document.getElementById("address6Modal").value = e.options[e.selectedIndex].text
			document.getElementById("address5Modal").value = 'กรุณาเลือกอำเภอ'
			document.getElementById("address4Modal").value = 'กรุณาเลือกตำบล'
			document.getElementById("address7Modal").value = '0'

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
			
			document.getElementById("address5Modal").value = e.options[e.selectedIndex].text
			document.getElementById("address4Modal").value = 'กรุณาเลือกตำบล'
			document.getElementById("address7Modal").value = '0'

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
	
	document.getElementById("address4Modal").value = e.options[e.selectedIndex].text
	document.getElementById("address7Modal").value = zip_code
	
});

function skillData() {
	
var user_id = document.getElementById('infoUserId').value
	
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

function updateUserSkill() {
	
	document.getElementById('spinner2').style.display = 'block';
	$(':button').prop('disabled', true);
	
	const data = $.getJSON('https://api.ipify.org?format=json', function(data){
		
		var skill = getValueSkillDatatable()
		var ip = data.ip
			
		axios({
			  method: "post",
			  url: "updateUserSkill",
			  data: 'skill='+JSON.stringify(skill)+'&ip='+ip,
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
		
	});
	
	
}

function updateUserData() {
	
	document.getElementById('spinner').style.display = 'block';
	$(':button').prop('disabled', true);
	
	const data = $.getJSON('https://api.ipify.org?format=json', function(data){
	
		var imageFile = imageFileModal.files[0]
		var imageText = document.getElementById('imageTextModal').value
		var image = ''
		
		var address1 = document.getElementById('address1Modal').value
		var address2 = document.getElementById('address2Modal').value
		var address3 = document.getElementById('address3Modal').value
		var address4 = document.getElementById('address4Modal').value
		var address5 = document.getElementById('address5Modal').value
		var address6 = document.getElementById('address6Modal').value
		var address7 = document.getElementById('address7Modal').value
		var phone = document.getElementById('phoneModal').value
		var ip = data.ip
		
		let formData = new FormData();
		
		if(ip != "" && address1 != "" && address2 != "" && address3 != "" && address4 != "กรุณาเลือกตำบล" && address5 != "กรุณาเลือกอำเภอ" && address6 != "กรุณาเลือกจังหวัด" && address7 != "0" && phone != "") {
			
			if(imageFile != "" && imageFile != null) {
				
				if(checkImageType(imageFile) == 0) {
					
					image = imageFile
				}
				
			} else if(imageText != "") {
				
				image = imageText
			}
			
			if(image != "" && image != null) {
				
				if(address2 > 0 && address3 > 0 && address7 > 0 && phone > 0 && phone.length == 10) {
					
					formData.append("profile_image", image);
					formData.append("ip", ip);
					formData.append("address1", address1);
					formData.append("address2", address2);
					formData.append("address3", address3);
					formData.append("address4", address4);
					formData.append("address5", address5);
					formData.append("address6", address6);
					formData.append("address7", address7);
					formData.append("phone", phone);
					
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
						  title: 'กรุณาตรวจสอบข้อมูล (เลขที่, หมู่ที่, รหัสไปรษณีย์, เบอร์โทร)',
						  showConfirmButton: false,
						  timer: 3000
						})
						
						$(':button').prop('disabled', false);
						document.getElementById('spinner').style.display = 'none';
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
					document.getElementById('spinner').style.display = 'none';
		}
	
	});
}

function updateUserPassword() {
	
	document.getElementById('spinner1').style.display = 'block';
	$(':button').prop('disabled', true);
	
	const data = $.getJSON('https://api.ipify.org?format=json', function(data){
		
		var password = document.getElementById('passwordModal').value
		var confirmPassword = document.getElementById('confirmPasswordModal').value
		var ip = data.ip
		
		if(password != "" && confirmPassword != "" && ip != "") {
			
			if(password === confirmPassword) {
				
				axios({
					  method: "post",
					  url: "updateUserPassword",
					  data: 'password='+password+'&ip='+ip,
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
					  title: 'รหัสผ่านไม่ตรงกัน',
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

$(document).on('click', 'i', function () {
	var lang = $(this).closest('tr').find('td:eq(1)').text()
	$('#language').append($('<option>' + lang + '</option>'));
	
    $(this).closest('tr').remove();
    return false;
});

function showPassword() {
	  var x = document.getElementById("passwordModal")
	  var z = document.getElementById("confirmPasswordModal")
	  
	  if (x.type === "password" && z.type === "password") {
	    x.type = "text"
	    z.type = "text"
	  } else {
	    x.type = "password"
	    z.type = "password"
	  }
	}
	
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
</script>