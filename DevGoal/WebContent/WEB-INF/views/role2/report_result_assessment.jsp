<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ผลการประเมินการฝึกงานของนิสิต/นักศึกษา</title>
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
					<h4>ผลการประเมินการฝึกงานของนิสิต/นักศึกษา</h4>
					<span style="color: red;">*หากต้องการดูข้อมูลรายเทอม ให้ใส่ข้อมูลช่อง Search ปีการศึกษา/เทอม (เช่น 2565/1)</span>
				</div>
				
				<div class="table-overflow">
				<table class="table text-center" id="userDataTable">
					<thead class="table-dark text-white">
						<tr>
							<th>ชื่อ - นามสกุล</th>
							<th>มหาวิทยาลัย</th>
							<th>สถานที่ฝึกงาน</th>
							<th>เทอม</th>
							<th>วันที่ดำเนินการฝึกงาน</th>
							<th></th>
						</tr>
					</thead>
					<tbody id="userData">
					</tbody>
				</table>
				</div>
				<div id="pageNavPosition" class="pager-nav"></div>
			</div>

			<div class="modal fade" id="sendnotify">
				<div
					class="modal-dialog modal-xl modal-fullscreen-lg-down modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h5 id="notifyName" class="modal-title"></h5>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col-lg-3 col-lg-3 col-lg-3">
									<img id="notifyImage" src="" alt="personal picture"
										style="width: 250px; height: 250px; border-radius: 20%;">
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-lg-3 col-lg-3 col-lg-3">
									<label for="comment">ชื่อ - นามสกุล</label> <input
										class="form-control" id="userNameModal" type="text" disabled></input>
								</div>
								<div class="col-lg-3 col-lg-3 col-lg-3">
									<label for="comment">มหาวิทยาลัย</label> <input
										class="form-control" id="universityModal" type="text" disabled></input>
								</div>
								<div class="col-lg-3 col-lg-3 col-lg-3">
									<label for="comment">คณะ</label> <input class="form-control"
										id="facultyModal" type="text" disabled></input>
								</div>
								<div class="col-lg-3 col-lg-3 col-lg-3">
									<label for="comment">หลักสูตร</label> <input
										class="form-control" id="courseModal" type="text" disabled></input>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-lg-3 col-lg-3 col-lg-3">
									<label for="comment">สถานที่ฝึกงาน</label> <input
										class="form-control" id="internshipModal" type="text" disabled></input>
								</div>
								<div class="col-lg-3 col-lg-3 col-lg-3">
									<label for="comment">วันที่ดำเนินการฝึกงาน</label> <input
										class="form-control" id="timeReg" type="text" disabled></input>
									<input type="hidden" id="std_internship_id">
									<input type="hidden" id="result_internship_id">
								</div>
							</div>
							<hr>
							<h5 id="criterionNameModal"></h5>
							<div class="row">
								<div class="col-lg-6 col-md-6 col-sm-6">
									<form>
										<div id="formDynamic"></div>
									</form>
								</div>
							</div>
							<h6 id="criterionScore1Modal" style="color: red;"></h6>
							<hr>
							<h5 id="criterionNameModal2"></h5>
							<div class="row">
								<div class="col-lg-6 col-md-6 col-sm-6">
									<form>
										<div id="formDynamic2"></div>
									</form>
								</div>
							</div>
							<h6 id="criterionScore2Modal" style="color: red;"></h6>
							<div class="modal-footer">
								<button type="button" class="btn btn-danger"
									data-bs-dismiss="modal">ปิด</button>
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
		  url: "getStudentInternshipCompleteForReport",
		}).then(function (response) {
			
			
			$.each(response.data, function(i, data) {

					var newRow = document.createElement("tr")
					var newCell0 = document.createElement("td")
				    var newCell1 = document.createElement("td")
				    var newCell2 = document.createElement("td")
				    var newCell3 = document.createElement("td")
				    var newCell4 = document.createElement("td")
				    var newCell5 = document.createElement("td")
				    
				    var name = response.data[i].firstname +' '+response.data[i].lastname
				    
				    newCell0.innerHTML = "<div class='d-flex '><img src="+'resources/images/profile/'+response.data[i].profile_image+" class='rounded-circle'/><div class='ms-3'><p class='fw-bold mb-1'>"+name+"</p></div></div>"
				    newCell1.innerHTML = "<p class='fw-normal mb-1'>"+response.data[i].university_name+"</p>"
				    newCell2.innerHTML = "<p>"+response.data[i].internship_name+"</p>"
				    newCell3.innerHTML = "<p>"+response.data[i].term_no+"</p>"
				    newCell4.innerHTML = "<p>"+response.data[i].time_reg+"</p>"
				    newCell5.innerHTML = "<button onClick='showModal(\""+response.data[i].profile_image+"\",\""+response.data[i].firstname+"\",\""+response.data[i].lastname+"\",\""+response.data[i].university_name+"\",\""+response.data[i].faculty_name+"\",\""+response.data[i].course_name+"\",\""+response.data[i].internship_name+"\",\""+response.data[i].time_reg+"\",\""+response.data[i].student_place_of_internship_id+"\",\""+response.data[i].assessment_internship_id+"\")' class='btn btn-primary' data-bs-toggle='modal' data-bs-target='#sendnotify'>ดูคะแนนการประเมิน</button>"
				    
				    
				    newRow.append(newCell0)
				    newRow.append(newCell1)
				    newRow.append(newCell2)
				    newRow.append(newCell3)
				    newRow.append(newCell4)
				    newRow.append(newCell5)
				    document.getElementById("userData").appendChild(newRow)
				    
          });
			$('#userDataTable').dataTable();
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
	
	
	
				
	function showModal(profile_image, firstname, lastname, university_name, faculty_name, course_name, internship_name, time_reg, student_place_of_internship_id, assessment_internship_id) {
		
		axios({
			  method: "post",
			  url: "getReportResultAssessmentDetail",
			  data: "assessment_internship_id="+assessment_internship_id,
			}).then(function (response) {
				
				var condition_1 = ''
				var condition_2 = ''
				
				var criterion_name1 = ''
				var criterion_name2 = ''
				
				var total_score1 = 0
				var total_score2 = 0
				
				$.each(response.data, function(i, data) {
					
					if(response.data[i].condition == '1') {
						
						condition_1 += '<div class="row"><div class="col-sm-6 col-md-6 col-lg-6"><p>'+response.data[i].detail+' (คะแนนเต็ม '+ response.data[i].full_score+')'+'</p></div><div class="col-sm-6 col-md-6 col-lg-6"><div class="form-floating "><input type="text" class="form-control" placeholder="คะแนน(อาจารย์)" value="'+response.data[i].score+'" disabled> <label for="name">คะแนน(อาจารย์)</label></div></div></div>'
						criterion_name1 = response.data[i].result_internship_name
						total_score1 += parseInt(response.data[i].score)
							
					} else if(response.data[i].condition == '2') {
						
						condition_2 += '<div class="row"><div class="col-sm-6 col-md-6 col-lg-6"><p>'+response.data[i].detail+' (คะแนนเต็ม '+ response.data[i].full_score+')'+'</p></div><div class="col-sm-6 col-md-6 col-lg-6"><div class="form-floating "><input type="text" class="form-control" placeholder="คะแนน(อาจารย์)" value="'+response.data[i].score+'" disabled> <label for="name">คะแนน(สถานที่ฝึกงาน)</label></div></div></div>'
						criterion_name2 = response.data[i].result_internship_name
						total_score2 += parseInt(response.data[i].score)
						
					}
				});
				
				document.getElementById('formDynamic').innerHTML = condition_1
				document.getElementById('formDynamic2').innerHTML = condition_2
				
				document.getElementById('criterionNameModal').innerHTML = '<h5> เกณฑ์ที่อาจารย์ใช้ทำการประเมิน : '+criterion_name1+'</h5>'
				document.getElementById('criterionNameModal2').innerHTML = '<h5> เกณฑ์ที่สถานที่ฝึกงานใช้ทำการประเมิน : '+criterion_name2+'</h5>'
				
				document.getElementById('criterionScore1Modal').innerHTML = 'รวมคะแนน : '+total_score1
				document.getElementById('criterionScore2Modal').innerHTML = 'รวมคะแนน : '+total_score2
			
			})
				
			  .catch(function (response) {
				  Swal.fire({
					  icon: 'error',
					  title: 'ไม่สามารถทำรายการได้ในขณะนี้',
					  showConfirmButton: false,
					  timer: 3000
					})
			  });
		
		
		document.getElementById('notifyName').innerHTML = firstname+' '+lastname 
		document.getElementById("notifyImage").src = "resources/images/profile/"+profile_image
		document.getElementById('universityModal').value = university_name
		document.getElementById('internshipModal').value = internship_name
		document.getElementById('timeReg').value = time_reg
		document.getElementById('userNameModal').value = firstname+' '+lastname 
		document.getElementById('facultyModal').value = faculty_name
		document.getElementById('courseModal').value = course_name
		document.getElementById('std_internship_id').value = student_place_of_internship_id
		
		
	}
	
	
</script>
