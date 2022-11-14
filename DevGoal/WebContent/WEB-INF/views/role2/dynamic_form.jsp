<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>สร้างแบบฟอร์มการประเมิน</title>
<meta name="theme-color" content="hsl(24.3, 97.4%, 54.3%)">
<link href="resources/images/logo/devgoal_logo.png" size="16x16"
	rel="shortcut icon" type="image/png" />
<link rel="stylesheet" href="resources/stylecss/style_user.css">
<script type="text/javascript" src="https://unpkg.com/htmlincludejs"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/v/dt/dt-1.12.1/datatables.min.js"></script>
<script type="text/javascript"
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
			<include src="resources/includeBody/role2/sidebar_admin.html"></include>
		</nav>
		<include src="resources/includeBody/role2/navbar_admin.html"></include>

		<section class="p-4 my-container">
			<button class="btn" id="menu-btn">
				<i class="fa-solid fa-list"></i>
			</button>

			<div class="row table-responsive">
				<div class="card ">
					<div class="card-header">
						<h4>เพิ่มเกณฑ์การประเมินนิสิต/นักศึกษา</h4>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-lg-5 col-md-8 col-sm-12">
								<p id="name">ชื่อเกณฑ์การประเมิน</p>
								<input type="text" class="form-control"
									placeholder="ชื่อเกณฑ์การประเมิน" id="nameCriterion">
							</div>
							<div class="col-lg-2 col-md-4 col-sm-12">
								<p id="name">คะแนนเต็ม</p>
								<div class="input-group mb-3">
									<input type="number" class="form-control"
										placeholder="คะแนนเต็ม" min="1" id="scoreCriterion"> <span
										class="input-group-text" id="basic-addon2">คะแนน</span>
								</div>
							</div>
						</div>
						<button class="btn btn-primary" type="button"
							onClick="insertCriterion()" id="insert_criterion"
							style="float: right;">บันทึกเกณฑ์การประเมิน</button>

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

				<div class="table-container col-sm-12 col-md-12 col-lg-12">
					<div class="abovetable ">
						<h4>แก้ไขข้อมูลเกณฑ์การประเมินนิสิต/นักศึกษา</h4>
					</div>

					<div class="table-overflow">
						<table class="table  table-striped text-center"
							id="criterionTable">
							<thead class="table-dark">
								<tr>
									<th>ชื่อเกณฑ์การประเมิน</th>
									<th>คะแนนเต็ม</th>
									<th>สถานะ</th>
									<th>เวลาที่บันทึก</th>
									<th></th>
									<th></th>
								</tr>
							</thead>
							<tbody id="criterionData">
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


				<div class="modal fade" id="internshipModal">
					<div
						class="modal-dialog modal-xl modal-fullscreen-lg-down modal-dialog-centered">
						<div class="modal-content" id="update">
							<div class="modal-header">
								<h5 class="modal-title">แก้ไขข้อมูลเกณฑ์การประเมินนิสิต/นักศึกษา</h5>
							</div>
							<div class="modal-body">
								<div class="row">
									<div class="col-lg-12 col-md-12 col-sm-12">
										<form>
											<div class="row">
												<div class="col-sm-12 col-md-6 col-lg-4">
													<div class="form-floating ">
														<input type="text" class="form-control"
															id="nameCriterionModal" placeholder="ชื่อเกณฑ์การกระเมิน"
															name="nameCriterionModal"> <label for="name">ชื่อเกณฑ์การกระเมิน</label>
													</div>
												</div>
												<div class="col-sm-12 col-md-6 col-lg-3">
													<div class="form-floating ">
														<input type="number" class="form-control"
															id="scoreCriterionModal" placeholder="คะแนนเต็ม"
															name="scoreCriterionModal" min="1"> <label
															for="initial">คะแนนเต็ม</label>
													</div>
												</div>
												<div class="col-sm-12 col-md-6 col-lg-2">
													<div class="form-floating ">
														<input type="text" class="form-control"
															id="timeRegCriterionModal" placeholder="คะแนนเต็ม"
															name="timeRegCriterionModal" disabled> <label
															for="initial">เวลาที่บันทึกเกณฑ์</label> <input
															type="hidden" id="idCriterionModal">
													</div>
												</div>
											</div>
										</form>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" onClick="updateCriterion()"
										class="btn btn-primary" id="update_criterion">บันทึก</button>
									<button type="button" class="btn btn-danger"
										data-bs-dismiss="modal" id="close_update_criterion">ยกเลิก</button>
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

				<hr>

				<div class="row">
					<div class="col-sm-12 col-md-12 col-lg-8">
						<div class="card shadow p-3 rounded">
							<div
								class="card-header bg-dark shadow p-3 mb-5 rounded text-white fs-5">
								<i class="fa-solid fa-code fa-md"></i>
								สร้างแบบฟอร์มการประเมินนิสิต/นักศึกษา <i
									class="fa-solid fa-code fa-md"></i>
							</div>
							<div class="card-body">
								<div class="row">
									<div class="col-sm-12 col-md-12 col-lg-4">
										<p>เลือกเกณฑ์การประเมิน</p>
										<select class="form-select" id="criterionSelect">
										</select>
									</div>
									<div class="col-sm-12 col-md-12 col-lg-3">
										<p>รูปแบบการเพิ่มข้อมูล</p>
										<select class="form-select" id="level">
											<option value="0"></option>
											<option value="1">ช่องเพิ่มข้อความ</option>
											<option value="2">ช่องเพิ่มตัวเลข</option>
										</select>
									</div>
									<div class="col-sm-12 col-md-12 col-lg-3">
										<p>.</p>
										<button class="btn btn-info" onclick="addSkillDatatable()">เพิ่มข้อมูลลงในแบบฟอร์ม</button>
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
												<th>เกณฑ์การประเมิน</th>
												<th>รูปแบบการเพิ่มข้อมูล</th>
												<th>ลบ</th>
											</tr>
										</thead>
										<tbody id="data_language">
									</table>
								</div>
								<button class="btn btn-primary" data-bs-toggle='modal'
									data-bs-target='#insertCriterionFormModal'
									style="float: right;">สร้างแบบฟอร์มการประเมิน</button>
							</div>
						</div>
					</div>
				</div>

				<div class="modal fade" id="insertCriterionFormModal">
					<div
						class="modal-dialog modal-l modal-fullscreen-lg-down modal-dialog-centered">
						<div class="modal-content" id="update">
							<div class="modal-header">
								<h5 class="modal-title">ตั้งชื่อแบบฟอร์มการประเมินนิสิต/นักศึกษา</h5>
							</div>
							<div class="modal-body">
								<div class="row">
									<div class="col-lg-12 col-md-12 col-sm-12">
										<form>
											<div class="row">
												<div class="col-sm-12 col-md-12 col-lg-12">
													<div class="form-floating ">
														<input type="text" class="form-control"
															id="nameCriterionFormModal"
															placeholder="ชื่อแบบฟอร์มเกณฑ์การประเมิน"
															name="nameCriterionFormModal"> <label for="name">ชื่อแบบฟอร์มเกณฑ์การประเมิน</label>
													</div>
												</div>
											</div>

											<div class="row">

												<div class="col-sm-12 col-md-12 col-lg-8">
													<select class="form-select" id="formType">
														<option value="0">กรุณาเลือกกลุ่มเป้าหมาย</option>
														<option value="1">แบบฟอร์มสำหรับอาจารย์</option>
														<option value="2">แบบฟอร์มสำหรับสถานที่ฝึกงาน</option>
													</select>
												</div>

											</div>
										</form>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" onClick="insertCriterionForm()"
										class="btn btn-primary" id="insert_form">บันทึก</button>
									<button type="button" class="btn btn-danger"
										data-bs-dismiss="modal" id="close_insert_form">ยกเลิก</button>
								</div>

								<div class="lds-roller" id="spinner3" style="display: none;">
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

				<div class="table-container col-sm-12 col-md-12 col-lg-12">
					<div class="abovetable ">
						<h4>แบบฟอร์มเกณฑ์การประเมินนิสิต/นักศึกษา</h4>
					</div>
					<div class="table-overflow">
						<table class="table  table-striped text-center"
							id="criterionFormTable">
							<thead class="table-dark">
								<tr>
									<th>ชื่อแบบฟอร์มเกณฑ์การประเมิน</th>
									<th>แบบฟอร์มสำหรับ</th>
									<th>สถานะ</th>
									<th>เวลาที่บันทึก</th>
									<th></th>
									<th></th>
								</tr>
							</thead>
							<tbody id="criterionFormData">
							</tbody>
						</table>
					</div>
					<div class="lds-roller" id="spinner4" style="display: none;">
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

				<div class="modal fade" id="previewCriterionFormodal">
					<div
						class="modal-dialog modal-xl modal-fullscreen-lg-down modal-dialog-centered">
						<div class="modal-content" id="update">
							<div class="modal-header">
								<h5 class="modal-title">ตัวอย่างแบบฟอร์มการประเมินนิสิต/นักศึกษา</h5>
							</div>
							<div class="modal-body">
								<div class="row">
									<div class="col-lg-12 col-md-12 col-sm-12">
										<form>
											<div id="formDynamic"></div>
										</form>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-danger"
										data-bs-dismiss="modal">ปิด</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>

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
		
		axios({
			  method: "post",
			  url: "criterionData",
			}).then(function (response) {
				
				$.each(response.data, function(i, data) {
					
						var newRow = document.createElement("tr")
						var newCell0 = document.createElement("td")
					    var newCell1 = document.createElement("td")
					    var newCell2 = document.createElement("td")
					    var newCell3 = document.createElement("td")
					    var newCell4 = document.createElement("td")
					    var newCell5 = document.createElement("td")
					    
					    newCell0.innerHTML = "<p>"+response.data[i].detail+"</p>"
					    newCell1.innerHTML = "<p>"+response.data[i].score+"</p>"
					    
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
					    newCell4.innerHTML = "<button type='button' onClick='ShowCriterionModal(\""+ response.data[i].detail +"\",\""+ response.data[i].score +"\",\""+ response.data[i].time_reg +"\",\""+ response.data[i].criterion_id +"\")' class='btn btn-warning' data-bs-toggle='modal' data-bs-target='#internshipModal'>ดูรายละเอียด</button>"
					    newCell5.innerHTML = "<button id='confirm' onClick='manegementStatus("+response.data[i].criterion_id+", 1)' class='btn btn-success'>ยืนยัน</button><button onClick='manegementStatus("+response.data[i].criterion_id+", 0)' class='btn btn-danger' id='cancel'>ปฏิเสธ</button>"
					    
					    newRow.append(newCell0)
					    newRow.append(newCell1)
					    newRow.append(newCell2)
					    newRow.append(newCell3)
					    newRow.append(newCell4)
					    newRow.append(newCell5)
					    document.getElementById("criterionData").appendChild(newRow)
	            });
	           
				$('#criterionTable').DataTable();
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
			  url: "getCriterionDetail",
			}).then(function (response) {
				
				$('#criterionSelect').append($('<option value="0"></option>'));
				
				$.each(response.data, function(i, data) {
	               	$('#criterionSelect').append($('<option value="' + response.data[i].criterion_id + '">' + response.data[i].detail + '</option>'));
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
			  url: "getResultInternshipForm",
			}).then(function (response) {
				
				$.each(response.data, function(i, data) {
					
						var newRow = document.createElement("tr")
						var newCell0 = document.createElement("td")
					    var newCell1 = document.createElement("td")
					    var newCell2 = document.createElement("td")
					    var newCell3 = document.createElement("td")
					    var newCell4 = document.createElement("td")
					    var newCell5 = document.createElement("td")
					    
					    newCell0.innerHTML = "<p>"+response.data[i].result_internship_name+"</p>"
					    newCell1.innerHTML = "<p>"+response.data[i].type+"</p>"
					    
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
					    newCell4.innerHTML = "<button type='button' onClick='ShowCriterionFormModal(\""+ response.data[i].result_internship_id +"\")' class='btn btn-info' data-bs-toggle='modal' data-bs-target='#previewCriterionFormodal'>ดูตัวอย่างแบบฟอร์ม</button>"
					    newCell5.innerHTML = "<button id='confirm_form' onClick='manegementCriterionFormStatus("+response.data[i].result_internship_id+", 1)' class='btn btn-success'>ยืนยัน</button><button onClick='manegementCriterionFormStatus("+response.data[i].result_internship_id+", 0)' class='btn btn-danger' id='cancel_form'>ปฏิเสธ</button>"
					    
					    newRow.append(newCell0)
					    newRow.append(newCell1)
					    newRow.append(newCell2)
					    newRow.append(newCell3)
					    newRow.append(newCell4)
					    newRow.append(newCell5)
					    document.getElementById("criterionFormData").appendChild(newRow)
	            });
	           
				$('#criterionFormTable').DataTable();
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
	
	var i = 1
	function addSkillDatatable() {
		
		var x = document.getElementById("criterionSelect");
		var e = document.getElementById("level");
		
		if(x.options[x.selectedIndex].value != "0" && e.options[e.selectedIndex].value != "0") {
			
			var language = x.options[x.selectedIndex].text;
			var level = e.options[e.selectedIndex].text;
			
			var newRow = document.createElement("tr")
			var newCell0 = document.createElement("td")
		    var newCell1 = document.createElement("td")
		    var newCell2 = document.createElement("td")
		    var newCell3 = document.createElement("td")
		    
		    newCell0.innerHTML = i++
		    newCell1.innerHTML = language+'<input type="hidden" id="criterion_id" value="'+x.options[x.selectedIndex].value+'">'
		    newCell2.innerHTML = level
		    newCell3.innerHTML = "<i class='fa fa-close' style='color: red'></i>"
		    
		    newRow.append(newCell0)
		    newRow.append(newCell1)
		    newRow.append(newCell2)
		    newRow.append(newCell3)
		    document.getElementById("data_language").appendChild(newRow)
		    
		    $("#criterionSelect").val(0).change();
			$("#level").val(0).change();
			
		} else {
	Swal.fire({
				icon: 'warning',
				title: 'กรุณากรอกข้อมูลเกณฑ์การประเมิน',
				showConfirmButton: false,
				timer: 3000
			})
		}
		
	}

	$(document).on('click', 'i', function () {
	    $(this).closest('tr').remove();
	    return false;
	});
	
	function getCriterionDatatable() {
		
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
		
		var criterion = []
		
		table.children("tbody").find("input").each(function() {
			criterion.push($(this).prop("value"))
			
		});
		
		var data = []
		var subData = []
		
		for(var j = 0; j < criterion.length; j++) {
			subData = []
			
			subData.push(criterion[j])
			subData.push(skill[j][1])
			
			data.push(subData)
			
		}
		
		
		return data
		
		
	}
	
	function insertCriterion() {
		
		document.getElementById('spinner').style.display = 'block';
		$(':button').prop('disabled', true);
		
		var nameCriterion = document.getElementById('nameCriterion').value
		var scoreCriterion = document.getElementById('scoreCriterion').value
		
		if(nameCriterion != '' && scoreCriterion != '' && parseInt(scoreCriterion) > 0) {
			
		const data = $.getJSON('https://api.ipify.org?format=json', function(data){
			
			var ip = data.ip
			
			axios({
				  method: "post",
				  url: "insertCriterion",
				  data: "name_criterion="+nameCriterion+"&score_riterion="+scoreCriterion+"&ip="+ip,
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
		});
		} else {
			Swal.fire({
				  icon: 'warning',
				  title: 'กรุณากรอกข้อมูลเกณฑ์ให้ครบ',
				  showConfirmButton: false,
				  timer: 3000
				})
				
				$(':button').prop('disabled', false);
			document.getElementById('spinner').style.display = 'none';
			
		}
		
	}
	
function ShowCriterionModal(detail, score, time_reg, criterion_id) {
		
		document.getElementById('nameCriterionModal').value = detail
		document.getElementById('scoreCriterionModal').value = score
		document.getElementById('timeRegCriterionModal').value = time_reg
		document.getElementById('idCriterionModal').value = criterion_id
		
		
	}
	
	
function updateCriterion() {
	
	document.getElementById('spinner1').style.display = 'block';
	$(':button').prop('disabled', true);
	
	const data = $.getJSON('https://api.ipify.org?format=json', function(data){
		
		criterion_id = document.getElementById('idCriterionModal').value
		detail = document.getElementById('nameCriterionModal').value
		score = document.getElementById('scoreCriterionModal').value
		ip = data.ip
		
		if(criterion_id != '' && detail != '' && score != '' && ip != '') {
			
			axios({
				  method: "post",
				  url: "updateCriterion",
				  data: "criterion_id="+criterion_id+"&detail="+detail+"&score="+score+"&ip="+ip,
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

function manegementStatus(criterion_id, status) {
	
	document.getElementById('spinner2').style.display = 'block';
	$(':button').prop('disabled', true);
	
	const data = $.getJSON('https://api.ipify.org?format=json', function(data){
			
		ip = data.ip
			
		if(criterion_id != '') {
				
			axios({
				  method: "post",
				  url: "updateStatusCriterion",
				  data: 'criterion_id=' + criterion_id +'&status=' +status +'&ip='+ip,
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
				  title: 'กรุณาเลือกเกณฑ์การประเมิน',
				  showConfirmButton: false,
				  timer: 3000
				})
				
				$(':button').prop('disabled', false);
				document.getElementById('spinner2').style.display = 'none';
			}
			
		});
		
			
		}
		
function insertCriterionForm() {
	

	document.getElementById('spinner3').style.display = 'block';
	$(':button').prop('disabled', true);
	
	const data = $.getJSON('https://api.ipify.org?format=json', function(data){
		
		
		var criterion_data = getCriterionDatatable()
		var ip = data.ip
		var result_internship_name = document.getElementById('nameCriterionFormModal').value
		var formType = document.getElementById('formType').value
		
		if(criterion_data.length != 0 && ip != '' && result_internship_name != '' && formType != '' && formType != '0') {
			
		const data = $.getJSON('https://api.ipify.org?format=json', function(data){
			
			var ip = data.ip
			
			axios({
				  method: "post",
				  url: "insertInternshipCriterionForm",
				  data: "criterion_data="+JSON.stringify(criterion_data)+"&ip="+ip+"&result_internship_name="+result_internship_name+"&form_type="+formType,
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
						  document.getElementById('spinner3').style.display = 'none';
						} else if(response.data.alert == "2") {
						  
						  Swal.fire({
						      icon: "warning",
						    title: response.data.status,
						    showConfirmButton: false,
						    timer: 3000
						    })
						    
						    $(':button').prop('disabled', false);
						  document.getElementById('spinner3').style.display = 'none';
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
					document.getElementById('spinner3').style.display = 'none';
				  });
		});
		} else {
			Swal.fire({
				  icon: 'warning',
				  title: 'กรุณากรอกข้อมูลให้ครบ',
				  showConfirmButton: false,
				  timer: 3000
				})
				
				$(':button').prop('disabled', false);
			document.getElementById('spinner3').style.display = 'none';
			
		}
		
	});
	
	
	
}


function manegementCriterionFormStatus(result_internship_id, status) {
	

	document.getElementById('spinner4').style.display = 'block';
	$(':button').prop('disabled', true);
	
	const data = $.getJSON('https://api.ipify.org?format=json', function(data){
			
		ip = data.ip
			
		if(result_internship_id != '') {
				
			axios({
				  method: "post",
				  url: "updateStatusCriterionForm",
				  data: 'result_internship_id=' + result_internship_id +'&status=' +status +'&ip='+ip,
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
					  document.getElementById('spinner4').style.display = 'none';
					} else if(response.data.alert == "2") {
					  
					  Swal.fire({
					      icon: "warning",
					    title: response.data.status,
					    showConfirmButton: false,
					    timer: 3000
					    })
					    
					    $(':button').prop('disabled', false);
					  document.getElementById('spinner4').style.display = 'none';
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
					document.getElementById('spinner4').style.display = 'none';
				  });
			} else {
				Swal.fire({
				  icon: 'warning',
				  title: 'กรุณาเลือกเกณฑ์การประเมิน',
				  showConfirmButton: false,
				  timer: 3000
				})
				
				$(':button').prop('disabled', false);
				document.getElementById('spinner4').style.display = 'none';
			}
			
		});
		
			
		}
		
function ShowCriterionFormModal(result_internship_id) {
	
	if(result_internship_id != '') {
		
		
		axios({
			  method: "post",
			  url: "getCriterionFormData",
			  data: "result_internship_id="+result_internship_id,
			}).then(function (response) {
				
				var form = ''
				
				$.each(response.data, function(i, data) {
	             	
	             	if(response.data[i].input_type == 'ช่องเพิ่มข้อความ') {
	             		
	             		form += '<div class="row"><div class="col-sm-2 col-md-3 col-lg-2"><p>'+response.data[i].detail+'</p></div><div class="col-sm-3 col-md-3 col-lg-3"><div class="form-floating "><input type="text" class="form-control" id="nameCriterionFormModal" placeholder="ชื่อเกณฑ์การประเมิน" name="nameCriterionFormModal"> <label for="name">คะแนน</label></div></div></div>'
	             		
	             	} else if(response.data[i].input_type == 'ช่องเพิ่มตัวเลข') {
	             		
	             		form += '<div class="row"><div class="col-sm-2 col-md-3 col-lg-2"><p>'+response.data[i].detail+'</p></div><div class="col-sm-3 col-md-3 col-lg-3"><div class="form-floating "><input type="number" min="1" class="form-control" id="nameCriterionFormModal" placeholder="ชื่อเกณฑ์การประเมิน" name="nameCriterionFormModal"> <label for="name">คะแนน</label></div></div></div>'
	             		
	             	}
	             	
	             	
	             	
	         });
				
				document.getElementById('formDynamic').innerHTML = form
				
		  })
		  .catch(function (response) {
			Swal.fire({
			icon: 'error',
			title: 'ไม่สามารถทำรายการได้ในขณะนี้',
			showConfirmButton: false,
			timer: 3000
		})
		  });
		
		
		
	}
	
	
}
	
	</script>