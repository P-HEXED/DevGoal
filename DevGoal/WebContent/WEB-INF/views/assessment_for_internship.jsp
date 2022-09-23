<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>เลือกนิสิต/นักศึกษาที่ต้องการประเมินการฝึกงาน</title>
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
		<section class="p-4 my-container">
			<div class="table-container table-responsive">
				<div class="row abovetable ">
					<h4>เลือกนิสิต/นักศึกษาที่ต้องการประเมินการฝึกงาน</h4>
				</div>
				<div class="table-overflow">
				<table class="table text-center" id="userDataTable">
					<thead class="table-dark text-white">
						<tr>
							<th>ชื่อ - นามสกุล</th>
							<th>มหาวิทยาลัย</th>
							<th>สถานที่ฝึกงาน</th>
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
								</div>

							</div>

							<hr>

							<div class="row">
								<div class="col-lg-12 col-md-12 col-sm-12">
									<form>
										<div id="formDynamic"></div>
									</form>
								</div>
							</div>

							<div class="modal-footer">
								<button type="button" onClick="insertScore()"
									class="btn btn-primary" data-bs-dismiss="modal">บันทึก</button>
								<button type="button" class="btn btn-danger"
									data-bs-dismiss="modal">ปิด</button>
							</div>
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
</body>
</html>


<script type="text/javascript">
$(function() {
	
	const queryString = window.location.search;
	const urlParams = new URLSearchParams(queryString);
	
	var data1 = urlParams.get('data1')
	var data2 = urlParams.get('data2')
	var data3 = urlParams.get('data3')
	
	axios({
		  method: "post",
		  url: "getStudentInternshipCompleteUnRole",
		  data: "data1="+data1+"&data2="+data2
		}).then(function (response) {
			
			$.each(response.data, function(i, data) {

					var newRow = document.createElement("tr")
					var newCell0 = document.createElement("td")
				    var newCell1 = document.createElement("td")
				    var newCell2 = document.createElement("td")
				    var newCell3 = document.createElement("td")
				    var newCell4 = document.createElement("td")
				    
				    var name = response.data[i].firstname +' '+response.data[i].lastname
				    
				    newCell0.innerHTML = "<div class='d-flex '><img src="+'resources/images/profile/'+response.data[i].profile_image+" class='rounded-circle'/><div class='ms-3'><p class='fw-bold mb-1'>"+name+"</p></div></div>"
				    newCell1.innerHTML = "<p class='fw-normal mb-1'>"+response.data[i].university_name+"</p>"
				    newCell2.innerHTML = "<p>"+response.data[i].internship_name+"</p>"
				    newCell3.innerHTML = "<p>"+response.data[i].time_reg+"</p>"
				    newCell4.innerHTML = "<button onClick='showModal(\""+response.data[i].profile_image+"\",\""+response.data[i].firstname+"\",\""+response.data[i].lastname+"\",\""+response.data[i].university_name+"\",\""+response.data[i].faculty_name+"\",\""+response.data[i].course_name+"\",\""+response.data[i].internship_name+"\",\""+response.data[i].time_reg+"\",\""+response.data[i].student_place_of_internship_id+"\")' class='btn btn-primary' data-bs-toggle='modal' data-bs-target='#sendnotify'>ทำแบบประเมิน</button>"
				    
				    
				    newRow.append(newCell0)
				    newRow.append(newCell1)
				    newRow.append(newCell2)
				    newRow.append(newCell3)
				    newRow.append(newCell4)
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
	
	
	axios({
		  method: "post",
		  url: "getCriterionFormById",
		  data: "data1="+data1+"&data3="+data3
		}).then(function (response) {
			
				var form = ''
				
				$.each(response.data, function(i, data) {
					
	             	if(response.data[i].input_type == 'ช่องเพิ่มข้อความ') {
	             		
	             		form += '<div class="row"><div class="col-sm-2 col-md-3 col-lg-2"><p>'+response.data[i].detail+'</p></div><div class="col-sm-3 col-md-3 col-lg-3"><div class="form-floating "><input type="text" class="form-control" id="criterionScore'+i+'" placeholder="คะแนน" > <label for="name">คะแนน</label></div></div></div><input type="hidden" id="criterionId'+i+'" value="'+response.data[i].criterion_id+'">'
	             		
	             	} else if(response.data[i].input_type == 'ช่องเพิ่มตัวเลข') {
	             		
	             		form += '<div class="row"><div class="col-sm-2 col-md-3 col-lg-2"><p>'+response.data[i].detail+'</p></div><div class="col-sm-3 col-md-3 col-lg-3"><div class="form-floating "><input type="number" min="1" class="form-control" id="criterionScore'+i+'" placeholder="คะแนน" > <label for="name">คะแนน</label></div></div></div><input type="hidden" id="criterionId'+i+'" value="'+response.data[i].criterion_id+'">'
	             		
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
	
		    
	});
	
				
	function showModal(profile_image, firstname, lastname, university_name, faculty_name, course_name, internship_name, time_reg, student_place_of_internship_id) {
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
	
	function insertScore() {
		
		document.getElementById('spinner').style.display = 'block';
		$(':button').prop('disabled', true);
		
		const data = $.getJSON('https://api.ipify.org?format=json', function(data){
		
		var inputs = document.getElementsByTagName('input');
		
		const criterionId = "criterionId"
		const criterionScore = "criterionScore"
		var id = ''
		
		var criterion_data = []
		var criterion_id = []
		var criterion_score = []

		for(var key in inputs) {
		   id = inputs[key].id
		   
		   if(id != undefined && id.includes('criterion')) {
			   
			   if(id.includes(criterionId)) {
				   
				   criterion_id.push(document.getElementById(id).value)
				   
				   
			   } else if(id.includes(criterionScore)) {
				   
				   if(document.getElementById(id).value != '') {
					   
					   criterion_score.push(document.getElementById(id).value)
				   } else {
					   
					   Swal.fire({
							  icon: 'warning',
							  title: 'กรุณากรอกคะแนนให้ครบทุกเกณฑ์',
							  showConfirmButton: false,
							  timer: 3000
							})
						$(':button').prop('disabled', true);
					   document.getElementById('spinner').style.display = 'none';
						return(false)
				   }
				   
				  
				   
			   }
			   
		   }
		   

		}
		
		for(var i = 0; i < criterion_id.length; i++) {
			
			criterion_data.push([criterion_id[i], criterion_score[i]])
		}
		
		const queryString = window.location.search;
		const urlParams = new URLSearchParams(queryString);
		
		
		var data3 = urlParams.get('data3')
		var std_internship_id = document.getElementById('std_internship_id').value
		var ip = data.ip
		
		if(criterion_data.length != 0 && data3 != '' && std_internship_id != '' && ip != '') {
			
			axios({
				  method: "post",
				  url: "insertAssessmentByInternship",
				  data: "criterion_data="+JSON.stringify(criterion_data)+"&data3="+data3+"&std_internship_id="+std_internship_id+"&ip="+ip,
				})
				  .then(function (response) {
					  
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
								$(':button').prop('disabled', true);
					 		document.getElementById('spinner').style.display = 'none';
				  });
			
		}

		});
		
	}
	
</script>
