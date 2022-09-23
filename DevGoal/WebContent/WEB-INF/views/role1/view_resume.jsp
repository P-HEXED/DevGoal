<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ตัวอย่างเรซูมเม่</title>
<link rel="stylesheet" href="resources/stylecss/style_user.css">
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
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/js/bootstrap.min.js"
	integrity="sha384-5h4UG+6GOuV9qXh6HqOLwZMY4mnLPraeTrjT5v07o347pj6IkfuoASuGBhfDsp3d"
	crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>
<script type="text/javascript" src="resources/js/loading.js"></script>
<link rel="stylesheet" href="resources/stylecss/loading_axios.css">
</head>
<style>
@media print {
	html, body, main {
		width: 210mm;
		height: 297mm;
		overflow: hidden;
		-webkit-print-color-adjust: exact;
	}
	.btn{
		visibility: hidden;
		display: none;
	}
}

body {
	background: rgb(204, 204, 204);
}

page {
	background: #fff;
	display: block;
	margin: 0 auto;
	box-shadow: 0 0 0.5cm rgba(0, 0, 0, 0.5);
}

page[size=A4] {
	width: 210mm;
	height: 297mm;
}

@page {
	size: 210mm 297mm;
	margin: 0;
}

img {
	border-radius: 50%;
	width: 180px;
	height: 180px;
}

.center {
	display: block;
	margin: 0 auto;
}

Aside {
	background-color: #3b4f86;
}

p, i {
	font-size: 14px;
}

hr {
	background-color: #3b4f86;
}

.keySkills {
	list-style-type: none;
	column-count: 3;
}

.personalinfo {
	display: inline-block;
	margin: 0 auto;
}

Aside, section {
	line-height: 120%;
}

button {
	margin-top: 10px;
	margin-bottom: 10px;
	height:min-content;
}
.menu-container{

}
</style>
<body>
<div class="ring">DEVGOAL<span class="loading"></span></div>

	<main style="overflow-x:auto;">
		<div class="my-container d-flex ">
		<div class="menu-container">
		<button type="button" style="float:right;" class="btn btn-success" onClick="downloadResume()">ดาวน์โหลด</button>	
		<button type="button" style="float:right;" class="btn btn-info" onClick="printResume()">ปริ้นเรซูมเม่</button>	
		<button type="button" style="float:right;" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#pdfFileChoose">ส่งเรซูมเม่ให้นายจ้าง</button>
		</div>	
			<page size="A4" class="col-lg-11 col-md-11 col-sm-11 d-flex" id="resumeInformation">
			<Aside class="p-3 col-lg-4 col-md-4 col-sm-4 text-white">
				<img id="image" alt="profile" class="center mb-3">
				<h5>ข้อมูลส่วนตัว</h5>
				<p id="gender" class="personalinfo"></p><br>
				<p id="birthDay" class="personalinfo"></p><br>
				<p id="age" class="personalinfo"></p>
				<hr class="bg-white">
				<h5>ที่อยู่การติดต่อ</h5>
				<p id="phone">
					<i class="fa-solid fa-phone"></i>
				</p>
				<p id="email">
					<i class="fa-solid fa-envelope"></i>
				</p>
				<hr class="bg-white">
				<h5>ประวัติการศึกษา</h5>
				<p id="userHighSchool"></p>
				<p id="userHighSchoolGPAX"></p>
				<p id="study"></p>
				<p id="userUniversityGPAX"></p>
				
			</Aside>
			<section class="p-3 col-lg-8 col-lg-8 col-sm-8">
				<h4 id="name"></h4>
				<h6 id="userPostionFocus"></h6>
				<hr>
				<h5>คำอธิบายเกี่ยวกับตัวเอง</h5>
				<p id="userDetail"></p>
				<hr>
				<h5>เป้าหมายในการทำงาน</h5>
				<p id="userWorkDetail"></p>
				<hr>
				<h5>ทักษะ</h5>
				<ul class="keySkills" id="skill">
				</ul>
				<hr>
				<h5>ประสบการณ์</h5>
				<ul id="experience">
				</ul>
				<hr>
				<h5>ผลงานที่เคยทำ</h5>
				<ul id="work">
				</ul>
				<hr>
				<h5>งานอดิเรก</h5>
				<ul id="hobby">
				</ul>
			</section>
			</page>
		</div>
	</main>
	
	<div class="modal fade" id="pdfFileChoose">
				<div
					class="modal-dialog modal-l modal-fullscreen-lg-down modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">เลือกไฟล์เรซูเม่</h5>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col-lg-12">
									<input type="file" class="form-control" id="pdfFile">
								</div>
							</div>
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
						<div class="modal-footer">
							<button type="button" onClick="sendResume()"
								class="btn btn-primary" id="send">ส่งข้อมูล</button>
							<button type="button" class="btn btn-danger"
								data-bs-dismiss="modal">ปิด</button>
						</div>
					</div>
				</div>
			</div>
</body>
</html>
<script type="text/javascript">
	$(function() {

		var userHighSchool = sessionStorage.getItem("userHighSchool")
		var userWorkDetail = sessionStorage.getItem("userWorkDetail")
		var experience = JSON.parse(sessionStorage.getItem("experience"))
		var work = JSON.parse(sessionStorage.getItem("work"))
		var hobby = JSON.parse(sessionStorage.getItem("hobby"))
		var skill = JSON.parse(sessionStorage.getItem("skill"))
		var image = sessionStorage.getItem("image")
		var name = sessionStorage.getItem("name")
		var birthday = sessionStorage.getItem("birthday")
		var gender = sessionStorage.getItem("gender")
		var email = sessionStorage.getItem("email")
		var phone = sessionStorage.getItem("phone")
		var university = sessionStorage.getItem("university")
		var faculty = sessionStorage.getItem("faculty")
		var course = sessionStorage.getItem("course")
		var userHighSchoolGPAX = sessionStorage.getItem("userHighSchoolGPAX")
		var userUniversityGPAX = sessionStorage.getItem("userUniversityGPAX")
		var userPostionFocus = sessionStorage.getItem("userPostionFocus")
		var userDetail = sessionStorage.getItem("userDetail")
		
		
		document.getElementById('image').src = image
		document.getElementById('gender').innerHTML = 'เพศ : '+gender
		document.getElementById('birthDay').innerHTML = 'วันเกิด : '+birthday
		
		var date = new Date(); 
		var yearsVal = date.getFullYear() + 543
		var birthday = birthday.slice(birthday.length-4, birthday.length)
		
		document.getElementById('age').innerHTML = 'อายุ : '+ (yearsVal-birthday)
		document.getElementById('phone').innerHTML = 'เบอร์โทรศัพทร์ : '+phone
		document.getElementById('email').innerHTML = 'อีเมล : '+email
		document.getElementById('userHighSchool').innerHTML = 'มัธยมศึกษาตอนปลาย : '+userHighSchool
		document.getElementById('userHighSchoolGPAX').innerHTML = 'เกรดเฉลี่ยสะสม : '+userHighSchoolGPAX
		document.getElementById('study').innerHTML = 'อุดมศึกษา : หลักสูตร'+course +' คณะ'+faculty +' '+university
		document.getElementById('userUniversityGPAX').innerHTML = 'เกรดเฉลี่ยสะสม : '+userUniversityGPAX
		document.getElementById('name').innerHTML = name
		document.getElementById('userPostionFocus').innerHTML = 'ตำแหน่งที่สนใจ : '+userPostionFocus
		document.getElementById('userDetail').innerHTML = userDetail
		document.getElementById('userWorkDetail').innerHTML = userWorkDetail
		
		
		for(var i = 0; i < skill.length; i++) {
			
			$('#skill').append($('<li><i class="fa-solid fa-circle-dot"></i> '+skill[i]+'</li>'));
		}

		for(var j = 0; j < experience.length; j++) {
			$('#experience').append($('<li>'+experience[j]+'</li>'));
		}
		
		for(var k = 0; k < work.length; k++) {
			$('#work').append($('<li>'+work[k]+'</li>'));
		}
		
		for(var l = 0; l < hobby.length; l++) {
			$('#hobby').append($('<li>'+hobby[l]+'</li>'));
		}

		
	});
	
	function checkPdfType(pdfFile) {
		
		const  fileType = pdfFile.type;
		
		const validPdfTypes = ['application/pdf'];
		
		if (!validPdfTypes.includes(fileType)) {
	Swal.fire({
					icon: 'warning',
					title: 'ไม่รองรับไฟล์ ใช้ได้แค่ PDF เท่านั้น',
					showConfirmButton: false,
					timer: 3000
				})
		    return -1
		} else {
			return 0
		}
	}
	
	
	function printResume() {
        window.print();
    }
	
	async function sendResume() {
		
		document.getElementById('spinner').style.display = 'block';
		$(':button').prop('disabled', true);
		
		var emailRole3 = sessionStorage.getItem("emailRole3")
		
		
			if(emailRole3 != '' && pdfFile.files[0] != undefined && pdfFile.files[0] != null && pdfFile.files[0] != '') {
				
				if(await checkPdfType(pdfFile.files[0]) == 0) {
					
					
					let formData = new FormData();
					formData.append("emailRole3", emailRole3);
					formData.append("pdfResume", pdfFile.files[0]);
					
					axios({
						  method: "post",
						  url: "sendResume",
						  data: formData,
						}).then(function (response) {

							if(response.data.alert == "1") {
									  
							  Swal.fire({
							      icon: "success",
							    title: response.data.status,
							    showConfirmButton: false,
							    timer: 3000
							    })
							    .then(() => {
							      	sessionStorage.removeItem("userHighSchool");
									sessionStorage.removeItem("userWorkDetail");
									sessionStorage.removeItem("experience");
									sessionStorage.removeItem("work");
									sessionStorage.removeItem("hobby");
									sessionStorage.removeItem("skill");
									sessionStorage.removeItem("image");
									sessionStorage.removeItem("name");
									sessionStorage.removeItem("birthday");
									sessionStorage.removeItem("gender");
									sessionStorage.removeItem("email");
									sessionStorage.removeItem("phone");
									sessionStorage.removeItem("university");
									sessionStorage.removeItem("faculty");
									sessionStorage.removeItem("course");
									sessionStorage.removeItem("emailRole3");
									sessionStorage.removeItem("userHighSchoolGPAX");
									sessionStorage.removeItem("userUniversityGPAX");
									sessionStorage.removeItem("userPostionFocus");
									
									sessionStorage.clear();
									window.close()
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
					
					
				}
				
			} else {
				
				Swal.fire({
					  icon: 'warning',
					  title: 'กรุณาเลือกไฟล์เรซูมเม่',
					  showConfirmButton: false,
					  timer: 3000
					})
					
					$(':button').prop('disabled', false);
				 document.getElementById('spinner').style.display = 'none';
			}
			
		
		
		
		
	}
	
	function downloadResume() {
		
    	const page = document.getElementById('resumeInformation');
		
		html2pdf(page, {
		    jsPDF: {
		      orientation: 'p',
		      unit: 'mm',
		      format: 'a4',
		      putOnlyUsedFonts:true
		    },
		    imageType: 'image/jpeg',
		    output: 'resume.pdf'
		  });
	}
	
	
	
	</script>