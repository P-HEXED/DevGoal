<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>สถานที่ฝึกงาน</title>
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
          <include src="resources/includeBody/role1/sidebar_admin.html"></include>
        </nav>
        <include src="resources/includeBody/role1/navbar_admin.html"></include>

    <section class="p-4 my-container">
        <button class="btn" id="menu-btn"><i class="fa-solid fa-list"></i></button>
        <div class="table-container table-responsive" >
            <div class="row abovetable "> 
                <h4>สถานที่ฝึกงาน</h4>	
                </div> 
                
                <div class=" col-sm-6 col-md-6 col-lg-3">
                	<select class="form-select" id="zone">
                		<option>จัดเรียงตามภูมิภาค</option>
						<option value="1">ภาคเหนือ</option>
						<option value="2">ภาคตะวันออกเฉียงเหนือ</option>
						<option value="3">ภาคกลาง</option>
						<option value="4">ภาคตะวันออก</option>
						<option value="5">ภาคตะวันตก</option>
						<option value="6">ภาคใต้</option>
					</select>
                </div>
                
                <div class="table-overflow">
                <table class="table text-center" id="userDataTable" >
                  <thead class="table-dark text-white">
                    <tr>
                      <th>บริษัท</th>
                      <th>อีเมล</th>
                      <th>จังหวัด</th>
                      <th>สถานที่ตั้ง</th>
                      <th>เวลาที่ประกาศ</th>
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
                <h5 id="notifyName" class="modal-title">รายละเอียดสถานที่ฝึกงาน</h5>
              </div>
              <div class="modal-body">
              
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

                      <div class="col col-md-6 col-lg-5">
                      	<label for="comment">บริษัท</label>
	                  	<input class="form-control" id="overseaName" type="text" disabled></input>
                       </div>
                       <div class="row">
                       	<div class="col col-sm-12 col-md-3 col-lg-3">
	                        <label for="comment">อีเมล</label>
		                  	<input class="form-control" id="overseaEmail" type="text" disabled></input>
		                  </div>
		                  <div class="col col-sm-12 col-md-3 col-lg-3">
		                  	<label for="comment">เบอร์โทรศัพทร์</label>
		                  	<input class="form-control" id="overseaPhone" type="text" disabled></input>
		                  </div>
		                  <div class="col col-sm-12 col-md-3 col-lg-3">
		                  	<label for="comment">สถานที่ตั้ง</label>
		                  	<input class="form-control" id="overseaType" type="text" disabled></input>
		                  </div>
                       </div>
                       
	                  <div class="col col-sm-12 col-md-6 col-lg-6">
	                  	<label for="comment">ที่อยู่</label>
	                  	<textarea class="form-control" rows="5" id="overseaAddress" name="text" disabled></textarea>
                      </div>
                      <div class="col col-sm-12 col-md-1 col-lg-1">
                      	<label for="comment">จำนวนที่รับ</label>
	                  	<input class="form-control" id="overseaRecive" type="text" disabled></input>
	                  	<input type="hidden" id="overseaId">
	                  	<input type="hidden" id="userOverseaId">
	                  	<input type="hidden" id="overseaMap">
	                  </div>
	                  <hr>
	                  <h5>ทักษะด้านโปรแกรมมิ่งที่ต้องการ</h5>
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
              	<button type="button" id="send" onClick="sendData()" class="btn btn-primary">ส่งข้อมูลส่วนตัวให้บริษัท</button>
              	<button type="button" onClick="showMap()" class="btn btn-success">ดูแผนที่</button>
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">ปิด</button>
              </div>
          </div>
        </div>
      </div>
      </div>
    </section>
</main>

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
		  url: "findPlaceOfInternshipBySkill",
		}).then(function (response) {
			
			$.each(response.data, function(i, data) {
				
					var newRow = document.createElement("tr")
					var newCell0 = document.createElement("td")
				    var newCell1 = document.createElement("td")
				    var newCell2 = document.createElement("td")
				    var newCell3 = document.createElement("td")
				    var newCell4 = document.createElement("td")
				    var newCell5 = document.createElement("td")
				    
				    var matching = ''
				    
				    if(response.data[i].matching == "1") {
				    	
				    	matching = '<span style="color: blue; font-size: 15px;">(ทักษะความสามารถตรงกับคุณ)</span>'
				    	
				    }
				    
				    newCell0.innerHTML = "<p>"+response.data[i].name+"</p>"+matching
				    newCell1.innerHTML = "<p>"+response.data[i].email+"</p>"
				    newCell2.innerHTML = "<p>"+response.data[i].province+"</p>"
				    newCell4.innerHTML = "<p>"+response.data[i].time_reg+"</p>"
				    
				    var cell3 = ''
					    
				    if(response.data[i].type == "ในประเทศ") {
				    	
				    	cell3 = "<span class='badge badge-success rounded-pill d-inline'>"+response.data[i].type+"</span>"
				    	
				    }else if(response.data[i].type == "ต่างประเทศ") {
				    	
				    	cell3 = "<span class='badge badge-warning rounded-pill d-inline'>"+response.data[i].type+"</span>"
				    	
				    }
				    
				    
				    
				    newCell3.innerHTML = cell3
				    newCell5.innerHTML = "<button onClick='showModal(\""+response.data[i].name+"\",\""+ response.data[i].email+"\",\""+ response.data[i].type+"\",\""+ response.data[i].time_reg+"\",\""+response.data[i].address+"\",\""+response.data[i].phone+"\",\""+response.data[i].recive_total+"\",\""+response.data[i].place_of_internship_id+"\",\""+response.data[i].user_id+"\",\""+response.data[i].province+"\")' class='btn btn-primary' data-bs-toggle='modal' data-bs-target='#sendnotify'>รายละเอียด</button>"
				    
				    newRow.append(newCell0)
				    newRow.append(newCell1)
				    newRow.append(newCell2)
				    newRow.append(newCell3)
				    newRow.append(newCell4)
				    newRow.append(newCell5)
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
	
				
	function showModal(name, email, type, time_reg, address, phone, recive_total, internship_id, user_id, province) {
		
		axios({
			  method: "post",
			  url: "findSkillByInternship",
			  data: 'internship_id=' +internship_id,
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
		
		document.getElementById('overseaName').value = name
		document.getElementById("overseaEmail").value = email
		document.getElementById('overseaPhone').value = phone
		document.getElementById('overseaType').value = type
		document.getElementById('overseaAddress').value = address
		document.getElementById('overseaRecive').value = (recive_total + ' คน')
		document.getElementById('overseaId').value = internship_id
		document.getElementById('userOverseaId').value = user_id
		document.getElementById('overseaMap').value = (name +" "+ province)
		
	}
	
	function showMap() {
		
		var url = "https://www.google.com/maps/search/?api=1&query="
		var province = document.getElementById('overseaMap').value
		
		window.open(url+province);
	}
	
	function sendData() {
		
		document.getElementById('spinner').style.display = 'block';
		$(':button').prop('disabled', true);
		
		const data = $.getJSON('https://api.ipify.org?format=json', function(data){
				
			ip = data.ip
			var internship_id = document.getElementById('overseaId').value
				
			if(internship_id != '' && ip != '') {
					
				axios({
					  method: "post",
					  url: "sendDataToInternship",
					  data: 'internship_id=' + internship_id +'&ip=' + ip,
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
						  title: 'กรุณาเลือกบริษัท',
						  showConfirmButton: false,
						  timer: 3000
						})
						
						$(':button').prop('disabled', false);
					document.getElementById('spinner').style.display = 'none';
				}
				
			});
				
					
	}
	
	$('#zone').change(function() {
		
		var e = document.getElementById("zone");
		var zone_value = e.options[e.selectedIndex].value;
		
		if(zone_value != '') {
			
			axios({
				  method: "post",
				  url: "findPlaceOfInternshipByZone",
				  data: "zone_value="+zone_value,
				}).then(function (response) {
					
					$("#userDataTable").DataTable().clear().draw();
			        $("#userDataTable").dataTable().fnDestroy();
			        
					$.each(response.data, function(i, data) {
						
						var newRow = document.createElement("tr")
						var newCell0 = document.createElement("td")
					    var newCell1 = document.createElement("td")
					    var newCell2 = document.createElement("td")
					    var newCell3 = document.createElement("td")
					    var newCell4 = document.createElement("td")
					    var newCell5 = document.createElement("td")
					    
					    var matching = ''
				    
					    if(response.data[i].matching == "1") {
					    	
					    	matching = '<span style="color: blue; font-size: 15px;">(ทักษะความสามารถตรงกับคุณ)</span>'
					    	
					    }
					    
					    newCell0.innerHTML = "<p>"+response.data[i].name+"</p>"+matching
					    newCell1.innerHTML = "<p>"+response.data[i].email+"</p>"
					    newCell2.innerHTML = "<p>"+response.data[i].province+"</p>"
					    newCell4.innerHTML = "<p>"+response.data[i].time_reg+"</p>"
					    
					    var cell3 = ''
						    
						    if(response.data[i].type == "ในประเทศ") {
						    	
						    	cell3 = "<span class='badge badge-success rounded-pill d-inline'>"+response.data[i].type+"</span>"
						    	
						    }else if(response.data[i].type == "ต่างประเทศ") {
						    	
						    	cell3 = "<span class='badge badge-warning rounded-pill d-inline'>"+response.data[i].type+"</span>"
						    	
						    }
						    
						    
						    
						newCell3.innerHTML = cell3
					    newCell5.innerHTML = "<button onClick='showModal(\""+response.data[i].name+"\",\""+ response.data[i].email+"\",\""+ response.data[i].type+"\",\""+ response.data[i].time_reg+"\",\""+response.data[i].address+"\",\""+response.data[i].phone+"\",\""+response.data[i].recive_total+"\",\""+response.data[i].place_of_internship_id+"\",\""+response.data[i].user_id+"\",\""+response.data[i].province+"\")' class='btn btn-primary' data-bs-toggle='modal' data-bs-target='#sendnotify'>รายละเอียด</button>"
					    
					    newRow.append(newCell0)
					    newRow.append(newCell1)
					    newRow.append(newCell2)
					    newRow.append(newCell3)
					    newRow.append(newCell4)
					    newRow.append(newCell5)
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
		}
		
	});
	
</script>
