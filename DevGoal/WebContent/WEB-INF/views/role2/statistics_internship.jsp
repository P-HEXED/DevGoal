<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>สถิติการฝึกงาน</title>
<meta name="theme-color" content="hsl(24.3, 97.4%, 54.3%)">
<link href="resources/images/logo/devgoal_logo.png" size="48x48"
	rel="shortcut icon" type="image/png" />
<link rel="stylesheet" href="resources/stylecss/style_user.css">
<script src="https://unpkg.com/htmlincludejs"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
<link rel="stylesheet" href="resources/stylecss/classic.css">
<link rel="stylesheet" href="resources/stylecss/classic.date.css">
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
<script type="text/javascript" src="resources/js/loading.js"></script>
<link rel="stylesheet" href="resources/stylecss/loading_axios.css">
<style>
      p{
      font-size: 14px;
      }
    @media (min-width:768px) and (max-width:912px){
        .card-body{
          margin-top:50px;
          margin-bottom:50px;
        }
      }
      @media (max-width:912px){
        .card,.card-body{
         text-align: center;
        }
        .btn{
        margin-top:20px;
        }
      }
        @media (max-width:765px){
        .card-date{
         margin-top:45px;
        }
      }
      #smallcard01,#smallcard02,#smallcard03,#datecard{
        align-items: stretch;
      }
      #smallcard01{
        border-right:5px solid #d9534f;
      }
      #smallcard02{
        border-right: 5px solid #5cb85c;
      }
      #smallcard03{
        border-right: 5px solid #f0ad4e;
      }
    </style>
</head>
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
				<div class="row">
					<div class="col-lg-3 col-sm-12 col-md-12">
						<div class="card card-date">
							<div class="row p-3">
								<div class="col-lg-6 col-sm-12 col-md-12">
									<div class="form-group ">
										<label for="input_from">จากวันที่</label> <input type="text"
											class="form-control" id="input_from" placeholder="Start Date">
									</div>
								</div>
								<div class="col-lg-6 col-sm-12 col-md-12">
									<div class="form-group">
										<label for="input_to">ถึงวันที่</label> <input type="text"
											class="form-control" id="input_to" placeholder="End Date">
										<br>
										<button type="button" onClick="searchData()"
											class='btn btn-primary' id="search" style="float: right;">ค้นหา</button>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-3 col-sm-12 col-md-12">
						<div class="card" id="smallcard03">
							<div class="card-body" style="height: 145px;">
								<div class="row gx-5">
									<div class="col-lg-12 col-md-4 col-sm-12 mb-3">
										<i class="fa-solid fa-user-clock text-warning fa-2x"></i>
										<p>นิสิต/นัศึกษาที่กำลังฝึกงาน</p>
										<h4 id="userStatus2"></h4>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-3 col-sm-12 col-md-12">
						<div class="card" id="smallcard02">
							<div class="card-body" style="height: 145px;">
								<div class="row gx-5">
									<div class="col-lg-12 col-md-4 col-sm-12 mb-3">
										<i class="fa-solid fa-user-check text-success fa-2x"></i>
										<p>นิสิต/นักศึกษาที่ฝึกงานแล้ว</p>
										<h4 id="userStatus1"></h4>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-lg-5 col-sm-12 col-md-12">
						<div class="card">
							<div class="card-body">
								<canvas id="donutChart" height="215vh" width="290vw"></canvas>
							</div>
						</div>
					</div>

					<div class="col-lg-7 col-sm-12 col-md-12">
							<div class="card">
								<div class="card-body">

									<div class="col-sm-6 col-md-4 col-lg-4">
										<select class="form-select" id="internshipSelect">
											<option value="0">เลือกสถานที่ฝึกงาน</option>
										</select>
									</div>
									<br>
									
									<div class="table-overflow">
									<table class="table text-center" id="userDataTable">
										<thead class="table-dark text-white">
											<tr>
												<th>ชื่อ - นามสกุล</th>
												<th>เวลาที่ดำเนินการฝึกงาน</th>
											</tr>
										</thead>
										<tbody id="userData">
										</tbody>
									</table>
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
		<script type="text/javascript" src="resources/js/sidebar.js"></script>
		<script src="resources/js/chart.js"></script>
		<script src="resources/js/jquery-3.3.1.min.js"></script>
		<script src="resources/js/popper.min.js"></script>
		<script src="resources/js/bootstrap.min.js"></script>
		<script src="resources/js/picker.js"></script>
		<script src="resources/js/picker.date.js"></script>
		<script src="resources/js/main.js"></script>
		<script type="text/javascript"
			src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
		<script src="resources/js/jquery.dataTables.min.js"></script>
		<script
			src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
</body>
</html>
<script type="text/javascript">
	
	var donut = ''
	
	$(function() {
		
		$('#userDataTable').dataTable( {
			"aaSorting": []
		});
		
		axios({
			  method: "post",
			  url: "getStatisticsInternshipCompleteDataCard",
			}).then(function (response) {
				
				document.getElementById('userStatus2').innerHTML = response.data.role1_internshiping + ' คน'
				document.getElementById('userStatus1').innerHTML = response.data.role1_complete + ' คน'
				
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
			  url: "getStatisticsInternshipingDataDonut",
			}).then(function (response) {
				
				var aValues = []
				var bValues = []
				var barColors = [
					"#dc3545",
					"#0d6efd",
					"#ffc107",
					"#252525",
					"#00FFE8",
					"#00FF08",
					"#FFAA00",
					"#00FF8F",
					"#8F00FF",
					"#FF0087",
					"#B6B6B4" ,
					"#E5E4E2" ,
					"#BCC6CC" ,
					"#98AFC7" ,
					"#728FCE" ,
					"#4863A0" ,
					"#2B547E" ,
					"#191970" ,
					"#000080" ,
					"#151B8D" ,
					"#00008B" ,
					"#0000CD" ,
					"#0041C2" ,
					"#2916F5" ,
					"#0000FF" ,
					"#0909FF" ,
					"#1F45FC" ,
					"#2554C7" ,
					"#1569C7" ,
					"#1974D2" ,
					"#2B60DE" ,
					"#4169E1" ,
					"#2B65EC" ,
					"#306EFF" ,
					"#157DEC" ,
					"#1589FF" ,
					"#1E90FF" ,
					"#368BC1" ,
					"#4682B4" ,
					"#488AC7" ,
					"#357EC7" ,
					"#3090C7" ,
					"#659EC7" ,
					"#87AFC7" ,
					"#95B9C7" ,
					"#6495ED" ,
					"#6698FF" ,
					"#56A5EC" ,
					"#38ACEC" ,
					"#00BFFF" ,
					"#3BB9FF" ,
					"#5CB3FF" ,
					"#79BAEC" ,
					"#82CAFF" ,
					"#87CEFA" ,
					"#87CEEB" ,
					"#A0CFEC" ,
					"#B7CEEC" ,
					"#B4CFEC" ,
					"#ADDFFF" ,
					"#C2DFFF" ,
					"#C6DEFF" ,
					"#BDEDFF" ,
					"#B0E0E6" ,
					"#AFDCEC" ,
					"#ADD8E6" ,
					"#B0CFDE" ,
					"#C9DFEC" ,
					"#D5D6EA" ,
					"#E3E4FA" ,
					"#E6E6FA" ,
					"#EBF4FA" ,
					"#F0F8FF" ,
					"#F8F8FF" ,
					"#F0FFFF" ,
					"#E0FFFF" ,
					"#CCFFFF" ,
					"#9AFEFF" ,
					"#7DFDFE" ,
					"#57FEFF" ,
					"#00FFFF" ,
					"#0AFFFF" ,
					"#50EBEC" ,
					"#4EE2EC" ,
					"#16E2F5" ,
					"#8EEBEC" ,
					"#AFEEEE" ,
					"#CFECEC" ,
					"#81D8D0" ,
					"#77BFC7" ,
					"#92C7C7" ,
					"#78C7C7" ,
					"#7BCCB5" ,
					"#66CDAA" ,
					"#AAF0D1" ,
					"#7FFFD4" ,
					"#93FFE8" ,
					"#40E0D0" ,
					"#48D1CC" ,
					"#48CCCD" ,
					"#46C7C7" ,
					"#43C6DB" ,
					"#00CED1" ,
					"#43BFC7" ,
					"#20B2AA" ,
					"#3EA99F" ,
					"#5F9EA0" ,
					"#3B9C9C" ,
					"#008B8B" ,
					"#008080" ,
					"#045F5F" ,
					"#033E3E" ,
					"#25383C" ,
					"#2C3539" ,
					"#3C565B" ,
					"#4C787E" ,
					"#5E7D7E" ,
					"#307D7E" ,
					"#348781" ,
					"#438D80" ,
					"#4E8975" ,
					"#306754" ,
					"#2E8B57" ,
					"#31906E" ,
					"#00A36C" ,
					"#34A56F" ,
					"#50C878" ,
					"#3EB489" ,
					"#3CB371" ,
					"#78866B" ,
					"#848B79" ,
					"#617C58" ,
					"#728C00" ,
					"#6B8E23" ,
					"#808000" ,
					"#556B2F" ,
					"#4B5320" ,
					"#667C26" ,
					"#4E9258" ,
					"#387C44" ,
					"#347235" ,
					"#347C2C" ,
					"#228B22" ,
					"#008000" ,
					"#006400" ,
					"#046307" ,
					"#254117" ,
					"#437C17" ,
					"#347C17" ,
					"#6AA121" ,
					"#4AA02C" ,
					"#41A317" ,
					"#12AD2B" ,
					"#3EA055" ,
					"#73A16C" ,
					"#6CBB3C" ,
					"#6CC417" ,
					"#4CC417",
					"#dc3545",
					"#0d6efd",
					"#ffc107",
					"#252525",
					"#00FFE8",
					"#00FF08",
					"#FFAA00",
					"#00FF8F",
					"#8F00FF",
					"#FF0087",
					"#41A317" ,
					"#12AD2B" ,
					"#3EA055" ,
					"#252525",
					"#00FFE8",
					"#00FF08",
					"#FFAA00",
					"#252525",
					"#00FFE8",
					"#00FF08",
					"#FFAA00",
					"#252525",
					"#00FFE8",
					"#00FF08",
					"#FFAA00",
					"#252525",
					"#00FFE8",
					"#00FF08",
					"#FFAA00",
					"#252525",
					"#00FFE8",
					"#00FF08",
					"#FFAA00",
					"#252525",
					"#00FFE8",
					"#00FF08",
					"#FFAA00",
					"#252525",
					"#00FFE8",
					"#00FF08",
					"#FFAA00",
					"#252525",
					"#00FFE8",
					"#00FF08",
					"#FFAA00"

				];
				
				
				
				$.each(response.data, function(i, data) {
				
					aValues.push(response.data[i].internship_name)
					bValues.push(response.data[i].role1_count)
					
					$('#internshipSelect').append($('<option value="' + response.data[i].internship_id + '">' + response.data[i].internship_name + '</option>'));
				})
				

				donut = new Chart("donutChart", {
					type: "doughnut",
					data: {
						labels: aValues,
						datasets: [{
							backgroundColor: barColors,
							data: bValues
						}]
					},
					options: {
						title: {
							display: true,
							text: "จำนวนนิสิต/นักศึกษาที่กำลังฝึกงานและฝึกงานแล้วในแต่ละสถานที่ฝึกงาน"
						}
					}
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
	
	var b = ''
	var e = ''
	
	
	$('#internshipSelect').change(async function() {
		
		await setFormat()
		
		if(b != '' && e != '') {
			
			var x = document.getElementById("internshipSelect");
			var internship = x.options[x.selectedIndex].value;
			
			if(internship != '') {
				
				axios({
					  method: "post",
					  url: "getStudentStatisticsInternshipingData",
					  data: "internship_id="+internship+"&begin="+b+"&end="+e,
					}).then(function (response) {
						
						$("#userDataTable").DataTable().clear().draw();
				        $("#userDataTable").dataTable().fnDestroy();
				        
						$.each(response.data, function(i, data) {
							
							var newRow = document.createElement("tr")
							var newCell = document.createElement("td")
							var newCell0 = document.createElement("td")
						    
						    var name = response.data[i].firstname +' '+response.data[i].lastname
						    
						    newCell.innerHTML = "<div class='d-flex '><img src="+'resources/images/profile/'+response.data[i].profile_image+" class='rounded-circle'/><div class='ms-3'><p class='fw-bold mb-1'>"+name+"</p><p class='text-muted mb-0'>"+response.data[i].email+"</p></div></div>"
						    newCell0.innerHTML = "<p>"+response.data[i].time_reg+"</p>"
						    
						    newRow.append(newCell)
						    newRow.append(newCell0)
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
		
		
	} else if(b == '' && e == ''){
		
		var x = document.getElementById("internshipSelect");
		var internship = x.options[x.selectedIndex].value;
		
		if(internship != '') {
			
			axios({
				  method: "post",
				  url: "getStudentStatisticsInternshipingData",
				  data: "internship_id="+internship,
				}).then(function (response) {
					
					$("#userDataTable").DataTable().clear().draw();
			        $("#userDataTable").dataTable().fnDestroy();
			        
					$.each(response.data, function(i, data) {
						
						var newRow = document.createElement("tr")
						var newCell = document.createElement("td")
						var newCell0 = document.createElement("td")
					    
					    var name = response.data[i].firstname +' '+response.data[i].lastname
					    
					    newCell.innerHTML = "<div class='d-flex '><img src="+'resources/images/profile/'+response.data[i].profile_image+" class='rounded-circle'/><div class='ms-3'><p class='fw-bold mb-1'>"+name+"</p><p class='text-muted mb-0'>"+response.data[i].email+"</p></div></div>"
					    newCell0.innerHTML = "<p>"+response.data[i].time_reg+"</p>"
					    
					    newRow.append(newCell)
					    newRow.append(newCell0)
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
		
	}
	
	});
	
	async function setFormat() {
		
		const monthENG = ["January","February","March","April","May","June","July","August","September","October","November","December"];
		
		var begin = document.getElementById('input_from').value
		var end = document.getElementById('input_to').value
		
		const beginArray = begin.split(" ");
		const endArray = end.split(" ");
		
		var begin_day = beginArray[0]
		var end_day = endArray[0]
		
		var begin_year = beginArray[2]
		var end_year = endArray[2]
		
		if(begin_day < 10) {
			begin_day = '0'+ begin_day
		}
		
		if(end_day < 10) {
			end_day = '0'+ end_day
		}
		
		if(beginArray[1] != undefined && endArray[1] != undefined) {
			
			var month = await setFormatStringToIndex(beginArray[1].replace(",", ""), endArray[1].replace(",", ""), monthENG)
			var begin_month = month[0]
			var end_month = month[1]
			
			b = begin_year +'-'+ begin_month +'-'+ begin_day
			e = end_year +'-'+ end_month +'-'+ end_day
			
		} /* else {
			
			Swal.fire({
				icon: 'warning',
				title: 'กรุณาเลือกวันที่',
				showConfirmButton: false,
				timer: 3000
			})
			
			$(':button').prop('disabled', false);
		} */

			
		
	}
	
	function setFormatStringToIndex(begin_month, end_month, monthENG) {
		
		for(var i = 0; i < monthENG.length; i++) {
					
				if(begin_month == monthENG[i]) {
					begin_month = i+1
					
					if(begin_month < 10) {
						begin_month = '0'+ begin_month
					}
				}
				
				if(end_month == monthENG[i]) {
					end_month = i+1
					
					if(end_month < 10) {
						end_month = '0'+ end_month
					}
				}
		}
		
		return([begin_month, end_month])
	}
	
	async function searchData() {
		
		document.getElementById('spinner').style.display = 'block';
		$("#internshipSelect").val('0').change();
		$(':button').prop('disabled', true);
		
		await setFormat()
		
		if(b != '' && e != '') {
			
			axios({
				  method: "post",
				  url: "getStatisticsInternshipCompleteDataCardFilter",
				  data: 'begin=' + b + '&end=' + e,
				}).then(function (response) {
					
					document.getElementById('userStatus2').innerHTML = response.data.role1_internshiping + ' คน'
					document.getElementById('userStatus1').innerHTML = response.data.role1_complete + ' คน'
					
					$(':button').prop('disabled', false);
					document.getElementById('spinner').style.display = 'none';
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
			
			
			
			axios({
				  method: "post",
				  url: "getStatisticsInternshipingDataDonutFilter",
				  data: 'begin=' + b + '&end=' + e,
				}).then(function (response) {
					
					$(':button').prop('disabled', false);
					document.getElementById('spinner').style.display = 'none';
					
					var aValues = []
					var bValues = []
					var barColors = [
						"#dc3545",
						"#0d6efd",
						"#ffc107",
						"#252525",
						"#00FFE8",
						"#00FF08",
						"#FFAA00",
						"#00FF8F",
						"#8F00FF",
						"#FF0087",
						"#B6B6B4" ,
						"#E5E4E2" ,
						"#BCC6CC" ,
						"#98AFC7" ,
						"#728FCE" ,
						"#4863A0" ,
						"#2B547E" ,
						"#191970" ,
						"#000080" ,
						"#151B8D" ,
						"#00008B" ,
						"#0000CD" ,
						"#0041C2" ,
						"#2916F5" ,
						"#0000FF" ,
						"#0909FF" ,
						"#1F45FC" ,
						"#2554C7" ,
						"#1569C7" ,
						"#1974D2" ,
						"#2B60DE" ,
						"#4169E1" ,
						"#2B65EC" ,
						"#306EFF" ,
						"#157DEC" ,
						"#1589FF" ,
						"#1E90FF" ,
						"#368BC1" ,
						"#4682B4" ,
						"#488AC7" ,
						"#357EC7" ,
						"#3090C7" ,
						"#659EC7" ,
						"#87AFC7" ,
						"#95B9C7" ,
						"#6495ED" ,
						"#6698FF" ,
						"#56A5EC" ,
						"#38ACEC" ,
						"#00BFFF" ,
						"#3BB9FF" ,
						"#5CB3FF" ,
						"#79BAEC" ,
						"#82CAFF" ,
						"#87CEFA" ,
						"#87CEEB" ,
						"#A0CFEC" ,
						"#B7CEEC" ,
						"#B4CFEC" ,
						"#ADDFFF" ,
						"#C2DFFF" ,
						"#C6DEFF" ,
						"#BDEDFF" ,
						"#B0E0E6" ,
						"#AFDCEC" ,
						"#ADD8E6" ,
						"#B0CFDE" ,
						"#C9DFEC" ,
						"#D5D6EA" ,
						"#E3E4FA" ,
						"#E6E6FA" ,
						"#EBF4FA" ,
						"#F0F8FF" ,
						"#F8F8FF" ,
						"#F0FFFF" ,
						"#E0FFFF" ,
						"#CCFFFF" ,
						"#9AFEFF" ,
						"#7DFDFE" ,
						"#57FEFF" ,
						"#00FFFF" ,
						"#0AFFFF" ,
						"#50EBEC" ,
						"#4EE2EC" ,
						"#16E2F5" ,
						"#8EEBEC" ,
						"#AFEEEE" ,
						"#CFECEC" ,
						"#81D8D0" ,
						"#77BFC7" ,
						"#92C7C7" ,
						"#78C7C7" ,
						"#7BCCB5" ,
						"#66CDAA" ,
						"#AAF0D1" ,
						"#7FFFD4" ,
						"#93FFE8" ,
						"#40E0D0" ,
						"#48D1CC" ,
						"#48CCCD" ,
						"#46C7C7" ,
						"#43C6DB" ,
						"#00CED1" ,
						"#43BFC7" ,
						"#20B2AA" ,
						"#3EA99F" ,
						"#5F9EA0" ,
						"#3B9C9C" ,
						"#008B8B" ,
						"#008080" ,
						"#045F5F" ,
						"#033E3E" ,
						"#25383C" ,
						"#2C3539" ,
						"#3C565B" ,
						"#4C787E" ,
						"#5E7D7E" ,
						"#307D7E" ,
						"#348781" ,
						"#438D80" ,
						"#4E8975" ,
						"#306754" ,
						"#2E8B57" ,
						"#31906E" ,
						"#00A36C" ,
						"#34A56F" ,
						"#50C878" ,
						"#3EB489" ,
						"#3CB371" ,
						"#78866B" ,
						"#848B79" ,
						"#617C58" ,
						"#728C00" ,
						"#6B8E23" ,
						"#808000" ,
						"#556B2F" ,
						"#4B5320" ,
						"#667C26" ,
						"#4E9258" ,
						"#387C44" ,
						"#347235" ,
						"#347C2C" ,
						"#228B22" ,
						"#008000" ,
						"#006400" ,
						"#046307" ,
						"#254117" ,
						"#437C17" ,
						"#347C17" ,
						"#6AA121" ,
						"#4AA02C" ,
						"#41A317" ,
						"#12AD2B" ,
						"#3EA055" ,
						"#73A16C" ,
						"#6CBB3C" ,
						"#6CC417" ,
						"#4CC417",
						"#dc3545",
						"#0d6efd",
						"#ffc107",
						"#252525",
						"#00FFE8",
						"#00FF08",
						"#FFAA00",
						"#00FF8F",
						"#8F00FF",
						"#FF0087",
						"#41A317" ,
						"#12AD2B" ,
						"#3EA055" ,
						"#252525",
						"#00FFE8",
						"#00FF08",
						"#FFAA00",
						"#252525",
						"#00FFE8",
						"#00FF08",
						"#FFAA00",
						"#252525",
						"#00FFE8",
						"#00FF08",
						"#FFAA00",
						"#252525",
						"#00FFE8",
						"#00FF08",
						"#FFAA00",
						"#252525",
						"#00FFE8",
						"#00FF08",
						"#FFAA00",
						"#252525",
						"#00FFE8",
						"#00FF08",
						"#FFAA00",
						"#252525",
						"#00FFE8",
						"#00FF08",
						"#FFAA00",
						"#252525",
						"#00FFE8",
						"#00FF08",
						"#FFAA00"

					];
					
					$.each(response.data, function(i, data) {
					
						aValues.push(response.data[i].internship_name)
						bValues.push(response.data[i].role1_count)
						
					})
					
					donut.destroy()
					donut = new Chart("donutChart", {
						type: "doughnut",
						data: {
							labels: aValues,
							datasets: [{
								backgroundColor: barColors,
								data: bValues
							}]
						},
						options: {
							title: {
								display: true,
								text: "จำนวนนิสิต/นักศึกษาที่กำลังฝึกงานและฝึกงานแล้วในแต่ละสถานที่ฝึกงาน"
							}
						}
					});
						
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
				title: 'กรุณาเลือกวันที่',
				showConfirmButton: false,
				timer: 3000
			})
			
			$(':button').prop('disabled', false);
			document.getElementById('spinner').style.display = 'none';
		}
		
		
	}
	
</script>