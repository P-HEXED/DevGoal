<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>จัดการข้อมูลผู้ใช้ที่ร้องขอ</title>
<link type="text/css" rel="stylesheet"
	href="resources/stylecss/style_user.css">
<link href="resources/images/logo/devgoal_logo.png" size="16x16"
	rel="shortcut icon" type="image/png" />
<script src="https://unpkg.com/htmlincludejs"></script>
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
<style>
@media screen and (max-width:765px){
.table-container{
margin-top:45px;
}
}
</style>
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
			<div class="table-container table-responsive">
				<div class="abovetable">
					<h4>จัดการข้อมูลผู้ใช้ที่ร้องขอ</h4>
				</div>
				<div class="table-overflow">
				<table class="table text-center" id="userDataTable">
					<thead class="table-dark text-white">
						<tr>
							<th>อีเมล</th>
							<th>สถานะ</th>
							<th>เวลาที่บันทึก</th>
							<th></th>
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

			<div class="modal fade" id="showDataChange">
				<div
					class="modal-dialog modal-xl modal-fullscreen-lg-down modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h5 id="notifyName" class="modal-title"></h5>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col-lg-3 col-md-12 col-sm-12">
									<label for="comment">อีเมล</label> <input class="form-control"
										id="emailModal" type="text" disabled></input>
								</div>

								<div class="col-lg-3 col-md-12 col-sm-12">
									<label for="comment">สถานะ</label> <input class="form-control"
										id="statusModal" type="text" disabled></input>
								</div>

								<div class="col-lg-3 col-md-12 col-sm-12">
									<label for="comment">เวลาที่บันทึก</label> <input
										class="form-control" id="timeModal" type="text" disabled></input>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-lg-12 col-md-12 col-sm-12">
									<label for="comment">รายละเอียดข้อมูลที่ต้องการเปลี่ยน</label>
									<textarea class="form-control" rows="5" id="dataModal"
										name="text" disabled></textarea>
									<input type="hidden" id="idModal" value=""></input>
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
		  url: "userDataChange",
		}).then(function (response) {
			
			$.each(response.data, function(i, data) {
				
					var newRow = document.createElement("tr")
					var newCell0 = document.createElement("td")
				    var newCell1 = document.createElement("td")
				    var newCell2 = document.createElement("td")
				    var newCell3 = document.createElement("td")
				    var newCell4 = document.createElement("td")
				    
				    newCell0.innerHTML = "<p>"+response.data[i].email+"</p>"
				    newCell1.innerHTML = "<p>"+response.data[i].status+"</p>"
				    newCell2.innerHTML = "<p>"+response.data[i].time_reg+"</p>"
				    newCell3.innerHTML = "<button onClick='showModal(\""+response.data[i].email+"\",\""+ response.data[i].status+"\",\""+ response.data[i].time_reg+"\",\""+response.data[i].user_data+"\",\""+response.data[i].request_user_data_change_id+"\")' class='btn btn-primary' data-bs-toggle='modal' data-bs-target='#showDataChange'>ดูรายละเอียด</button>"
				    newCell4.innerHTML = "<button onClick='manegementStatus("+response.data[i].request_user_data_change_id+", 1)' class='btn btn-success'>ยืนยัน</button><button onClick='manegementStatus("+response.data[i].request_user_data_change_id+", 0)' class='btn btn-danger'>ปฏิเสธ</button>"
				    
				    newRow.append(newCell0)
				    newRow.append(newCell1)
				    newRow.append(newCell2)
				    newRow.append(newCell3)
				     newRow.append(newCell4)
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
	
	function showModal(email, status, time_reg, user_data, id) {
		
		document.getElementById('emailModal').value = email
		document.getElementById('statusModal').value = status
		document.getElementById('timeModal').value = time_reg
		document.getElementById('dataModal').value = user_data
		document.getElementById('idModal').value = id

	}
	
				
	function manegementStatus(id, status) {
		
		document.getElementById('spinner').style.display = 'block';
		$(':button').prop('disabled', true);
		
		const data = $.getJSON('https://api.ipify.org?format=json', function(data){
				
			ip = data.ip
				
			if(id != '' && ip != '') {
					
				axios({
					  method: "post",
					  url: "managementUserDataChangeStatusByAdmin",
					  data: 'request_user_data_change_id=' + id +'&status=' +status +'&ip='+ip,
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
