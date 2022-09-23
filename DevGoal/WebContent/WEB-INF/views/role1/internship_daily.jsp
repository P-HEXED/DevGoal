<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>บันทึกกิจกรรมการฝึกงานรายวัน</title>
<meta name="theme-color" content="hsl(24.3, 97.4%, 54.3%)">
<link href="resources/images/logo/devgoal_logo.png" size="16x16"
	rel="shortcut icon" type="image/png" />
<link rel="stylesheet" href="resources/stylecss/style_user.css">
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="stylesheet" href="resources/stylecss/loading_axios.css">
</head>
<style>
@media ( min-width :765px) {
	#date {
		width: 50%;
	}
}
</style>
<body>
	<main>
		<nav class="navbar navbar-expand d-flex flex-column " id="sidebar">
			<include src="resources/includeBody/role1/sidebar_admin.html"></include>
		</nav>
		<include src="resources/includeBody/role1/navbar_admin.html"></include>

		<section class="p-4 my-container">
			<button typee="button" class="btn" id="menu-btn" aria-label="Name"
				role="button">
				<i class="fa-solid fa-list"></i>
			</button>
			<div class="card-container">
				<div class="card mx-4" id="activevity">
					<div class="card-header">
						<h4>แบบฟอร์มกรอกกิจกรรมการฝึกงานรายวัน</h4>
					</div>
					<div class="card-body">
						<div class="row">

							<div class="col-sm-12 col-md-12 col-lg-4">
								<label class="form-label" for="detail">วันที่</label> <input
									type="text" id="date" class="form-control mb-4" disabled="true">
							</div>

							<div class="col-sm-12 col-md-12 col-lg-6">
								<form>
									<label class="form-label" for="detail">การฝึกงานวันนี้</label>
									<div class="form-outline mb-4">
										<input class="form-control" id="detail"></input> <label
											class="form-label" for="detail">กิจกรรมที่ทำ</label>
									</div>

								</form>
							</div>
						</div>
						<button type="button" onClick="sendDetail()" id="send"
								class="btn btn-primary" style="float: right;">บันทึก</button>
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

	<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="https://unpkg.com/htmlincludejs"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.2.0/mdb.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script type="text/javascript"
		src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/js/bootstrap.min.js"
		integrity="sha384-5h4UG+6GOuV9qXh6HqOLwZMY4mnLPraeTrjT5v07o347pj6IkfuoASuGBhfDsp3d"
		crossorigin="anonymous"></script>
	<script type="text/javascript" src="resources/js/sidebar.js"></script>
</body>
</html>
<script type="text/javascript">

$(function() {
	
	var date = new Date(); 
	
	const monthTH = ["มกราคม", "กุมภาพันธ์", "มีนาคม", "เมษายน", "พฤษภาคม", "มิถุนายน", "กรกฏาคม", "สิงหาคม", "กันยายน", "ตุลาคม", "พฤศจิกายน", "ธันวาคม"];
	
	var dateVal = date.getDate()
	var monthVal = date.getMonth()
	var yearsVal = date.getFullYear() + 543
	
	document.getElementById('date').value = dateVal +' '+ monthTH[monthVal] +' '+yearsVal
	
});

function sendDetail() {
	
	document.getElementById('spinner').style.display = 'block';
	$(':button').prop('disabled', true);
	
	const data = $.getJSON('https://api.ipify.org?format=json', function(data){
		
		var ip = data.ip
		var detail = document.getElementById('detail').value
		
		if(ip != '' && detail != '') {
			
			
			axios({
				  method: "post",
				  url: "sendInternshipDetailDaily",
				  data: 'ip=' + ip + '&detail=' + detail,
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
				  title: 'กรอกข้อมูลให้ครบ',
				  showConfirmButton: false,
				  timer: 3000
				})
				$(':button').prop('disabled', false);
			document.getElementById('spinner').style.display = 'none';
		}
		
	});
}
	
</script>