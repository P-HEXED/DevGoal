<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ประวัติการส่งการแจ้งเตือน</title>
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
          <include src="resources/includeBody/role4/sidebar_admin.html"></include>
        </nav>
        <include src="resources/includeBody/role4/navbar_admin.html"></include>
    <section class="p-4 my-container">
        <button class="btn" id="menu-btn"><i class="fa-solid fa-list"></i></button>
        <div class="table-container table-responsive">
            <div class="row abovetable "> 
                <h4>ประวัติการส่งการแจ้งเตือน</h4>
                </div> 
                <div class="table-overflow">
                <table class="table text-center" id="userDataTable">
                  <thead class="table-dark text-white">
                    <tr>
                      <th>ชื่อ - นามสกุล</th>
                      <th>สิทธิ์ผู้ใช้งาน</th>
                      <th>อีเมลผู้ส่ง</th>
                      <th>อีเมลผู้รับ</th>
                      <th>เวลาที่ส่ง</th>
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
                <h5 id="notifyName" class="modal-title"></h5>
              </div>
              <div class="modal-body">
                    <div class="row">
                      <div class="col-lg-4">
                        <img id="notifyImage" src="" alt="personal picture" style="width: 250px;height: 250px; border-radius:20%;">
                        <div class="row">
                        </div>
                      </div>
                      <div class="col-lg-8">
                      	<label for="comment">อีเมลผู้ส่ง</label>
	                  	<input class="form-control" id="emailSend" type="text" disabled></input>
                        <label for="comment">อีเมลผู้รับ</label>
	                  	<input class="form-control" id="emailRecive" type="text" disabled></input>
	                  	<label for="comment">เวลาที่ส่ง</label>
	                  	<input class="form-control" id="timeReg" type="text" disabled></input>
	                  	<label for="comment">รายละเอียด</label>
	                  	<textarea class="form-control" rows="5" id="detail" name="text" disabled></textarea>
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
		  url: "emailHistoryData",
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
				    newCell1.innerHTML = "<p class='fw-normal mb-1'>"+response.data[i].user_type+"</p>"
				    newCell2.innerHTML = "<p>"+response.data[i].email_send+"</p>"
				    newCell3.innerHTML = "<p>"+response.data[i].email_recive+"</p>"
				    newCell4.innerHTML = "<p>"+response.data[i].time_reg+"</p>"
				    newCell5.innerHTML = "<button onClick='SendNotify(\""+name+"\",\""+ response.data[i].profile_image+"\",\""+ response.data[i].email_send+"\",\""+ response.data[i].email_recive+"\",\""+response.data[i].detail+"\",\""+response.data[i].time_reg+"\")' class='btn btn-primary' data-bs-toggle='modal' data-bs-target='#sendnotify'>รายละเอียด</button>"
				    
				    
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
	
				
	function SendNotify(name, profile_image, email_send, email_recive, detail, time_reg) {
		document.getElementById('notifyName').innerHTML = name
		document.getElementById("notifyImage").src = "resources/images/profile/"+profile_image
		document.getElementById('emailSend').value = email_send
		document.getElementById('emailRecive').value = email_recive
		document.getElementById('timeReg').value = time_reg
		document.getElementById('detail').value = detail
	}
	
</script>
