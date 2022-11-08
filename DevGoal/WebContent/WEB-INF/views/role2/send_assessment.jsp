<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ส่งแบบฟอร์มประเมินนิสิต/นักศึกษา</title>
<link type="text/css" rel="stylesheet"
	href="resources/stylecss/style_user.css">
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
<script type="text/javascript" src="resources/js/loading.js"></script>
<link rel="stylesheet" href="resources/stylecss/loading_axios.css">
</head>

<style>
.pager-nav {
	float: right;
	margin: 16px 0;
}

.pager-nav span {
	display: inline-block;
	padding: 4px 8px;
	margin: 1px;
	cursor: pointer;
	font-size: 14px;
	background-color: #FFFFFF;
	border: 1px solid #005ce6;
	border-radius: 3px;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);
}

.pager-nav span:hover, .pager-nav .pg-selected {
	background-color: #f9f9f9;
	border: 1px solid #CCCCCC;
}

#form12 {
	border-bottom: 3px solid grey;
}
</style>

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
				<div class="row abovetable ">
					<h4>เลือกสถานที่ฝึกงานที่ต้องการส่ง</h4>
				</div>
				<div class="table-overflow">
				<table class="table text-center" id="userDataTable">
					<thead class="table-dark text-white">
						<tr>
							<th>ชื่อสถานที่ฝึกงาน</th>
							<th>อีเมล</th>
							<th></th>
						</tr>
					</thead>
					<tbody id="userData">
					</tbody>
				</table>
				</div>
				<div id="pageNavPosition" class="pager-nav"></div>
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

			<div class="modal fade" id="sendnotify">
				<div
					class="modal-dialog modal-l modal-fullscreen-lg-down modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h5 id="notifyName" class="modal-title"></h5>
						</div>
						<div class="modal-body">
							<div class="row">

								<div class="col-lg-6 col-sm-12 col-md-6">
									<div class="form-group ">
										<label for="input_from">สถานที่ฝึกงาน</label> <input
											type="text" class="form-control" id="nameInternshipModal"
											placeholder="สถานที่ฝึกงาน" disabled>
									</div>
								</div>

								<div class="col-lg-6 col-sm-12 col-md-6">
									<div class="form-group ">
										<label for="input_from">อีเมล</label> <input
											type="text" class="form-control" id="emailInternshipModal"
											placeholder="อีเมล" disabled>
									</div>
								</div>
								<br>
								<br>
								<br>
								<div class="col-sm-12 col-md-6 col-lg-8">
									<input type="hidden" id="internshiIdModal">
									<p>เลือกแบบฟอร์มเกณฑ์การประเมินสำหรับสถานที่ฝึกงาน</p>
									<select class="form-select" id="criterionForm">
									</select>
								</div>
								<hr>
								<div class="col-sm-12 col-md-6 col-lg-8">
									<p>เลือกแบบฟอร์มเกณฑ์การประเมินสำหรับอาจารย์</p>
									<select class="form-select" id="criterionType1Form">
									</select>
								</div>
							</div>

							<div class="modal-footer">
								<button type="button" onClick="SendForm()"
									class="btn btn-primary" data-bs-dismiss="modal" id="send">ส่งแบบฟอร์ม</button>
								<button type="button" class="btn btn-danger"
									data-bs-dismiss="modal" id="close_send">ยกเลิก</button>
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
$(function() {
	
		axios({
			  method: "post",
			  url: "getResultInternshipFormName",
			}).then(function (response) {
				
				$('#criterionForm').append($('<option value="0">เลือกแบบฟอร์มเกณฑ์การประเมิน</option>'));
				
				$.each(response.data, function(i, data) {
	               	$('#criterionForm').append($('<option value="' + response.data[i].result_internship_id + '">' + response.data[i].result_internship_name + '</option>'));
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
			  url: "getResultInternshipType1FormName",
			}).then(function (response) {
				
				$('#criterionType1Form').append($('<option value="0">เลือกแบบฟอร์มเกณฑ์การประเมิน</option>'));
				
				$.each(response.data, function(i, data) {
	               	$('#criterionType1Form').append($('<option value="' + response.data[i].result_internship_id + '">' + response.data[i].result_internship_name + '</option>'));
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
		  url: "getStudentInternshipComplete",
		}).then(function (response) {
			
			$.each(response.data, function(i, data) {
				
					var newRow = document.createElement("tr")
					var newCell0 = document.createElement("td")
				    var newCell1 = document.createElement("td")
				    var newCell2 = document.createElement("td")
				    
				    newCell0.innerHTML = "<p class='fw-normal mb-1'>"+response.data[i].name+"</p>"
				    newCell1.innerHTML = "<p class='fw-normal mb-1'>"+response.data[i].email+"</p>"
				    newCell2.innerHTML = "<button class='btn btn-primary' onClick='setModalData(\""+response.data[i].name+"\",\""+response.data[i].place_of_internship_id+"\",\""+response.data[i].email+"\")' data-bs-toggle='modal' data-bs-target='#sendnotify'>ส่งแบบฟอร์ม</button>"
				    
				    
				    newRow.append(newCell0)
				    newRow.append(newCell1)
				    newRow.append(newCell2)
				    document.getElementById("userData").appendChild(newRow)
				    
            });
			
			$('#userDataTable').DataTable();
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
	
	function setModalData(name, internship_id, email) {
		
		document.getElementById('internshiIdModal').value = internship_id
		document.getElementById('nameInternshipModal').value = name
		document.getElementById('emailInternshipModal').value = email
		
		
	}
	
				
	function SendForm() {
		
		document.getElementById('spinner').style.display = 'block';
		$(':button').prop('disabled', true);
		
		var internshipId = document.getElementById('internshiIdModal').value
		var internshipEmail = document.getElementById('emailInternshipModal').value
		
		var e = document.getElementById("criterionForm");
		var criterionFormId = e.options[e.selectedIndex].value;
		
		var d = document.getElementById("criterionType1Form");
		var criterionType1FormId = d.options[d.selectedIndex].value;
		
		const data = $.getJSON('https://api.ipify.org?format=json', function(data){
			
		var ip = data.ip
		
		if(internshipId != '' && internshipEmail != '' && criterionFormId != '' && ip != '' && criterionFormId != '0' && criterionType1FormId != '' && criterionType1FormId != '0') {
			
			axios({
				  method: "post",
				  url: "sendAssessmentToInternship",
				  data: "internship_id="+internshipId+"&internship_email="+internshipEmail+"&criterion_form_id="+criterionFormId+"&ip="+ip+"&criterionType1FormId="+criterionType1FormId,
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
				  title: 'กรุณาเลือกแบบฟอร์มเกณฑ์การประเมิน',
				  showConfirmButton: false,
				  timer: 3000
				})
				$(':button').prop('disabled', false);
				document.getElementById('spinner').style.display = 'none';
		}
			
		
		});
	}
	
</script>
