<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>แดชบอร์ด</title>
    <meta name="theme-color" content="hsl(24.3, 97.4%, 54.3%)">
    <link href="resources/images/logo/devgoal_logo.png" size="48x48" rel="shortcut icon"  type="image/png"/>
    <link rel="stylesheet" href="resources/stylecss/style_user.css">
    <script src="https://unpkg.com/htmlincludejs"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
    <link rel="stylesheet" href="resources/stylecss/classic.css">
    <link rel="stylesheet" href="resources/stylecss/classic.date.css">
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
          <include src="resources/includeBody/role4/sidebar_admin.html"></include>
        </nav>
        <include src="resources/includeBody/role4/navbar_admin.html"></include>
          <section class="p-4 my-container">
              <button class="btn" id="menu-btn"><i class="fa-solid fa-list"></i></button>  
                    <div class="row">
                      <div class="col-lg-3 col-sm-12 col-md-12"> 
                        <div class="card card-date">
                          <div class="row p-3">
                            <div class="col-lg-6 col-sm-12 col-md-12">
                              <div class="form-group ">
                                  <label for="input_from">จากวันที่</label>
                                <input type="text" class="form-control" id="input_from" placeholder="Start Date">
                              </div>
                          </div>
                          <div class="col-lg-6 col-sm-12 col-md-12">
                            <div class="form-group">
                                <label for="input_to">ถึงวันที่</label>
                              <input type="text" class="form-control" id="input_to" placeholder="End Date">
                            </div>
                        </div>
                        <div class="col-lg-2 col-sm-12 col-md-12">
                        	<button type="button" onClick="searchData()" class='btn btn-primary'>ค้นหา</button>
                        </div>
                          </div>
                      </div>    
                      </div> 
                      
                      <div class=" col-lg-3 col-sm-12 col-md-12">
                        <div class="card" id="smallcard01">
                          <div class="card-body" style="height: 145px;">
                            <div class="row">
                              <div class="col-lg-12 col-md-4 col-sm-12 mb-3">
                                <i class="fa-solid fa-user-xmark text-danger fa-2x"></i><p>ผู้ใช้ที่ยังไม่ยืนยันอีเมล</p><h4 id="userStatus0"></h4>
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
                                <i class="fa-solid fa-user-check text-success fa-2x"></i><p>ผู้ใช้ที่ยืนยันแล้ว</p><h4 id="userStatus1"></h4>
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
                                <i class="fa-solid fa-user-clock text-warning fa-2x"></i><p>ผู้ใช้ที่รอการยืนยัน</p><h4 id="userStatus2"></h4>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-7 col-sm-12 col-md-12">
                        <div class="card ">
                          <div class="card-body">
                              <canvas id="linechart"></canvas>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-5 col-sm-12 col-md-12">
                        <div class="card">
                          <div class="card-body" >
                              <canvas id="donutChart" height="215vh" width="290vw" ></canvas>
                          </div>
                        </div>
                      </div>
                       <div class="container"style="width: 99.8%;">
                        <div class="card" >
                          <div class="card-body">
                              <canvas id="barChart" style="height:40vh; width:80vw;"></canvas>
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
        <script src="resources/js/chart.js"></script>
        <script src="resources/js/jquery-3.3.1.min.js"></script>
        <script src="resources/js/popper.min.js"></script>
        <script src="resources/js/bootstrap.min.js"></script>
        <script src="resources/js/picker.js"></script>
        <script src="resources/js/picker.date.js"></script>
        <script src="resources/js/main.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</body>
</html>
<script type="text/javascript">
	
	var donut = ''
	
	$(function() {
		
		axios({
			  method: "post",
			  url: "dashboardData",
			}).then(function (response) {
				
				document.getElementById('userStatus0').innerHTML = response.data.user_status0 + ' คน'
				document.getElementById('userStatus1').innerHTML = response.data.user_status1 + ' คน'
				document.getElementById('userStatus2').innerHTML = response.data.user_status2 + ' คน'
				
				var aValues = ["นิสิต / นักศึกษา", "อาจารย์", "นายจ้าง", "ผู้ดูแลระบบ"];
				var bValues = [response.data.user_type1, response.data.user_type2, response.data.user_type3, response.data.user_type4];
				var barColors = [
					"#dc3545",
					"#0d6efd",
					"#ffc107",
					"#252525",
				];

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
							text: "จำนวนผู้ใช้งานของแต่ละประเภท"
						}
					}
				});
				
				const ctx = document.getElementById('linechart').getContext('2d');
				const gradientcolor = ctx.createLinearGradient(0,0,0,350);
				gradientcolor.addColorStop(0.3,'#007bff');
				gradientcolor.addColorStop(1,'#A2F0FF');
				
				let draw = Chart.controllers.line.prototype.draw;
				Chart.controllers.line = Chart.controllers.line.extend({
				    draw: function() {
				        draw.apply(this, arguments);
				        let ctx = this.chart.chart.ctx;
				        let _stroke = ctx.stroke;
				        ctx.stroke = function() {
				            ctx.save();
				            ctx.shadowColor = 'black';
				            ctx.shadowBlur = 5;
				            ctx.shadowOffsetX = 0;
				            ctx.shadowOffsetY = 4;
				            _stroke.apply(this, arguments)
				            ctx.restore();
				        }
				    }
				});
				
				var date = new Date(); 
				
				const monthTH = ["มกราคม", "กุมภาพันธ์", "มีนาคม", "เมษายน", "พฤษภาคม", "มิถุนายน", "กรกฏาคม", "สิงหาคม", "กันยายน", "ตุลาคม", "พฤศจิกายน", "ธันวาคม"];
				
				var yearsVal = date.getFullYear() + 543
				
				
				var ourDate = ''
				
				var week_ago = []
				var month_cur_ago = []
				var date_current = ''
				
				for(var i = 0; i < 7; i++) {
					
					ourDate = new Date();
					
					date_current = ourDate.getDate() - i;
					ourDate.setDate(date_current)
					
					week_ago.push(ourDate.getDate());
					month_cur_ago.push(ourDate.getMonth());
				}
				
				
				new Chart("linechart", {
					type: "line",
					data: {
						labels: [
							week_ago[6] +' '+monthTH[month_cur_ago[6]]+' '+yearsVal,
							week_ago[5] +' '+monthTH[month_cur_ago[5]]+' '+yearsVal,
							week_ago[4] +' '+monthTH[month_cur_ago[4]]+' '+yearsVal,
							week_ago[3] +' '+monthTH[month_cur_ago[3]]+' '+yearsVal,
							week_ago[2] +' '+monthTH[month_cur_ago[2]]+' '+yearsVal,
							week_ago[1] +' '+monthTH[month_cur_ago[1]]+' '+yearsVal,
							week_ago[0] +' '+monthTH[month_cur_ago[0]]+' '+yearsVal,
						],
						datasets: [
							{
								data: [response.data.user_day1, response.data.user_day2, response.data.user_day3, response.data.user_day4, response.data.user_day5, response.data.user_day6, response.data.user_day7],
								lineTension: 0.5,
								backgroundColor: gradientcolor,
								borderColor: "#007bff",
								borderWidth: 2,
							 	pointBackgroundColor: "#007bff",
					            pointBorderColor: "#007bff",
					            pointHoverBackgroundColor: "#007bff",
					            pointHoverBorderColor: "#FFFFFF",
					            pointRadius: 3,
					            pointHoverRadius: 5
							},
						],
					},
					options: {
						scales: {
					        yAxes: [{
					            ticks: {
					                precision: 0
					            }
					        }]
					    },
						legend: {
							display: false,
						},
						title: {
							display: true,
							text: "จำนวนผู้ใช้ที่เข้าสู่ระบบย้อนหลัง 7 วัน"
						}
					}
				}
				);
				
				
				
				var yValues = [response.data.user_month1, response.data.user_month2, response.data.user_month3, response.data.user_month4, response.data.user_month5, response.data.user_month6, response.data.user_month7, response.data.user_month8, response.data.user_month9, response.data.user_month10, response.data.user_month11, response.data.user_month12];
				var barColors = [
					"#dc3545",
					"#e91e63",
					"#ffc107",
					"#252525",
					"#B23CFD",
					"#00B74A",
					"#39C0ED",
					"#ffea00",
					"#1de9b6",
					"#c6ff00",
					"#1976d2",
					"#0d6efd"
				];

				new Chart("barChart", {
					type: "bar",
					data: {
						labels: monthTH,
						datasets: [{
							backgroundColor: barColors,
							data: yValues
						}]
					},
					options: {
						legend: { display: false },
						title: {
							display: true,
							text: "จำนวนสถิติผู้สมัครใช้งานเว็บไซต์รายปี"
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
		$(':button').prop('disabled', true);
		
		await setFormat()
		
		if(b != '' && e != '') {
			
			axios({
				  method: "post",
				  url: "dashboardDataByDate",
				  data: 'begin=' + b + '&end=' + e,
				}).then(function (response) {
					
					document.getElementById('spinner').style.display = 'none';
					$(':button').prop('disabled', false);
					
					document.getElementById('userStatus0').innerHTML = response.data.user_status0 + ' คน'
					document.getElementById('userStatus1').innerHTML = response.data.user_status1 + ' คน'
					document.getElementById('userStatus2').innerHTML = response.data.user_status2 + ' คน'
					
					donut.destroy()
					
					var aValues = ["นิสิต / นักศึกษา", "อาจารย์", "นายจ้าง", "ผู้ดูแลระบบ"];
					var bValues = [response.data.user_type1, response.data.user_type2, response.data.user_type3, response.data.user_type4];
					var barColors = [
						"#dc3545",
						"#0d6efd",
						"#ffc107",
						"#252525",
					];

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
								text: "จำนวนผู้ใช้งานของแต่ละประเภท"
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