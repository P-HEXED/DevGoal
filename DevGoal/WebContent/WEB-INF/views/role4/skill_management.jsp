<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>จัดการข้อมูลทักษะความสามารถ</title>
<link rel="stylesheet" href="resources/stylecss/style_user.css">
<link href="resources/images/logo/devgoal_logo.png" size="16x16"
	rel="shortcut icon" type="image/png" />
<script src="https://unpkg.com/htmlincludejs"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.2.0/mdb.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
<script type="text/javascript" src="resources/js/loading.js"></script>
<link rel="stylesheet" href="resources/stylecss/loading_axios.css">
</head>
<body>
	<div class="ring">
		DEVGOAL<span class="loading"></span>
	</div>
	<main>
		<nav class="navbar navbar-expand d-flex flex-column " id="sidebar">
			<include src="resources/includeBody/role4/sidebar_admin.html"></include>
		</nav>
		<include src="resources/includeBody/role4/navbar_admin.html"></include>
		<section class="p-4 my-container">
			<button class="btn" id="menu-btn">
				<i class="fa-solid fa-list"></i>
			</button>
				<div class="row table-responsive">
					<div class="card-container ">
						&nbsp;&nbsp;
						<h4>จัดการข้อมูลทักษะความสามารถ</h4>
						<div class="card" id="ins">
							<div class="card-header">เพิ่มข้อมูลทักษะความสามารถด้านโปรแกรมมิ่ง</div>
							<div class="card-body">
								<div class="row">
									<form>
										<div class="col-sm-12 col-md-10 col-lg-6">
											<div class="form-floating ">
												<input type="text" class="form-control"
													id="skillDataInsert" placeholder="ทักษะความสามารถด้านโปรแกรมมิ่ง เช่น (ภาษาทางโปรแกรมมิ่ง, การจัดการฐานข้อมูล)"
													name="name"> <label for="name">ทักษะความสามารถด้านโปรแกรมมิ่ง เช่น (ภาษาทางโปรแกรมมิ่ง, การจัดการฐานข้อมูล)</label>
											</div>
										</div>
										<br>
										<button type="button" onClick="insertPlaceOfInternship()"
											class="btn btn-primary" style="float: right;">บันทึก</button>
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
					<div class="table-container col-sm-6 col-md-12 col-lg-12">
						<div class="row abovetable ">
							<h4>แก้ไขข้อมูลทักษะความสามารถด้านโปรแกรมมิ่ง</h4>
						</div>
						<div class="table-overflow">
						<table class="table text-center " id="internshipDataTable">
							<thead class="table-dark">
								<tr>
									<th>ทักษะความสารถด้านโปรแกรมมิ่ง</th>
									<th>สถานะ</th>
									<th>เวลาที่บันทึก</th>
									<th></th>
									<th></th>
								</tr>
							</thead>
							<tbody id="internshipTable">
							</tbody>
						</table>
						</div>
						<div class="lds-roller" id="spinner2" style="display: none;">
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
			<div class="modal fade" id="internshipModal">
				<div
					class="modal-dialog modal-xl modal-fullscreen-lg-down modal-dialog-centered">
					<div class="modal-content" id="update">
						<div class="modal-header">
							<h5 class="modal-title">แก้ไขข้อมูลทักษะความสามารถด้านโปรแกรมมิ่ง</h5>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col-lg-12">
									<form>
										<div class="row">
										
											<div class="col-sm-12 col-md-6 col-lg-4">
												<div class="form-floating ">
													<input type="text" class="form-control"
														id="detailModal" placeholder="ทักษะความสามารถด้านโปรแกรมมิ่ง"
														name="detailModal"> <label for="name">ทักษะความสามารถด้านโปรแกรมมิ่ง</label>
												</div>
											</div>
											
											<div class="col-sm-12 col-md-6 col-lg-3">
												<div class="form-floating ">
													<input type="text" class="form-control"
														id="statusModal" placeholder="สถานะ"
														name="statusModal" disabled> <label for="initial">สถานะ</label>
												</div>
											</div>
											
											<div class="col-sm-12 col-md-6 col-lg-3">
												<div class="form-floating ">
													<input type="text" class="form-control"
														id="emailModal" placeholder="เวลาที่บันทึก"
														name="emailModal" disabled> <label for="initial">เวลาที่บันทึก</label>
												</div>
											</div>
											<input type="hidden" id="skillIdModal">
											
										</div>
									</form>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" onClick="updatePlaceOfInternship()"
									class="btn btn-primary">บันทึก</button>
								<button type="button" class="btn btn-danger"
									data-bs-dismiss="modal">ยกเลิก</button>
							</div>

							<div class="lds-roller" id="spinner1" style="display: none;">
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
		  url: "findAllSkill",
		}).then(function (response) {
			
			$.each(response.data, function(i, data) {
				
					var newRow = document.createElement("tr")
				    var newCell1 = document.createElement("td")
				    var newCell2 = document.createElement("td")
				    var newCell3 = document.createElement("td")
				    var newCell4 = document.createElement("td")
				    var newCell5 = document.createElement("td")
				    
				    newCell1.innerHTML = "<p>"+response.data[i].detail+"</p>"
				    
				    var cell2 = ''
					    
				    if(response.data[i].status == "ไม่ผ่านการยืนยัน") {
				    	
				    	cell2 = "<span class='badge badge-danger rounded-pill d-inline'>"+response.data[i].status+"</span>"
				    	
				    }else if(response.data[i].status == "ยืนยันแล้ว") {
				    	
				    	cell2 = "<span class='badge badge-success rounded-pill d-inline'>"+response.data[i].status+"</span>"
				    	
				    }else if(response.data[i].status == "รอการตรวจสอบ") {
				    	
				    	cell2 = "<span class='badge badge-warning rounded-pill d-inline'>"+response.data[i].status+"</span>"
				    	
				    }
				    
				    newCell2.innerHTML = cell2
				    newCell3.innerHTML = "<p>"+response.data[i].time_reg+"</p>"
				    newCell4.innerHTML = "<button type='button' onClick='ShowInternshipModal(\""+ response.data[i].detail +"\",\""+ response.data[i].status +"\",\""+ response.data[i].time_reg +"\",\""+ response.data[i].skill_id +"\")' class='btn btn-warning' data-bs-toggle='modal' data-bs-target='#internshipModal'>ดูรายละเอียด</button>"
				    newCell5.innerHTML = "<button onClick='manegementStatus("+response.data[i].skill_id+", 1)' class='btn btn-success'>ยืนยัน</button><button onClick='manegementStatus("+response.data[i].skill_id+", 0)' class='btn btn-danger'>ปฏิเสธ</button>"
				    	
				    newRow.append(newCell1)
				    newRow.append(newCell2)
				    newRow.append(newCell3)
				    newRow.append(newCell4)
				    newRow.append(newCell5)
				    document.getElementById("internshipTable").appendChild(newRow)
            });
           
			$('#internshipDataTable').DataTable();
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
	
	function ShowInternshipModal(detail, status, time_reg, skill_id) {

		document.getElementById('detailModal').value = detail
		document.getElementById('statusModal').value = status
		document.getElementById('emailModal').value = time_reg
		document.getElementById('skillIdModal').value = skill_id
		
		
	}
	
	function updatePlaceOfInternship() {
		
		document.getElementById('spinner1').style.display = 'block';
		$(':button').prop('disabled', true);
		
		const data = $.getJSON('https://api.ipify.org?format=json', function(data){
			
			skill_id = document.getElementById('skillIdModal').value
			skill = document.getElementById('detailModal').value
			ip = data.ip
			
			if(skill_id != '' && skill != '' && ip != '') {
				
				axios({
					  method: "post",
					  url: "skillUpdate",
					  data: "skill_id="+skill_id+"&skill="+skill+"&ip="+ip,
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
						  document.getElementById('spinner1').style.display = 'none';
						} else if(response.data.alert == "2") {
						  
						  Swal.fire({
						      icon: "warning",
						    title: response.data.status,
						    showConfirmButton: false,
						    timer: 3000
						    })
						    
						    $(':button').prop('disabled', false);
						  document.getElementById('spinner1').style.display = 'none';
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
						document.getElementById('spinner1').style.display = 'none';
					  });
			} else {
				Swal.fire({
					  icon: 'warning',
					  title: 'กรุณากรอกข้อมูลให้ครบ',
					  showConfirmButton: false,
					  timer: 3000
					})
					$(':button').prop('disabled', false);
				document.getElementById('spinner1').style.display = 'none';
			}
			
		});
	}
	
	function insertPlaceOfInternship() {
		
		document.getElementById('spinner').style.display = 'block';
		$(':button').prop('disabled', true);
		
		const data = $.getJSON('https://api.ipify.org?format=json', function(data){
			
			skill = document.getElementById('skillDataInsert').value
			ip = data.ip
			
			if(skill != '' && ip != '') {
				
					axios({
						  method: "post",
						  url: "skillInsert",
						  data: "skill="+skill+"&ip="+ip,
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
		
	
	
	function manegementStatus(skill_id, status) {
		
		document.getElementById('spinner2').style.display = 'block';
		$(':button').prop('disabled', true);
		
		const data = $.getJSON('https://api.ipify.org?format=json', function(data){
				
			ip = data.ip
				
			if(skill_id != '') {
					
				axios({
					  method: "post",
					  url: "skillUpdateStatus",
					  data: 'skill_id=' + skill_id +'&status=' +status +'&ip='+ip,
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
						  document.getElementById('spinner2').style.display = 'none';
						} else if(response.data.alert == "2") {
						  
						  Swal.fire({
						      icon: "warning",
						    title: response.data.status,
						    showConfirmButton: false,
						    timer: 3000
						    })
						    
						    $(':button').prop('disabled', false);
						  document.getElementById('spinner2').style.display = 'none';
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
						document.getElementById('spinner2').style.display = 'none';
					  });
				} else {
					Swal.fire({
					  icon: 'warning',
					  title: 'กรุณาเลือกทักษะความสารถ',
					  showConfirmButton: false,
					  timer: 3000
					})
					$(':button').prop('disabled', false);
					document.getElementById('spinner2').style.display = 'none';
				}
				
			});
			

			}
</script>