<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<title>เข้าสู่ระบบ</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
	rel="stylesheet" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.2.0/mdb.min.css"
	rel="stylesheet" />
<link rel="stylesheet" href="resources/stylecss/style_user.css">
<link href="resources/images/logo/devgoal_logo.png" size="16x16"
	rel="shortcut icon" type="image/png" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.2.0/mdb.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	
<script type="text/javascript" src="resources/js/loading.js"></script>
<link rel="stylesheet" href="resources/stylecss/loading_axios.css">
<style>

* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

.row {
	background-color: white;
	border-radius: 30px;
	box-shadow: 12px 12px 22px;
}

.login img {
	border-top-left-radius: 30px;
	border-bottom-left-radius: 30px;
	width: 100%;
	height: 100%;
}

.login h1 {
	font-size: 3rem;
	font-weight: 700;
	font-family: 'printable4ubold';
}

.btn {
	font-size: medium;
	margin: 0 auto;
}

.login {
	height: 125vh;
	background: rgb(34, 193, 195);
	background: linear-gradient(0deg, rgba(34, 193, 195, 1) 0%,
		rgba(78, 55, 255, 1) 100%);
}

.form-outline {
	width: 50%;
	margin: 0 auto;
}

hr {
	width: 75%;
	margin: 0 auto;
	color: rgba(78, 55, 255, 1);
}

@media ( max-width :820px) {
	img {
		display: none;
	}
	.form-outline {
		width: 65%;
		margin: 0 auto;
	}
	#logo {
		display: inline;
	}
	.login{
	height:150vh;
	}
}

#logo {
	width: 70px;
	height: 60px;
}

body {
	margin: 0;
	padding: 0;
	width: 100vw;
	height: 100vh;
	background-color: #eee;
}

.content {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 100%;
	height: 100%;
}

.loader-wrapper {
	width: 100%;
	height: 100%;
	position: absolute;
	top: 0;
	left: 0;
	background-color: #242f3f;
	display: flex;
	justify-content: center;
	align-items: center;
}

.loader {
	display: inline-block;
	width: 30px;
	height: 30px;
	position: relative;
	border: 4px solid #Fff;
	animation: loader 2s infinite ease;
}

.loader-inner {
	vertical-align: top;
	display: inline-block;
	width: 100%;
	background-color: #fff;
	animation: loader-inner 2s infinite ease-in;
}

@
keyframes loader { 0% {
	transform: rotate(0deg);
}

25


%
{
transform


:


rotate
(


180deg


)
;


}
50


%
{
transform


:


rotate
(


180deg


)
;


}
75


%
{
transform


:


rotate
(


360deg


)
;


}
100


%
{
transform


:


rotate
(


360deg


)
;


}
}
@
keyframes loader-inner { 0% {
	height: 0%;
}
25


%
{
height


:


0
%;


}
50


%
{
height


:


100
%;


}
75


%
{
height


:


100
%;


}
100


%
{
height


:


0
%;


}
}
</style>
</head>
<body>
<div class="ring">DEVGOAL<span class="loading"></span></div>

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

	<section class="login py-5 ">
		<div class="container">
			<div class="row g-0">
				<div class="col-lg-4">
					<img src="resources/images/img/background_1.jpg" class="img-fluid"
						alt="login_image">
				</div>
				<div class="col-lg-8 text-center py-5">
					<h1 class="animate__animated animate__slideInRight">
						<img src="resources/images/logo/devgoal_logo.png" alt="logo"
							id="logo">เข้าสู่ระบบ
					</h1>
					<hr>
					<form>
						<div class="form-row mt-5 ">
							<div class="form-outline col-lg-12 col-sm-12">
								<input type="email" class="form-control px-3" id="email">
								<label class="form-label" for="อีเมล">อีเมล</label>
							</div>
						</div>
						<div class="form-row py-4  ">
							<div class="form-outline col-lg-12">
								<input type="password" class="form-control px-3" id="password">
								<label class="form-label" for="password">รหัสผ่าน</label>
							</div>
						</div>
						<div class="form-check mt-2">
							<a href="resetPassword">ลืมรหัสผ่านหรือเปล่า?</a>
						</div>
						<div class="form-row py-4">
							<div class=" col-lg-12 col-sm-12">
								<button type="button"
									class="btn btn-primary btn-rounded w-50 btn-block"
									onclick="Login()">
									<i class="fa-solid fa-arrow-right-to-bracket"></i> เข้าสู่ระบบ
								</button>
							</div>
						</div>
						<hr>
						<label>หรือ</label>
						<div class="form-row py-3">
							<div class=" col-lg-12 col-sm-12">
								<a type="button"
									class="btn btn-danger btn-rounded w-50 btn-block"
									href="register"> <i class="fa-solid fa-user-plus"></i>
									สมัครสมาชิก
								</a>
							</div>
						</div>
						<label>หากข้อมูลไม่ผ่านการตรวจสอบสามารถส่งข้อมูลใหม่ได้ที่นี่</label>
						<div class="form-row py-3">
							<div class=" col-lg-12 col-sm-12">
								<a type="button"
									class="btn btn-info btn-rounded w-50 btn-block"
									href="requestForm"> <i class="fa-solid fa-file-signature"></i>
									ส่งข้อมูลส่วนตัวเพื่อขอแก้ไขใหม่
								</a>
							</div>
						</div>
						<div class="form-row pt-5">
							<div class=" col-lg-12 col-sm-12">
								<button class="btn btn-primary btn-floating">
									<i class="fa-solid fa-y"></i>
								</button>
								<button class="btn btn-primary btn-floating">
									<i class="fa-solid fa-o"></i>
								</button>
								<button class="btn btn-primary  btn-floating">
									<i class="fa-solid fa-u"></i>
								</button>
								<button class="btn btn-primary  btn-floating">
									<i class="fa-solid fa-r"></i>
								</button>
								<button class="btn btn-dark  btn-floating">
									<i class="fa-solid fa-w"></i>
								</button>
								<button class="btn btn-dark  btn-floating">
									<i class="fa-solid fa-e"></i>
								</button>
								<button class="btn btn-dark  btn-floating">
									<i class="fa-solid fa-l"></i>
								</button>
								<button class="btn btn-dark  btn-floating">
									<i class="fa-solid fa-c"></i>
								</button>
								<button class="btn btn-dark btn-floating">
									<i class="fa-solid fa-o"></i>
								</button>
								<button class="btn btn-dark btn-floating">
									<i class="fa-solid fa-m"></i>
								</button>
								<button class="btn btn-dark btn-floating">
									<i class="fa-solid fa-e"></i>
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>

	</section>
</body>
</html>

<script type="text/javascript">
	
	function Login() {
		document.getElementById('spinner').style.display = 'block';
		
		$(':button').prop('disabled', true);
		
		const data = $.getJSON('https://api.ipify.org?format=json', function(data){
			
			email = document.getElementById('email').value
			password = document.getElementById('password').value
			ip = data.ip
			
			if(email != "" && password != "" && ip != "") {
				
				
				axios({
					  method: "post",
					  url: "login_validate",
					  data: 'email=' + email + '&password=' + password + '&ip=' + ip,
					}).then(function (response) {
						
						if(response.data.alert == "1") {
									  
						  Swal.fire({
						      icon: "success",
						    title: response.data.status,
						    showConfirmButton: false,
						    timer: 3000
						    })
						    .then(() => {
						      window.location.replace(response.data.redirect); 
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
							document.getElementById('spinner').style.display = 'none';
						  $(':button').prop('disabled', false);
					  });
			} else {
				Swal.fire({
					  icon: 'warning',
					  title: 'กรอกข้อมูลให้ครบ',
					  showConfirmButton: false,
					  timer: 3000
					})
					
					document.getElementById('spinner').style.display = 'none';
				 	$(':button').prop('disabled', false);
			}
			
		});

	}

</script>