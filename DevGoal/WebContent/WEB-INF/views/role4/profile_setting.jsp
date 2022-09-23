<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>โปรไฟล์</title>
<link rel="stylesheet" href="resources/stylecss/style_user.css">
<link href="resources/images/logo/devgoal_logo.png" size="16x16"
	rel="shortcut icon" type="image/png" />
<script src="https://unpkg.com/htmlincludejs"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.2.0/mdb.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/loading.js"></script>
<link rel="stylesheet" href="resources/stylecss/loading_axios.css">
</head>
<body>
	<div class="ring">
		DEVGOAL<span class="loading"></span>
	</div>
	<main>
		<nav class="navbar navbar-expand d-flex flex-column " id="sidebar">
			<include src="resources/includeBody/role4/sidebar_admin.html"></include>
		</nav>
		<include src="resources/includeBody/role4/navbar_admin.html"></include>
		<section class="p-4 my-container">
			<button class="btn" id="menu-btn">
				<i class="fa-solid fa-list"></i>
			</button>
			<div class="card-container" id="somecard">
				<div class="card">
					<div class="card-header" id="infoName"></div>
					<div class="card-body">
						<div class="row">
							<div class="col-lg-3 text-center mb-4">
								<img src="" id="infoImage" alt="personal picture"
									style="width: 250px; height: 250px; border-radius: 20%;">
								<div class="row"></div>
							</div>
							<div class="col-lg-9">
								<form>
									<div class="row">
										<div class="col-sm col-md-5 col-lg-5">
											<div class="form-floating ">
												<input type="text" class="form-control" id="infoFirstname"
													placeholder="ชื่อ" name="name" disabled> <label
													for="name">ชื่อ</label>
											</div>
										</div>
										<div class="col-sm  col-md-5 col-lg-5">
											<div class="form-floating ">
												<input type="text" class="form-control" id="infoLastname"
													placeholder="นามสกุล" name="surname" disabled> <label
													for="surname">นามสกุล</label>
											</div>
										</div>
										<div class="col-sm col-md-2 col-lg-2">
											<div class="form-floating ">
												<input type="text" class="form-control" id="infoGender"
													placeholder="เพศสภาพ" name="gender" disabled> <label
													for="gender">เพศสภาพ</label>
											</div>
										</div>
									</div>
									<div class="col-sm col-md-12 col-lg-12">
										<div class="form-floating ">
											<input type="text" class="form-control" id="infoAddress"
												placeholder="ชื่อที่พัก/ชื่อหมู่บ้าน" name="address"
												disabled> <label for="address">ที่อยู่</label>
										</div>
									</div>
									<div class="row">
										<div class="col-sm col-md-6 col-lg-6">
											<div class="form-floating ">
												<input type="text" class="form-control" id="infoEmail"
													placeholder="อีเมล" name="email" disabled> <label
													for="email">อีเมล</label>
											</div>
										</div>
										<div class="col-sm col-md-6 col-lg-6">
											<div class="form-floating ">
												<input type="text" class="form-control"
													id="infoIdentified_number"
													placeholder="เลขบัตรประจำตัวประชาชน" name="id" disabled>
												<label for="id">เลขบัตรประจำตัวประชาชน</label>
											</div>
										</div>
									</div>
									<div class="row">
										<div class=" col-md-5 col-lg-5">
											<div class="form-floating ">
												<input type="text" class="form-control"
													id="infoStudent_code" placeholder="รหัสนิสิต / นักศึกษา"
													name="student_code" disabled> <label
													for="student_code">รหัสนิสิต / นักศึกษา</label>
											</div>
										</div>
										<div class=" col-md-5 col-lg-5">
											<div class="form-floating ">
												<input type="text" class="form-control" id="infoPhone"
													placeholder="ใส่เบอร์โทรศัพท์" name="phone" disabled>
												<label for="phone">เบอร์โทรศัพท์</label>
											</div>
										</div>
										<div class="col-md-2 col-lg-2">
											<div class="form-floating ">
												<input type="text" class="form-control" id="infoAge"
													placeholder="วันเกิด" name="age" disabled> <label
													for="age">วันเกิด</label>
											</div>
										</div>
									</div>
									<div class="row">
										<div class=" col-md-4 col-lg-4">
											<div class="form-floating ">
												<input type="text" class="form-control" id="infoUniversity"
													placeholder="ชื่อมหาวิทยาลัย" name="university" disabled>
												<label for="university">ชื่อมหาวิทยาลัย</label>
											</div>
										</div>
										<div class="col-md-4 col-lg-4">
											<div class="form-floating ">
												<input type="text" class="form-control" id="infoFaculty"
													placeholder="คณะ" name="faculty" disabled> <label
													for="faculty">คณะ</label>
											</div>
										</div>
										<div class=" col-md-4 col-lg-4">
											<div class="form-floating ">
												<input type="text" class="form-control" id="infoCourse"
													placeholder="สาขา" name="course" disabled> <label
													for="course">สาขา</label>
											</div>
										</div>
									</div>
									<div class="col-md-12 col-lg-6">
										<div class="form-floating ">
											<input type="text" class="form-control" id="infoAdvisor"
												placeholder="ชื่ออาจารย์ที่ปรึกษา" name="advisor" disabled>
											<label for="advisor">ชื่ออาจารย์ที่ปรึกษา</label>
										</div>
									</div>
									<div class="row">
										<div class="col-md-4 col-lg-4">
											<div class="form-floating ">
												<input type="text" class="form-control" id="infoStatus"
													placeholder="สถานะ" name="status" disabled> <label
													for="status">สถานะ</label>
											</div>
										</div>
										<div class=" col-md-4 col-lg-4">
											<div class="form-floating ">
												<input type="text" class="form-control" id="infoUser_type"
													placeholder="สิทธิ์ผู้ใช้งาน" name="user_type" disabled>
												<label for="user_type">สิทธิ์ผู้ใช้งาน</label>
											</div>
										</div>
										<div class="col-md-4 col-lg-4">
											<div class="form-floating ">
												<input type="text" class="form-control" id="infoTime_reg"
													placeholder="เวลาที่สมัคร" name="time_reg" disabled>
												<label for="time_reg">เวลาที่สมัคร</label>
											</div>
										</div>
										<input type="hidden" class="form-control" id="infoUserId">
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="card-footer">
						<button type="button" class="btn btn-warning"
							data-bs-toggle="modal" data-bs-target="#info">แก้ไขข้อมูลส่วนตัว</button>
						<button type="button" class="btn btn-primary"
							data-bs-toggle="modal" data-bs-target="#passwordUpdate">ตั้งค่ารหัสผ่าน</button>
						<button type="button" class="btn btn-success"
							data-bs-toggle="modal" data-bs-target="#skillUpdate"
							onClick="skillData()">ตั้งค่าความสามารถ</button>
					</div>
				</div>
			</div>
			<div class="modal fade" id="info">
				<div
					class="modal-dialog modal-xl modal-fullscreen-lg-down modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h5 id="nameShow" class="modal-title"></h5>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col-lg-3 text-center">
									<img class="mb-5" id="imageShow" src="" alt="personal picture"
										style="width: 250px; height: 250px; border-radius: 20%;">
									<p style="font-size: 18px; color: red;">การแก้ไขรูปโปรไฟล์
										ให้เลือกอย่างใดอย้่างหนึ่ง</p>
									<p style="font-size: 16px; color: red;">1.อัปโหลดรูป
										2.กรอกชื่อไฟล์ใหม่ที่ผู้ใช้ร้องขอ</p>
								</div>
								<div class="col-lg-9">
									<form>
										<div class="card-body">
											<div class="tab-content" id="myTabContent">
												<div class="row">
													<div class="col-sm-12 col-md-12 col-lg-3 my-1">
														<p>เพศ</p>
														<div class="form-check">
															<input class="form-check-input" type="radio"
																name="flexRadioDefault" id="male_gender"> <label
																class="form-check-label" for="male_gender"> ชาย
															</label>
														</div>
														<div class="form-check">
															<input class="form-check-input" type="radio"
																name="flexRadioDefault" id="female_gender" checked>
															<label class="form-check-label" for="female_gender">
																หญิง </label>
														</div>
													</div>
													<div class="col-sm-12 col-md-6 col-lg-5 my-1">
														<p>ชื่อ</p>
														<input type="text" class="form-control"
															placeholder="ชื่อ (ไม่ต้องใส่คำนำหน้า)" aria-label="ชื่อ"
															aria-describedby="basic-addon1" id="firstname">
													</div>
													<div class="col-sm-12 col-md-6 col-lg-4 my-1">
														<p>นามสกุล</p>
														<input type="text" class="form-control"
															placeholder="นามสกุล" aria-label="นามสกุล"
															aria-describedby="basic-addon1" id="lastname">
													</div>
													<div class="col-sm-12 col-md-12 col-lg-4 my-1">
														<p style="margin: 0; display: inline; float: left">อัปโหลดรูปถ่ายหน้าตรง</p>
														<p></p>
														<p
															style="font-size: 12px; color: red; margin: 0; display: inline; float: right">(ไฟล์
															JPEG, PNG เท่านั้น)</p>
														<br> <input type="file" class="form-control"
															id="profile_image">
													</div>
													<div class="col-sm-12 col-md-4 col-lg-4 my-1"
														id="div_imageNameFile">
														<p>ชื่อรูปโปรไฟล์</p>
														<input type="text" class="form-control"
															placeholder="ชื่อรูปโปรไฟล์" aria-label="ชื่อรูปโปรไฟล์"
															aria-describedby="basic-addon1" id="imageNameFile">
													</div>
													<div class="col-sm-12 col-md-4 col-lg-4 my-1"
														id="div_student_code">
														<p>รหัสนิสิต/นักศึกษา</p>
														<input type="number" class="form-control"
															placeholder="รหัสนิสิต/นักศึกษา"
															aria-label="รหัสนิสิต/นักศึกษา"
															aria-describedby="basic-addon1" min="1" id="student_code">
													</div>
													<div class="col-sm-12 col-md-4 col-lg-3 my-2"
														id="div_user_type">
														<p>สิทธิ์การใช้งาน</p>
														<select class="form-select" id="user_type">
															<option value="1">นิสิต/นักศึกษา</option>
															<option value="2">อาจารย์</option>
															<option value="3">นายจ้าง</option>
															<option value="4">ผู้ดูแลระบบ</option>
														</select>
													</div>
													<div class="col-sm-12 col-md-4 col-lg-4 my-1">
														<p>เลขบัตรประชาชน</p>
														<input type="number" class="form-control"
															placeholder="เลขบัตรประชาชน" aria-label="เลขบัตรประชาชน"
															aria-describedby="basic-addon1" min="1" id="identified">
													</div>
													<div class="col-sm-12 col-md-4 col-lg-3 my-1">
														<p>เบอร์โทร</p>
														<input type="number" class="form-control"
															placeholder="เบอร์โทร" aria-label="เบอร์โทร"
															aria-describedby="basic-addon1" min="1" id="phone">
													</div>
													<div class="col-sm-12 col-md-4 col-lg-3 my-1">
														<p>วันเกิด (ข้อมูลเดิม)</p>
														<input type="text" class="form-control"
															placeholder="วันเกิด" aria-label="วันเกิด"
															aria-describedby="basic-addon1" min="1" id="age" disabled>
													</div>
												</div>
												<br>
												<div class="row">

													<div class="col-lg-2 col-sm-12 col-md-3">
														<p>เดือนเกิด</p>
														<select class="form-select" id="month">
															<option value="0">เดือน</option>
															<option value="1">มกราคม</option>
															<option value="2">กุมภาพันธ์</option>
															<option value="3">มีนาคม</option>
															<option value="4">เมษายน</option>
															<option value="5">พฤษภาคม</option>
															<option value="6">มิถุนายน</option>
															<option value="7">กรกฏาคม</option>
															<option value="8">สิงหาคม</option>
															<option value="9">กันยายน</option>
															<option value="10">ตุลาคม</option>
															<option value="11">พฤศจิกายน</option>
															<option value="12">ธันวาคม</option>
														</select>
													</div>

													<div class="col-lg-2 col-sm-12 col-md-3">
														<p>วันเกิด</p>
														<select class="form-select" id="day">
															<option value="0">วันที่</option>
														</select>
													</div>

													<div class="col-lg-2 col-sm-12 col-md-3">
														<p>ปีเกิด</p>
														<select class="form-select" id="years">
															<option value="0">ปี</option>
														</select>
													</div>

													<div class="col-sm-12 col-md-4 col-lg-3 my-1">
														<p>เวลาที่สมัคร</p>
														<input type="text" class="form-control"
															placeholder="เวลาที่สมัคร" aria-label="เวลาที่สมัคร"
															aria-describedby="basic-addon1" id="time_reg" disabled>
													</div>

												</div>

												<hr>
												<div class="row">
													<div class="col-sm-12 col-md-12 col-lg-4 my-2">
														<p>ชื่อที่พัก/ชื่อหมู่บ้าน</p>
														<input type="text" class="form-control"
															placeholder="ชื่อที่พัก/ชื่อหมู่บ้าน"
															aria-label="ชื่อที่พัก/ชื่อหมู่บ้าน"
															aria-describedby="basic-addon1" id="address_1">
													</div>
													<div class="col-sm-12 col-md-6 col-lg-2 my-2">
														<p>เลขที่</p>
														<input type="number" class="form-control"
															placeholder="เลขที่" aria-label="เลขที่"
															aria-describedby="basic-addon1" min="1" id="address_2">
													</div>
													<div class="col-sm-12 col-md-6 col-lg-2 my-2">
														<p>หมู่ที่</p>
														<input type="number" class="form-control"
															placeholder="หมู่ที่" aria-label="หมู่ที่"
															aria-describedby="basic-addon1" min="1" id="address_3">
													</div>
													<div class="col-sm-12 col-md-6 col-lg-4 my-2">
														<p>จังหวัด</p>
														<input type="text" class="form-control"
															placeholder="จังหวัด" aria-label="จังหวัด"
															aria-describedby="basic-addon1" id="address_6" disabled>
													</div>
													<div class="col-sm-12 col-md-6 col-lg-4 my-2">
														<p>อำเภอ/เขต</p>
														<input type="text" class="form-control"
															placeholder="อำเภอ" aria-label="อำเภอ"
															aria-describedby="basic-addon1" id="address_5" disabled>
													</div>
													<div class="col-sm-12 col-md-6 col-lg-4 my-2">
														<p>ตำบล/แขวง</p>
														<input type="text" class="form-control" placeholder="ตำบล"
															aria-label="ตำบล" aria-describedby="basic-addon1"
															id="address_4" disabled>
													</div>
													<div class="col-sm-12 col-md-6 col-lg-4 my-2">
														<p>รหัสไปรษณีย์</p>
														<input type="number" class="form-control"
															placeholder="รหัสไปรษณีย์" aria-label="รหัสไปรษณีย์"
															aria-describedby="basic-addon1" min="1" id="address_7"
															disabled>
													</div>
												</div>

												<div class="row">

													<div class="col-sm-12 col-md-6 col-lg-3 my-2">
														<p>จังหวัด</p>
														<select class="form-select" id="address_6_update">
															<option value="0">กรุณาเลือกจังหวัด</option>
														</select>
													</div>

													<div class="col-sm-12 col-md-6 col-lg-3 my-2">
														<p>อำเภอ/เขต</p>
														<select class="form-select" id="address_5_update">
															<option value="0">กรุณาเลือกอำเภอ</option>
														</select>
													</div>

													<div class="col-sm-12 col-md-6 col-lg-3 my-2">
														<p>ตำบล/แขวง</p>
														<select class="form-select" id="address_4_update">
															<option value="0">กรุณาเลือกตำบล</option>
														</select>
													</div>

												</div>

												<hr>
												<div class="row">
													<div class="col-sm-12 col-md-12 col-lg-6 my-2">
														<p id="p_email">อีเมลมหาลัย</p>
														<input type="email" class="form-control"
															placeholder="อีเมลมหาลัย" aria-describedby="basic-addon1"
															id="email">
													</div>
													<div class="col-sm-12 col-md-12 col-lg-6 my-2"
														id="div_advisor">
														<p>ชื่ออาจารย์ที่ปรึกษา</p>
														<input type="text" class="form-control"
															placeholder="ชื่ออาจารย์ที่ปรึกษา (ใส่คำนำหน้า)"
															aria-label="อาจารย์ที่ปรึกษา"
															aria-describedby="basic-addon1" id="advisor">
													</div>
													<input type="hidden" id="user_id" />
												</div>
												</br>
												<div class="row">
													<div class="col-sm-12 col-md-6 col-lg-4 my-2">
														<p>มหาวิทยาลัย (ข้อมูลปัจจุบัน)</p>
														<input type="text" class="form-control"
															placeholder="มหาวิทยาลัย" aria-label="มหาวิทยาลัย"
															aria-describedby="basic-addon1" id="old_university"
															disabled> <input type="hidden"
															id="old_university_id" />
													</div>
													<div class="col-sm-12 col-md-6 col-lg-4 my-2">
														<p>คณะ (ข้อมูลปัจจุบัน)</p>
														<input type="text" class="form-control" placeholder="คณะ"
															aria-label="คณะ" aria-describedby="basic-addon1"
															id="old_faculty" disabled> <input type="hidden"
															id="old_faculty_id" />
													</div>
													<div class="col-sm-12 col-md-6 col-lg-4 my-2">
														<p>หลักสูตร (ข้อมูลปัจจุบัน)</p>
														<input type="text" class="form-control"
															placeholder="หลักสูตร" aria-label="หลักสูตร"
															aria-describedby="basic-addon1" id="old_course" disabled>
														<input type="hidden" id="old_course_id" />
													</div>
												</div>
												<div class="row">
													<div class="col-sm-12 col-md-4 col-lg-4 my-2"
														id="div_university">
														<p>มหาวิทยาลัย</p>
														<select class="form-select" id="university">
														</select>
													</div>

													<div class="col-sm-12 col-md-4 col-lg-4 my-2"
														id="div_faculty">
														<p>คณะ</p>
														<select class="form-select" id="faculty">
														</select>
													</div>

													<div class="col-sm-12 col-md-4 col-lg-4 my-2"
														id="div_course">
														<p>หลักสูตร</p>
														<select class="form-select" id="course">
														</select>
													</div>
												</div>
												<hr>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" onClick="updateUserData()"
								class="btn btn-primary" data-bs-dismiss="modal">บันทึก</button>
							<button type="button" class="btn btn-danger"
								data-bs-dismiss="modal">ยกเลิก</button>
						</div>
					</div>
				</div>
			</div>

			<div class="modal fade" id="passwordUpdate">
				<div
					class="modal-dialog modal-l modal-fullscreen-lg-down modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">ตั้งค่ารหัสผ่าน</h5>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col-lg-12">
									<form>
										<div class="form-floating ">
											<input type="password" class="form-control"
												id="passwordModal" placeholder="รหัสผ่าน" name="password">
											<label for="password">รหัสผ่าน</label>
										</div>
										<div class="form-floating ">
											<input type="password" class="form-control"
												id="confirmPasswordModal" placeholder="ยืนยันรหัสผ่าน"
												name="password"> <label for="password">ยืนยันรหัสผ่าน</label>
										</div>
										<div class="form-check">
											<input class="form-check-input mt-2" type="checkbox"
												onclick="showPassword()" id="flexCheckDefault"> <label
												class="form-check-label mt-1" for="flexCheckDefault">
												แสดงรหัสผ่าน </label>
										</div>
									</form>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" onClick="updateUserPassword()"
								class="btn btn-primary">บันทึก</button>
							<button type="button" class="btn btn-danger"
								data-bs-dismiss="modal">ยกเลิก</button>
						</div>

						<div class="lds-roller" id="spinner1" style="display: none;">
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
				</div>
			</div>

			<div class="modal fade" id="skillUpdate">
				<div
					class="modal-dialog modal-xl modal-fullscreen-lg-down modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">ตั้งค่าความสามารถ</h5>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="row">
									<div class="col-sm-12 col-md-12 col-lg-6">
										<p>ทักษะด้านโปรแกรมมิ่ง</p>
										<select class="form-select" id="language">
											<option value="0">เลือกทักษะด้านโปรแกรมมิ่ง</option>
										</select>
									</div>
									<div class="col-sm-12 col-md-12 col-lg-4">
										<p>ระดับความชำนาญ</p>
										<select class="form-select" id="level">
											<option value="0">เลือกระดับความชำนาญ</option>
											<option value="1">ระดับเริ่มต้น</option>
											<option value="2">ระดับปานกลาง</option>
											<option value="3">ระดับสูง</option>
										</select>
									</div>
									<div class="col-sm-12 col-md-12 col-lg-2">
										<p>.</p>
										<button class="btn btn-primary" onclick="addSkillDatatable()">เพิ่มข้อมูล</button>
									</div>
								</div>
								<div class="col-sm-12 col-md-12 col-lg-6">
									<table id="datatable_language"
										class="table table-primary table-striped shadow p-3 mb-5 rounded"
										style="width: 100%">
										<thead>
											<tr>
												<th>ลำดับ</th>
												<th>ทักษะด้านโปรแกรมมิ่ง</th>
												<th>ระดับความชำนาญ</th>
												<th>ลบ</th>
											</tr>
										</thead>
										<tbody id="data_language">
									</table>
								</div>

							</div>
						</div>
						<div class="modal-footer">
							<button type="button" onClick="updateUserSkill()"
								class="btn btn-primary">บันทึก</button>
							<button type="button" class="btn btn-danger"
								data-bs-dismiss="modal">ยกเลิก</button>
						</div>

						<div class="lds-roller" id="spinner2" style="display: none;">
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
</body>
</html>
<script type="text/javascript">

$(function() {
	
	var date = new Date(); 
	var yearsVal = date.getFullYear() + 543
	
	for(var i = 0; i < 10; i++) {
		
		$('#years').append($('<option value="' + ((yearsVal-18)-i) + '">' + ((yearsVal-18)-i) + '</option>'));
		
	}
			
	axios({
		  method: "post",
		  url: "profileSettingAdmin",
		}).then(function (response) {
			document.getElementById('infoName').innerHTML = response.data[0].firstname + ' ' + response.data[0].lastname
			document.getElementById("infoImage").src = "resources/images/profile/"+response.data[0].profile_image
			document.getElementById('infoFirstname').value = response.data[0].firstname
			document.getElementById('infoLastname').value = response.data[0].lastname
			document.getElementById('infoGender').value = response.data[0].gender
			document.getElementById('infoAddress').value = response.data[0].address1+' '+response.data[0].address2+' '+response.data[0].address3+' '+response.data[0].address4+' '+response.data[0].address5+' '+response.data[0].address6+' '+response.data[0].address7
			document.getElementById('infoEmail').value = response.data[0].email
			document.getElementById('infoIdentified_number').value = response.data[0].identified_number
			
			if(response.data[0].university_name == undefined) {
				document.getElementById('infoUniversity').value = "ไม่มีข้อมูล"
				document.getElementById('old_university').value = ""
			} else {
				document.getElementById('infoUniversity').value = response.data[0].university_name
				document.getElementById('old_university').value = response.data[0].university_name
			}
			if(response.data[0].faculty_name == undefined) {
				document.getElementById('infoFaculty').value = "ไม่มีข้อมูล"
				document.getElementById('old_faculty').value = ""
			} else {
				document.getElementById('infoFaculty').value = response.data[0].faculty_name
				document.getElementById('old_faculty').value = response.data[0].faculty_name
			}
			if(response.data[0].course_name == undefined) {
				document.getElementById('infoCourse').value = "ไม่มีข้อมูล"
				document.getElementById('old_course').value = ""
			} else {
				document.getElementById('infoCourse').value = response.data[0].course_name
				document.getElementById('old_course').value = response.data[0].course_name
			}
			if(response.data[0].advisor == undefined) {
				document.getElementById('infoAdvisor').value = "ไม่มีข้อมูล"
				document.getElementById('advisor').value = ""
			} else {
				document.getElementById('infoAdvisor').value = response.data[0].advisor
				document.getElementById('advisor').value = response.data[0].advisor
			}
			if(response.data[0].student_code == undefined) {
				document.getElementById('infoStudent_code').value = "ไม่มีข้อมูล"
				document.getElementById('student_code').value = ""
			} else {
				document.getElementById('infoStudent_code').value = response.data[0].student_code
				document.getElementById('student_code').value = response.data[0].student_code
			}
			
			document.getElementById('infoPhone').value = response.data[0].phone
			document.getElementById('infoAge').value = response.data[0].birthday
			document.getElementById('infoStatus').value = response.data[0].status
			
			var user_type = response.data[0].user_type
			
			if(user_type == "1") {
				
				user_type = "นิสิต/นักศึกษา"
			} else if(user_type == "2") {
				
				user_type = "อาจารย์"
			} else if(user_type == "3") {
				
				user_type = "นายจ้าง"
			} else if(user_type == "4") {
				
				user_type = "ผู้ดูแลระบบ"
			}
			
			document.getElementById('infoUser_type').value = user_type
			document.getElementById('infoTime_reg').value = response.data[0].time_reg
			document.getElementById('infoUserId').value = response.data[0].user_id
			document.getElementById('passwordModal').value = ''
			document.getElementById('confirmPasswordModal').value = ''
			
			document.getElementById("imageShow").src = "resources/images/profile/"+response.data[0].profile_image
			document.getElementById("imageNameFile").value = response.data[0].profile_image
			document.getElementById('firstname').value = response.data[0].firstname
			document.getElementById('lastname').value = response.data[0].lastname
			document.getElementById('address_1').value = response.data[0].address1
			document.getElementById('address_2').value = response.data[0].address2
			document.getElementById('address_3').value = response.data[0].address3
			document.getElementById('address_4').value = response.data[0].address4
			document.getElementById('address_5').value = response.data[0].address5
			document.getElementById('address_6').value = response.data[0].address6
			document.getElementById('address_7').value = response.data[0].address7
			
			if(response.data[0].gender == "ชาย") {
				document.getElementById('male_gender').checked = true;
			} else if(response.data[0].gender == "หญิง") {
				document.getElementById('female_gender').checked = true;
			}
			
			$("#user_type").val(response.data[0].user_type).change();
			document.getElementById('email').value = response.data[0].email
			document.getElementById('identified').value = response.data[0].identified_number
			document.getElementById('phone').value = response.data[0].phone
			document.getElementById('age').value = response.data[0].birthday
			
			
			document.getElementById('time_reg').value = response.data[0].time_reg
			document.getElementById('nameShow').innerHTML = response.data[0].firstname+' '+response.data[0].lastname
			document.getElementById('user_id').value = response.data[0].user_id
			
			if(response.data[0].university_id == undefined) {
				document.getElementById('old_university_id').value = ""
			} else {
				document.getElementById('old_university_id').value = response.data[0].university_id
			}
			if(response.data[0].faculty_id == undefined) {
				document.getElementById('old_faculty_id').value = ""
			} else {
				document.getElementById('old_faculty_id').value = response.data[0].faculty_id
			}
			if(response.data[0].course_id == undefined) {
				document.getElementById('old_course_id').value = ""
			} else {
				document.getElementById('old_course_id').value = response.data[0].course_id
			}
			
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
		  url: "findSkill",
		}).then(function (response) {
		  $.each(response.data, function(i, data) {
		             $('#language').append($('<option value="' + (i+1) + '">' + response.data[i].detail + '</option>'));
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
	
	axios({
		  method: "post",
		  url: "findProvinces",
		}).then(function (response) {
			$.each(response.data, function(i, data) {
       	$('#address_6_update').append($('<option value="' + response.data[i].province_id + '">' + response.data[i].province_name + '</option>'));
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

$('#address_6_update').change(function() {
	
	var e = document.getElementById("address_6_update");
	var province_id = e.options[e.selectedIndex].value;
	
	axios({
		  method: "post",
		  url: "findAmphure",
		  data: "province_id="+province_id,
		}).then(function (response) {
			
			$("#address_5_update").empty();
			$("#address_4_update").empty();
			
			document.getElementById("address_6").value = e.options[e.selectedIndex].text
			document.getElementById("address_5").value = 'กรุณาเลือกอำเภอ'
			document.getElementById("address_4").value = 'กรุณาเลือกตำบล'
			document.getElementById("address_7").value = '0'

			$('#address_5_update').append('<option value="0">กรุณาเลือกอำเภอ</option>')
			$('#address_4_update').append('<option value="0">กรุณาเลือกตำบล</option>')
			
			
			$.each(response.data, function(i, data) {
				
           		$('#address_5_update').append($('<option value="' + response.data[i].amphure_id + '">' + response.data[i].amphure_name + '</option>'));
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


$('#address_5_update').change(function() {
	
	var e = document.getElementById("address_5_update");
	var amphure_id = e.options[e.selectedIndex].value;
	
	axios({
		  method: "post",
		  url: "findDistricts",
		  data: "amphure_id="+amphure_id,
		}).then(function (response) {
			
			$("#address_4_update").empty();
			
			document.getElementById("address_5").value = e.options[e.selectedIndex].text
			document.getElementById("address_4").value = 'กรุณาเลือกตำบล'
			document.getElementById("address_7").value = '0'

			$('#address_4_update').append('<option value="0">กรุณาเลือกตำบล</option>')
			
			$.each(response.data, function(i, data) {
				
           		$('#address_4_update').append($('<option value="' + response.data[i].zip_code + '">' + response.data[i].districts_name + '</option>'));
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




$('#address_4_update').change(function() {
	
	var e = document.getElementById("address_4_update");
	var zip_code = e.options[e.selectedIndex].value;
	
	document.getElementById("address_4").value = e.options[e.selectedIndex].text
	document.getElementById("address_7").value = zip_code
	
});

$('#month').change(function() {
	
	const nums31 = ['1', '3', '5', '7', '8', '10', '12']
	const nums30 = ['4', '6', '9', '11']
	const num29 = 2
	
	var e = document.getElementById("month");
	var month_val = e.options[e.selectedIndex].value;
	
	if(month_val != 0) {
		
		if(nums31.includes(month_val)) {
			
			$('#day').empty()
			$('#day').append($('<option value="0">วันที่</option>'));
			
			for(var i = 1; i <= 31; i++) {
				
				$('#day').append($('<option value="' + i + '">' + i + '</option>'));
			}
			
		}else if(nums30.includes(month_val)) {
			
			$('#day').empty()
			$('#day').append($('<option value="0">วันที่</option>'));
			
			for(var i = 1; i <= 30; i++) {
				
				$('#day').append($('<option value="' + i + '">' + i + '</option>'));
			}
			
		}else if(num29 == month_val) {
			
			$('#day').empty()
			$('#day').append($('<option value="0">วันที่</option>'));
			
			for(var i = 1; i <= 29; i++) {
				
				$('#day').append($('<option value="' + i + '">' + i + '</option>'));
			}
			
		}
		
	} else {
		$('#day').empty()
		$('#day').append($('<option value="0">วันที่</option>'));
	}
	
	
});

function skillData() {
	
var user_id = document.getElementById('infoUserId').value
	
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
			    var newCell3 = document.createElement("td")
			    
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
			    newCell3.innerHTML = "<i class='fa fa-close' style='color: red'></i>"
			    
			    
			    newRow.append(newCell0)
			    newRow.append(newCell1)
			    newRow.append(newCell2)
			    newRow.append(newCell3)
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

	
}
var i = 1
function addSkillDatatable() {
	var x = document.getElementById("language");
	var language = x.options[x.selectedIndex].text;
	 
	var e = document.getElementById("level");
	var level = e.options[e.selectedIndex].text;
	
	if(language != 'เลือกทักษะด้านโปรแกรมมิ่ง' && level != 'เลือกระดับความชำนาญ') {
		
		var newRow = document.createElement("tr")
		var newCell0 = document.createElement("td")
	    var newCell1 = document.createElement("td")
	    var newCell2 = document.createElement("td")
	    var newCell3 = document.createElement("td")
	    
	    newCell0.innerHTML = i++
	    newCell1.innerHTML = language
	    newCell2.innerHTML = level
	    newCell3.innerHTML = "<i class='fa fa-close' style='color: red'></i>"
	    
	    newRow.append(newCell0)
	    newRow.append(newCell1)
	    newRow.append(newCell2)
	    newRow.append(newCell3)
	    document.getElementById("data_language").appendChild(newRow)
	    
	    x.remove(x.selectedIndex)
    
  		$("#language").val(0).change();
   	 	$("#level").val(0).change();
		
	} else {
		Swal.fire({
			icon: 'warning',
			title: 'กรุณากรอกข้อมูลความสามารถ',
			showConfirmButton: false,
			timer: 3000
		})
	}
	
}

function getValueSkillDatatable() {
	
	var skill = []
	var subSkill = []
	
	var table = $('#datatable_language')
	
	var i = 0
	table.children("tbody").find("td").each(function() {
		subSkill.push($(this).text())
		
		if(i == 3) {
			skill.push(subSkill.splice(1,2))
			subSkill = []
			i = 0
		} else {
			i++
		}
		
   });
	
	return skill
	
	
}

function updateUserSkill() {
	
	document.getElementById('spinner2').style.display = 'block';
	$(':button').prop('disabled', true);
	
	const data = $.getJSON('https://api.ipify.org?format=json', function(data){
		
		var skill = getValueSkillDatatable()
		var ip = data.ip
			
		axios({
			  method: "post",
			  url: "updateUserSkill",
			  data: 'skill='+JSON.stringify(skill)+'&ip='+ip,
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
						  document.getElementById('spinner2').style.display = 'none';
						} else if(response.data.alert == "2") {
						  
						  Swal.fire({
						      icon: "warning",
						    title: response.data.status,
						    showConfirmButton: false,
						    timer: 3000
						    })
						    
						    $(':button').prop('disabled', false);
						  document.getElementById('spinner2').style.display = 'none';
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
				document.getElementById('spinner2').style.display = 'none';
			  });
		
	});
	
	
}

function checkDataForm(address_2, address_3, address_7, student_code, identified, phone, user_type, email) {
	
	const regex_pattern = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	
	if(user_type == "1") {
		
		if(address_2 > 0 && address_3 > 0 && address_7 > 0 && student_code > 0 && phone > 0 && phone.length == 10 && identified > 0 && identified.length == 13 && regex_pattern.test(email)) {
			return 0
		} else {
			Swal.fire({
					  icon: 'warning',
					  title: 'กรุณาตรวจสอบข้อมูล (เลขที่, หมู่ที่, รหัสไปรษณีย์, รหัสนิสิต/นักศึกษา, เบอร์โทร, เลขบัตรประชาชน, อีเมล)',
					  showConfirmButton: false,
					  timer: 3000
					})
					$(':button').prop('disabled', false);
						document.getElementById('spinner').style.display = 'none';
			return -1
		}
	} else {
		
		if(address_2 > 0 && address_3 > 0 && address_7 > 0 && phone > 0 && phone.length == 10 && identified > 0 && identified.length == 13 && regex_pattern.test(email)) {
			return 0
		} else {
			Swal.fire({
					  icon: 'warning',
					  title: 'กรุณาตรวจสอบข้อมูล (เลขที่, หมู่ที่, รหัสไปรษณีย์, เบอร์โทร, เลขบัตรประชาชน, อีเมล)',
					  showConfirmButton: false,
					  timer: 3000
					})
					$(':button').prop('disabled', false);
						document.getElementById('spinner').style.display = 'none';
			return -1
		}
		
	}
	
}

function updateUserData(){
	
	document.getElementById('spinner').style.display = 'block';
	$(':button').prop('disabled', true);
	
	const data = $.getJSON('https://api.ipify.org?format=json', function(data){
	
	var user_id = document.getElementById("user_id").value
	var male = document.getElementById("male_gender").checked
	var female = document.getElementById("female_gender").checked
	var gender = ""
	var firstname = document.getElementById("firstname").value
	var lastname = document.getElementById("lastname").value
	
	var d = document.getElementById("day");
	var day = d.options[d.selectedIndex].value;
	
	var m = document.getElementById("month");
	var month = m.options[m.selectedIndex].text;
	
	var y = document.getElementById("years");
	var years = y.options[y.selectedIndex].value;
	
	var age = ""
	
	if(day != "0" && month != "เดือน" && years != "0") {
		
		age = day +' '+ month +' '+ years
		
	} else {
		
		age = document.getElementById("age").value
		
	}
	
	var address_1 = document.getElementById("address_1").value
	var address_2 = document.getElementById("address_2").value
	var address_3 = document.getElementById("address_3").value
	var address_4 = document.getElementById("address_4").value
	var address_5 = document.getElementById("address_5").value
	var address_6 =  document.getElementById("address_6").value
	var address_7 = document.getElementById("address_7").value
	var email = document.getElementById("email").value
	var student_code = document.getElementById("student_code").value
	var phone = document.getElementById("phone").value
    var identified = document.getElementById("identified").value
 	var advisor = document.getElementById("advisor").value
	var university = document.getElementById("old_university_id").value
	var faculty = document.getElementById("old_faculty_id").value
	var course = document.getElementById("old_course_id").value
	var user_type = document.getElementById("user_type").value
	var image_file = profile_image.files[0]
	var image_text = document.getElementById("imageNameFile").value
	var image = ""
	var ip = data.ip
	
	
	if(male == true) {
		gender = "1"
	} else if(female == true) {
		gender = "2"
	} else {
		Swal.fire({
		icon: 'warning',
		title: 'กรุณาเลือกเพศ',
		showConfirmButton: false,
		timer: 3000
	})
	$(':button').prop('disabled', false);
		document.getElementById('spinner').style.display = 'none';
	}
	
	
	if(image_file != "" && image_file != null) {
		
		if(checkImageType(image_file) == 0) {
			
			image = image_file
		}
		
	} else if(image_text != "") {
		
		image = image_text
	}
	
	let formData = new FormData();
	
	if(user_type == "1") {
		
		if(ip != "" && gender != "" && firstname != "" && lastname != "" && age != "" && address_1 != "" && address_2 != "" && address_3 != "" && address_4 != "กรุณาเลือกตำบล" && address_5 != "กรุณาเลือกอำเภอ" && address_6 != "กรุณาเลือกจังหวัด" && address_7 != "0" && email != "" && student_code != "" && phone != "" && identified  != "" && advisor != "" && university != "" && faculty != "" && course != "" && image != "" && image != null && user_id != "") {

			checkData = checkDataForm(address_2, address_3, address_7, student_code, identified, phone, user_type, email)
			
			if(checkData == 0) {
				
				if(checkIdentified(identified)) {
					
					formData.append("ip", ip);
					formData.append("gender", gender);
					formData.append("firstname", firstname);
					formData.append("lastname", lastname);
					formData.append("birthday", age);
					formData.append("address_1", address_1);
					formData.append("address_2", address_2);
					formData.append("address_3", address_3);
					formData.append("address_4", address_4);
					formData.append("address_5", address_5);
					formData.append("address_6", address_6);
					formData.append("address_7", address_7);
					formData.append("email", email);
					formData.append("student_code", student_code);
					formData.append("phone", phone);
					formData.append("identified", identified);
					formData.append("advisor", advisor);
					formData.append("university", university);
					formData.append("faculty", faculty);
					formData.append("course", course);
					formData.append("user_type", user_type);
					formData.append("image", image);
					formData.append("image_text", image);
					formData.append("user_id", user_id);
					
					axios({
						  method: "post",
						  url: "updateUserData",
						  data: formData,
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
								$(':button').prop('disabled', false);
							document.getElementById('spinner').style.display = 'none';
						  });
					
				} else {
					
					Swal.fire({
						  icon: 'warning',
						  title: 'เลขบัตรประจำตัวประชาชนผิด',
						  showConfirmButton: false,
						  timer: 3000
						})
						$(':button').prop('disabled', false);
					document.getElementById('spinner').style.display = 'none';
				}
				
				
				
		} 
		
	}else {
		Swal.fire({
		icon: 'warning',
		title: 'กรุณากรอกข้อมูลให้ครบ',
		showConfirmButton: false,
		timer: 3000
		
	})
	$(':button').prop('disabled', false);
		document.getElementById('spinner').style.display = 'none';
	}
		
	} else if(user_type == "2") {
		
		if(ip != "" && gender != "" && firstname != "" && lastname != "" && age != "" && address_1 != "" && address_2 != "" && address_3 != "" && address_4 != "กรุณาเลือกตำบล" && address_5 != "กรุณาเลือกอำเภอ" && address_6 != "กรุณาเลือกจังหวัด" && address_7 != "0" && email != "" && phone != "" && identified  != "" && university != "" && faculty != "" && course != "" && image != "" && image != null && user_id != "") {

			checkData = checkDataForm(address_2, address_3, address_7, "0", identified, phone, user_type, email)
			
			if(checkData == 0) {
				
				if(checkIdentified(identified)) {
					
					formData.append("ip", ip);
					formData.append("gender", gender);
					formData.append("firstname", firstname);
					formData.append("lastname", lastname);
					formData.append("birthday", age);
					formData.append("address_1", address_1);
					formData.append("address_2", address_2);
					formData.append("address_3", address_3);
					formData.append("address_4", address_4);
					formData.append("address_5", address_5);
					formData.append("address_6", address_6);
					formData.append("address_7", address_7);
					formData.append("email", email);
					formData.append("phone", phone);
					formData.append("identified", identified);
					formData.append("university", university);
					formData.append("faculty", faculty);
					formData.append("course", course);
					formData.append("user_type", user_type);
					formData.append("image_text", image);
					formData.append("image", image);
					formData.append("user_id", user_id);
					
					axios({
						  method: "post",
						  url: "updateUserData",
						  data: formData,
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
								$(':button').prop('disabled', false);
							document.getElementById('spinner').style.display = 'none';
						  });
					
				} else {
					
					Swal.fire({
						  icon: 'warning',
						  title: 'เลขบัตรประจำตัวประชาชนผิด',
						  showConfirmButton: false,
						  timer: 3000
						})
						$(':button').prop('disabled', false);
					document.getElementById('spinner').style.display = 'none';
				}
				
			}
			
		} else {
			Swal.fire({
			icon: 'warning',
			title: 'กรุณากรอกข้อมูลให้ครบ',
			showConfirmButton: false,
			timer: 3000
		})
		$(':button').prop('disabled', false);
			document.getElementById('spinner').style.display = 'none';
		}
	} else if(user_type == "3") {
		
		if(ip != "" && gender != "" && firstname != "" && lastname != "" && age != "" && address_1 != "" && address_2 != "" && address_3 != "" && address_4 != "กรุณาเลือกตำบล" && address_5 != "กรุณาเลือกอำเภอ" && address_6 != "กรุณาเลือกจังหวัด" && address_7 != "0" && email != "" && phone != "" && identified  != "" && image != "" && image != null && user_id != "") {

			checkData = checkDataForm(address_2, address_3, address_7, "0", identified, phone, user_type, email)
			
			if(checkData == 0) {
				
				if(checkIdentified(identified)) {
					
					formData.append("ip", ip);
					formData.append("gender", gender);
					formData.append("firstname", firstname);
					formData.append("lastname", lastname);
					formData.append("birthday", age);
					formData.append("address_1", address_1);
					formData.append("address_2", address_2);
					formData.append("address_3", address_3);
					formData.append("address_4", address_4);
					formData.append("address_5", address_5);
					formData.append("address_6", address_6);
					formData.append("address_7", address_7);
					formData.append("email", email);
					formData.append("phone", phone);
					formData.append("identified", identified);
					formData.append("user_type", user_type);
					formData.append("image_text", image);
					formData.append("image", image);
					formData.append("user_id", user_id);
					
					axios({
						  method: "post",
						  url: "updateUserData",
						  data: formData,
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
								$(':button').prop('disabled', false);
							document.getElementById('spinner').style.display = 'none';
						  });
					
				} else {
					
					Swal.fire({
						  icon: 'warning',
						  title: 'เลขบัตรประจำตัวประชาชนผิด',
						  showConfirmButton: false,
						  timer: 3000
						})
						$(':button').prop('disabled', false);
					document.getElementById('spinner').style.display = 'none';
				}
				
				
			}
			
			
		}  else {
			Swal.fire({
			icon: 'warning',
			title: 'กรุณากรอกข้อมูลให้ครบ',
			showConfirmButton: false,
			timer: 3000
			})
			$(':button').prop('disabled', false);
			document.getElementById('spinner').style.display = 'none';
		}
		
	} else if(user_type == "4") {
		
		if(ip != "" && gender != "" && firstname != "" && lastname != "" && age != "" && address_1 != "" && address_2 != "" && address_3 != "" && address_4 != "กรุณาเลือกตำบล" && address_5 != "กรุณาเลือกอำเภอ" && address_6 != "กรุณาเลือกจังหวัด" && address_7 != "0" && email != "" && phone != "" && identified  != "" && image != "" && image != null && user_id != "") {
			
			checkData = checkDataForm(address_2, address_3, address_7, "0", identified, phone, user_type, email)
			
			if(checkData == 0) {
				
				if(checkIdentified(identified)) {
					
					formData.append("ip", ip);
					formData.append("gender", gender);
					formData.append("firstname", firstname);
					formData.append("lastname", lastname);
					formData.append("birthday", age);
					formData.append("address_1", address_1);
					formData.append("address_2", address_2);
					formData.append("address_3", address_3);
					formData.append("address_4", address_4);
					formData.append("address_5", address_5);
					formData.append("address_6", address_6);
					formData.append("address_7", address_7);
					formData.append("email", email);
					formData.append("phone", phone);
					formData.append("identified", identified);
					formData.append("user_type", user_type);
					formData.append("image_text", image);
					formData.append("image", image);
					formData.append("user_id", user_id);
					
					axios({
						  method: "post",
						  url: "updateUserData",
						  data: formData,
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
								$(':button').prop('disabled', false);
							document.getElementById('spinner').style.display = 'none';
						  });
					
				} else {
					
					Swal.fire({
						  icon: 'warning',
						  title: 'เลขบัตรประจำตัวประชาชนผิด',
						  showConfirmButton: false,
						  timer: 3000
						})
						$(':button').prop('disabled', false);
					document.getElementById('spinner').style.display = 'none';
				}
				
				
				
			}
			
		} else {
			Swal.fire({
				  icon: 'warning',
				  title: 'กรุณากรอกข้อมูลให้ครบ',
				  showConfirmButton: false,
				  timer: 3000
				})
				$(':button').prop('disabled', false);
				document.getElementById('spinner').style.display = 'none';
	
			}
		
		} else {
			Swal.fire({
					  icon: 'warning',
					  title: 'กรุณากรอกข้อมูลให้ครบ',
					  showConfirmButton: false,
					  timer: 3000
					})
					$(':button').prop('disabled', false);
					document.getElementById('spinner').style.display = 'none';
		
		}
	});
	
}

function updateUserPassword() {
	document.getElementById('spinner1').style.display = 'block';
	$(':button').prop('disabled', true);
	
	const data = $.getJSON('https://api.ipify.org?format=json', function(data){
		
		var password = document.getElementById('passwordModal').value
		var confirmPassword = document.getElementById('confirmPasswordModal').value
		var ip = data.ip
		
		if(password != "" && confirmPassword != "" && ip != "") {
			
			if(password === confirmPassword) {
				
				axios({
					  method: "post",
					  url: "updateUserPassword",
					  data: 'password='+password+'&ip='+ip,
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
						  document.getElementById('spinner1').style.display = 'none';
						} else if(response.data.alert == "2") {
						  
						  Swal.fire({
						      icon: "warning",
						    title: response.data.status,
						    showConfirmButton: false,
						    timer: 3000
						    })
						    
						    $(':button').prop('disabled', false);
						  document.getElementById('spinner1').style.display = 'none';
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
						document.getElementById('spinner1').style.display = 'none';
					  });
				
			} else {
				Swal.fire({
					  icon: 'warning',
					  title: 'รหัสผ่านไม่ตรงกัน',
					  showConfirmButton: false,
					  timer: 3000
					})
					$(':button').prop('disabled', false);
				document.getElementById('spinner1').style.display = 'none';
			}
			
		} else {
			Swal.fire({
					  icon: 'warning',
					  title: 'กรุณากรอกข้อมูลให้ครบ',
					  showConfirmButton: false,
					  timer: 3000
					})
					$(':button').prop('disabled', false);
			document.getElementById('spinner1').style.display = 'none';
		}
	
	});
	
}

$(document).on('click', 'i', function () {
	var lang = $(this).closest('tr').find('td:eq(1)').text()
	$('#language').append($('<option>' + lang + '</option>'));
	
    $(this).closest('tr').remove();
    return false;
});

function showPassword() {
	  var x = document.getElementById("passwordModal")
	  var z = document.getElementById("confirmPasswordModal")
	  
	  if (x.type === "password" && z.type === "password") {
	    x.type = "text"
	    z.type = "text"
	  } else {
	    x.type = "password"
	    z.type = "password"
	  }
	}
	
function checkImageType(profile_image) {
	
	const  fileType = profile_image['type'];
	
	const validImageTypes = ['image/jpeg', 'image/png'];
	
	if (!validImageTypes.includes(fileType)) {
		Swal.fire({
					  icon: 'warning',
					  title: 'ไม่รองรับไฟล์รูปภาพ ใช้ได้แค่ PNG, JPG',
					  showConfirmButton: false,
					  timer: 3000
					})
	    return -1
	} else {
		return 0
	}
}

$(function() {
	$('#university').append($('<option></option>'));
	axios({
		  method: "post",
		  url: "findUniversity",
		}).then(function (response) {
			$.each(response.data, function(i, data) {
               	$('#university').append($('<option value="' + response.data[i].university_id + '">' + response.data[i].name + '</option>'));
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

$('#university').change(function() {
	
	$("#faculty").empty();
	$("#course").empty();
	
	document.getElementById('old_faculty').value = ""
	document.getElementById('old_course').value = ""
	
	var university_id = $(this).val()
	
	var e = document.getElementById("university");
	var text = e.options[e.selectedIndex].text;
	
	document.getElementById('old_university_id').value = university_id
	document.getElementById('old_university').value = text

    if (university_id !== '') {
    	
    	$('#faculty').append($('<option></option>'));
    	
    	axios({
			  method: "post",
			  url: "findFacultyByUniversity",
			  data: 'university_id='+university_id,
			}).then(function (response) {
				
				$.each(response.data, function(i, data) {
	                 $('#faculty').append($('<option value="' + response.data[i].faculty_id + '">' + response.data[i].name + '</option>'));
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

$('#faculty').change(function() {
	
	$("#course").empty();
	document.getElementById('old_course').value = ""
	
	var faculty_id = $(this).val()
	
	var e = document.getElementById("faculty");
	var text = e.options[e.selectedIndex].text;
	
	document.getElementById('old_faculty_id').value = faculty_id
	document.getElementById('old_faculty').value = text
	
    if (faculty_id !== '') {
    	
    	$('#course').append($('<option></option>'));
    	
    	axios({
			  method: "post",
			  url: "findCourseByFaculty",
			  data: 'faculty_id='+faculty_id,
			}).then(function (response) {
				
				$.each(response.data, function(i, data) {
	                 $('#course').append($('<option value="' + response.data[i].course_id + '">' + response.data[i].name + '</option>'));
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

$('#course').change(function() {
	
	var e = document.getElementById("course");
	var value = e.options[e.selectedIndex].value;
	var text = e.options[e.selectedIndex].text;
	
	document.getElementById('old_course_id').value = value
	document.getElementById('old_course').value = text
	
});

function checkIdentified(identified_number) {

    if(identified_number != ''){

      if(Script_checkID(identified_number)){
        
        return true
      }else{
        
        return false
      }

    }

  }
  
  function Script_checkID(id){
      if(! IsNumeric(id)) return false;
      if(id.substring(0,1)== 0) return false;
      if(id.length != 13) return false;
      for(i=0, sum=0; i < 12; i++)
          sum += parseFloat(id.charAt(i))*(13-i);
      if((11-sum%11)%10!=parseFloat(id.charAt(12))) return false;
      return true;
  }
  function IsNumeric(input){
      var RE = /^-?(0|INF|(0[1-7][0-7]*)|(0x[0-9a-fA-F]+)|((0|[1-9][0-9]*|(?=[\.,]))([\.,][0-9]+)?([eE]-?\d+)?))$/;
      return (RE.test(input));
  }
</script>