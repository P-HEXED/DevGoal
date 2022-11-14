<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>หน้าหลัก</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/stylecss/style_user.css">
<link href="resources/images/logo/devgoal_logo.png" size="16x16"
	rel="shortcut icon" type="image/png" />
<script type="text/javascript" src="https://unpkg.com/htmlincludejs"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript" src="resources/js/loading.js"></script>
<link rel="stylesheet" href="resources/stylecss/loading_axios.css">
</head>
<style>
#profile {
	margin-top: 20px;
	width: 155px;
	height: 155px;
	outline: white 5px solid;
	outline-offset: 5px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
}

#profile:hover {
	outline: #005ce6 5px solid;
	outline-offset: 5px;
	box-shadow: 0 0 40px rgba(0, 0, 0, 0.5);
	transition: 0.3s;
}

input:hover {
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
	outline: rgb(228, 228, 228) 3px solid;
	outline-offset: 3px;
}

label {
	margin-top: 6px;
}

input[type=text]:disabled {
	background-color: transparent;
	border: rgb(193, 193, 230) solid 2px;
}

.card {
	padding: 15px;
	outline: white 3px solid;
	outline-offset: 3px;
}

.card:hover {
	outline-offset: 5px;
	box-shadow: 0 0 40px rgba(0, 0, 0, 0.5);
	transition: 0.3s;
	background-color: rgb(245, 245, 245);
	color: black;
}

#smallcard03:hover {
	outline-offset: 5px;
	box-shadow: 0 0 40px rgba(0, 255, 70, 5);
	transition: 0.3s;
	background-color: rgb(245, 245, 245);
	color: black;
}

#smallcard02:hover {
	outline-offset: 5px;
	box-shadow: 0 0 40px rgba(0, 120, 255, 5);
	transition: 0.3s;
	background-color: rgb(245, 245, 245);
	color: black;
}

@media screen and (max-width:765px){
	.profile-card{
	margin:0 auto;
	margin-top:50px;
	}
	#smallcard03{
	margin-top:20px;
	}
	.stat-card{
	margin-top:20px;
	margin-bottom:20px;
	}
}
hr {
	border: #0066ff solid 5px;
	border-radius: 50px;
}
body {
	background-image: resources/images/img/bg_home.jpg
}
</style>
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
			<br> <br>

			<div class="row">
			<div class="col-lg-3 col-md-6 col-sm-12">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="card profile-card align-items-center" style="width: 15rem;">
						<img id="profileImage" class="rounded-circle mx-0 auto"
							alt="Profile picture" style="width: 220px; height: 220px;">
						<div class="card-body">
							<h5 class="card-title" id="nameCard"></h5>
							<ul>
								<li class="card-text" id="universityCard"></li>
								<li class="card-text" id="facultyCard"></li>
								<li class="card-text" id="courseCard">
							</li>
							</ul>
						</div>
					</div>
				</div>
				</div>
			<!-- <div class="col-lg-6 col-md-6 col-sm-12">
				<div class="col-lg-12 col-sm-12 col-md-12">
					<div class="card" id="smallcard03">
						<div class="card-body" style="height: 10px;">
							<div class="row">
								<div class="col-lg-12 col-md-12 col-sm-12 mb-3">
									<h6 id="userStatus2"></h6>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-12 col-sm-12 col-md-12">
					<div class="card" id="smallcard02">
						<div class="card-body" style="height: 10px;">
							<div class="row">
								<div class="col-lg-12 col-md-12 col-sm-12 mb-3">
									<h6 id="userStatus1"></h6>
								</div>
							</div>
						</div>
					</div>
				</div>
				</div> -->
			<br>
				<div class="col-lg-9 col-md-12 col-sm-12">
					<div class="card stat-card px-4">
						<h4>สถานะการฝึกงาน</h4>
						<div class="row d-flex justify-content-around text-center gx-5">
							<div class="col-sm-12 col-md-6 col-lg-6">
								<div class="row mt-5">
									<div class="col-sm-12 col-md-4 col-lg-4">
										<label for="name">กำลังฝึกงานอยู่ที่</label>
									</div>
									<div class="col-sm-12 col-md-8 col-lg-8">
										<input id="internship_now" type="text" disabled="true"
											class="form-control">
									</div>
								</div>
								<div class="row mt-5">
									<div class="col-sm-12 col-md-4 col-lg-4">
										<label for="name">ที่อยู่สถานที่ฝึกงาน</label>
									</div>
									<div class="col-sm-12 col-md-8 col-lg-8">
										<input id="address_data" type="text" disabled="true"
											class="form-control">
									</div>
								</div>
								<div class="row mt-5">
									<div class="col-sm-12 col-md-4 col-lg-4">
										<label for="name">เบอร์โทรที่ฝึกงาน</label>
									</div>
									<div class="col-sm-12 col-md-8 col-lg-5">
										<input id="phone_data" type="text" disabled="true"
											class="form-control">
									</div>
								</div>
								<!-- <div class="row mt-4">
									<div class="col-sm-12 col-md-4 col-lg-4">
										<label for="name">กำลังทำงานอยู่ที่</label>
									</div>
									<div class="col-sm-12 col-md-8 col-lg-8">
										<input id="overseas_now" type="text" disabled="true"
											class="form-control">
									</div>
								</div> -->
							</div>
							<div class=" col-sm-12 col-md-6 col-lg-6">
								<canvas id="polarArea"></canvas>
								<p>1 = ระดับเริ่มต้น, 2 = ระดับปานกลาง, 3 = ระดับชำนาญ</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
</body>
</html>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
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

<script type="text/javascript">

$(function() {
	
	axios({
		  method: "post",
		  url: "getStudentData",
		}).then(function (response) {
			
			document.getElementById('profileImage').src = 'resources/images/profile/'+response.data.profile_image
			document.getElementById('nameCard').innerHTML = response.data.firstname +' '+ response.data.lastname
			document.getElementById('universityCard').innerHTML = response.data.university_name
			document.getElementById('facultyCard').innerHTML = response.data.faculty_name
			document.getElementById('courseCard').innerHTML = response.data.course_name
			
			
			if(response.data.internship_name == undefined) {
				
				document.getElementById('internship_now').value = 'ไม่มีข้อมูล'
			} else {
				
				document.getElementById('internship_now').value = response.data.internship_name
			}
			
			if(response.data.address == undefined) {
				
				document.getElementById('address_data').value = 'ไม่มีข้อมูล'
			} else {
				
				document.getElementById('address_data').value = response.data.address
			}
			
			if(response.data.phone == undefined) {
				
				document.getElementById('phone_data').value = 'ไม่มีข้อมูล'
			} else {
				
				document.getElementById('phone_data').value = response.data.phone
			}
			
			
			/* if(response.data.overseas_now == undefined) {
				
				document.getElementById('overseas_now').value = 'ไม่มีข้อมูล'
			} else {
				
				document.getElementById('overseas_now').value = response.data.overseas_now
			} */
			
			/* document.getElementById('userStatus1').innerHTML = 'จำนวนสถานที่ทำงานที่สนใจคุณ '+response.data.overseas_request_student+' บริษัท'
			document.getElementById('userStatus2').innerHTML = 'จำนวนสถานที่ฝึกงานที่สนใจคุณ '+response.data.internship_request_student+' บริษัท' */
			
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
			
			var xValues = []
			var yValues = []
			var barColors = [ "#009BFF", "#FF0000", "#FFDC00", "#00FFBD", "#FF0087", "#8F00FF", "#00FF0C", "F3FF00","#009BFF", "#FF0000", "#FFDC00", "#00FFBD", "#FF0087", "#8F00FF", "#00FF0C", "F3FF00","#009BFF", "#FF0000", "#FFDC00", "#00FFBD", "#FF0087", "#8F00FF", "#00FF0C", "F3FF00","#009BFF", "#FF0000", "#FFDC00", "#00FFBD", "#FF0087", "#8F00FF", "#00FF0C", "F3FF00","#009BFF", "#FF0000", "#FFDC00", "#00FFBD", "#FF0087", "#8F00FF", "#00FF0C", "F3FF00","#009BFF", "#FF0000", "#FFDC00", "#00FFBD", "#FF0087", "#8F00FF", "#00FF0C", "F3FF00" ]
			
			$.each(response.data, function(i, data) {
				
				xValues.push(response.data[i].detail)
				yValues.push(response.data[i].level)
				
				
			});
			
			new Chart("polarArea", {
				type : "polarArea",
				data : {
					labels : xValues,
					datasets : [ {
						backgroundColor : barColors,
						data : yValues
					} ]
				},
				options : {
					title : {
						display : true,
						text : "ทักษะความสามารถของคุณ"
					}
				}
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
	
</script>