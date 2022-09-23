<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>ร้องขอสถานที่ฝึกงาน</title>
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
	<div class="ring">
		DEVGOAL<span class="loading"></span>
	</div>
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
					<h4>ร้องขอสถานที่ฝึกงาน</h4>
					<div class="card" id="ins">
						<div class="card-header">เพิ่มสถานที่ฝึกงาน</div>
						<div class="card-body">
							<div class="row">
								<div class="col-lg-12">
									<form>
										<div class="row">
											<div class="col-sm-12 col-md-6 col-lg-4">
												<div class="form-floating ">
													<input type="text" class="form-control"
														id="internshipNameInsert" placeholder="ชื่อสถานที่ฝึกงาน"
														name="name"> <label for="name">ชื่อสถานที่ฝึกงาน</label>
												</div>
											</div>
											<div class="col-sm-12 col-md-6 col-lg-3">
												<div class="form-floating ">
													<input type="text" class="form-control"
														id="internshipEmailInsert"
														placeholder="อีเมลสถานที่ฝึกงาน" name="initial"> <label
														for="initial">อีเมลสถานที่ฝึกงาน</label>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-12 col-md-6 col-lg-2">
												<div class="form-floating ">
													<input type="number" class="form-control"
														id="internshipPhoneInsert" placeholder="เบอร์โทร"
														name="zipcode" min="1"> <label for="zipcode">เบอร์โทร</label>
												</div>
											</div>
											<div class="col-sm-12 col-md-6 col-lg-2">
												<div class="form-floating ">
													<input type="number" class="form-control"
														id="internshipReceiveInsert" placeholder="จำนวนที่รับ"
														name="zipcode" min="1"> <label for="zipcode">จำนวนที่รับ</label>
												</div>
											</div>
											<div class="col-sm-12 col-md-6 col-lg-2">
												<select class="form-select" id="internshipTypeInsert">
													<option value="0">สถานที่ตั้ง</option>
													<option value="1">ในประเทศ</option>
													<option value="2">ต่างประเทศ</option>
												</select>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-12 col-md-6 col-lg-2">
												<div class="form-floating ">
													<input type="text" class="form-control"
														id="internshipAddress1Insert" placeholder="ประเทศ"
														name="country"> <label for="country">ประเทศ</label>
												</div>
											</div>
										</div>
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
											<div class="col-sm-12 col-md-6 col-lg-2 my-2">
												<p>รหัสไปรษณีย์</p>
												<input type="number" class="form-control"
													placeholder="รหัสไปรษณีย์" aria-label="รหัสไปรษณีย์"
													aria-describedby="basic-addon1" min="1" id="address_7">
											</div>
										</div>
										<div class="row">
											<div class="col-sm-12 col-md-12 col-lg-9">
												<div class="card shadow p-3 rounded">
													<div
														class="card-header bg-dark shadow p-3 mb-5 rounded text-white fs-5">
														<i class="fa-solid fa-code fa-md"></i>
														ทักษะด้านโปรแกรมมิ่ง <i class="fa-solid fa-code fa-md"></i>
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
																<button type="button" class="btn btn-primary"
																	onclick="addSkillDatatable()">เพิ่มข้อมูล</button>
															</div>
														</div>
														</br>
														<div class="table-overflow col-sm-12 col-md-12 col-lg-8">
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
										</div>
								</div>
								</div>
								<button type="button" id="submit"
									onClick="insertPlaceOfInternship()" class="btn btn-primary"
									style="float: right;">ร้องขอ</button>
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

$(document).on('click', 'i', function () {
	
	var lang = $(this).closest('tr').find('td:eq(1)').text()
	$('#language').append($('<option>' + lang + '</option>'));
	  
    $(this).closest('tr').remove();
    return false;
});

function checkDataForm(phone, receive, zipcode, email, type) {
	
	const regex_pattern = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	
	if(phone > 0 && receive > 0 && zipcode > 0 && regex_pattern.test(email) && phone.length > 8 && phone.length < 11 && type != '0') {
		
		return 0
	} else {
		
		return -1
	}
	
}

function insertPlaceOfInternship() {
	
	document.getElementById('spinner').style.display = 'block';
	$(':button').prop('disabled', true);
	
	const data = $.getJSON('https://api.ipify.org?format=json', function(data){
		
		name = document.getElementById('internshipNameInsert').value
		email = document.getElementById('internshipEmailInsert').value
		phone = document.getElementById('internshipPhoneInsert').value
		receive = document.getElementById('internshipReceiveInsert').value
		type = document.getElementById('internshipTypeInsert').value
		address1 = document.getElementById('internshipAddress1Insert').value
		
		var o = document.getElementById("address_4");
		var address4 = o.options[o.selectedIndex].text;

		var n = document.getElementById("address_5");
		var address3 = n.options[n.selectedIndex].text;

		var p = document.getElementById("address_6");
		var address2 = p.options[p.selectedIndex].text;
		
		address5 = document.getElementById('address_7').value
		ip = data.ip
		skill = getValueSkillDatatable()
		
		if(name != '' && email != '' && phone != '' && receive != '' && type != '' && address1 != '' && address2 != 'กรุณาเลือกจังหวัด' && address3 != 'กรุณาเลือกอำเภอ' && address4 != 'กรุณาเลือกตำบล' && address5 != '' && ip != '' && skill.length > 0) {
			
			if(checkDataForm(phone, receive, address5, email, type) == 0) {
				
				axios({
					  method: "post",
					  url: "requestPlaceOfInternship",
					  data: "internship_name="+name+"&email="+email+"&phone="+phone+"&receive_total="+receive+"&type="+type+"&address1="+address1+"&address2="+address2+"&address3="+address3+"&address4="+address4+"&address5="+address5+"&ip="+ip+"&skill="+JSON.stringify(skill),
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
									icon: 'warning',
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
				  title: 'กรุณาตรวจสอบความถูกต้องของ เบอร์โทร, จำนวนที่รับ, รหัสไปรษณีย์, อีเมล, สถานที่ตั้ง',
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
		
	});
	
}
</script>