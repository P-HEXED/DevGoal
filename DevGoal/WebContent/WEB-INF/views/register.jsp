
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>สมัครสมาชิก</title>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
	rel="stylesheet" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.2.0/mdb.min.css"
	rel="stylesheet" />
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.2.0/mdb.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
<link rel="stylesheet"
	href="https://unpkg.com/bootstrap-table@1.20.0/dist/bootstrap-table.min.css">
<link href="resources/images/logo/devgoal_logo.png" size="16x16"
	rel="shortcut icon" type="image/png" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"
	integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT"
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script
	src="https://unpkg.com/bootstrap-table@1.20.0/dist/bootstrap-table.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript" src="resources/js/loading.js"></script>
<link rel="stylesheet" href="resources/stylecss/loading_axios.css">
</head>
<style>
@font-face {
	font-family: 'printable4ubold';
	src: url('resources/stylecss/printable4u_bold_ver_1.00-webfont.woff2')
		format('woff2'),
		url('resources/stylecss/printable4u_bold_ver_1.00-webfont.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

* {
	font-family: printable4ubold;
	font-size: 18px;
}

.btn {
	border-radius: 10px;
	align-items: center;
}

.nav-link {
	border-radius: 10px;
	color: white;
}

#genre {
	width: max-content;
}

.d-flex {
	justify-content: space-evenly;
	align-items: center;
	flex-direction: row;
}

.nav-item {
	padding-bottom: 5px;
}

hr {
	color: #005ce6;
}

.card {
	border: 2px solid #005ce6;
}

#submit {
	margin-top: 10px;
	height: 35%;
}

@media ( max-width : 912px) {
	#genre{
	width:85%;
	}
	.d-flex {
		flex-direction: column;
	}
	.nav-tabs {
		margin: 0 auto;
		float: none;
		justify-content: center;
		width: 50%;
	}
	span {
		margin-top: 10px;
	}
}
</style>
<body>
	<div class="ring">
		DEVGOAL<span class="loading"></span>
	</div>
	</br>
	<div class="container">
		<div class="card shadow p-3 mb-5 rounded">
			<h1>DevGoal</h1>
			<div class="d-flex jusify-content-between">
				<div class="card-header bg-info shadow p-3 rounded " id="genre">
					<ul class="nav nav-tabs card-header-tabs " id="myTab"
						role="tablist">
						<li class="nav-item"><a class="nav-link active fs-6"
							role="button" id="student" data-toggle="tab"
							onclick="showInput(1)" role="tab" aria-controls="home"
							aria-selected="true"> <i
								class="fa-solid fa-user-graduate fa-lg"></i> นิสิต/นักศึกษา
						</a></li>
						<li class="nav-item"><a class="nav-link fs-6" role="button"
							id="teacher" data-toggle="tab" onclick="showInput(2)" role="tab"
							aria-controls="profile" aria-selected="false"> <i
								class="fa-solid fa-chalkboard-user fa-lg"></i> อาจารย์
						</a></li>
						<li class="nav-item"><a class="nav-link fs-6" role="button"
							id="entrepreneur" data-toggle="tab" onclick="showInput(3)"
							role="tab" aria-controls="contact" aria-selected="false"> <i
								class="fa-solid fa-user-tie fa-lg"></i> นายจ้าง
						</a></li>
					</ul>
				</div>
				<span></span> <span></span> <span></span> <span></span> <span></span>
				<span></span> <span class="p-2 px-5 rounded bg-primary"><h1
						class="fw-bold fs-3 text-white">สมัครสมาชิก</h1></span>
			</div>
			<hr>
			<div class="card-body">
				<div class="tab-content" id="myTabContent">
					<div class="row">
						<div class="col-sm-12 col-md-12 col-lg-1 my-1">
							<p>เพศ <span style="color: red;">*</span> </p>
							<div class="form-check">
								<input class="form-check-input" type="radio"
									name="flexRadioDefault" id="male_gender"> <label
									class="form-check-label" for="male_gender"> ชาย </label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="radio"
									name="flexRadioDefault" id="female_gender" checked> <label
									class="form-check-label" for="female_gender"> หญิง </label>
							</div>
						</div>
						<div class="col-sm-12 col-md-6 col-lg-4 my-1">
							<p>ชื่อ <span style="color: red;">*</span> </p>
							<input type="text" class="form-control"
								placeholder="ชื่อ (ไม่ต้องใส่คำนำหน้า)" aria-label="ชื่อ"
								aria-describedby="basic-addon1" id="firstname">
						</div>
						<div class="col-sm-12 col-md-6 col-lg-4 my-1">
							<p>นามสกุล <span style="color: red;">*</span> </p>
							<input type="text" class="form-control" placeholder="นามสกุล"
								aria-label="นามสกุล" aria-describedby="basic-addon1"
								id="lastname">
						</div>
						<div class="col-sm-12 col-md-12 col-lg-3 my-1">
							<p style="margin: 0; display: inline; float: left">รูปถ่ายหน้าตรง <span style="color: red;">*</span> </p>
							<p></p>
							<p
								style="font-size: 12px; color: red; margin: 0; display: inline; float: right">(ไฟล์
								JPEG, PNG เท่านั้น)</p>
							<br> <input type="file" class="form-control"
								id="profile_image">
						</div>
						<div class="col-sm-12 col-md-12 col-lg-1"></div>
						<div class="col-sm-12 col-md-4 col-lg-4 my-1"
							id="div_student_code">
							<p>รหัสนิสิต/นักศึกษา <span style="color: red;">*</span> </p>
							<input type="number" class="form-control"
								placeholder="รหัสนิสิต/นักศึกษา" aria-label="รหัสนิสิต/นักศึกษา"
								aria-describedby="basic-addon1" min="1" id="student_code">
						</div>
						<div class="col-sm-12 col-md-4 col-lg-4 my-1">
							<p>เลขบัตรประชาชน <span style="color: red;">*</span> </p>
							<input type="number" class="form-control"
								placeholder="เลขบัตรประชาชน" aria-label="เลขบัตรประชาชน"
								aria-describedby="basic-addon1" min="1" id="identified">
						</div>
						<div class="col-sm-12 col-md-4 col-lg-2 my-1">
							<p>เบอร์โทร <span style="color: red;">*</span> </p>
							<input type="number" class="form-control" placeholder="เบอร์โทร"
								aria-label="เบอร์โทร" aria-describedby="basic-addon1" min="1"
								id="phone">
						</div>
					</div>
					<br>
					<div class="row">

						<div class="col-lg-2 col-sm-12 col-md-3">
							<p>เดือนเกิด <span style="color: red;">*</span> </p>
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
							<p>วันเกิด <span style="color: red;">*</span> </p>
							<select class="form-select" id="day">
								<option value="0">วันที่</option>
							</select>
						</div>

						<div class="col-lg-2 col-sm-12 col-md-3">
							<p>ปีเกิด <span style="color: red;">*</span> </p>
							<select class="form-select" id="years">
								<option value="0">ปี</option>
							</select>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-sm-12 col-md-12 col-lg-4 my-2">
							<p>ชื่อที่พัก/ชื่อหมู่บ้าน <span style="color: red;">*</span> </p>
							<input type="text" class="form-control"
								placeholder="ชื่อที่พัก/ชื่อหมู่บ้าน"
								aria-label="ชื่อที่พัก/ชื่อหมู่บ้าน"
								aria-describedby="basic-addon1" id="address_1">
						</div>
						<div class="col-sm-12 col-md-6 col-lg-2 my-2">
							<p>เลขที่ <span style="color: red;">*</span> </p>
							<input type="number" class="form-control" placeholder="เลขที่"
								aria-label="เลขที่" aria-describedby="basic-addon1" min="1"
								id="address_2">
						</div>
						<div class="col-sm-12 col-md-6 col-lg-2 my-2">
							<p>หมู่ที่ <span style="color: red;">*</span> </p>
							<input type="number" class="form-control" placeholder="หมู่ที่"
								aria-label="หมู่ที่" aria-describedby="basic-addon1" min="1"
								id="address_3">
						</div>
						</div>
						<div class="row">
							<div class="col-sm-12 col-md-6 col-lg-3 my-2">
								<p>จังหวัด <span style="color: red;">*</span> </p>
								<select class="form-select" id="address_6">
									<option value="0">กรุณาเลือกจังหวัด</option>
								</select>
							</div>
							
							<div class="col-sm-12 col-md-6 col-lg-3 my-2">
								<p>อำเภอ/เขต <span style="color: red;">*</span> </p>
								<select class="form-select" id="address_5">
									<option value="0">กรุณาเลือกอำเภอ</option>
								</select>
							</div>
							
							<div class="col-sm-12 col-md-6 col-lg-3 my-2">
								<p>ตำบล/แขวง <span style="color: red;">*</span> </p>
								<select class="form-select" id="address_4">
									<option value="0">กรุณาเลือกตำบล</option>
								</select>
							</div>
							
							<div class="col-sm-12 col-md-6 col-lg-2 my-2">
								<p>รหัสไปรษณีย์ <span style="color: red;">*</span> </p>
								<input type="number" class="form-control"
									placeholder="รหัสไปรษณีย์" aria-label="รหัสไปรษณีย์"
									aria-describedby="basic-addon1" min="1" id="address_7">
							</div>
							
						</div>
					<hr>
					<div class="row">
						<div class="col-sm-12 col-md-12 col-lg-6 my-2">
							<p id="p_email">อีเมลมหาลัย <span style="color: red;">*</span> </p>
							<input type="email" class="form-control"
								placeholder="อีเมลมหาลัย" aria-describedby="basic-addon1"
								id="email">
						</div>
						<div class="col-sm-12 col-md-12 col-lg-6 my-2" id="div_advisor">
							<p>ชื่ออาจารย์ที่ปรึกษา <span style="color: red;">*</span> </p>
							<input type="text" class="form-control"
								placeholder="ชื่ออาจารย์ที่ปรึกษา (ใส่คำนำหน้า)"
								aria-label="อาจารย์ที่ปรึกษา" aria-describedby="basic-addon1"
								id="advisor">
						</div>
					</div>
					</br>
					<div class="row">
						<div class="col-sm-12 col-md-4 col-lg-4 my-2" id="div_university">
							<p>มหาวิทยาลัย <span style="color: red;">*</span> </p>
							<select class="form-select" id="university">
							</select>
						</div>

						<div class="col-sm-12 col-md-4 col-lg-4 my-2" id="div_faculty">
							<p>คณะ <span style="color: red;">*</span> </p>
							<select class="form-select" id="faculty">
							</select>
						</div>

						<div class="col-sm-12 col-md-4 col-lg-4 my-2" id="div_course">
							<p>หลักสูตร <span style="color: red;">*</span> </p>
							<select class="form-select" id="course">
							</select>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-sm-12 col-md-12 col-lg-8">
							<div class="card shadow p-3 rounded">
								<div
									class="card-header bg-primary shadow p-3 mb-5 rounded text-white fs-5">
									<i class="fa-solid fa-code fa-md"></i> ทักษะด้านโปรแกรมมิ่ง <i
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
									</br>
									<div class="col-sm-12 col-md-12 col-lg-8" style="overflow-x:auto;">
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
						<div class="col-sm-12 col-md-12 col-lg-4 ">
							<div class=" card shadow p-3 rounded ">
								<p>รหัสผ่าน <span style="color: red;">*</span> </p>
								<input type="password" class="form-control"
									placeholder="รหัสผ่าน" aria-label="รหัสผ่าน"
									aria-describedby="basic-addon1" id="password">
								<div class="form-check">
									<input class="form-check-input mt-2" type="checkbox"
										onclick="showPassword()" id="flexCheckDefault"> <label
										class="form-check-label mt-1" for="flexCheckDefault">
										แสดงรหัสผ่าน </label>
								</div>
								<p class="my-3">ยืนยันรหัสผ่าน <span style="color: red;">*</span> </p>
								<input type="password" class="form-control"
									placeholder="ยืนยันรหัสผ่าน" aria-label="ยืนยันรหัสผ่าน"
									aria-describedby="basic-addon1" id="confirm_password">
							</div>
							<div class="col-sm-12 col-md-12 col-lg-12 button-container">
								<input type="hidden" value="1" id="register_choice">
								<button type="button" onclick="register()"
									class="btn btn-primary" id="submit" style="float: right;">สมัครสมาชิก</button>
							</div>
						</div>
					</div>
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
</body>
<script type="text/javascript">

$(function() {
	
	var date = new Date(); 
	var yearsVal = date.getFullYear() + 543
	
	for(var i = 0; i < 10; i++) {
		
		$('#years').append($('<option value="' + ((yearsVal-18)-i) + '">' + ((yearsVal-18)-i) + '</option>'));
		
	}
	
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

$('#university').change(function() {
	
	$("#faculty").empty();
	$("#course").empty();
	
	var university_id = $(this).val()
	
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
	
	var faculty_id = $(this).val()
	
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



function showInput(value) {
	document.getElementById('register_choice').value = value
	if (value == 1) {
		document.getElementById("div_student_code").style.display = "block"
		document.getElementById("div_advisor").style.display = "block"
		document.getElementById("div_university").style.display = "block"
		document.getElementById("div_faculty").style.display = "block"
		document.getElementById("div_course").style.display = "block"
		document.getElementById("p_email").innerHTML = "<p>อีเมลมหาลัย <span style='color: red;'>*</span> </p>"
		document.getElementById("email").placeholder="อีเมลมหาลัย"
		
	} else if (value == 2) {
		document.getElementById("div_student_code").style.display = "none"
		document.getElementById("div_advisor").style.display = "none"
		document.getElementById("div_university").style.display = "block"
		document.getElementById("div_faculty").style.display = "block"
		document.getElementById("div_course").style.display = "block"
		document.getElementById("p_email").innerHTML = "<p>อีเมลมหาลัย <span style='color: red;'>*</span> </p>"
		document.getElementById("email").placeholder="อีเมลมหาลัย"
	} else if (value == 3) {
		document.getElementById("div_student_code").style.display = "none"
		document.getElementById("div_advisor").style.display = "none"
		document.getElementById("div_university").style.display = "none"
		document.getElementById("div_faculty").style.display = "none"
		document.getElementById("div_course").style.display = "none"
		document.getElementById("p_email").innerHTML = "<p>อีเมล <span style='color: red;'>*</span> </p>"
		document.getElementById("email").placeholder="อีเมล"
	}
}

function showPassword() {
	  var x = document.getElementById("password")
	  var z = document.getElementById("confirm_password")
	  
	  if (x.type === "password" && z.type === "password") {
	    x.type = "text"
	    z.type = "text"
	  } else {
	    x.type = "password"
	    z.type = "password"
	  }
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

function checkDataForm(address_2, address_3, address_7, student_code, identified, phone, register_choice, email) {
	
	const regex_pattern = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	
	if(register_choice == "1") {
		
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
					document.getElementById('spinner').style.display = 'none';
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
					document.getElementById('spinner').style.display = 'none';
			return -1
		}
		
	}
	
}
	
function register() {
	
	document.getElementById('spinner').style.display = 'block';
	$(':button').prop('disabled', true);
	
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
		
	}
	
	var address_1 = document.getElementById("address_1").value
	var address_2 = document.getElementById("address_2").value
	var address_3 = document.getElementById("address_3").value
	
	var o = document.getElementById("address_4");
	var address_4 = o.options[o.selectedIndex].text;
	
	var n = document.getElementById("address_5");
	var address_5 = n.options[n.selectedIndex].text;
	
	var p = document.getElementById("address_6");
	var address_6 = p.options[p.selectedIndex].text;
	
	var address_7 = document.getElementById("address_7").value
	
	var email = document.getElementById("email").value
	var student_code = document.getElementById("student_code").value
	var phone = document.getElementById("phone").value
    var identified = document.getElementById("identified").value
 	var advisor = document.getElementById("advisor").value
	var university = document.getElementById("university").value
	var faculty = document.getElementById("faculty").value
	var course = document.getElementById("course").value
	var password = document.getElementById("password").value
	var confirm_password = document.getElementById("confirm_password").value
	var register_choice = document.getElementById("register_choice").value
	
	let formData = new FormData();
	
	skill = getValueSkillDatatable()
	
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
	document.getElementById('spinner').style.display = 'none';
	}
	
	if(password !== confirm_password) {
Swal.fire({
			icon: 'warning',
			title: 'รหัสผ่านไม่ตรงกัน',
			showConfirmButton: false,
			timer: 3000
		})
		$(':button').prop('disabled', false);
document.getElementById('spinner').style.display = 'none';
	} else {
		
		if(register_choice == "1") {
			if(age != "" && gender != "" && firstname != "" && lastname != "" && address_1 != "" && address_2 != "" && address_3 != "" && address_4 != "กรุณาเลือกตำบล" && address_5 != "กรุณาเลือกอำเภอ" && address_6 != "กรุณาเลือกจังหวัด" && address_7 != "0" && email != "" && student_code != "" && phone != "" && identified != "" && advisor != "" && university != "" && faculty != "" && course != "" && password != "" && register_choice != "" && profile_image.files[0] != undefined) {
				
				checkData = checkDataForm(address_2, address_3, address_7, student_code, identified, phone, register_choice, email)
				
				checkImage = checkImageType(profile_image.files[0])
				
				if(checkData == 0 && checkImage == 0) {
					
					if(checkIdentified(identified)) {
						
						formData.append("profile_image", profile_image.files[0]);
						formData.append("gender", gender);
						formData.append("birthday", age);
						formData.append("firstname", firstname);
						formData.append("lastname", lastname);
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
						formData.append("password", password);
						formData.append("register_choice", register_choice);
						formData.append("skill", JSON.stringify(skill));
						
						axios({
							  method: "post",
							  url: "register_user",
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
										    	window.location.replace('login'); 
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
							  title: 'เลขบัตรประจำตัวประชาชนผิด',
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
		} else if(register_choice == "2") {
			if(age != "" && gender != "" && firstname != "" && lastname != "" && address_1 != "" && address_2 != "" && address_3 != "" && address_4 != "กรุณาเลือกตำบล" && address_5 != "กรุณาเลือกอำเภอ" && address_6 != "กรุณาเลือกจังหวัด" && address_7 != "0" && email != "" && phone != "" && identified != "" && university != "" && faculty != "" && course != "" && password != "" && register_choice != "" && profile_image.files[0] != undefined) {
				
				checkData = checkDataForm(address_2, address_3, address_7, "0", identified, phone, register_choice, email)
				
				checkImage = checkImageType(profile_image.files[0])
				
				if(checkData == 0 && checkImage == 0) {
					
					if(checkIdentified(identified)) {
						
						formData.append("profile_image", profile_image.files[0]);
						formData.append("gender", gender);
						formData.append("birthday", age);
						formData.append("firstname", firstname);
						formData.append("lastname", lastname);
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
						formData.append("password", password);
						formData.append("register_choice", register_choice);
						formData.append("skill", JSON.stringify(skill));
						
						axios({
							  method: "post",
							  url: "register_user",
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
									    	window.location.replace('login'); 
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
							  title: 'เลขบัตรประจำตัวประชาชนผิด',
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
		} else if(register_choice == "3") {
			if(age != "" && gender != "" && firstname != "" && lastname != "" && address_1 != "" && address_2 != "" && address_3 != "" && address_4 != "กรุณาเลือกตำบล" && address_5 != "กรุณาเลือกอำเภอ" && address_6 != "กรุณาเลือกจังหวัด" && address_7 != "0" && email != "" && phone != "" && identified != "" && password != "" && register_choice != "" && profile_image.files[0] != undefined) {
				
				checkData = checkDataForm(address_2, address_3, address_7, "0", identified, phone, register_choice, email)
				
				checkImage = checkImageType(profile_image.files[0])
				
				if(checkData == 0 && checkImage == 0) {
					
					if(checkIdentified(identified)) {
						
						formData.append("profile_image", profile_image.files[0]);
						formData.append("gender", gender);
						formData.append("birthday", age);
						formData.append("firstname", firstname);
						formData.append("lastname", lastname);
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
						formData.append("password", password);
						formData.append("register_choice", register_choice);
						formData.append("skill", JSON.stringify(skill));
						
						axios({
							  method: "post",
							  url: "register_user",
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
									    	window.location.replace('login'); 
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
							  title: 'เลขบัตรประจำตัวประชาชนผิด',
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
		} else {
			Swal.fire({
					  icon: 'warning',
					  title: 'กรุณาเลือกผู้ใช้ที่ต้องการสมัครสมาชิก',
					  showConfirmButton: false,
					  timer: 3000
					})
					$(':button').prop('disabled', false);
			document.getElementById('spinner').style.display = 'none';
		} 
		
		
		
	}
	
	
	
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
</html>