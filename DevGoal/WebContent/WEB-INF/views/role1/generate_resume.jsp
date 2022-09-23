<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>สร้างเรซูมเม่</title>
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
	
	<script type="text/javascript" src="resources/js/loading.js"></script>
<link rel="stylesheet" href="resources/stylecss/loading_axios.css">
</head>
<body>

<div class="ring">DEVGOAL<span class="loading"></span></div>
	<main>
		<nav class="navbar navbar-expand d-flex flex-column " id="sidebar">
			<include src="resources/includeBody/role1/sidebar_admin.html"></include>
		</nav>
		<include src="resources/includeBody/role1/navbar_admin.html"></include>

		<section class="p-4 my-container">
			<button class="btn" id="menu-btn">
				<i class="fa-solid fa-list"></i>
			</button>

			<div class="container">
				<div class="card-container">
					&nbsp;&nbsp;
					<h4>สร้างเรซูมเม่</h4>
					<div class="card" id="ins">
						<div class="card-header">เพิ่มข้อมูลเพื่อสร้างเรซูมเม่</div>
						<div class="card-body">
							<div class="row">
								<div class="col-lg-12">
									<form>
										<h5>ข้อมูลส่วนตัว</h5>
										<div class="row">

											<div class="col-sm-12 col-md-6 col-lg-4">
												<img src="" id="userImage" alt="personal picture"
													style="width: 250px; height: 250px; border-radius: 20%;">
												<div class="row"></div>
											</div>

										</div>
										<br>

										<div class="row">
											<div class="col-sm-12 col-md-6 col-lg-3">
												<div class="form-floating ">
													<input type="text" class="form-control" id="userName"
														placeholder="ชื่อ" name="initial" disabled> <label
														for="initial">ชื่อ - นามสกุล</label>
												</div>
											</div>

											<div class="col-sm-12 col-md-6 col-lg-3">
												<div class="form-floating ">
													<input type="text" class="form-control" id="userBirthday"
														placeholder="วันเกิด" name="userBirthday" disabled> <label
														for="zipcode">วันเกิด</label>
												</div>
											</div>
											<div class="col-sm-12 col-md-6 col-lg-1">
												<div class="form-floating ">
													<input type="text" class="form-control" id="userGender"
														placeholder="เพศ" name="userGender" disabled> <label
														for="zipcode">เพศ</label>
												</div>
											</div>
											<div class="col-sm-12 col-md-6 col-lg-3">
												<div class="form-floating ">
													<input type="text" class="form-control" id="userEmail"
														placeholder="อีเมล" name="userEmail" disabled> <label
														for="zipcode">อีเมล</label>
												</div>
											</div>
											<div class="col-sm-12 col-md-6 col-lg-2">
												<div class="form-floating ">
													<input type="number" class="form-control" id="userPhone"
														placeholder="เบอร์โทรศัพทร์" name="userPhone" min="1"
														disabled> <label for="zipcode">เบอร์โทรศัพทร์</label>
												</div>
											</div>

											<div class="col-lg-2 col-sm-12 col-md-4">
												<select class="form-select" id="overseas_name">
													<option value="0">เลือกสถานที่ทำงาน</option>
												</select>
											</div>

										</div>
										<br>

										<hr>
										<h5>ข้อมูลการศึกษา</h5>
										<div class="row">

											<div class="col-sm-12 col-md-6 col-lg-3">
												<div class="form-floating ">
													<input type="text" class="form-control" id="userHighSchool"
														placeholder="ชื่อโรงเรียนมัธยมปลาย" name="userHighSchool">
													<label for="zipcode">ชื่อโรงเรียนมัธยมปลาย</label>
												</div>
											</div>

											<div class="col-sm-12 col-md-6 col-lg-2">
												<div class="form-floating ">
													<input type="number" class="form-control"
														id="userHighSchoolGPAX"
														placeholder="เกรดเฉลี่ยสะสมมัธยมปลาย"
														name="userHighSchoolGPAX" min="1"> <label
														for="zipcode">เกรดเฉลี่ยสะสมมัธยมปลาย</label>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-12 col-md-6 col-lg-3">
												<div class="form-floating ">
													<input type="text" class="form-control" id="userUniversity"
														placeholder="มหาวิทยาลัย" name="userUniversity" disabled>
													<label for="zipcode">มหาวิทยาลัย</label>
												</div>
											</div>

											<div class="col-sm-12 col-md-6 col-lg-2">
												<div class="form-floating ">
													<input type="text" class="form-control" id="userFaculty"
														placeholder="คณะ" name="userFaculty" disabled> <label
														for="zipcode">คณะ</label>
												</div>
											</div>

											<div class="col-sm-12 col-md-6 col-lg-2">
												<div class="form-floating ">
													<input type="text" class="form-control" id="userCourse"
														placeholder="หลักสูตร" name="userCourse" disabled>
													<label for="zipcode">หลักสูตร</label>
												</div>
											</div>

											<div class="col-sm-12 col-md-6 col-lg-2">
												<div class="form-floating ">
													<input type="number" class="form-control"
														id="userUniversityGPAX"
														placeholder="เกรดเฉลี่ยสะสมอุดมศึกษา"
														name="userUniversityGPAX" min="1"> <label
														for="zipcode">เกรดเฉลี่ยสะสมอุดมศึกษา</label>
												</div>
											</div>
										</div>
										<hr>
										<h5>อธิบายเกี่ยวกับตัวเอง</h5>
										<div class="row">
											<div class="col-sm-12 col-md-6 col-lg-10">
												<div class="form-floating ">
													<input type="text" class="form-control" id="userDetail"
														placeholder="อธิบายเกี่ยวกับตัวเอง" name="userDetail">
													<label for="zipcode">อธิบายเกี่ยวกับตัวเอง</label>
												</div>
											</div>
										</div>
										<hr>
										<h5>เป้าหมายในการทำงาน</h5>
										<div class="row">
											<div class="col-sm-12 col-md-6 col-lg-10">
												<div class="form-floating ">
													<input type="text" class="form-control" id="userWorkDetail"
														placeholder="เป้าหมายในการทำงาน" name="userWorkDetail">
													<label for="zipcode">เป้าหมายในการทำงาน</label>
												</div>
											</div>
										</div>
										<hr>
										<h5>ตำแหน่งที่สนใจ</h5>
										<div class="row">
											<div class="col-sm-12 col-md-6 col-lg-10">
												<div class="form-floating ">
													<input type="text" class="form-control"
														id="userPostionFocus" placeholder="ตำแหน่งที่สนใจ"
														name="userPostionFocus"> <label for="zipcode">ตำแหน่งที่สนใจ</label>
												</div>
											</div>
										</div>
										<hr>
										<h5>ทักษะ</h5>
										<div class="card-body">
											<div class="table-overflow col-sm-12 col-md-12 col-lg-6">
												<table id="datatable_language"
													class="table table-primary table-striped shadow p-3 mb-5 rounded"
													style="width: 100%">
													<thead>
														<tr>
															<th>ลำดับ</th>
															<th>ทักษะด้านโปรแกรมมิ่ง</th>
															<th>ระดับความชำนาญ</th>
														</tr>
													</thead>
													<tbody id="data_language">
												</table>
											</div>
										</div>
										<hr>
										<h5>ประสบการณ์</h5>
										<div class="row">
											<div class="col-sm-12 col-md-12 col-lg-8">
												<div class="card shadow p-3 rounded">
													<div
														class="card-header bg-primary shadow p-3 mb-5 rounded text-white fs-5">
														<i class="fa-solid fa-code fa-md"></i> ประสบการณ์ <i
															class="fa-solid fa-code fa-md"></i>
													</div>
													<div class="card-body">
														<div class="row">
															<div class="col-sm-12 col-md-12 col-lg-8">
																<input type="text" class="form-control"
																	placeholder="เพิ่มครั้งละ 1 ประสบการณ์ เช่น (เคยทำระบบขายสินค้า POS ให้ บริษัท A)"
																	aria-label="ประสบการณ์" aria-describedby="basic-addon1"
																	id="experience">
															</div>

															<div class="col-sm-12 col-md-12 col-lg-3">
																<button type="button" class="btn btn-primary"
																	onclick="addExperience()">เพิ่มข้อมูล</button>
															</div>
														</div>
														</br>
														<div class="table-overflow col-sm-12 col-md-12 col-lg-8">
															<table id="datatable_experience"
																class="table table-primary table-striped shadow p-3 mb-5 rounded"
																style="width: 100%">
																<thead>
																	<tr>
																		<th>ลำดับ</th>
																		<th>ประสบการณ์</th>
																		<th>ลบ</th>
																	</tr>
																</thead>
																<tbody id="data_experience">
															</table>
														</div>
													</div>
												</div>
											</div>
										</div>

										<hr>
										<h5>ผลงานที่เคยทำ</h5>
										<div class="row">
											<div class="col-sm-12 col-md-12 col-lg-8">
												<div class="card shadow p-3 rounded">
													<div
														class="card-header bg-info shadow p-3 mb-5 rounded text-white fs-5">
														<i class="fa-solid fa-code fa-md"></i> ผลงานที่เคยทำ <i
															class="fa-solid fa-code fa-md"></i>
													</div>
													<div class="card-body">
														<div class="row">
															<div class="col-sm-12 col-md-12 col-lg-8">
																<input type="text" class="form-control"
																	placeholder="เพิ่มครั้งละ 1 ผลงาน เช่น (ระบบขายสินค้า)"
																	aria-label="ผลงานที่เคยทำ"
																	aria-describedby="basic-addon1" id="work">
															</div>

															<div class="col-sm-12 col-md-12 col-lg-3">
																<button type="button" class="btn btn-primary"
																	onclick="addWork()">เพิ่มข้อมูล</button>
															</div>
														</div>
														</br>
														<div class="table-overflow col-sm-12 col-md-12 col-lg-8">
															<table id="datatable_work"
																class="table table-primary table-striped shadow p-3 mb-5 rounded"
																style="width: 100%">
																<thead>
																	<tr>
																		<th>ลำดับ</th>
																		<th>ผลงาน</th>
																		<th>ลบ</th>
																	</tr>
																</thead>
																<tbody id="data_work">
															</table>
														</div>
													</div>
												</div>
											</div>
										</div>

										<hr>
										<h5>งานอดิเรก</h5>
										<div class="row">
											<div class="col-sm-12 col-md-12 col-lg-8">
												<div class="card shadow p-3 rounded">
													<div
														class="card-header bg-dark shadow p-3 mb-5 rounded text-white fs-5">
														<i class="fa-solid fa-code fa-md"></i> งานอดิเรก <i
															class="fa-solid fa-code fa-md"></i>
													</div>
													<div class="card-body">
														<div class="row">
															<div class="col-sm-12 col-md-12 col-lg-8">
																<input type="text" class="form-control"
																	placeholder="เพิ่มครั้งละ 1 งานอดิเรก เช่น (ศึกษา Framework ใหม่ๆ)"
																	aria-label="งานอดิเรก" aria-describedby="basic-addon1"
																	id="hobby">
															</div>

															<div class="col-sm-12 col-md-12 col-lg-3">
																<button type="button" class="btn btn-primary"
																	onclick="addHobby()">เพิ่มข้อมูล</button>
															</div>
														</div>
														</br>
														<div class="table-overflow col-sm-12 col-md-12 col-lg-8">
															<table id="datatable_hobby"
																class="table table-primary table-striped shadow p-3 mb-5 rounded"
																style="width: 100%">
																<thead>
																	<tr>
																		<th>ลำดับ</th>
																		<th>งานอดิเรก</th>
																		<th>ลบ</th>
																	</tr>
																</thead>
																<tbody id="data_hobby">
															</table>
														</div>
													</div>
												</div>
											</div>
										</div>

										</br>
										<button type="button" onClick="showResume()"
											class="btn btn-primary" id="show" style="float: right;">ดูตัวอย่าง</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
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
</html>
<script type="text/javascript" src="resources/js/sidebar.js"></script>
<script type="text/javascript">

$(function() {
	
	var date = new Date(); 
	var yearsVal = date.getFullYear() + 543
	
	for(var i = 0; i < 10; i++) {
		
		$('#years').append($('<option value="' + ((yearsVal-18)-i) + '">' + ((yearsVal-18)-i) + '</option>'));
		
	}
	
	axios({
		  method: "post",
		  url: "overseasDataForResume",
		}).then(function (response) {
			
			$.each(response.data, function(i, data) {
				
				$('#overseas_name').append($('<option value="' + response.data[i].role3_email + '">' + response.data[i].overseas_name + '</option>'));
				
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
		  url: "getUserDataForGenerateResumeRole1",
		}).then(function (response) {
			
				document.getElementById('userImage').src = 'resources/images/profile/'+response.data.profile_image
				document.getElementById('userName').value = response.data.firstname +' '+ response.data.lastname
				document.getElementById('userBirthday').value = response.data.birthday
				document.getElementById('userGender').value = response.data.gender
				document.getElementById('userEmail').value = response.data.email
				document.getElementById('userPhone').value = response.data.phone
				document.getElementById('userUniversity').value = response.data.university_name
				document.getElementById('userFaculty').value = response.data.faculty_name
				document.getElementById('userCourse').value = response.data.course_name
				
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
		  url: "findSkillBySessionUserId",
		}).then(function (response) {
			
			$("#data_language").empty()
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
	
		    
	});


	var i = 1
	function addExperience() {
		var language = document.getElementById("experience").value

		if (language != '') {

			var newRow = document.createElement("tr")
			var newCell0 = document.createElement("td")
			var newCell1 = document.createElement("td")
			var newCell3 = document.createElement("td")

			newCell0.innerHTML = i++
			newCell1.innerHTML = language
			newCell3.innerHTML = "<i class='fa fa-close' style='color: red'></i>"

			newRow.append(newCell0)
			newRow.append(newCell1)
			newRow.append(newCell3)
			document.getElementById("data_experience").appendChild(newRow)

			document.getElementById("experience").value = ''


		} else {
			Swal.fire({
				icon : 'warning',
				title : 'กรุณากรอกข้อมูลประสบการณ์',
				showConfirmButton : false,
				timer : 3000
			})

		}

	}

	function getValueExperience() {

		var skill = []
		var subSkill = []

		var table = $('#datatable_experience')

		var i = 0
		table.children("tbody").find("td").each(function() {
			subSkill.push($(this).text())

			if (i == 2) {
				skill.push(subSkill.splice(1, 1))
				subSkill = []
				i = 0
			} else {
				i++
			}

		});

		return skill

	}

	$(document).on('click', 'i', function() {
		$(this).closest('tr').remove();
		return false;
	});

	var j = 1
	function addWork() {
		var language = document.getElementById("work").value

		if (language != '') {

			var newRow = document.createElement("tr")
			var newCell0 = document.createElement("td")
			var newCell1 = document.createElement("td")
			var newCell3 = document.createElement("td")

			newCell0.innerHTML = j++
			newCell1.innerHTML = language
			newCell3.innerHTML = "<i class='fa fa-close' style='color: red'></i>"

			newRow.append(newCell0)
			newRow.append(newCell1)
			newRow.append(newCell3)
			document.getElementById("data_work").appendChild(newRow)

			document.getElementById("work").value = ''


		} else {
			Swal.fire({
				icon : 'warning',
				title : 'กรุณากรอกข้อมูลผลงานที่เคยทำ',
				showConfirmButton : false,
				timer : 3000
			})

		}

	}

	function getValueWork() {

		var skill = []
		var subSkill = []

		var table = $('#datatable_work')

		var i = 0
		table.children("tbody").find("td").each(function() {
			subSkill.push($(this).text())

			if (i == 2) {
				skill.push(subSkill.splice(1, 1))
				subSkill = []
				i = 0
			} else {
				i++
			}

		});

		return skill

	}

	var k = 1
	function addHobby() {
		var language = document.getElementById("hobby").value

		if (language != '') {

			var newRow = document.createElement("tr")
			var newCell0 = document.createElement("td")
			var newCell1 = document.createElement("td")
			var newCell3 = document.createElement("td")

			newCell0.innerHTML = k++
			newCell1.innerHTML = language
			newCell3.innerHTML = "<i class='fa fa-close' style='color: red'></i>"

			newRow.append(newCell0)
			newRow.append(newCell1)
			newRow.append(newCell3)
			document.getElementById("data_hobby").appendChild(newRow)

			document.getElementById("hobby").value = ''


		} else {
			Swal.fire({
				icon : 'warning',
				title : 'กรุณากรอกข้อมูลงานอดิเรก',
				showConfirmButton : false,
				timer : 3000
			})

		}

	}

	function getValueHobby() {

		var skill = []
		var subSkill = []

		var table = $('#datatable_hobby')

		var i = 0
		table.children("tbody").find("td").each(function() {
			subSkill.push($(this).text())

			if (i == 2) {
				skill.push(subSkill.splice(1, 1))
				subSkill = []
				i = 0
			} else {
				i++
			}

		});

		return skill

	}
	
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
	
	function getValueSkillDatatable() {
		
		var skill = []
		var subSkill = []
		
		var table = $('#datatable_language')
		
		var a = 0
		table.children("tbody").find("td").each(function() {
			subSkill.push($(this).text())
			
			if(a == 2) {
				skill.push(subSkill.splice(1,1))
				subSkill = [] 
				a = 0
			} else {
				a++
			}
			
	   });
		
		return skill
		
		
	}
	
	async function showResume() {
		
		document.getElementById('spinner').style.display = 'block';
		
		$(':button').prop('disabled', true);
		
		var userHighSchool = document.getElementById('userHighSchool').value
		var userWorkDetail = document.getElementById('userWorkDetail').value
		var experience = getValueExperience()
		var work = getValueWork()
		var hobby = getValueHobby()
		
		var skill = getValueSkillDatatable()
		var image = document.getElementById('userImage').src
		var name = document.getElementById('userName').value
		var birthday = document.getElementById('userBirthday').value
		var gender = document.getElementById('userGender').value
		var email = document.getElementById('userEmail').value
		var phone = document.getElementById('userPhone').value
		var university = document.getElementById('userUniversity').value
		var faculty = document.getElementById('userFaculty').value
		var course = document.getElementById('userCourse').value
		
		var userPostionFocus = document.getElementById('userPostionFocus').value
		var userUniversityGPAX = document.getElementById('userUniversityGPAX').value
		var userHighSchoolGPAX = document.getElementById('userHighSchoolGPAX').value
		var userDetail = document.getElementById('userDetail').value
		
		var em = document.getElementById("overseas_name");
		var emailRole3 = em.options[em.selectedIndex].value;
		
		if(emailRole3 != '' && emailRole3 != '0' && userPostionFocus != '' && userDetail != '' && userUniversityGPAX != '' && userUniversityGPAX != '0' && userHighSchoolGPAX != '' && userHighSchoolGPAX != '0' && userHighSchool != '' && userWorkDetail != '' && experience.length != 0 && work.length != 0 && hobby.length != 0) {
			
			$(':button').prop('disabled', false);
			document.getElementById('spinner').style.display = 'none';
			
			await setCookie(userHighSchool, userWorkDetail, experience, work, hobby, skill, image, name, birthday, gender, email, phone, university, faculty, course, userPostionFocus, userUniversityGPAX, userHighSchoolGPAX, userDetail, emailRole3)
			
			window.open("showResume", "_blank");
			
			
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
	}
	
	function setCookie(userHighSchool, userWorkDetail, experience, work, hobby, skill, image, name, birthday, gender, email, phone, university, faculty, course, userPostionFocus, userUniversityGPAX, userHighSchoolGPAX, userDetail, emailRole3) {
		
		sessionStorage.setItem("userHighSchool", userHighSchool);
		sessionStorage.setItem("userWorkDetail", userWorkDetail);
		sessionStorage.setItem("experience", JSON.stringify(experience));
		sessionStorage.setItem("work", JSON.stringify(work));
		sessionStorage.setItem("hobby", JSON.stringify(hobby));
		sessionStorage.setItem("skill", JSON.stringify(skill));
		sessionStorage.setItem("image", image);
		sessionStorage.setItem("name", name);
		sessionStorage.setItem("birthday", birthday);
		sessionStorage.setItem("gender", gender);
		sessionStorage.setItem("email", email);
		sessionStorage.setItem("phone", phone);
		sessionStorage.setItem("university", university);
		sessionStorage.setItem("faculty", faculty);
		sessionStorage.setItem("course", course);
		sessionStorage.setItem("userPostionFocus", userPostionFocus);
		sessionStorage.setItem("userUniversityGPAX", userUniversityGPAX);
		sessionStorage.setItem("userHighSchoolGPAX", userHighSchoolGPAX);
		sessionStorage.setItem("userDetail", userDetail);
		sessionStorage.setItem("emailRole3", emailRole3);
	}
</script>