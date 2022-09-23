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
	margin-top: 0;
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
	margin-top:10px;
	}
	#smallcard03{
	margin-top:50px;
	}
	.stat-card{
	margin-top:20px;
	margin-bottom:20px;
	}
}

@media (min-width:765px) and (max-width:912px){
	.profile-card,.stat-card{
	margin-top:20px;
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
			<include src="resources/includeBody/role3/sidebar_admin.html"></include>
		</nav>
		<include src="resources/includeBody/role3/navbar_admin.html"></include>

		<section class="p-4 my-container">
			<button class="btn" id="menu-btn">
				<i class="fa-solid fa-list"></i>
			</button>
			<br> <br>
			<div class="row">
				<div class="col-lg-3 offset-lg-6 col-sm-12 col-md-6">
					<div class="card " id="smallcard03">
						<div class="card-body" style="height: 10px;">
							<div class="row">
								<div class="col-lg-12 col-md-12 col-sm-12 mb-3">
									<h6 id="userStatus2"></h6>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-12 col-md-6">
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
			<br>
				<div class="col-lg-2 col-md-5 col-sm-12">
					<div class="card profile-card align-items-center" style="width: 15rem;">
						<img id="profileImage" class="rounded-circle"
							alt="Profile picture" style="width: 220px; height: 220px;">
						<div class="card-body">
							<h5 class="card-title" id="nameCard"></h5>
						</div>
					</div>
				</div>
				<div class="col-lg-1 col-md-1 col-sm-12"></div>
				<div class="col-lg-9 col-md-6 col-sm-12">
					<div class="card stat-card px-4">
						<div class="row d-flex justify-content-around text-center gx-5">
							<div class="col-lg-7">
								<canvas id="barChart"></canvas>
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
		  url: "getEmployerData",
		}).then(function (response) {
			
			document.getElementById('profileImage').src = 'resources/images/profile/'+response.data.profile_image
			document.getElementById('nameCard').innerHTML = response.data.firstname +' '+ response.data.lastname
			
			document.getElementById('userStatus1').innerHTML = 'จำนวนนิสิต/นักศึกษาที่สนใจบริษัทของคุณ '+response.data.student_request+' คน'
			document.getElementById('userStatus2').innerHTML = 'จำนวนนิสิต/นักศึกษาที่คุณสนใจ '+response.data.request_student+' คน'
			
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
		  url: "getStudentCountWorking",
		}).then(function (response) {
			
			var xValues = []
			var yValues = []
			var barColors = [ "#009BFF", "#FF0000", "#FFDC00", "#00FFBD", "#FF0087", "#8F00FF", "#00FF0C", "F3FF00" ]
			
			$.each(response.data, function(i, data) {
				
				xValues.push(response.data[i].name)
				yValues.push(response.data[i].count)
				
				
			});
			
			var chartEl = document.getElementById("barChart")
			chartEl.height = 160
			
			new Chart(chartEl, {
				type: "bar",
				data: {
					labels: xValues,
					datasets: [{
						backgroundColor: barColors,
						data: yValues
					}]
				},
				options: {
					scales: {
				        yAxes: [{
				            ticks: {
				            	beginAtZero: true,
				                precision: 0
				            }
				        }],
				        xAxes: [{
				            barPercentage: 0.3
				        }]
				    },
					legend: { display: false },
					title: {
						display: true,
						text: "จำนวนนิสิต/นักศึกษาที่เข้าทำงานในแต่ละบริษัทของคุณ"
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