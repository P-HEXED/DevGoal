<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ตั้งค่ารหัสผ่าน</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
	rel="stylesheet" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.2.0/mdb.min.css"
	rel="stylesheet" />
<link type="text/css" rel="stylesheet"
	href="../resources/stylecss/style_user.css">
<link href="../resources/images/logo/devgoal_logo.png" size="16x16"
	rel="shortcut icon" type="image/png" />
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="../resources/js/loading.js"></script>
<link rel="stylesheet" href="../resources/stylecss/loading_axios.css">
<style>
.btn {
	float: right;
	margin: 10px;
}

label {
	margin-right: 6px;
	font-weight: bold;
}

#Repeatpassword {
	margin-right: 18px;
}

.card-header {
	background-color: white;
}

.card {
	border: 2px solid #ffffff;
	box-shadow: 6px 6px 20px rgba(122, 122, 122, 0.212);
	position: absolute;
	top: 10%;
	left: 10%;
	right: 10%;
}
</style>
</head>

<body>
<div class="ring">DEVGOAL<span class="loading"></span></div>
	<div class="container ">
		<div class="card m-4 mx-auto col-sm-12 col-md-10 col-lg-6">
			<div class="card-header bg-primary text-white fs-4">ตั้งค่ารหัสผ่านใหม่</div>
			<div class="card-body text-center">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div
						class="form-outline my-4  col-lg-12 col-md-12 col-sm-12 mx-auto">
						<i class="fa-solid fa-key trailing text-primary"></i> <input
							type="password" id="password"
							class="form-control form-control-lg form-icon-trailing">
						<label class="form-label">รหัสผ่านใหม่</label>
					</div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div
						class="form-outline my-4  col-lg-12 col-md-12 col-sm-12 mx-auto">
						<i class="fa-solid fa-key  trailing text-primary"></i> <input
							type="password" id="confirmPassword"
							class="form-control form-control-lg form-icon-trailing">
						<label class="form-label">ยืนยันรหัสผ่านใหม่</label>
					</div>
				</div>
				<div class="col-sm-1 col-md-3 col-lg-2">
					<div class="form-check">
						<input class="form-check-input mt-2" type="checkbox"
							onclick="showPassword()" id="flexCheckDefault"> <label
							class="form-check-label mt-1" for="flexCheckDefault">
							แสดงรหัสผ่าน </label>
					</div>
				</div>
				
			</div>
			<div class="col-sm-12 col-md-12 col-lg-2">
			<button type="button" onClick="Send()" class="btn btn-primary" style="float: right;">บันทึก</button>
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
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.2.0/mdb.min.js"></script>
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
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</body>
</html>
<script type="text/javascript">

    function Send() {
    	
    	document.getElementById('spinner').style.display = 'block';
    	$(':button').prop('disabled', true);
        
        password = document.getElementById('password').value
        confirmPassword = document.getElementById('confirmPassword').value
        
        const queryString = window.location.search
        const urlParams = new URLSearchParams(queryString)
        const data = urlParams.get('data')
    
        if(password != "" && confirmPassword != "") {
            
            if(password === confirmPassword) {
                
                axios({
                      method: "post",
                      url: "../sendNewPasswordReset",
                      data: 'password=' + password +'&data='+data,
                    }).then(function (response) {
                    	
                    	
                    	if(response.data.alert == "1") {
									  
						  Swal.fire({
						      icon: "success",
						    title: response.data.status,
						    showConfirmButton: false,
						    timer: 3000
						    })
						    .then(() => {
						      window.location.replace(response.data.redirect)
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
                          window.location.replace('404')
                      });
            } else {
				Swal.fire({
					  icon: 'warning',
					  title: 'รหัสผ่านไม่ตรงกัน',
					  showConfirmButton: false,
					  timer: 3000
					})
					$(':button').prop('disabled', false);
				document.getElementById('spinner').style.display = 'none';
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
        
    
    }
    
    function showPassword() {
  	  var x = document.getElementById("password")
  	  var z = document.getElementById("confirmPassword")
  	  
  	  if (x.type === "password" && z.type === "password") {
  	    x.type = "text"
  	    z.type = "text"
  	  } else {
  	    x.type = "password"
  	    z.type = "password"
  	  }
  	}
    
    </script>