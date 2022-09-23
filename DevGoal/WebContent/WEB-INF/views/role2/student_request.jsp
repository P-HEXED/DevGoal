<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>นิสิต/ นักศึกษาที่สนใจบริษัทของคุณ</title>
    <link type="text/css" rel="stylesheet" href="resources/stylecss/style_user.css">
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
.pager-nav span:hover,
.pager-nav .pg-selected {
    background-color: #f9f9f9;
    border: 1px solid #CCCCCC;
}
#form12{
    border-bottom:3px solid grey ;
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
        <button class="btn" id="menu-btn"><i class="fa-solid fa-list"></i></button>
        <div class="table-container table-responsive">
            <div class="row abovetable "> 
                <h4>นิสิต/ นักศึกษาที่สนใจบริษัทของคุณ</h4>
                </div> 
                <div class="table-overflow">
                <table class="table text-center" id="userDataTable">
                  <thead class="table-dark text-white">
                    <tr>
                      <th>ชื่อ - นามสกุล</th>
                      <th>หลักสูตร</th>
                      <th>คณะ</th>
                      <th>มหาวิทยาลัย</th>
                      <th>สถานะ</th>
                      <th>เวลา</th>
                      <th></th>
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
          <div class="modal-dialog modal-xl modal-fullscreen-lg-down modal-dialog-centered">
            <div class="modal-content">
              <div class="modal-header">
                <h5 id="modalName" class="modal-title"></h5>
              </div>
              <div class="modal-body">
               		<div class="row">
	               		<div class="col col-sm-12 col-md-12 col-lg-4">
	                        <img id="userImage" src="" alt="personal picture" style="width: 250px;height: 250px; border-radius:20%;">
	                    </div>
	                    
                    </div>
                    <div class="row">
	                    <div class="col col-sm-12 col-md-12 col-lg-3">
	                      	<label for="comment">ชื่อ - นามสกุล</label>
		                  	<input class="form-control" id="userName" type="text" disabled></input>
                       </div>
                       	
                       	<div class="col col-sm-12 col-md-12 col-lg-1">
		                  	<label for="comment">เพศ</label>
		                  	<input class="form-control" id="userGender" type="text" disabled></input>
		                  </div>
	                  
		                  <div class="col col-sm-12 col-md-12 col-lg-3">
		                  	<label for="comment">วันเกิด</label>
		                  	<input class="form-control" id="userAge" type="text" disabled></input>
		                  </div>
		                  
		                  <div class="col col-sm-12 col-md-12 col-lg-3">
		                  	<label for="comment">บริษัทที่สนใจ</label>
		                  	<input class="form-control" id="overseaName" type="text" disabled></input>
		                  </div>
                       
                       </div>
                        
		                  <hr>
		                  <div class="row">
		                  	
		                  	<div class="col col-sm-12 col-md-12 col-lg-4">
		                        <label for="comment">อีเมล</label>
			                  	<input class="form-control" id="userEmail" type="text" disabled></input>
			                  </div>
			                  
			                  <div class="col col-sm-12 col-md-12 col-lg-2">
			                  	<label for="comment">เบอร์โทรศัพทร์</label>
			                  	<input class="form-control" id="userPhone" type="text" disabled></input>
			                  </div>
		                  </div>
	                      
                       	<hr>
                       	<div class="row">
                       		<div class="col col-sm-12 col-md-12 col-lg-3">
			                  	<label for="comment">หลักสูตร</label>
			                  	<input class="form-control" id="userCourse" type="text" disabled></input>
			                  </div>
			                  
			                  <div class="col col-sm-12 col-md-12 col-lg-3">
			                  	<label for="comment">คณะ</label>
			                  	<input class="form-control" id="userFaculty" type="text" disabled></input>
			                  </div>
			                  
			                  <div class="col col-sm-12 col-md-12 col-lg-3">
			                  	<label for="comment">มหาวิทยาลัย</label>
			                  	<input class="form-control" id="userUniversity" type="text" disabled></input>
			                  </div>
                       	</div>
		                  
		                  <hr>
		                  <div class="row">
		                  	<div class="col col-sm-12 col-md-12 col-lg-2">
			                  	<label for="comment">สถานะ</label>
			                  	<input class="form-control" id="userStatus" type="text" disabled></input>
			                  </div>
			                  
			                  <div class="col col-sm-12 col-md-12 col-lg-3">
			                  	<label for="comment">เวลา</label>
			                  	<input class="form-control" id="overseaTimeReg" type="text" disabled></input>
			                  </div>
		                  </div>
		                  
		                  
                       
                      <div class="col col-sm-12 col-md-12 col-lg-8">
	                  	<label for="comment">ที่อยู่</label>
	                  	<textarea class="form-control" rows="5" id="userAddress" name="text" disabled></textarea>
                      	<input type="hidden" id="userId">
                      	<input type="hidden" id="userOverseasId">
                      </div>
                      
	                 
	                  
	                  <hr>
	                  <h5>ทักษะด้านโปรแกรมมิ่ง</h5>
	                  <div class="card-body">
						<div class="col-sm-12 col-md-12 col-lg-8">
							<table id="datatable_language"
								class="table table-primary table-striped shadow p-3 mb-5 rounded"
								style="width: 100%">
								<thead>
									<tr>
										<th>ลำดับ</th>
										<th>ทักษะด้านโปรแกรมมิ่ง</th>
										<th>ระดับความชำนาญ</th>
									</tr>
								</thead>
								<tbody id="data_language">
							</table>
						</div>
					</div>
              <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">ปิด</button>
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
	
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/js/bootstrap.min.js" integrity="sha384-5h4UG+6GOuV9qXh6HqOLwZMY4mnLPraeTrjT5v07o347pj6IkfuoASuGBhfDsp3d" crossorigin="anonymous"></script>
    <script type="text/javascript" src="resources/js/sidebar.js"></script>
</body>
</html>


<script type="text/javascript">
$(function() {
	
	axios({
		  method: "post",
		  url: "studentRequestDataForRole2",
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
				    var newCell7 = document.createElement("td")
				    
				    var name = response.data[i].firstname +' '+ response.data[i].lastname
				    
				    newCell0.innerHTML = "<div class='d-flex '><img src="+'resources/images/profile/'+response.data[i].profile_image+" class='rounded-circle'/><div class='ms-3'><p class='fw-bold mb-1'>"+name+"</p><p class='text-muted mb-0'>"+response.data[i].email+"</p></div></div>"
				    newCell1.innerHTML = "<p>"+response.data[i].course_name+"</p>"
				    newCell2.innerHTML = "<p>"+response.data[i].faculty_name+"</p>"
				    newCell3.innerHTML = "<p>"+response.data[i].university_name+"</p>"
				    
				    var cell4 = ''
					    
				    if(response.data[i].status == "ไม่ผ่านการยืนยัน") {
				    	
				    	cell4 = "<span class='badge badge-danger rounded-pill d-inline'>"+response.data[i].status+"</span>"
				    	
				    }else if(response.data[i].status == "ผ่านการยืนยัน") {
				    	
				    	cell4 = "<span class='badge badge-success rounded-pill d-inline'>"+response.data[i].status+"</span>"
				    	
				    }else if(response.data[i].status == "รอตรวจสอบ") {
				    	
				    	cell4 = "<span class='badge badge-warning rounded-pill d-inline'>"+response.data[i].status+"</span>"
				    	
				    }
				    
				    
				    newCell4.innerHTML = cell4
				    newCell5.innerHTML = "<p>"+response.data[i].time_reg+"</p>"
				    newCell6.innerHTML = "<button onClick='showModal(\""+response.data[i].user_id+"\",\""+ response.data[i].firstname+"\",\""+ response.data[i].lastname+"\",\""+ response.data[i].address+"\",\""+response.data[i].email+"\",\""+response.data[i].phone+"\",\""+response.data[i].profile_image+"\",\""+response.data[i].birthday+"\",\""+response.data[i].university_name+"\",\""+response.data[i].faculty_name+"\",\""+response.data[i].course_name+"\",\""+response.data[i].time_reg+"\",\""+response.data[i].internship_name+"\",\""+response.data[i].gender+"\",\""+response.data[i].status+"\",\""+response.data[i].student_place_of_internship_id+"\")' class='btn btn-primary' data-bs-toggle='modal' data-bs-target='#sendnotify'>รายละเอียด</button>"
				    newCell7.innerHTML = "<button id='confirm' onClick='manegementStatus("+response.data[i].user_id+", 1, "+response.data[i].student_place_of_internship_id+")' class='btn btn-success'>ยืนยัน</button><button onClick='manegementStatus("+response.data[i].user_id+", 0, "+response.data[i].student_place_of_internship_id+")' class='btn btn-danger' id='cancel'>ปฏิเสธ</button>"
				    
				    newRow.append(newCell0)
				    newRow.append(newCell1)
				    newRow.append(newCell2)
				    newRow.append(newCell3)
				    newRow.append(newCell4)
				    newRow.append(newCell5)
				    newRow.append(newCell6)
				    newRow.append(newCell7)
				    document.getElementById("userData").appendChild(newRow)
				    
            });
			
			$('#userDataTable').dataTable( {
				"aaSorting": []
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
	
				
	function showModal(user_id, firstname, lastname, address, email, phone, profile_image, birthday, university_name, faculty_name, course_name, time_reg, internship_name, gender, status, student_place_of_internship_id) {
		
		axios({
			  method: "post",
			  url: "findSkillByUser",
			  data: 'user_id=' +user_id,
			}).then(function (response) {
				
				$("#data_language").empty()
				$.each(response.data, function(i, data) {
					
					var newRow = document.createElement("tr")
					var newCell0 = document.createElement("td")
				    var newCell1 = document.createElement("td")
				    var newCell2 = document.createElement("td")
				    
				    newCell0.innerHTML = "<p>"+(i+1)+"</p>"
				    newCell1.innerHTML = "<p>"+response.data[i].detail+"</p>"
				    
				    var data = ''
					    
				    if(response.data[i].level == '1') {
				    	data = 'ระดับเริ่มต้น'
				    } else if(response.data[i].level == '2') {
				    	data = 'ระดับปานกลาง'
				    } else if(response.data[i].level == '3') {
				    	data = 'ระดับสูง'
				    }
				    
				    newCell2.innerHTML = "<p>"+data+"</p>"
				    
				    
				    newRow.append(newCell0)
				    newRow.append(newCell1)
				    newRow.append(newCell2)
				    document.getElementById("data_language").appendChild(newRow)
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
		
		document.getElementById('userImage').src = 'resources/images/profile/'+profile_image
		document.getElementById("modalName").innerHTML = firstname +' '+ lastname
		document.getElementById("userName").value = firstname +' '+ lastname
		document.getElementById('userEmail').value = email
		document.getElementById('userPhone').value = phone
		document.getElementById('userAge').value = birthday
		document.getElementById('userGender').value = gender
		document.getElementById('userCourse').value = course_name
		document.getElementById('userFaculty').value = faculty_name
		document.getElementById('userUniversity').value = university_name
		document.getElementById('overseaName').value = internship_name
		document.getElementById('userStatus').value = status
		document.getElementById('overseaTimeReg').value = time_reg
		document.getElementById('userAddress').value = address
		document.getElementById('userId').value = user_id
		document.getElementById('userOverseasId').value = student_place_of_internship_id
	}
	
	function manegementStatus(user_id, status, user_internship_id) {
		
		document.getElementById('spinner').style.display = 'block';
		$(':button').prop('disabled', true);
		
		const data = $.getJSON('https://api.ipify.org?format=json', function(data){
				
			ip = data.ip
				
			if(user_id != '' && ip != '' && user_internship_id != '') {
					
				axios({
					  method: "post",
					  url: "managementUserAndInternshipStatus",
					  data: 'user_id=' + user_id +'&status=' +status +'&ip='+ip+'&user_internship_id='+user_internship_id,
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
						  title: 'กรุณาเลือกผู้ใช้งาน',
						  showConfirmButton: false,
						  timer: 3000
						})
						$(':button').prop('disabled', false);
						document.getElementById('spinner').style.display = 'none';
				}
				
			});
			
				
			}
	
	
	
</script>
