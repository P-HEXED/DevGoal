<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>DevGoal</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link href="resources/images/logo/devgoal_logo.png" size="16x16"
	rel="shortcut icon" type="image/png" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
@font-face {
	font-family: 'printable4uregular';
	src:
		url('resources/stylecss/printable4u_regular_ver_1.00-webfont.woff2')
		format('woff2'),
		url('resources/stylecss/printable4u_regular_ver_1.00-webfont.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

* {
	font-family: printable4uregular;
}

body {
	background-color: f1ffbff;
}

.section-paddind {
	padding: 100px 0;
}

.carousel-item {
	height: 100vh;
	min-height: 300px;
}

.carousel-caption {
	bottom: 220px;
	z-index: 2;
}

.carousel-caption h5 {
	font-size: 45px;
	text-transform: uppercase;
	letter-spacing: 2px;
	margin-top: 25px;
}

.carousel-caption p {
	width: 60%;
	margin: auto;
	font-size: 25px;
	line-height: 1.9;
}

.carousel-inner::before {
	content: '';
	position: absolute;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	background-color: rgba(0, 0, 0, 0.7);
	z-index: 1;
}

.navbar-nav {
	font-size: 20px;
	text-transform: uppercase;
	font-weight: 500;
}

.navbar-light .navbar-brand {
	color: black;
	font-size: 30px;
	text-transform: uppercase;
	font-weight: 700;
	letter-spacing: 2px;
}

.navbar-light .navbar-brand::focus, .navbar-light .navbar-brand:hover {
	color: black;
}

.navbar-light .navbar-nav .navbar-link {
	color: black;
}

.w-100 {
	height: 100vh;
}

@media only screen and (min-width:768px) and (max-width:991px) {
	.carousel-caption {
		bottom: 370px;
	}
	.carousel-caption p {
		width: 100%;
	}
}

@media only screen and (max-width:767px) {
	.navbar-nav {
		text-align: center;
	}
	.carousel-caption {
		bottom: 125px;
	}
	.carousel-caption h5 {
		font-size: 17px;
	}
	.carousel-caption a {
		padding: 10px 15px;
	}
	.carousel-caption p {
		width: 100%;
		line-height: 1.6;
		font-size: 12px;
	}
}

section p {
	font-size: 20px;
}

.contact .card-body {
	font-size: 20px;
}

.contact .card {
	box-shadow: 15px 15px 40px rgba(0, 0, 0, 0.15);
}

img {
	width: 200px;
	height: 200px;
}
</style>
</head>
<body data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="50">
	<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
		<div class="container">
			<img src="resources/images/logo/devgoal_logo.png" alt="logo"
				style="width: 55px; height: 45px;"> <a class="navbar-brand"
				href="#"><span class="text-primary">Dev</span>Goal</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link" href="#home">Home</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#about">About</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#contact">Contact</a>
					</li>
					<li class="nav-item"></li>
				</ul>
			</div>
		</div>
	</nav>

	<div id="home" class="carousel slide" data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="resources/images/img/index_img1.jpg" class="d-block w-100"
					alt="background1">
				<div class="carousel-caption">
					<h5>หาที่ฝึกงานและที่ทำงาน ที่ชอบและถูกใจ
						ทั้งในประเทศและต่างประเทศ</h5>
					<p>เว็บไซค์หาที่ฝึกงานสำหรับนิสิต / นักศึกษา</p>
					<p>
						<a href="login" class="btn btn-primary mt-3">เริ่มต้นใช้งาน</a>
					</p>
					<p>
						<a type="button" data-bs-toggle="tooltip"
							data-bs-placement="bottom" title="หากท่านเป็นตัวแทนบริษัทที่กำลังมองหานิสิต/นักศึกษาฝึกงานอยู่ สามารถดูข้อมูลเบื้องต้นได้ที่นี่"
							href="placeRequest" class="btn btn-info mt-3">เลือกนิสิต/นักศึกษาที่สนใจ</a>
					</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="resources/images/img/background_2.jpg"
					class="d-block w-100" alt="background2">
				<div class="carousel-caption">
					<h5>รองรับทุกสายงานของโปรแกรมเมอร์</h5>
					<p>ไม่ว่าจะเป็น Programmer หรือ Developer หรือ UX/UI Designer</p>
					<p>
						<a href="login" class="btn btn-primary mt-3">เริ่มต้นใช้งาน</a>
						
					</p>
					<p>
						<a type="button" data-bs-toggle="tooltip"
							data-bs-placement="bottom" title="หากท่านเป็นตัวแทนบริษัทที่กำลังมองหานิสิต/นักศึกษาฝึกงานอยู่ สามารถดูข้อมูลเบื้องต้นได้ที่นี่"
							href="placeRequest" class="btn btn-info mt-3">เลือกนิสิต/นักศึกษาที่สนใจ</a>
					</p>
					
				</div>
			</div>
			<div class="carousel-item">
				<img src="resources/images/img/background_3.jpg"
					class="d-block w-100" alt="background3">
				<div class="carousel-caption">
					<h5>รองรับทุกขนาดทุกหน้าจอ</h5>
					<p>ตัวเว็บไซต์สามารถใช้ได้กับหน้าจอทุกขนาด
						ไม่ว่าจะเป็นโทรศัพท์มือถือ แล็ปท็อป หรือแท็บเล็ต</p>
					<p>
						<a href="login" class="btn btn-primary mt-3">เริ่มต้นใช้งาน</a>
					</p>
					<p>
						<a type="button" data-bs-toggle="tooltip"
							data-bs-placement="bottom" title="หากท่านเป็นตัวแทนบริษัทที่กำลังมองหานิสิต/นักศึกษาฝึกงานอยู่ สามารถดูข้อมูลเบื้องต้นได้ที่นี่"
							href="placeRequest" class="btn btn-info mt-3">เลือกนิสิต/นักศึกษาที่สนใจ</a>
					</p>
				</div>
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>

	<section id="about" class="about section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-12 col-12">
					<div class="about-img mt-5">
						<img src="resources/images/img/background_4.jpg" alt="logo"
							style="width: 300px; height: 400px;">
					</div>
				</div>
				<div class="col-lg-8 col-md-12 col-12 ps-lg-5 mt-md-5">
					<div class="about-text">
						<h2>About Us</h2>
						<p>
							เว็บไซต์นี้เป็นส่วนหนึ่งของรายวิชาโครงงานนิสิตทางเทคโนโลยีสารสนเทศ
							<br> (Information Technology Senior Project 2) <br>
							Copyright &copy;
							<script>
								document.write(new Date().getFullYear());
							</script>
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section id="contact" class="contact section-padding">
		<div class="container">
			<div class="row">
				<div class=" col-md-12 ">
					<div class="section-header text-center pb-5">
						<h2>สมาชิกผู้พัฒนา</h2>
						<p>สมาชิกทุกคนที่ร่วมมือกันสร้าง Web Application
							ขึ้นมาซึ่งประกอบไปดัวยสมาชิกดังนี้</p>
					</div>
				</div>
			</div>
			<div class="row ">
				<div class="col-12 col-md-6 col-lg-4">
					<div class="card text-center">
						<div class="card-body">
							<img class="img-fluid rounded-circle"
								src="resources/images/admin/1.jpg"
								style="width: 220px; height: 220px;" alt="member1">
							<h3 class="card-title py-2">พีระพัฒน์ ภูเงิน</h3>
							<p class="card-text">
								สมาชิกคนที่ 1 <br> ตำแหน่ง : Full Stack Developer <br>
								Email : 62011211024@msu.ac.th
							</p>
						</div>
					</div>
				</div>
				<div class="col-12 col-md-6 col-lg-4">
					<div class="card text-center">
						<div class="card-body">
							<img class="img-fluid rounded-circle"
								src="resources/images/admin/2.jpg"
								style="width: 220px; height: 220px;" alt="member2">
							<h3 class="card-title py-2">วรุท จันทะศรี</h3>
							<p class="card-text">
								สมาชิกคนที่ 2 <br> ตำแหน่ง : Front End Developer <br>
								Email : 62011211028@msu.ac.th
							</p>
						</div>
					</div>
				</div>
				<div class="col-12 col-md-6 col-lg-4">
					<div class="card text-center">
						<div class="card-body">
							<img class="img-fluid rounded-circle"
								src="resources/images/admin/3.jpg"
								style="width: 220px; height: 220px;" alt="member3">
							<h3 class="card-title py-2">เจษฏา มีระหงษ์</h3>
							<p class="card-text">
								สมาชิกคนที่ 3 <br> ตำแหน่ง : Database Manager <br>
								Email : 62011211048@msu.ac.th
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section id="" class="mb-5 section-padding">
		<div class="container"></div>
	</section>

</body>
<script>

//Initialize tooltips
var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
  return new bootstrap.Tooltip(tooltipTriggerEl)
})

</script>
</html>

