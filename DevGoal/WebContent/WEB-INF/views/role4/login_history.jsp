<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ประวัติการเข้าสู่ระบบ</title>
    <link type="text/css" rel="stylesheet" href="resources/stylecss/style_user.css">
    <link href="resources/images/logo/devgoal_logo.png" size="16x16" rel="shortcut icon" type="image/png" />
	<script type="text/javascript"src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.2.0/mdb.min.js"></script>
    <script src="https://unpkg.com/htmlincludejs"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script> 
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
        <button class="btn" id="menu-btn"><i class="fa-solid fa-list"></i></button>
        <div class="table-container table-responsive">
			<div class="abovetable">
				<h4>ประวัติการเข้าสู่ระบบ</h4>
			</div>
			<div class="table-overflow">
                <table class="table text-center" id="userDataTable">
                  <thead class="table-dark text-white">
                    <tr>
                      <th>ชื่อ - นามสกุล</th> 
                      <th>สิทธิ์ผู้ใช้งาน</th>
                      <th>ไอพีแอดเดรส</th>
                      <th>เวลา</th>
                    </tr>
                  </thead>
                  <tbody id="userData">
                  </tbody>
                </table>
                </div>
                <div id="pageNavPosition" class="pager-nav"></div>
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
		  url: "loginHistoryData",
		}).then(function (response) {
			
			$.each(response.data, function(i, data) {
				
					var newRow = document.createElement("tr")
					var newCell0 = document.createElement("td")
				    var newCell1 = document.createElement("td")
				    var newCell2 = document.createElement("td")
				    var newCell3 = document.createElement("td")
				    
				    var name = response.data[i].firstname +' '+response.data[i].lastname
				    
				    newCell0.innerHTML = "<div class='d-flex '><img src="+'resources/images/profile/'+response.data[i].profile_image+" class='rounded-circle'/><div class='ms-3'><p class='fw-bold mb-1'>"+name+"</p><p class='text-muted mb-0'>"+response.data[i].email+"</p></div></div>"
				    newCell1.innerHTML = "<p class='fw-normal mb-1'>"+response.data[i].user_type+"</p>"
				    
				    newCell2.innerHTML = "<p class='fw-normal mb-1'>"+response.data[i].ip_address+"</p>"
				    newCell3.innerHTML = "<p class='fw-normal mb-1'>"+response.data[i].time_reg+"</p>"
				    
				    newRow.append(newCell0)
				    newRow.append(newCell1)
				    newRow.append(newCell2)
				    newRow.append(newCell3)
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
	
	

</script>
