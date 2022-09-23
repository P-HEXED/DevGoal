<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>จัดการข้อมูลสถานศึกษา</title>
<link rel="stylesheet" href="resources/stylecss/style_user.css">
<link href="resources/images/logo/devgoal_logo.png" size="16x16" rel="shortcut icon" type="image/png" />
<script src="https://unpkg.com/htmlincludejs"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script> 
<script type="text/javascript" src="resources/js/loading.js"></script>
<link rel="stylesheet" href="resources/stylecss/loading_axios.css">
</head>
<body>
<div class="ring">DEVGOAL<span class="loading"></span></div>
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
						<h4>จัดการข้อมูลสถานศึกษา</h4>
						<div class="card" id="ins">
							<div class="card-header"> <h4>เพิ่มมหาวิทยาลัย</h4> </div>
							<div class="card-body">
								<div class="row">
									<div class="col-lg-12 col-sm-12">
										<form>
											<div class="row">
												<div class="col-sm-12 col-md-6 col-lg-4">
													<div class="form-floating ">
														<input type="text" class="form-control" id="universityNameInsert"
															placeholder="ชื่อมหาวิทยาลัย" name="name"> <label
															for="name">ชื่อมหาวิทยาลัย</label>
													</div>
												</div>
												<div class="col-sm-12 col-md-6 col-lg-3">
													<div class="form-floating ">
														<input type="text" class="form-control" id="universitySortNameInsert"
															placeholder="ชื่อย่อ (ภาษาอังกฤษ เช่น msu)" name="initial"> <label
															for="initial">ชื่อย่อ (ภาษาอังกฤษ เช่น msu)</label>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-sm-12 col-md-6 col-lg-2">
													<div class="form-floating ">
														<input type="text" class="form-control" id="universityAddress1Insert"
															placeholder="ประเทศ" name="country"> <label
															for="country">ประเทศ</label>
													</div>
												</div>
												<div class="col-sm-12 col-md-6 col-lg-2">
													<div class="form-floating ">
														<input type="text" class="form-control" id="universityAddress2Insert"
															placeholder="จังหวัด" name="province"> <label
															for="province">จังหวัด</label>
													</div>
												</div>
												<div class="col-sm-12 col-md-6 col-lg-2">
													<div class="form-floating ">
														<input type="text" class="form-control" id="universityAddress3Insert"
															placeholder="อำเภอ" name="district"> <label
															for="district">อำเภอ</label>
													</div>
												</div>
												<div class="col-sm-12 col-md-6 col-lg-2">
													<div class="form-floating ">
														<input type="text" class="form-control" id="universityAddress4Insert"
															placeholder="ตำบล" name="locality"> <label
															for="locality">ตำบล</label>
													</div>
												</div>
												<div class="col-sm-12 col-md-6 col-lg-2">
													<div class="form-floating ">
														<input type="number" class="form-control" id="universityAddress5Insert"
															placeholder="รหัสไปรษณีย์" name="zipcode" min="1"> <label
															for="zipcode" >รหัสไปรษณีย์</label>
													</div>
												</div>
											</div>
											</br>
											<button type="button" onClick="insertUniversity()" class="btn btn-primary" style="float: right;">บันทึก</button>
										</form>
										
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
							</div>
						</div>
					</div>

					<div class="card-container">
						<div class="card" id="ins">
							<div class="card-header"><h4>เพิ่มคณะ</h4> </div>
							<div class="card-body">
								<div class="row">
									<div class="col-lg-12">
										<form>
											<div class="row">
												<div class="col-sm-12 col-md-6 col-lg-3">
													<div class="form-floating ">
														<input type="text" class="form-control" id="facultyNameInsert"
															placeholder="คณะ" name="fact"> <label for="fact">คณะ</label>
													</div>
												</div>
												<div class="col-sm-12 col-md-6 col-lg-3">
													<select class="form-select" id="facultyUniversityInsert">
													</select>
												</div>
											</div>
											</br>
											<button type="button" onClick="insertFaculty()" class="btn btn-primary" style="float: right;">บันทึก</button>
										</form>
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
					</div>

					<div class="card-container">
						<div class="card" id="ins">
							<div class="card-header"> <h4>เพิ่มหลักสูตร</h4> </div>
							<div class="card-body">
								<div class="row">
									<div class="col-lg-12">
										<form>
											<div class="row">
												<div class="col-sm-12 col-md-6 col-lg-3">
													<div class="form-floating ">
														<input type="text" class="form-control" id="courseNameInsert"
															placeholder="คณะ" name="fact"> <label for="fact">หลักสูตร</label>
													</div>
												</div>
												<div class="col-sm-12 col-md-6 col-lg-3">
													<select class="form-select" id="courseUniversityIdInsert">
													</select>
												</div>
												<div class="col-sm-12 col-md-6 col-lg-3">
													<select class="form-select" id="courseFacutyIdInsert">
													</select>
												</div>
											</div>
											</br>
											<button type="button" onClick="insertCourse()" class="btn btn-primary" style="float: right;">บันทึก</button>
										</form>
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
							</div>
						</div>
					</div>

					<div class="table-container col-sm-12 col-md-12 col-lg-12 table-responsive">
						<h4>ตารางแก้ไขข้อมูลมหาวิทยาลัย</h4>
						<div class="table-overflow">
						<table class="table text-center "id="universityDataTable">
							<thead class="table-dark">
								<tr>
									<th>มหาวิทยาลัย</th>
									<th>ชื่อย่อ</th>
									<th>สถานะ</th>
									<th>เวลาที่บันทึก</th>
									<th></th>
									<th></th>
								</tr>
							</thead>
							<tbody id="universityTable">
							</tbody>
						</table>
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

					<div class="table-container table-responsive col-sm-12 col-md-12 col-lg-12">
						<h4>ตารางแก้ไขข้อมูลคณะ</h4>
						<div class="table-overflow">
						<table class="table text-center "id="facultyDataTable">
							<thead class="table-dark">
								<tr>
									<th>คณะ</th>
									<th>มหาวิทยาลัย</th>
									<th>สถานะ</th>
									<th>เวลาที่บันทึก</th>
									<th></th>
									<th></th>
								</tr>
							</thead>
							<tbody id="facultyTable">
							</tbody>
						</table>
						</div>
						<div class="lds-roller" id="spinner5" style="display: none;">
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

					<div class="table-container table-responsive col-sm-12 col-md-12 col-lg-12">
						<h4>ตารางแก้ไขข้อมูลสาขา</h4>
						<div class="table-overflow">
						<table class="table text-center "id="courseDataTable">
							<thead class="table-dark" >
								<tr>
									<th>หลักสูตร</th>
									<th>คณะ</th>
									<th>มหาวิทยาลัย</th>
									<th>สถานะ</th>
									<th>เวลาที่บันทึก</th>
									<th></th>
									<th></th>
								</tr>
							</thead>
							<tbody id="courseTable">
							</tbody>
						</table>
						</div>
						<div class="lds-roller" id="spinner7" style="display: none;">
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


			<div class="modal fade" id="universityModal">
				<div
					class="modal-dialog modal-xl modal-fullscreen-lg-down modal-dialog-centered">
					<div class="modal-content" id="update">
						<div class="modal-header">
							<h5 class="modal-title">แก้ไขข้อมูลมหาวิทยาลัย</h5>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col-lg-12">
									<form>
										<div class="row">
											<div class="col-sm-12 col-md-6 col-lg-4">
												<div class="form-floating ">
													<input type="text" class="form-control" id="universityNameModal"
														placeholder="ชื่อมหาวิทยาลัย" name="universityNameModal"> <label
														for="name">มหาวิทยาลัย</label>
												</div>
											</div>
											<div class="col-sm-12 col-md-6 col-lg-3">
												<div class="form-floating ">
													<input type="text" class="form-control" id="universitySortNameModal"
														placeholder="ชื่อย่อ" name="universitySortNameModal"> <label
														for="initial">ชื่อย่อ</label>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-12 col-md-6 col-lg-3">
												<div class="form-floating ">
													<input type="text" class="form-control" id="universityAddress1Modal"
														placeholder="ประเทศ" name="universityAddress1Modal"> <label
														for="country">ประเทศ</label>
												</div>
											</div>
											<div class="col-sm-12 col-md-6 col-lg-3">
												<div class="form-floating ">
													<input type="text" class="form-control" id="universityAddress2Modal"
														placeholder="จังหวัด" name="universityAddress2Modal"> <label
														for="province">จังหวัด</label>
												</div>
											</div>
											<div class="col-sm-12 col-md-6 col-lg-3">
												<div class="form-floating ">
													<input type="text" class="form-control" id="universityAddress3Modal"
														placeholder="อำเภอ" name="universityAddress3Modal"> <label
														for="district">อำเภอ</label>
												</div>
											</div>
											<div class="col-sm-12 col-md-6 col-lg-3">
												<div class="form-floating ">
													<input type="text" class="form-control" id="universityAddress4Modal"
														placeholder="ตำบล" name="universityAddress4Modal"> <label
														for="locality">ตำบล</label>
												</div>
											</div>
											<div class="col-sm-12 col-md-6 col-lg-3">
												<div class="form-floating ">
													<input type="text" class="form-control" id="universityAddress5Modal"
														placeholder="รหัสไปรษณีย์" name="universityAddress5Modal"> <label
														for="zipcode">รหัสไปรษณีย์</label>
												</div>
											</div>
											<div class="col-sm-12 col-md-6 col-lg-3">
												<div class="form-floating ">
													<input type="text" class="form-control" id="universityTimeRegModal"
														placeholder="เวลาที่บันทึก" name="universityTimeRegModal" disabled> <label
														for="zipcode">เวลาที่บันทึก</label>
												</div>
												<input type="hidden" id="universityIdModal" value=""></input>
											</div>
										</div>
									</form>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" onClick="universityUpdateData()" class="btn btn-primary">บันทึก</button>
								<button type="button" class="btn btn-danger"
									data-bs-dismiss="modal">ยกเลิก</button>
							</div>
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
				</div>
			</div>

			<div class="modal fade" id="facultyModal">
				<div
					class="modal-dialog modal-xl modal-fullscreen-lg-down modal-dialog-centered">
					<div class="modal-content" id="update">
						<div class="modal-header">
							<h5 class="modal-title">แก้ไขข้อมูลคณะ</h5>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col-lg-12">
									<form>
										<div class="row">
											<div class="col-sm-12 col-md-6 col-lg-3">
												<div class="form-floating ">
													<input type="text" class="form-control" id="facultyUniversityNameModal"
														placeholder="ชื่อมหาวิทยาลัย" name="facultyUniversityNameModal" disabled>
													<label for="name">มหาวิทยาลัย</label>
												</div>
											</div>
											<div class="col-sm-12 col-md-6 col-lg-3">
												<div class="form-floating ">
													<input type="text" class="form-control" id="facultyNameModal"
														placeholder="คณะ" name="facultyNameModal"> <label for="fact">คณะ</label>
												</div>
											</div>
											<div class="col-sm-12 col-md-6 col-lg-3">
												<div class="form-floating ">
													<input type="text" class="form-control" id="facultyTimeRegModal"
														placeholder="เวลาที่บันทึก" name="facultyTimeRegModal" disabled> <label
														for="zipcode">เวลาที่บันทึก</label>
												</div>
											</div>
											<input type="hidden" id="facultyIdModal" value=""></input>
										</div>
									</form>
									<div class="modal-footer">
										<button type="button" class="btn btn-primary" onClick="facultyUpdateData()">บันทึก</button>
										<button type="button" class="btn btn-danger"
											data-bs-dismiss="modal">ยกเลิก</button>
									</div>
									<div class="lds-roller" id="spinner6" style="display: none;">
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
				</div>
			</div>

			<div class="modal fade" id="courseModal">
				<div
					class="modal-dialog modal-xl modal-fullscreen-lg-down modal-dialog-centered">
					<div class="modal-content" id="update">
						<div class="modal-header">
							<h5 class="modal-title">แก้ไขข้อมูลหลักสูตร</h5>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col-lg-12">
									<form>
										<div class="row">
											<div class="col-sm-12 col-md-6 col-lg-3">
												<div class="form-floating ">
													<input type="text" class="form-control" id="courseUniversityNameModal"
														placeholder="ชื่อมหาวิทยาลัย" name="courseUniversityNameModal" disabled>
													<label for="name">มหาวิทยาลัย</label>
												</div>
											</div>
											<div class="col-sm-12 col-md-6 col-lg-3">
												<div class="form-floating ">
													<input type="text" class="form-control" id="courseFacultyNameModal"
														placeholder="คณะ" name="courseFacultyNameModal" disabled> <label for="bran">คณะ</label>
												</div>
											</div>
											<div class="col-sm-12 col-md-6 col-lg-3">
												<div class="form-floating ">
													<input type="text" class="form-control" id="courseNameModal"
														placeholder="หลักสูตร" name="courseNameModal"> <label for="bran">หลักสูตร</label>
												</div>
											</div>
											<div class="col-sm-12 col-md-6 col-lg-3">
												<div class="form-floating ">
													<input type="text" class="form-control" id="courseTimeRegModal"
														placeholder="เสลาที่บันทึก" name="courseTimeRegModal" disabled> <label for="bran">ที่เวลาที่บันทึก</label>
												</div>
											</div>
											<input type="hidden" id="courseIdModal" value=""></input>
										</div>
									</form>
									<div class="modal-footer">
										<button type="button" class="btn btn-primary" onClick="courseUpdateData()">บันทึก</button>
										<button type="button" class="btn btn-danger"
											data-bs-dismiss="modal">ยกเลิก</button>
									</div>
									<div class="lds-roller" id="spinner8" style="display: none;">
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
		  url: "findUniversityData",
		}).then(function (response) {
			
			$.each(response.data, function(i, data) {
				
					var newRow = document.createElement("tr")
					var newCell0 = document.createElement("td")
				    var newCell1 = document.createElement("td")
				    var newCell2 = document.createElement("td")
				    var newCell3 = document.createElement("td")
				    var newCell4 = document.createElement("td")
				    var newCell5 = document.createElement("td")
				    
				    newCell0.innerHTML = "<p>"+response.data[i].name+"</p>"
				    newCell1.innerHTML = "<p>"+response.data[i].sort_name+"</p>"
				    
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
				    newCell4.innerHTML = "<button type='button' onClick='ShowUniversityModal(\""+ response.data[i].university_id +"\",\""+ response.data[i].name +"\",\""+ response.data[i].sort_name +"\",\""+ response.data[i].time_reg +"\",\""+ response.data[i].address1 +"\",\""+ response.data[i].address2 +"\",\""+ response.data[i].address3 +"\",\""+ response.data[i].address4 +"\",\""+ response.data[i].address5 +"\")' class='btn btn-warning' data-bs-toggle='modal' data-bs-target='#universityModal'>ดูรายละเอียด</button>"
				    newCell5.innerHTML = "<button onClick='universityStatusManagement("+response.data[i].university_id+", 1)' class='btn btn-success'>ยืนยัน</button><button onClick='universityStatusManagement("+response.data[i].university_id+", 0)' class='btn btn-danger'>ปฏิเสธ</button>"
				    
				    newRow.append(newCell0)
				    newRow.append(newCell1)
				    newRow.append(newCell2)
				    newRow.append(newCell3)
				    newRow.append(newCell4)
				    newRow.append(newCell5)
				    document.getElementById("universityTable").appendChild(newRow)
            });
			$('#universityDataTable').DataTable();
			
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
		  url: "findFacultyData",
		}).then(function (response) {
			
			$.each(response.data, function(i, data) {
				
					var newRow = document.createElement("tr")
					var newCell0 = document.createElement("td")
				    var newCell1 = document.createElement("td")
				    var newCell2 = document.createElement("td")
				    var newCell3 = document.createElement("td")
				    var newCell4 = document.createElement("td")
				    var newCell5 = document.createElement("td")
				    
				    newCell0.innerHTML = "<p>"+response.data[i].faculty_name+"</p>"
				    newCell1.innerHTML = "<p>"+response.data[i].university_name+"</p>"
				    
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
				    newCell4.innerHTML = "<button type='button' onClick='ShowFacultyModal(\""+ response.data[i].faculty_id +"\",\""+ response.data[i].faculty_name +"\",\""+ response.data[i].time_reg +"\",\""+ response.data[i].university_name +"\")' class='btn btn-warning' data-bs-toggle='modal' data-bs-target='#facultyModal'>ดูรายละเอียด</button>"
				    newCell5.innerHTML = "<button onClick='facultyStatusManagement("+response.data[i].faculty_id+", 1)' class='btn btn-success'>ยืนยัน</button><button onClick='facultyStatusManagement("+response.data[i].faculty_id+", 0)' class='btn btn-danger'>ปฏิเสธ</button>"
				    
				    newRow.append(newCell0)
				    newRow.append(newCell1)
				    newRow.append(newCell2)
				    newRow.append(newCell3)
				    newRow.append(newCell4)
				    newRow.append(newCell5)
				    document.getElementById("facultyTable").appendChild(newRow)
          });
			 $('#facultyDataTable').DataTable();
			
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
		  url: "findCourseData",
		}).then(function (response) {
			
			$.each(response.data, function(i, data) {
				
					var newRow = document.createElement("tr")
					var newCell0 = document.createElement("td")
				    var newCell1 = document.createElement("td")
				    var newCell2 = document.createElement("td")
				    var newCell3 = document.createElement("td")
				    var newCell4 = document.createElement("td")
				    var newCell5 = document.createElement("td")
				    var newCell6 = document.createElement("td")
				    
				    newCell0.innerHTML = "<p>"+response.data[i].course_name+"</p>"
				    newCell1.innerHTML = "<p>"+response.data[i].faculty_name+"</p>"
				    newCell2.innerHTML = "<p>"+response.data[i].university_name+"</p>"
				    
					var cell2 = ''
					    
					    if(response.data[i].status == "ไม่ผ่านการยืนยัน") {
					    	
					    	cell2 = "<span class='badge badge-danger rounded-pill d-inline'>"+response.data[i].status+"</span>"
					    	
					    }else if(response.data[i].status == "ยืนยันแล้ว") {
					    	
					    	cell2 = "<span class='badge badge-success rounded-pill d-inline'>"+response.data[i].status+"</span>"
					    	
					    }else if(response.data[i].status == "รอการตรวจสอบ") {
					    	
					    	cell2 = "<span class='badge badge-warning rounded-pill d-inline'>"+response.data[i].status+"</span>"
					    	
					    }
				    
				    newCell3.innerHTML = cell2
				    newCell4.innerHTML = "<p>"+response.data[i].time_reg+"</p>"
				    newCell5.innerHTML = "<button type='button' onClick='ShowCourseModal(\""+ response.data[i].course_id +"\",\""+ response.data[i].course_name +"\",\""+ response.data[i].faculty_name +"\",\""+ response.data[i].university_name +"\",\""+ response.data[i].time_reg +"\")' class='btn btn-warning' data-bs-toggle='modal' data-bs-target='#courseModal'>ดูรายละเอียด</button>"
				    newCell6.innerHTML = "<button onClick='courseStatusManagement("+response.data[i].course_id+", 1)' class='btn btn-success'>ยืนยัน</button><button onClick='courseStatusManagement("+response.data[i].course_id+", 0)' class='btn btn-danger'>ปฏิเสธ</button>"
				    
				    newRow.append(newCell0)
				    newRow.append(newCell1)
				    newRow.append(newCell2)
				    newRow.append(newCell3)
				    newRow.append(newCell4)
				    newRow.append(newCell5)
				    newRow.append(newCell6)
				    document.getElementById("courseTable").appendChild(newRow)
        });
			$('#courseDataTable').DataTable();
			
		})
		  .catch(function (response) {
			Swal.fire({
				icon: 'error',
				title: 'ไม่สามารถทำรายการได้ในขณะนี้',
				showConfirmButton: false,
				timer: 3000
			})
		  });
	
		$('#facultyUniversityInsert').append($('<option value="0">เลือกมหาวิทยาลัย</option>'));
		$('#courseUniversityIdInsert').append($('<option value="0">เลือกมหาวิทยาลัย</option>'));
		$('#courseFacutyIdInsert').append($('<option value="0">เลือกคณะ</option>'));
		
		axios({
			  method: "post",
			  url: "findUniversity",
			}).then(function (response) {
				$.each(response.data, function(i, data) {
	               	$('#facultyUniversityInsert').append($('<option value="' + response.data[i].university_id + '">' + response.data[i].name + '</option>'));
	               	$('#courseUniversityIdInsert').append($('<option value="' + response.data[i].university_id + '">' + response.data[i].name + '</option>'));
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
	
	$('#courseUniversityIdInsert').change(function() {
		
		$('#courseFacutyIdInsert').empty()
	
		var university_id = $(this).val()
		
	    if (university_id !== '') {
	    	
	    	$('#courseFacutyIdInsert').append($('<option value="0">เลือกคณะ</option>'));
	    	
	    	axios({
				  method: "post",
				  url: "findFacultyByUniversity",
				  data: 'university_id='+university_id,
				}).then(function (response) {
					
					$.each(response.data, function(i, data) {
		                 $('#courseFacutyIdInsert').append($('<option value="' + response.data[i].faculty_id + '">' + response.data[i].name + '</option>'));
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

	    }
	});
	
	function ShowUniversityModal(university_id, name, sort_name, time_reg, address1, address2, address3, address4, address5) {
		
		document.getElementById('universityNameModal').value = name
		document.getElementById('universitySortNameModal').value = sort_name
		document.getElementById('universityAddress1Modal').value = address1
		document.getElementById('universityAddress2Modal').value = address2
		document.getElementById('universityAddress3Modal').value = address3
		document.getElementById('universityAddress4Modal').value = address4
		document.getElementById('universityAddress5Modal').value = address5
		document.getElementById('universityTimeRegModal').value = time_reg
		document.getElementById('universityIdModal').value = university_id
		
	}
	
	function universityUpdateData() {
		
		document.getElementById('spinner4').style.display = 'block';
		$(':button').prop('disabled', true);
		
		const data = $.getJSON('https://api.ipify.org?format=json', function(data){
			
			id = document.getElementById('universityIdModal').value
			name = document.getElementById('universityNameModal').value
			sort_name = document.getElementById('universitySortNameModal').value
			address1 = document.getElementById('universityAddress1Modal').value
			address2 = document.getElementById('universityAddress2Modal').value
			address3 = document.getElementById('universityAddress3Modal').value
			address4 = document.getElementById('universityAddress4Modal').value
			address5 = document.getElementById('universityAddress5Modal').value
			ip = data.ip
			
			if(id != '' && name != '' && sort_name != '' && address1 != '' && address2 != '' && address3 != '' && address4 != '' && address5 != '' && ip != '') {
				
				axios({
					  method: "post",
					  url: "universityUpdate",
					  data: 'university_id=' +id+ '&university_name=' + name + '&short_name=' + sort_name + '&address1=' + address1 + '&address2=' + address2 + '&address3=' + address3 + '&address4=' + address4 + '&address5=' + address5 + '&ip=' + ip,
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
					  title: 'กรุณากรอกข้อมูลให้ครบ',
					  showConfirmButton: false,
					  timer: 3000
					})
					$(':button').prop('disabled', false);
				document.getElementById('spinner4').style.display = 'none';
			}
			
		});
	}
	
	function universityStatusManagement(university_id, status) {
		
		document.getElementById('spinner3').style.display = 'block';
		$(':button').prop('disabled', true);
		 
	const data = $.getJSON('https://api.ipify.org?format=json', function(data){
			
			ip = data.ip
			
			if(university_id != '' && ip != '') {
				
				axios({
					  method: "post",
					  url: "universityUpdateStatus",
					  data: 'university_id=' +university_id + '&ip=' + ip + '&status=' + status,
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
	
	function ShowFacultyModal(faculty_id, faculty_name, time_reg, university_name) {
			
			document.getElementById('facultyNameModal').value = faculty_name
			document.getElementById('facultyUniversityNameModal').value = university_name
			document.getElementById('facultyTimeRegModal').value = time_reg
			document.getElementById('facultyIdModal').value = faculty_id
			
		}
		
	function facultyUpdateData() {
		
		document.getElementById('spinner6').style.display = 'block';
		$(':button').prop('disabled', false);
		
		const data = $.getJSON('https://api.ipify.org?format=json', function(data){
			
			id = document.getElementById('facultyIdModal').value
			name = document.getElementById('facultyNameModal').value
			ip = data.ip
			
			if(name != '' && id != '' && ip != '') {
				
				axios({
					  method: "post",
					  url: "facultyUpdate",
					  data: 'faculty_name=' + name +'&faculty_id=' + id +'&ip='+ip,
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
						  document.getElementById('spinner6').style.display = 'none';
						} else if(response.data.alert == "2") {
						  
						  Swal.fire({
						      icon: "warning",
						    title: response.data.status,
						    showConfirmButton: false,
						    timer: 3000
						    })
						    
						    $(':button').prop('disabled', false);
						  document.getElementById('spinner6').style.display = 'none';
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
						document.getElementById('spinner6').style.display = 'none';
					  });
			} else {
				Swal.fire({
					  icon: 'warning',
					  title: 'กรุณากรอกข้อมูลให้ครบ',
					  showConfirmButton: false,
					  timer: 3000
					})
					
					$(':button').prop('disabled', false);
				document.getElementById('spinner6').style.display = 'none';
			}
			
		});
		
		
	}
	
	function facultyStatusManagement(faculty_id, status) {
		
		document.getElementById('spinner5').style.display = 'block';
		$(':button').prop('disabled', true);
		
	const data = $.getJSON('https://api.ipify.org?format=json', function(data){
			
			ip = data.ip
			
			if(faculty_id != '' && ip != '') {
				
				axios({
					  method: "post",
					  url: "facultyUpdateStatus",
					  data: 'faculty_id=' + faculty_id +'&ip='+ip + '&status=' + status,
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
						  document.getElementById('spinner5').style.display = 'none';
						} else if(response.data.alert == "2") {
						  
						  Swal.fire({
						      icon: "warning",
						    title: response.data.status,
						    showConfirmButton: false,
						    timer: 3000
						    })
						    
						    $(':button').prop('disabled', false);
						  document.getElementById('spinner5').style.display = 'none';
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
						  document.getElementById('spinner5').style.display = 'none';
					  });
			} else {
				Swal.fire({
					  icon: 'warning',
					  title: 'กรุณากรอกข้อมูลให้ครบ',
					  showConfirmButton: false,
					  timer: 3000
					})
					
					$(':button').prop('disabled', false);
				document.getElementById('spinner5').style.display = 'none';
			}
			
		});
		
	}
	
	function ShowCourseModal(course_id, course_name, faculty_name, university_name, time_reg) {
		
		document.getElementById('courseUniversityNameModal').value = university_name
		document.getElementById('courseFacultyNameModal').value = faculty_name
		document.getElementById('courseNameModal').value = course_name
		document.getElementById('courseTimeRegModal').value = time_reg
		document.getElementById('courseIdModal').value = course_id
		
	}
	
	function courseUpdateData() {
		
		document.getElementById('spinner8').style.display = 'block';
		$(':button').prop('disabled', true);
		
	const data = $.getJSON('https://api.ipify.org?format=json', function(data){
			
			
			name = document.getElementById('courseNameModal').value
			id = document.getElementById('courseIdModal').value
			ip = data.ip
			
			if(name != '' && id != '' && ip != '') {
				
				axios({
					  method: "post",
					  url: "courseUpdate",
					  data: 'course_name=' + name +'&course_id=' + id +'&ip='+ip,
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
						  document.getElementById('spinner8').style.display = 'none';
						} else if(response.data.alert == "2") {
						  
						  Swal.fire({
						      icon: "warning",
						    title: response.data.status,
						    showConfirmButton: false,
						    timer: 3000
						    })
						    
						    $(':button').prop('disabled', false);
						  document.getElementById('spinner8').style.display = 'none';
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
						document.getElementById('spinner8').style.display = 'none';
					  });
			} else {
				Swal.fire({
					  icon: 'warning',
					  title: 'กรุณากรอกข้อมูลให้ครบ',
					  showConfirmButton: false,
					  timer: 3000
					})
					$(':button').prop('disabled', false);
				document.getElementById('spinner8').style.display = 'none';
			}
			
		});
	}
	
	function courseStatusManagement(course_id, status) {
		
		document.getElementById('spinner7').style.display = 'block';
		$(':button').prop('disabled', true);
		
	const data = $.getJSON('https://api.ipify.org?format=json', function(data){
			
			
			ip = data.ip
			
			if(course_id != '' && ip != '') {
				
				axios({
					  method: "post",
					  url: "courseUpdateStatus",
					  data: 'course_id=' + course_id +'&ip='+ip +'&status=' +status,
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
						  document.getElementById('spinner7').style.display = 'none';
						} else if(response.data.alert == "2") {
						  
						  Swal.fire({
						      icon: "warning",
						    title: response.data.status,
						    showConfirmButton: false,
						    timer: 3000
						    })
						    
						    $(':button').prop('disabled', false);
						  document.getElementById('spinner7').style.display = 'none';
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
						document.getElementById('spinner7').style.display = 'none';
					  });
			} else {
				Swal.fire({
					  icon: 'warning',
					  title: 'กรุณากรอกข้อมูลให้ครบ',
					  showConfirmButton: false,
					  timer: 3000
					})
					$(':button').prop('disabled', false);
				document.getElementById('spinner7').style.display = 'none';
			}
			
		});
		
	}
	
	function insertUniversity() {
		
		document.getElementById('spinner').style.display = 'block';
		$(':button').prop('disabled', true);
		
		const data = $.getJSON('https://api.ipify.org?format=json', function(data){
			
			name = document.getElementById('universityNameInsert').value
			sort_name = document.getElementById('universitySortNameInsert').value
			address1 = document.getElementById('universityAddress1Insert').value
			address2 = document.getElementById('universityAddress2Insert').value
			address3 = document.getElementById('universityAddress3Insert').value
			address4 = document.getElementById('universityAddress4Insert').value
			address5 = document.getElementById('universityAddress5Insert').value
			ip = data.ip
			
			if(name != '' && sort_name != '' && address1 != '' && address2 != '' && address3 != '' && address4 != '' && address5 != '' && ip != '') {
				
				axios({
					  method: "post",
					  url: "universityInsert",
					  data: 'university_name=' + name + '&short_name=' + sort_name + '&address1=' + address1 + '&address2=' + address2 + '&address3=' + address3 + '&address4=' + address4 + '&address5=' + address5 + '&ip=' + ip,
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
	
	function insertFaculty() {
		
		document.getElementById('spinner1').style.display = 'block';
		$(':button').prop('disabled', true);
		
		const data = $.getJSON('https://api.ipify.org?format=json', function(data){
			
			name = document.getElementById('facultyNameInsert').value
			university = document.getElementById('facultyUniversityInsert').value
			ip = data.ip
			
			if(name != '' && university != '' && university != '0' && ip != '') {
				
				axios({
					  method: "post",
					  url: "facultyInsert",
					  data: 'faculty_name=' + name +'&university_id=' + university +'&ip='+ip,
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
	
	function insertCourse() {
		
		document.getElementById('spinner2').style.display = 'block';
		$(':button').prop('disabled', true);
		
		const data = $.getJSON('https://api.ipify.org?format=json', function(data){
			
			
			name = document.getElementById('courseNameInsert').value
			faculty = document.getElementById('courseFacutyIdInsert').value
			ip = data.ip
			
			if(name != '' && faculty != '' && faculty != '0' && ip != '') {
				
				axios({
					  method: "post",
					  url: "courseInsert",
					  data: 'course_name=' + name +'&faculty_id=' + faculty +'&ip='+ip,
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
					  title: 'กรุณากรอกข้อมูลให้ครบ',
					  showConfirmButton: false,
					  timer: 3000
					})
					
					$(':button').prop('disabled', false);
				document.getElementById('spinner2').style.display = 'none';
			}
			
		});
		
		
	}
</script>