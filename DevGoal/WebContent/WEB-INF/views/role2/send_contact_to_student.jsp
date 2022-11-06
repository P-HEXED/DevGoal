<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ส่งข้อมูลการติดต่อให้นิสิต/นักศึกษา</title>
<link type="text/css" rel="stylesheet"
	href="resources/stylecss/style_user.css">
<link type="text/css" rel="stylesheet"
	href="resources/stylecss/classic.css">
<link type="text/css" rel="stylesheet"
	href="resources/stylecss/classic.date.css">
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
<script src="resources/js/picker.js"></script>
<script src="resources/js/picker.date.js"></script>
<script src="resources/js/main.js"></script>
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
				<div class="abovetable">
					<h4>ส่งข้อมูลการติดต่อให้นิสิต/นักศึกษา</h4>
					<span style="color: red;">*หากต้องการดูข้อมูลรายเทอม ให้ใส่ข้อมูลช่อง Search ปีการศึกษา/เทอม (เช่น 2565/1)</span>
				</div>

				<div class="table-overflow">
				<table class="table text-center" id="userDataTable">
					<thead class="table-dark text-white">
						<tr>
							<th></th>
							<th>ชื่อ - นามสกุล</th>
							<th>มหาวิทยาลัย</th>
							<th>สถานที่ฝึกงาน</th>
							<th>เทอม</th>
							<th></th>
						</tr>
					</thead>
					<tbody id="userData">
					</tbody>
				</table>
				</div>
				<div id="pageNavPosition" class="pager-nav"></div>
				<hr>

				<button type="button" id="sendDataBtn" class='btn btn-primary'
					style="float: right;" data-bs-toggle="modal"
					data-bs-target="#internshipModal">ส่งข้อมูล</button>

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
									<label for="comment">วันเกิด</label> <input class="form-control"
										id="userAge" type="text" disabled></input>
								</div>

								<div class="col col-sm-12 col-md-12 col-lg-3">
									<label for="comment">จังหวัด</label> <input
										class="form-control" id="userAddress" type="text" disabled></input>
								</div>

								<div class="col col-sm-12 col-md-12 col-lg-3">
									<label for="comment">สถานที่ฝึกงาน</label> <input
										class="form-control" id="userOverseas" type="text" disabled></input>
								</div>
								
								<div class="col col-sm-12 col-md-12 col-lg-2">
									<label for="comment">ปีการศึกษา/เทอม</label> <input
										class="form-control" id="userTerm" type="text" disabled></input>
								</div>

							</div>
							<div class="row">
								<div class="col col-sm-12 col-md-12 col-lg-3">
									<label for="comment">อีเมล</label> <input class="form-control"
										id="userEmail" type="text" disabled></input>
								</div>

								<div class="col col-sm-12 col-md-12 col-lg-3">
									<label for="comment">เบอร์โทร</label> <input
										class="form-control" id="userPhone" type="text" disabled></input>
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
									<h5>เพิ่มข้อมูลสำหรับการติดต่อ</h5>
								</div>
								<div class="card-body">
									<div class="row">
										<div class="col-lg-12">
											<form>
												<div class="row">

													<div class="col-lg-3 col-sm-12 col-md-6">
														<div class="form-group ">
															<label for="input_from">วันที่จะนัดประชุม</label> <input
																type="text" class="form-control" id="input_from"
																placeholder="Start Date">
														</div>
													</div>

													<div class="col-lg-2 col-md-2 col-sm-12 ">
													<div class="form-group">
													<label for="input_from">เวลาที่จะนัดประชุม</label>
													<input type="time" class="form-control" id="time">
													</div>
													</div>

													<div class="col-sm-12 col-md-6 col-lg-6">
														<div class="form-floating ">
															<input type="text" class="form-control"
																id="contactDetail"
																placeholder="ช่องทางการติดต่อ (ข้อมูลการนัดประชุมออนไลน์หรือข้อมูลสถานที่เพื่อนัดประชุม)"
																name="name"> <label for="name">ช่องทางการติดต่อ
																(ข้อมูลการนัดประชุมออนไลน์หรือข้อมูลสถานที่เพื่อนัดประชุม)</label>
														</div>
													</div>
												</div>
												</br>
												<button type="button" onClick="insertPlaceOfInternship()"
													class="btn btn-primary" id="send" style="float: right;">ส่งข้อมูลการติดต่อให้นิสิต/นักศึกษา</button>
											</form>
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

var table = ''

$(function() {
	
	axios({
		  method: "post",
		  url: "internshipAndStudentMatchingData",
		}).then(function (response) {
			
			$.each(response.data, function(i, data) {
				
				var newRow = document.createElement("tr")
				var newCell = document.createElement("td")
				var newCell0 = document.createElement("td")
			    var newCell1 = document.createElement("td")
			    var newCell2 = document.createElement("td")
			    var newCell3 = document.createElement("td")
			    var newCell4 = document.createElement("td")
			    
			    var name = response.data[i].firstname +' '+response.data[i].lastname
			    
			    newCell.innerHTML = "<input id='checkBox' type='checkbox' value='"+response.data[i].student_place_of_internship_id+"'/>"
			    newCell0.innerHTML = "<div class='d-flex '><img src="+'resources/images/profile/'+response.data[i].profile_image+" class='rounded-circle'/><div class='ms-3'><p class='fw-bold mb-1'>"+name+"</p></div></div>"
			    
			    newCell1.innerHTML = "<p class='fw-normal mb-1'>"+response.data[i].university_name+"</p>"
			    newCell2.innerHTML = "<p class='fw-normal mb-1'>"+response.data[i].internship_name+"</p>"
			    newCell3.innerHTML = "<p class='fw-normal mb-1'>"+response.data[i].term+"</p>"
			    newCell4.innerHTML = "<button type='button' onClick='ShowUserData(\""+response.data[i].profile_image+"\",\""+ response.data[i].firstname+"\",\""+ response.data[i].lastname+"\",\""+ response.data[i].gender+"\",\""+ response.data[i].birthday+"\",\""+ response.data[i].university_name+"\",\""+ response.data[i].faculty_name+"\",\""+ response.data[i].course_name+"\",\""+response.data[i].user_id+"\",\""+response.data[i].province+"\",\""+response.data[i].internship_name+"\",\""+response.data[i].email+"\",\""+response.data[i].phone+"\",\""+response.data[i].term+"\")' class='btn btn-info' data-bs-toggle='modal' data-bs-target='#info'>ดูข้อมูลส่วนตัว</button>"
			    
			    newRow.append(newCell)
			    newRow.append(newCell0)
			    newRow.append(newCell1)
			    newRow.append(newCell2)
			    newRow.append(newCell3)
			    newRow.append(newCell4)
			    document.getElementById("userData").appendChild(newRow)
				    
          });
			
		  table = $('#userDataTable').dataTable()
			/* $('#userDataTable').dataTable( {
				  "aaSorting": [],
				  "columnDefs": [
				    { "width": "20%", "targets": 4 }
				  ]
				} ); */
			
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
	
				
	function ShowUserData(profile_image, firstname, lastname, gender, birthday, university_name, faculty_name, course_name, user_id, province, internship_name, email, phone, term) {
		
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
		document.getElementById('userOverseas').value = internship_name
		document.getElementById('userEmail').value = email
		document.getElementById('userPhone').value = phone
		document.getElementById('userTerm').value = term
		
		
	}
	
	
	function getStdInternshipId() {
		
		var std_overseas_id = []

		$(table.$('input[type="checkbox"]').map(function () {
			if($(this).prop("checked")){
			
				std_overseas_id.push($(this).prop("value"))
				
			} 
			
		}));
		
		return std_overseas_id
	}

function getDateTH() {
	
	const monthENG = ["January","February","March","April","May","June","July","August","September","October","November","December"];
	const monthTH = ["มกราคม", "กุมภาพันธ์", "มีนาคม", "เมษายน", "พฤษภาคม", "มิถุนายน", "กรกฏาคม", "สิงหาคม", "กันยายน", "ตุลาคม", "พฤศจิกายน", "ธันวาคม"];
	
	var begin = document.getElementById('input_from').value
	
	const beginArray = begin.split(" ");
	
	var begin_day = beginArray[0]
	
	var begin_month = beginArray[1].slice(0, beginArray[1].length - 1)
	
	var begin_year = beginArray[2]
	
	for(var i = 0; i < monthENG.length; i++) {
		
		if(begin_month == monthENG[i]) {
			begin_month = monthTH[i]
			
		}
		
	}
	
	return 'วันที่ '+begin_day +' เดือน '+ begin_month +' พ.ศ. '+(parseInt(begin_year)+543)
	
}
	
function insertPlaceOfInternship() {
	
	document.getElementById('spinner').style.display = 'block';
	$(':button').prop('disabled', true);
		
		const data = $.getJSON('https://api.ipify.org?format=json', function(data){
			
			var date = document.getElementById('input_from').value
			var contact = document.getElementById('contactDetail').value
			var time = document.getElementById('time').value
			var ip = data.ip
			var std_internship_id = getStdInternshipId()
			
			if(std_internship_id.length > 0 && contact != '' && ip != '' && date != '' && time != '') {
				
				date = getDateTH()
				
				axios({
						  method: "post",
						  url: "sendContactRole2",
						  data: "std_internship_id="+JSON.stringify(std_internship_id)+"&ip="+ip+"&contact="+contact+"&date="+date+"&time="+time,
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
					  title: 'กรุณากรอกข้อมูลให้ครบ',
					  showConfirmButton: false,
					  timer: 3000
					})
					$(':button').prop('disabled', false);
					document.getElementById('spinner').style.display = 'none';
			}
			
		});
		
	}
	
	
</script>
