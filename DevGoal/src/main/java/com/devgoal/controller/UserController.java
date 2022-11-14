package com.devgoal.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.devgoal.dao.AdminEmailHistoryDAO;
import com.devgoal.dao.CourseDAO;
import com.devgoal.dao.EventHistoryDAO;
import com.devgoal.dao.LoginHistoryDAO;
import com.devgoal.dao.SkillDAO;
import com.devgoal.dao.StudentPlaceOfInternshipDAO;
import com.devgoal.dao.UniversityDAO;
import com.devgoal.dao.UserDAO;
import com.devgoal.dao.UserSkillDAO;

@Controller
@WebServlet("/updateUserData")
@MultipartConfig
public class UserController extends HttpServlet {

	String url = new PathConfig().url;

	public int checkData(String address_1, String address_2, String address_3, String address_4, String address_5,
			String address_6, String address_7, String phone, Part image, String ip) {

		if (address_1 != null && address_2 != null && address_3 != null && address_4 != null && address_5 != null
				&& address_6 != null && address_7 != null && phone != null && image != null && ip != null &&

				!address_1.equals("") && !address_2.equals("") && !address_3.equals("") && !address_4.equals("")
				&& !address_5.equals("") && !address_6.equals("") && !address_7.equals("") && !phone.equals("")
				&& !ip.equals("") &&

				image.getSize() != 0 && Integer.parseInt(address_2) > 0 && Integer.parseInt(address_3) > 0
				&& Integer.parseInt(address_7) > 0 && Long.parseLong(phone) > 0 && phone.length() == 10) {

			return 0;
		}

		return -1;

	}

	public int checkDataForAdmin(String gender, String firstname, String lastname, String address_1,
			String address_2, String address_3, String address_4, String address_5, String address_6, String address_7,
			String email, String phone, String identified, Part image, String student_code, String advisor,
			String university, String faculty, String course, String user_type, String user_id) {

		if (user_type != null && !user_type.equals("")) {

			if (user_type.equals("1")) {

				if (gender != null && firstname != null && lastname != null && address_1 != null && address_2 != null
						&& address_3 != null && address_4 != null && address_5 != null && address_6 != null
						&& address_7 != null && email != null && phone != null && identified != null && image != null
						&& student_code != null && advisor != null && university != null
						&& faculty != null && course != null && user_id != null &&

						!gender.equals("") && !firstname.equals("") && !lastname.equals("") && !address_1.equals("")
						&& !address_2.equals("") && !address_3.equals("") && !address_4.equals("")
						&& !address_5.equals("") && !address_6.equals("") && !address_7.equals("") && !email.equals("")
						&& !phone.equals("") && !identified.equals("") && !student_code.equals("")
						&& !advisor.equals("") && !university.equals("") && !faculty.equals("") && !course.equals("")
						&& !user_id.equals("") &&

						image.getSize() != 0 && Integer.parseInt(address_2) > 0 && Integer.parseInt(address_3) > 0
						&& Integer.parseInt(address_7) > 0 && Long.parseLong(phone) > 0 && phone.length() == 10
						&& Long.parseLong(identified) > 0 && identified.length() == 13
						&& Long.parseLong(student_code) > 0 && new EtcMethods().isValid(email) == true) {

					if (gender.equals("1") || gender.equals("2")) {

						return 0;

					}

				}

			} else if (user_type.equals("2")) {

				if (gender != null && firstname != null && lastname != null && address_1 != null && address_2 != null
						&& address_3 != null && address_4 != null && address_5 != null && address_6 != null
						&& address_7 != null && email != null && phone != null && identified != null && image != null
						&& university != null && faculty != null && course != null && user_id != null &&

						!gender.equals("") && !firstname.equals("") && !lastname.equals("") && !address_1.equals("")
						&& !address_2.equals("") && !address_3.equals("") && !address_4.equals("")
						&& !address_5.equals("") && !address_6.equals("") && !address_7.equals("") && !email.equals("")
						&& !phone.equals("") && !identified.equals("") && !university.equals("")
						&& !faculty.equals("") && !course.equals("") && !user_id.equals("") &&

						image.getSize() != 0 && Integer.parseInt(address_2) > 0 && Integer.parseInt(address_3) > 0
						&& Integer.parseInt(address_7) > 0 && Long.parseLong(phone) > 0 && phone.length() == 10
						&& Long.parseLong(identified) > 0 && identified.length() == 13
						&& new EtcMethods().isValid(email) == true) {

					if (gender.equals("1") || gender.equals("2")) {

						return 0;
					}

				}

			} else if (user_type.equals("3")) {

				if (gender != null && firstname != null && lastname != null && address_1 != null && address_2 != null
						&& address_3 != null && address_4 != null && address_5 != null && address_6 != null
						&& address_7 != null && email != null && phone != null && identified != null && image != null
						&& user_id != null &&

						!gender.equals("") && !firstname.equals("") && !lastname.equals("") && !address_1.equals("")
						&& !address_2.equals("") && !address_3.equals("") && !address_4.equals("")
						&& !address_5.equals("") && !address_6.equals("") && !address_7.equals("") && !email.equals("")
						&& !phone.equals("") && !identified.equals("") && !user_id.equals("") &&

						image.getSize() != 0 && Integer.parseInt(address_2) > 0 && Integer.parseInt(address_3) > 0
						&& Integer.parseInt(address_7) > 0 && Long.parseLong(phone) > 0 && phone.length() == 10
						&& Long.parseLong(identified) > 0 && identified.length() == 13
						&& new EtcMethods().isValid(email) == true) {

					if (gender.equals("1") || gender.equals("2")) {

						return 0;
					}

				}

			} else if (user_type.equals("4")) {

				if (gender != null && firstname != null && lastname != null && address_1 != null && address_2 != null
						&& address_3 != null && address_4 != null && address_5 != null && address_6 != null
						&& address_7 != null && email != null && phone != null && identified != null && image != null
						&& user_id != null &&

						!gender.equals("") && !firstname.equals("") && !lastname.equals("") && !address_1.equals("")
						&& !address_2.equals("") && !address_3.equals("") && !address_4.equals("")
						&& !address_5.equals("") && !address_6.equals("") && !address_7.equals("") && !email.equals("")
						&& !phone.equals("") && !identified.equals("") && !user_id.equals("") &&

						image.getSize() != 0 && Integer.parseInt(address_2) > 0 && Integer.parseInt(address_3) > 0
						&& Integer.parseInt(address_7) > 0 && Long.parseLong(phone) > 0 && phone.length() == 10
						&& Long.parseLong(identified) > 0 && identified.length() == 13
						&& new EtcMethods().isValid(email) == true) {

					if (gender.equals("1") || gender.equals("2")) {

						return 0;
					}

				}
			}

		}

		return -1;

	}

	// Update information all user
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		EtcMethods etc = new EtcMethods();

		HttpSession session = request.getSession(false);
		int sessionStatus = etc.checkSession(session, request);
		String status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
		String alert = "0";

		if (sessionStatus == 0 && !session.getAttribute("role").equals("4")) {

			String user_id = session.getAttribute("id").toString();
			Part image = request.getPart("profile_image");
			String ip = request.getParameter("ip");
			String address1 = request.getParameter("address1");
			String address2 = request.getParameter("address2");
			String address3 = request.getParameter("address3");
			String address4 = request.getParameter("address4");
			String address5 = request.getParameter("address5");
			String address6 = request.getParameter("address6");
			String address7 = request.getParameter("address7");
			String phone = request.getParameter("phone");

			if (checkData(address1, address2, address3, address4, address5, address6, address7, phone, image,
					ip) == 0) {

				String address = address1 + " " + address2 + " " + address3 + " " + address4 + " " + address5 + " "
						+ address6 + " " + address7;

				if (image.getContentType() != null) {
					// New image
					
					String imagesPath = etc.checkImages(image);

					if (!imagesPath.equals("")) {

						if (new UserDAO().updateUserAndNewImageProfile(user_id, address, phone, imagesPath) == 1) {

							status = "แก้ไขข้อมูลเรียบร้อย";
							alert = "1";
							new EventHistoryDAO().insertEventHistory(user_id, "แก้ไขข้อมูลส่วนตัวและรูปโปรไฟล์", ip);
						}

					}

				} else {
					// Default image

					if (new UserDAO().updateUserAndOldImageProfile(user_id, address, phone) == 1) {

						status = "แก้ไขข้อมูลเรียบร้อย";
						alert = "1";
						new EventHistoryDAO().insertEventHistory(user_id, "แก้ไขข้อมูลส่วนตัว", ip);
					}
				}
			}

		} else if (sessionStatus == 0 && session.getAttribute("role").equals("4")) {

			String admin_id = session.getAttribute("id").toString();

			String ip = request.getParameter("ip");
			String gender = request.getParameter("gender");
			String firstname = request.getParameter("firstname");
			String lastname = request.getParameter("lastname");
			String birthday = request.getParameter("birthday");
			String address1 = request.getParameter("address_1");
			String address2 = request.getParameter("address_2");
			String address3 = request.getParameter("address_3");
			String address4 = request.getParameter("address_4");
			String address5 = request.getParameter("address_5");
			String address6 = request.getParameter("address_6");
			String address7 = request.getParameter("address_7");
			String email = request.getParameter("email");
			String student_code = request.getParameter("student_code");
			String phone = request.getParameter("phone");
			String identified = request.getParameter("identified");
			String advisor = request.getParameter("advisor");
			String university = request.getParameter("university");
			String faculty = request.getParameter("faculty");
			String course = request.getParameter("course");
			String user_type = request.getParameter("user_type");
			String skill = request.getParameter("skill");
			Part image = request.getPart("image");
			String user_id = request.getParameter("user_id");
			String image_text = request.getParameter("image_text");

			if (checkDataForAdmin(gender, firstname, lastname, address1, address2, address3, address4, address5,
					address6, address7, email, phone, identified, image, student_code, advisor, university, faculty,
					course, user_type, user_id) == 0) {

				String address = address1 + " " + address2 + " " + address3 + " " + address4 + " " + address5 + " "
						+ address6 + " " + address7;

				if (user_type.equals("1")) {

					String short_name = email.substring(email.lastIndexOf("@") + 1);
					short_name = short_name.substring(0, short_name.indexOf('.'));
					int studyEmailStatus = new UniversityDAO().queryShortName(university, short_name);

					int studyFkStatus = new CourseDAO().queryFkStudyRefTables(university, faculty, course);

					if (studyEmailStatus == 0) {

						if (studyFkStatus == 0) {

							// Skill update process
							if (skill != null && !skill.equals("")) {

								ArrayList<HashMap<String, String>> skillData = etc.checkSkill(skill);
								ArrayList<String> userSkillID = new SkillDAO().checkInsertDuplicateSkill(skillData);

								UserSkillDAO userSkillDAO = new UserSkillDAO();

								int deleteStatus = userSkillDAO.deleteUserSkillByUserId(user_id);
								int insertStatus = -1;

								for (int i = 0; i < userSkillID.size(); i++) {

									insertStatus = userSkillDAO.insertUserSkill(user_id, userSkillID.get(i));
								}

								if (deleteStatus > 0) {

									status = "แก้ไขข้อมูลความสามารถเรียบร้อย";
									alert = "1";
									new EventHistoryDAO().insertEventHistory(admin_id,
											"แก้ไขข้อมูลความสามารถผู้ใช้รหัส " + user_id, ip);

								}

								if (insertStatus > 0) {

									status = "แก้ไขข้อมูลความสามารถเรียบร้อย";
									alert = "1";
									new EventHistoryDAO().insertEventHistory(admin_id,
											"แก้ไขข้อมูลความสามารถผู้ใช้รหัส " + user_id, ip);
								}
							}

							// User data update process
							if (image.getContentType() != null) {

								// New image
								String imagesPath = etc.checkImages(image);

								if (!imagesPath.equals("")) {
									
									HashMap<String, Object> identifiedID = new UserDAO().queryIdentifiedIDByUserId(user_id);
									
									if(identified.equals(identifiedID.get("identified_number"))) {
										if (new UserDAO().updateUserAndNewImageProfileForAdmin(gender, firstname, lastname,
												birthday, address, email, student_code, phone, identified, advisor, university,
												faculty, course, user_type, imagesPath, user_id) == 1) {

											status = "แก้ไขข้อมูลเรียบร้อย";
											alert = "1";
											etc.sendEmail(admin_id, email, "การแก้ไขข้อมูลส่วนตัว",
													"ผู้ดูแลระบบได้ทำการแก้ไขข้อมูลส่วนตัวของคุณ");
											new EventHistoryDAO().insertEventHistory(admin_id,
													"แก้ไขข้อมูลส่วนตัวและรูปโปรไฟล์ผู้ใช้รหัส " + user_id, ip);

										}
									} else {
										HashMap<String, Object> identifiedStatus = new UserDAO().checkIdentifiedID(identified);
										
										if(identifiedStatus.size() == 0) {
											
											if (new UserDAO().updateUserAndNewImageProfileForAdmin(gender, firstname, lastname,
													birthday, address, email, student_code, phone, identified, advisor, university,
													faculty, course, user_type, imagesPath, user_id) == 1) {
	
												status = "แก้ไขข้อมูลเรียบร้อย";
												alert = "1";
												etc.sendEmail(admin_id, email, "การแก้ไขข้อมูลส่วนตัว",
														"ผู้ดูแลระบบได้ทำการแก้ไขข้อมูลส่วนตัวของคุณ");
												new EventHistoryDAO().insertEventHistory(admin_id,
														"แก้ไขข้อมูลส่วนตัวและรูปโปรไฟล์ผู้ใช้รหัส " + user_id, ip);
	
											}
										} else {
											
											status = "เลขบัตรประจำตัวประชาชนนี้มีในระบบแล้ว";
											alert = "2";
										}
										
									}
									

								}

							} else {
								// Default image or user image from user request data change
								if (image_text != null && !image_text.equals("")) {
									
									HashMap<String, Object> identifiedID = new UserDAO().queryIdentifiedIDByUserId(user_id);
									
									if(identified.equals(identifiedID.get("identified_number"))) {
										
										if (new UserDAO().updateUserAndNewImageProfileForAdmin(gender, firstname, lastname,
												birthday, address, email, student_code, phone, identified, advisor, university,
												faculty, course, user_type, image_text, user_id) == 1) {

											status = "แก้ไขข้อมูลเรียบร้อย";
											alert = "1";
											etc.sendEmail(admin_id, email, "การแก้ไขข้อมูลส่วนตัว",
													"ผู้ดูแลระบบได้ทำการแก้ไขข้อมูลส่วนตัวของคุณ");
											new EventHistoryDAO().insertEventHistory(admin_id,
													"แก้ไขข้อมูลส่วนตัวผู้ใช้รหัส " + user_id, ip);

										}
										
									} else {
										
										HashMap<String, Object> identifiedStatus = new UserDAO().checkIdentifiedID(identified);
										
										if(identifiedStatus.size() == 0) {
											
											if (new UserDAO().updateUserAndNewImageProfileForAdmin(gender, firstname, lastname,
													birthday, address, email, student_code, phone, identified, advisor, university,
													faculty, course, user_type, image_text, user_id) == 1) {

												status = "แก้ไขข้อมูลเรียบร้อย";
												alert = "1";
												etc.sendEmail(admin_id, email, "การแก้ไขข้อมูลส่วนตัว",
														"ผู้ดูแลระบบได้ทำการแก้ไขข้อมูลส่วนตัวของคุณ");
												new EventHistoryDAO().insertEventHistory(admin_id,
														"แก้ไขข้อมูลส่วนตัวผู้ใช้รหัส " + user_id, ip);

											}
											
										} else {
											
											status = "เลขบัตรประจำตัวประชาชนนี้มีในระบบแล้ว";
											alert = "2";
										}
										
									}
									
									

									

								}

							}

						} 
						// else {
						// 	System.out.println("Study tables ref error");
						// }

					} else {
						status = "อีเมลมหาลัยไม่สัมพันธ์กับมหาลัยที่ท่านเลือก";
						alert = "2";
					}

				} else if (user_type.equals("2")) {

					String short_name = email.substring(email.lastIndexOf("@") + 1);
					short_name = short_name.substring(0, short_name.indexOf('.'));
					int studyEmailStatus = new UniversityDAO().queryShortName(university, short_name);

					int studyFkStatus = new CourseDAO().queryFkStudyRefTables(university, faculty, course);

					if (studyEmailStatus == 0) {

						if (studyFkStatus == 0) {

							// Skill update process
							if (skill != null && !skill.equals("")) {

								ArrayList<HashMap<String, String>> skillData = etc.checkSkill(skill);
								ArrayList<String> userSkillID = new SkillDAO().checkInsertDuplicateSkill(skillData);

								UserSkillDAO userSkillDAO = new UserSkillDAO();

								int deleteStatus = userSkillDAO.deleteUserSkillByUserId(user_id);
								int insertStatus = -1;

								for (int i = 0; i < userSkillID.size(); i++) {

									insertStatus = userSkillDAO.insertUserSkill(user_id, userSkillID.get(i));
								}

								if (deleteStatus > 0) {

									status = "แก้ไขข้อมูลความสามารถเรียบร้อย";
									alert = "1";
									new EventHistoryDAO().insertEventHistory(admin_id,
											"แก้ไขข้อมูลความสามารถผู้ใช้รหัส " + user_id, ip);
								}

								if (insertStatus > 0) {

									status = "แก้ไขข้อมูลความสามารถเรียบร้อย";
									alert = "1";
									new EventHistoryDAO().insertEventHistory(admin_id,
											"แก้ไขข้อมูลความสามารถผู้ใช้รหัส " + user_id, ip);
								}
							}

							// User data update process
							if (image.getContentType() != null) {

								// New image
								String imagesPath = etc.checkImages(image);

								if (!imagesPath.equals("")) {
									
									HashMap<String, Object> identifiedID = new UserDAO().queryIdentifiedIDByUserId(user_id);
									
									if(identified.equals(identifiedID.get("identified_number"))) {
										
										if (new UserDAO().updateUserAndNewImageProfileForAdmin(gender, firstname, lastname,
												birthday, address, email, student_code, phone, identified, advisor, university,
												faculty, course, user_type, imagesPath, user_id) == 1) {

											status = "แก้ไขข้อมูลเรียบร้อย";
											alert = "1";
											etc.sendEmail(admin_id, email, "การแก้ไขข้อมูลส่วนตัว",
													"ผู้ดูแลระบบได้ทำการแก้ไขข้อมูลส่วนตัวของคุณ");
											new EventHistoryDAO().insertEventHistory(admin_id,
													"แก้ไขข้อมูลส่วนตัวและรูปโปรไฟล์ผู้ใช้รหัส " + user_id, ip);

										}

									} else {
									  
										HashMap<String, Object> identifiedStatus = new UserDAO().checkIdentifiedID(identified);
										
										if(identifiedStatus.size() == 0) {
											
											if (new UserDAO().updateUserAndNewImageProfileForAdmin(gender, firstname, lastname,
													birthday, address, email, student_code, phone, identified, advisor, university,
													faculty, course, user_type, imagesPath, user_id) == 1) {

												status = "แก้ไขข้อมูลเรียบร้อย";
												alert = "1";
												etc.sendEmail(admin_id, email, "การแก้ไขข้อมูลส่วนตัว",
														"ผู้ดูแลระบบได้ทำการแก้ไขข้อมูลส่วนตัวของคุณ");
												new EventHistoryDAO().insertEventHistory(admin_id,
														"แก้ไขข้อมูลส่วนตัวและรูปโปรไฟล์ผู้ใช้รหัส " + user_id, ip);

											}
											
										} else {
											
											status = "เลขบัตรประจำตัวประชาชนนี้มีในระบบแล้ว";
											alert = "2";
										}
									  
									}
									
									


								}

							} else {
								// Default image

								if (image_text != null && !image_text.equals("")) {
									
									HashMap<String, Object> identifiedID = new UserDAO().queryIdentifiedIDByUserId(user_id);
									
									if(identified.equals(identifiedID.get("identified_number"))) {
										
										if (new UserDAO().updateUserAndNewImageProfileForAdmin(gender, firstname, lastname,
												birthday, address, email, student_code, phone, identified, advisor, university,
												faculty, course, user_type, image_text, user_id) == 1) {

											status = "แก้ไขข้อมูลเรียบร้อย";
											alert = "1";
											etc.sendEmail(admin_id, email, "การแก้ไขข้อมูลส่วนตัว",
													"ผู้ดูแลระบบได้ทำการแก้ไขข้อมูลส่วนตัวของคุณ");
											new EventHistoryDAO().insertEventHistory(admin_id,
													"แก้ไขข้อมูลส่วนตัวผู้ใช้รหัส " + user_id, ip);

										}

									} else {
									  
										HashMap<String, Object> identifiedStatus = new UserDAO().checkIdentifiedID(identified);
										
										if(identifiedStatus.size() == 0) {
											
											if (new UserDAO().updateUserAndNewImageProfileForAdmin(gender, firstname, lastname,
													birthday, address, email, student_code, phone, identified, advisor, university,
													faculty, course, user_type, image_text, user_id) == 1) {

												status = "แก้ไขข้อมูลเรียบร้อย";
												alert = "1";
												etc.sendEmail(admin_id, email, "การแก้ไขข้อมูลส่วนตัว",
														"ผู้ดูแลระบบได้ทำการแก้ไขข้อมูลส่วนตัวของคุณ");
												new EventHistoryDAO().insertEventHistory(admin_id,
														"แก้ไขข้อมูลส่วนตัวผู้ใช้รหัส " + user_id, ip);

											}
											
										} else {
											
											status = "เลขบัตรประจำตัวประชาชนนี้มีในระบบแล้ว";
											alert = "2";
										}
									  
									}
									
									
									


								}
							}

						} 
						// else {
						// 	System.out.println("Study tables ref error");
						// }

					} else {
						status = "อีเมลมหาลัยไม่สัมพันธ์กับมหาลัยที่ท่านเลือก";
						alert = "2";
					}

				} else if (user_type.equals("3")) {

					// Skill update process
					if (skill != null && !skill.equals("")) {

						ArrayList<HashMap<String, String>> skillData = etc.checkSkill(skill);
						ArrayList<String> userSkillID = new SkillDAO().checkInsertDuplicateSkill(skillData);

						UserSkillDAO userSkillDAO = new UserSkillDAO();

						int deleteStatus = userSkillDAO.deleteUserSkillByUserId(user_id);
						int insertStatus = -1;

						for (int i = 0; i < userSkillID.size(); i++) {

							insertStatus = userSkillDAO.insertUserSkill(user_id, userSkillID.get(i));
						}

						if (deleteStatus > 0) {

							status = "แก้ไขข้อมูลความสามารถเรียบร้อย";
							alert = "1";
							new EventHistoryDAO().insertEventHistory(admin_id,
									"แก้ไขข้อมูลความสามารถผู้ใช้รหัส " + user_id, ip);
						}

						if (insertStatus > 0) {

							status = "แก้ไขข้อมูลความสามารถเรียบร้อย";
							alert = "1";
							new EventHistoryDAO().insertEventHistory(admin_id,
									"แก้ไขข้อมูลความสามารถผู้ใช้รหัส " + user_id, ip);
						}
					}

					// User data update process
					if (image.getContentType() != null) {

						// New image
						String imagesPath = etc.checkImages(image);

						if (!imagesPath.equals("")) {
							
							
							HashMap<String, Object> identifiedID = new UserDAO().queryIdentifiedIDByUserId(user_id);
							
							if(identified.equals(identifiedID.get("identified_number"))) {

								if (new UserDAO().updateUserAndNewImageProfileForAdmin(gender, firstname, lastname, birthday,
										address, email, student_code, phone, identified, advisor, university, faculty,
										course, user_type, imagesPath, user_id) == 1) {

									status = "แก้ไขข้อมูลเรียบร้อย";
									alert = "1";
									etc.sendEmail(admin_id, email, "การแก้ไขข้อมูลส่วนตัว",
											"ผู้ดูแลระบบได้ทำการแก้ไขข้อมูลส่วนตัวของคุณ");
									new EventHistoryDAO().insertEventHistory(admin_id,
											"แก้ไขข้อมูลส่วนตัวและรูปโปรไฟล์ผู้ใช้รหัส " + user_id, ip);

								}
								
							} else {
							  
								HashMap<String, Object> identifiedStatus = new UserDAO().checkIdentifiedID(identified);
								
								if(identifiedStatus.size() == 0) {
									
									if (new UserDAO().updateUserAndNewImageProfileForAdmin(gender, firstname, lastname, birthday,
											address, email, student_code, phone, identified, advisor, university, faculty,
											course, user_type, imagesPath, user_id) == 1) {

										status = "แก้ไขข้อมูลเรียบร้อย";
										alert = "1";
										etc.sendEmail(admin_id, email, "การแก้ไขข้อมูลส่วนตัว",
												"ผู้ดูแลระบบได้ทำการแก้ไขข้อมูลส่วนตัวของคุณ");
										new EventHistoryDAO().insertEventHistory(admin_id,
												"แก้ไขข้อมูลส่วนตัวและรูปโปรไฟล์ผู้ใช้รหัส " + user_id, ip);

									}
									
								} else {
									
									status = "เลขบัตรประจำตัวประชาชนนี้มีในระบบแล้ว";
									alert = "2";
								}
							  
							}
							
							

							

						}

					} else {
						// Default image

						if (image_text != null && !image_text.equals("")) {
							
							HashMap<String, Object> identifiedID = new UserDAO().queryIdentifiedIDByUserId(user_id);
							
							if(identified.equals(identifiedID.get("identified_number"))) {

								if (new UserDAO().updateUserAndNewImageProfileForAdmin(gender, firstname, lastname, birthday,
										address, email, student_code, phone, identified, advisor, university, faculty,
										course, user_type, image_text, user_id) == 1) {

									status = "แก้ไขข้อมูลเรียบร้อย";
									alert = "1";
									etc.sendEmail(admin_id, email, "การแก้ไขข้อมูลส่วนตัว",
											"ผู้ดูแลระบบได้ทำการแก้ไขข้อมูลส่วนตัวของคุณ");
									new EventHistoryDAO().insertEventHistory(admin_id,
											"แก้ไขข้อมูลส่วนตัวผู้ใช้รหัส " + user_id, ip);

								}
								
							} else {
							  
								HashMap<String, Object> identifiedStatus = new UserDAO().checkIdentifiedID(identified);
								
								if(identifiedStatus.size() == 0) {
									
									if (new UserDAO().updateUserAndNewImageProfileForAdmin(gender, firstname, lastname, birthday,
											address, email, student_code, phone, identified, advisor, university, faculty,
											course, user_type, image_text, user_id) == 1) {

										status = "แก้ไขข้อมูลเรียบร้อย";
										alert = "1";
										etc.sendEmail(admin_id, email, "การแก้ไขข้อมูลส่วนตัว",
												"ผู้ดูแลระบบได้ทำการแก้ไขข้อมูลส่วนตัวของคุณ");
										new EventHistoryDAO().insertEventHistory(admin_id,
												"แก้ไขข้อมูลส่วนตัวผู้ใช้รหัส " + user_id, ip);

									}
									
								} else {
									
									status = "เลขบัตรประจำตัวประชาชนนี้มีในระบบแล้ว";
									alert = "2";
								}
							  
							}
							
							


						}
					}

				} else if (user_type.equals("4")) {

					// Skill update process
					if (skill != null && !skill.equals("")) {

						ArrayList<HashMap<String, String>> skillData = etc.checkSkill(skill);
						ArrayList<String> userSkillID = new SkillDAO().checkInsertDuplicateSkill(skillData);

						UserSkillDAO userSkillDAO = new UserSkillDAO();

						int deleteStatus = userSkillDAO.deleteUserSkillByUserId(user_id);
						int insertStatus = -1;

						for (int i = 0; i < userSkillID.size(); i++) {

							insertStatus = userSkillDAO.insertUserSkill(user_id, userSkillID.get(i));
						}
						if (deleteStatus > 0) {

							status = "แก้ไขข้อมูลความสามารถเรียบร้อย";
							alert = "1";
							new EventHistoryDAO().insertEventHistory(admin_id,
									"แก้ไขข้อมูลความสามารถผู้ใช้รหัส " + user_id, ip);
						}

						if (insertStatus > 0) {

							status = "แก้ไขข้อมูลความสามารถเรียบร้อย";
							alert = "1";
							new EventHistoryDAO().insertEventHistory(admin_id,
									"แก้ไขข้อมูลความสามารถผู้ใช้รหัส " + user_id, ip);
						}
					}

					// User data update process
					if (image.getContentType() != null) {

						// New image
						String imagesPath = etc.checkImages(image);

						if (!imagesPath.equals("")) {
							
							HashMap<String, Object> identifiedID = new UserDAO().queryIdentifiedIDByUserId(user_id);
							
							if(identified.equals(identifiedID.get("identified_number"))) {
								
								if (new UserDAO().updateUserAndNewImageProfileForAdmin(gender, firstname, lastname, birthday,
										address, email, student_code, phone, identified, advisor, university, faculty,
										course, user_type, imagesPath, user_id) == 1) {

									status = "แก้ไขข้อมูลเรียบร้อย";
									alert = "1";
									etc.sendEmail(admin_id, email, "การแก้ไขข้อมูลส่วนตัว",
											"ผู้ดูแลระบบได้ทำการแก้ไขข้อมูลส่วนตัวของคุณ");
									new EventHistoryDAO().insertEventHistory(admin_id,
											"แก้ไขข้อมูลส่วนตัวและรูปโปรไฟล์ผู้ใช้รหัส " + user_id, ip);

								}

							} else {
							  
								HashMap<String, Object> identifiedStatus = new UserDAO().checkIdentifiedID(identified);
								
								if(identifiedStatus.size() == 0) {
									
									if (new UserDAO().updateUserAndNewImageProfileForAdmin(gender, firstname, lastname, birthday,
											address, email, student_code, phone, identified, advisor, university, faculty,
											course, user_type, imagesPath, user_id) == 1) {

										status = "แก้ไขข้อมูลเรียบร้อย";
										alert = "1";
										etc.sendEmail(admin_id, email, "การแก้ไขข้อมูลส่วนตัว",
												"ผู้ดูแลระบบได้ทำการแก้ไขข้อมูลส่วนตัวของคุณ");
										new EventHistoryDAO().insertEventHistory(admin_id,
												"แก้ไขข้อมูลส่วนตัวและรูปโปรไฟล์ผู้ใช้รหัส " + user_id, ip);

									}
									
								} else {
									
									status = "เลขบัตรประจำตัวประชาชนนี้มีในระบบแล้ว";
									alert = "2";
								}
							  
							}
							
							
							

							

						}

					} else {
						// Default image

						if (image_text != null && !image_text.equals("")) {
							
							HashMap<String, Object> identifiedID = new UserDAO().queryIdentifiedIDByUserId(user_id);
							
							if(identified.equals(identifiedID.get("identified_number"))) {

								if (new UserDAO().updateUserAndNewImageProfileForAdmin(gender, firstname, lastname, birthday,
										address, email, student_code, phone, identified, advisor, university, faculty,
										course, user_type, image_text, user_id) == 1) {

									status = "แก้ไขข้อมูลเรียบร้อย";
									alert = "1";
									etc.sendEmail(admin_id, email, "การแก้ไขข้อมูลส่วนตัว",
											"ผู้ดูแลระบบได้ทำการแก้ไขข้อมูลส่วนตัวของคุณ");
									new EventHistoryDAO().insertEventHistory(admin_id,
											"แก้ไขข้อมูลส่วนตัวผู้ใช้รหัส " + user_id, ip);

								}
								
							} else {
							  
								HashMap<String, Object> identifiedStatus = new UserDAO().checkIdentifiedID(identified);
								
								if(identifiedStatus.size() == 0) {
									
									if (new UserDAO().updateUserAndNewImageProfileForAdmin(gender, firstname, lastname, birthday,
											address, email, student_code, phone, identified, advisor, university, faculty,
											course, user_type, image_text, user_id) == 1) {

										status = "แก้ไขข้อมูลเรียบร้อย";
										alert = "1";
										etc.sendEmail(admin_id, email, "การแก้ไขข้อมูลส่วนตัว",
												"ผู้ดูแลระบบได้ทำการแก้ไขข้อมูลส่วนตัวของคุณ");
										new EventHistoryDAO().insertEventHistory(admin_id,
												"แก้ไขข้อมูลส่วนตัวผู้ใช้รหัส " + user_id, ip);

									}
									
								} else {
									
									status = "เลขบัตรประจำตัวประชาชนนี้มีในระบบแล้ว";
									alert = "2";
								}
							  
							}
							
							

							

						}
					}

				}

			}

		}

		JSONObject jsonObject = new JSONObject();

		try {
			jsonObject.put("status", status);
			jsonObject.put("alert", alert);
			etc.responseJSONObject(jsonObject, response);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// verifyUserAdmin page
	@RequestMapping(value = "/verifyUserAdmin", method = RequestMethod.GET)
	public ModelAndView verifyUserAdmin(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");

		session = request.getSession(false);
		int sessionStatus = new EtcMethods().checkSession(session, request);

		if (sessionStatus == 0 && session.getAttribute("role").toString().equals("4")) {

			return new ModelAndView("role4/verifyuser_admin");

		} else {
			return new ModelAndView("404");
		}
	}

	// Home page all user
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ModelAndView home(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");

		session = request.getSession(false);
		int sessionStatus = new EtcMethods().checkSession(session, request);

		if (sessionStatus == 0 && session.getAttribute("role").toString().equals("1")) {

			return new ModelAndView("role1/home");

		} else if (sessionStatus == 0 && session.getAttribute("role").toString().equals("2")) {

			return new ModelAndView("role2/home");

		} else if (sessionStatus == 0 && session.getAttribute("role").toString().equals("3")) {

			return new ModelAndView("role3/home");

		} else if (sessionStatus == 0 && session.getAttribute("role").toString().equals("4")) {

			return new ModelAndView("role4/home");

		} else {
			return new ModelAndView("login");
		}
	}

	// Get user confirm data
	@RequestMapping(value = "/userData", method = RequestMethod.POST)
	@ResponseBody
	public void userData(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		EtcMethods etc = new EtcMethods();

		session = request.getSession(false);
		int sessionStatus = etc.checkSession(session, request);

		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = null;
		String[] address = {};

		if (sessionStatus == 0 && session.getAttribute("role").toString().equals("4")) {

			ArrayList<HashMap<String, Object>> userData = new UserDAO().queryUserData();

			for (int i = 0; i < userData.size(); i++) {
				jsonObject = new JSONObject();
				jsonObject.put("user_id", userData.get(i).get("user_id"));
				jsonObject.put("gender", userData.get(i).get("gender"));
				jsonObject.put("firstname", userData.get(i).get("firstname"));
				jsonObject.put("lastname", userData.get(i).get("lastname"));

				address = userData.get(i).get("address").toString().split("\\s+");
				for (int j = 0; j < address.length; j++) {
					jsonObject.put("address" + (j + 1), address[j]);
				}

				jsonObject.put("email", userData.get(i).get("email"));
				jsonObject.put("student_code", userData.get(i).get("student_code"));
				jsonObject.put("phone", userData.get(i).get("phone"));
				jsonObject.put("identified_number", userData.get(i).get("identified_number"));
				jsonObject.put("advisor", userData.get(i).get("advisor"));
				jsonObject.put("university_name", userData.get(i).get("university_name"));
				jsonObject.put("faculty_name", userData.get(i).get("faculty_name"));
				jsonObject.put("course_name", userData.get(i).get("course_name"));
				jsonObject.put("university_id", userData.get(i).get("university_id"));
				jsonObject.put("faculty_id", userData.get(i).get("faculty_id"));
				jsonObject.put("course_id", userData.get(i).get("course_id"));
				jsonObject.put("status", userData.get(i).get("status"));
				jsonObject.put("profile_image", userData.get(i).get("profile_image"));
				jsonObject.put("user_type", userData.get(i).get("user_type"));
				jsonObject.put("time_reg", userData.get(i).get("time_reg"));
				jsonObject.put("birthday", userData.get(i).get("birthday"));

				jsonArray.put(jsonObject);
			}

		}

		new EtcMethods().responseJSONArray(jsonArray, response);

	}

	@RequestMapping(value = "/userDataForVerify", method = RequestMethod.POST)
	@ResponseBody
	public void userDataForVerify(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		EtcMethods etc = new EtcMethods();

		session = request.getSession(false);
		int sessionStatus = etc.checkSession(session, request);

		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = null;
		String[] address = {};

		if (sessionStatus == 0 && session.getAttribute("role").toString().equals("4")) {

			ArrayList<HashMap<String, Object>> userData = new UserDAO().queryUserDataForVerify();

			for (int i = 0; i < userData.size(); i++) {
				jsonObject = new JSONObject();
				jsonObject.put("user_id", userData.get(i).get("user_id"));
				jsonObject.put("gender", userData.get(i).get("gender"));
				jsonObject.put("firstname", userData.get(i).get("firstname"));
				jsonObject.put("lastname", userData.get(i).get("lastname"));

				address = userData.get(i).get("address").toString().split("\\s+");
				for (int j = 0; j < address.length; j++) {
					jsonObject.put("address" + (j + 1), address[j]);
				}

				jsonObject.put("email", userData.get(i).get("email"));
				jsonObject.put("student_code", userData.get(i).get("student_code"));
				jsonObject.put("phone", userData.get(i).get("phone"));
				jsonObject.put("identified_number", userData.get(i).get("identified_number"));
				jsonObject.put("advisor", userData.get(i).get("advisor"));
				jsonObject.put("university_name", userData.get(i).get("university_name"));
				jsonObject.put("faculty_name", userData.get(i).get("faculty_name"));
				jsonObject.put("course_name", userData.get(i).get("course_name"));
				jsonObject.put("university_id", userData.get(i).get("university_id"));
				jsonObject.put("faculty_id", userData.get(i).get("faculty_id"));
				jsonObject.put("course_id", userData.get(i).get("course_id"));
				jsonObject.put("status", userData.get(i).get("status"));
				jsonObject.put("profile_image", userData.get(i).get("profile_image"));
				jsonObject.put("user_type", userData.get(i).get("user_type"));
				jsonObject.put("time_reg", userData.get(i).get("time_reg"));
				jsonObject.put("birthday", userData.get(i).get("birthday"));

				jsonArray.put(jsonObject);
			}

		}
		new EtcMethods().responseJSONArray(jsonArray, response);

	}

	// Get user confirm data
	@RequestMapping(value = "/profileSettingAdmin", method = RequestMethod.POST)
	@ResponseBody
	public void profileSettingAdmin(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		EtcMethods etc = new EtcMethods();

		session = request.getSession(false);
		int sessionStatus = etc.checkSession(session, request);

		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = null;
		String[] address = {};

		if (sessionStatus == 0 && session.getAttribute("role").toString().equals("4")) {

			ArrayList<HashMap<String, Object>> userData = new UserDAO().queryAdminData(session.getAttribute("id").toString());

			for (int i = 0; i < userData.size(); i++) {
				jsonObject = new JSONObject();
				jsonObject.put("user_id", userData.get(i).get("user_id"));
				jsonObject.put("gender", userData.get(i).get("gender"));
				jsonObject.put("firstname", userData.get(i).get("firstname"));
				jsonObject.put("lastname", userData.get(i).get("lastname"));

				address = userData.get(i).get("address").toString().split("\\s+");
				for (int j = 0; j < address.length; j++) {
					jsonObject.put("address" + (j + 1), address[j]);
				}

				jsonObject.put("email", userData.get(i).get("email"));
				jsonObject.put("student_code", userData.get(i).get("student_code"));
				jsonObject.put("phone", userData.get(i).get("phone"));
				jsonObject.put("identified_number", userData.get(i).get("identified_number"));
				jsonObject.put("advisor", userData.get(i).get("advisor"));
				jsonObject.put("university_name", userData.get(i).get("university_name"));
				jsonObject.put("faculty_name", userData.get(i).get("faculty_name"));
				jsonObject.put("course_name", userData.get(i).get("course_name"));
				jsonObject.put("university_id", userData.get(i).get("university_id"));
				jsonObject.put("faculty_id", userData.get(i).get("faculty_id"));
				jsonObject.put("course_id", userData.get(i).get("course_id"));
				jsonObject.put("status", userData.get(i).get("status"));
				jsonObject.put("profile_image", userData.get(i).get("profile_image"));
				jsonObject.put("user_type", userData.get(i).get("user_type"));
				jsonObject.put("time_reg", userData.get(i).get("time_reg"));
				jsonObject.put("birthday", userData.get(i).get("birthday"));

				jsonArray.put(jsonObject);
			}

		}

		new EtcMethods().responseJSONArray(jsonArray, response);

	}

	// Get user confirm data by sort case
	@RequestMapping(value = "/userDataSort", method = RequestMethod.POST)
	@ResponseBody
	public void userDataSort(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		EtcMethods etc = new EtcMethods();

		session = request.getSession(false);
		int sessionStatus = etc.checkSession(session, request);

		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = null;

		if (sessionStatus == 0 && session.getAttribute("role").toString().equals("4")) {

			ArrayList<HashMap<String, Object>> userData = new UserDAO().queryUserDataSort();

			for (int i = 0; i < userData.size(); i++) {
				jsonObject = new JSONObject();
				jsonObject.put("user_id", userData.get(i).get("user_id"));
				jsonObject.put("gender", userData.get(i).get("gender"));
				jsonObject.put("firstname", userData.get(i).get("firstname"));
				jsonObject.put("lastname", userData.get(i).get("lastname"));
				jsonObject.put("address", userData.get(i).get("address"));
				jsonObject.put("email", userData.get(i).get("email"));
				jsonObject.put("student_code", userData.get(i).get("student_code"));
				jsonObject.put("phone", userData.get(i).get("phone"));
				jsonObject.put("identified_number", userData.get(i).get("identified_number"));
				jsonObject.put("advisor", userData.get(i).get("advisor"));
				jsonObject.put("university", userData.get(i).get("university"));
				jsonObject.put("faculty", userData.get(i).get("faculty"));
				jsonObject.put("course", userData.get(i).get("course"));
				jsonObject.put("status", userData.get(i).get("status"));
				jsonObject.put("profile_image", userData.get(i).get("profile_image"));
				jsonObject.put("user_type", userData.get(i).get("user_type"));
				jsonObject.put("time_reg", userData.get(i).get("time_reg"));
				jsonObject.put("birthday", userData.get(i).get("birthday"));

				jsonArray.put(jsonObject);
			}

		}

		new EtcMethods().responseJSONArray(jsonArray, response);

	}

	@RequestMapping(value = "/emailHistoryData", method = RequestMethod.POST)
	@ResponseBody
	public void emailHistoryData(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		EtcMethods etc = new EtcMethods();

		session = request.getSession(false);
		int sessionStatus = etc.checkSession(session, request);

		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = null;

		if (sessionStatus == 0 && session.getAttribute("role").toString().equals("4")) {

			ArrayList<HashMap<String, Object>> userData = new AdminEmailHistoryDAO().queryEmailHistoryData();

			for (int i = 0; i < userData.size(); i++) {
				jsonObject = new JSONObject();
				jsonObject.put("firstname", userData.get(i).get("firstname"));
				jsonObject.put("lastname", userData.get(i).get("lastname"));
				jsonObject.put("profile_image", userData.get(i).get("profile_image"));
				jsonObject.put("user_type", userData.get(i).get("user_type"));
				jsonObject.put("email_send", userData.get(i).get("email_send"));
				jsonObject.put("email_recive", userData.get(i).get("email_recive"));
				jsonObject.put("detail", userData.get(i).get("detail"));
				jsonObject.put("time_reg", userData.get(i).get("time_reg"));

				jsonArray.put(jsonObject);
			}

		}

		new EtcMethods().responseJSONArray(jsonArray, response);

	}

	// Get user confirm data by sort user type case
	@RequestMapping(value = "/userDataSortUserType", method = RequestMethod.POST)
	@ResponseBody
	public void userDataSortUserType(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		EtcMethods etc = new EtcMethods();

		session = request.getSession(false);
		int sessionStatus = etc.checkSession(session, request);

		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = null;

		if (sessionStatus == 0 && session.getAttribute("role").toString().equals("4")) {

			String data = request.getParameter("data");

			if (data != null && !data.equals("")) {

				ArrayList<HashMap<String, Object>> userData = new UserDAO().queryUserDataSortUserType(data);

				for (int i = 0; i < userData.size(); i++) {
					jsonObject = new JSONObject();
					jsonObject.put("user_id", userData.get(i).get("user_id"));
					jsonObject.put("gender", userData.get(i).get("gender"));
					jsonObject.put("firstname", userData.get(i).get("firstname"));
					jsonObject.put("lastname", userData.get(i).get("lastname"));
					jsonObject.put("address", userData.get(i).get("address"));
					jsonObject.put("email", userData.get(i).get("email"));
					jsonObject.put("student_code", userData.get(i).get("student_code"));
					jsonObject.put("phone", userData.get(i).get("phone"));
					jsonObject.put("identified_number", userData.get(i).get("identified_number"));
					jsonObject.put("advisor", userData.get(i).get("advisor"));
					jsonObject.put("university", userData.get(i).get("university"));
					jsonObject.put("faculty", userData.get(i).get("faculty"));
					jsonObject.put("course", userData.get(i).get("course"));
					jsonObject.put("status", userData.get(i).get("status"));
					jsonObject.put("profile_image", userData.get(i).get("profile_image"));
					jsonObject.put("user_type", userData.get(i).get("user_type"));
					jsonObject.put("time_reg", userData.get(i).get("time_reg"));
					jsonObject.put("birthday", userData.get(i).get("birthday"));

					jsonArray.put(jsonObject);
				}

			}

		}

		new EtcMethods().responseJSONArray(jsonArray, response);

	}

	// Get user confirm data by sort user status case
	@RequestMapping(value = "/userDataSortUserStatus", method = RequestMethod.POST)
	@ResponseBody
	public void userDataSortUserStatus(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		EtcMethods etc = new EtcMethods();

		session = request.getSession(false);
		int sessionStatus = etc.checkSession(session, request);

		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = null;

		if (sessionStatus == 0 && session.getAttribute("role").toString().equals("4")) {

			String data = request.getParameter("data");

			if (data != null && !data.equals("")) {

				ArrayList<HashMap<String, Object>> userData = new UserDAO().queryUserDataSortUserStatus(data);

				for (int i = 0; i < userData.size(); i++) {
					jsonObject = new JSONObject();
					jsonObject.put("user_id", userData.get(i).get("user_id"));
					jsonObject.put("gender", userData.get(i).get("gender"));
					jsonObject.put("firstname", userData.get(i).get("firstname"));
					jsonObject.put("lastname", userData.get(i).get("lastname"));
					jsonObject.put("address", userData.get(i).get("address"));
					jsonObject.put("email", userData.get(i).get("email"));
					jsonObject.put("student_code", userData.get(i).get("student_code"));
					jsonObject.put("phone", userData.get(i).get("phone"));
					jsonObject.put("identified_number", userData.get(i).get("identified_number"));
					jsonObject.put("advisor", userData.get(i).get("advisor"));
					jsonObject.put("university", userData.get(i).get("university"));
					jsonObject.put("faculty", userData.get(i).get("faculty"));
					jsonObject.put("course", userData.get(i).get("course"));
					jsonObject.put("status", userData.get(i).get("status"));
					jsonObject.put("profile_image", userData.get(i).get("profile_image"));
					jsonObject.put("user_type", userData.get(i).get("user_type"));
					jsonObject.put("time_reg", userData.get(i).get("time_reg"));
					jsonObject.put("birthday", userData.get(i).get("birthday"));

					jsonArray.put(jsonObject);
				}

			}

		}

		new EtcMethods().responseJSONArray(jsonArray, response);

	}

	// Confirm user by admin
	@RequestMapping(value = "/managementUserStatusByAdmin", method = RequestMethod.POST)
	@ResponseBody
	public void managementUserStatusByAdmin(HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		EtcMethods etc = new EtcMethods();

		session = request.getSession(false);
		int sessionStatus = etc.checkSession(session, request);
		String status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
		String alert = "0";

		if (sessionStatus == 0 && session.getAttribute("role").toString().equals("4")) {

			String admin_id = session.getAttribute("id").toString();
			String user_id = request.getParameter("user_id");
			String ip = request.getParameter("ip");
			String status_user = request.getParameter("status");

			if (admin_id != null && user_id != null && ip != null && status_user != null && !status_user.equals("")
					&& !admin_id.equals("") && !user_id.equals("") && !ip.equals("")) {

				if (status_user.equals("1") || status_user.equals("0")) {

					String email = new UserDAO().findEmailByUserId(user_id).get("email").toString();
					String detail_event = "";

					if (new UserDAO().managementStatusUser(user_id, status_user) == 1) {

						status = "อัปเดทสถานะผู้ใช้งานสำเร็จ";
						alert = "1";

						if (status_user.equals("1")) {

							etc.sendEmail(admin_id, email, "ผลการตรวจสอบข้อมูลของคุณ",
									"คุณผ่านการยืนยันตัวตนแล้ว\nเข้าสู่ระบบได้ที่นี่ " + url + "login");
							detail_event = "ยืนยันตัวตนผู้ใช้รหัส " + user_id;

						} else if (status_user.equals("0")) {

							etc.sendEmail(admin_id, email, "ผลการตรวจสอบข้อมูลของคุณ",
									"คุณไม่ผ่านการยืนยันตัวตน โปรดตรวจสอบและกรอกข้อมูลใหม่\nคุณสามารถส่งข้อมูลใหม่ได้ที่นี่ "
											+ url + "requestForm");
							detail_event = "ยกเลิกการยืนยันตัวตนผู้ใช้รหัส " + user_id;

						}

						new EventHistoryDAO().insertEventHistory(admin_id, detail_event, ip);

					}

				}

			}

		}

		JSONObject jsonObject = new JSONObject();

		jsonObject.put("status", status);
		jsonObject.put("alert", alert);
		etc.responseJSONObject(jsonObject, response);

	}

	// Send mail notify
	@RequestMapping(value = "/sendMailNotify", method = RequestMethod.POST)
	@ResponseBody
	public void sendMailNotify(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		EtcMethods etc = new EtcMethods();

		session = request.getSession(false);
		int sessionStatus = etc.checkSession(session, request);
		String status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
		String alert = "0";

		if (sessionStatus == 0 && session.getAttribute("role").toString().equals("4")) {

			String admin_id = session.getAttribute("id").toString();
			String ip = request.getParameter("ip");

			String email = request.getParameter("email");
			String title = request.getParameter("title");
			String text = request.getParameter("text");
			String user_id = request.getParameter("user_id");

			if (admin_id != null && ip != null && email != null && title != null && text != null && user_id != null
					&& !user_id.equals("") && !admin_id.equals("") && !ip.equals("") && !email.equals("")
					&& !title.equals("") && !text.equals("")) {

				etc.sendEmail(admin_id, email, title, text);

				status = "ส่งการแจ้งเตือนสำเร็จ";
				alert = "1";
			}

		}

		JSONObject jsonObject = new JSONObject();

		jsonObject.put("status", status);
		jsonObject.put("alert", alert);
		etc.responseJSONObject(jsonObject, response);

	}

	// Event history page
	// For admin
	@RequestMapping(value = "/eventHistory", method = RequestMethod.GET)
	public ModelAndView eventHistory(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");

		session = request.getSession(false);
		int sessionStatus = new EtcMethods().checkSession(session, request);

		if (sessionStatus == 0 && session.getAttribute("role").toString().equals("4")) {

			return new ModelAndView("role4/event_history");

		} else {

			return new ModelAndView("404");
		}

	}

	// Login history page
	// For admin
	@RequestMapping(value = "/loginHistory", method = RequestMethod.GET)
	public ModelAndView loginHistory(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");

		session = request.getSession(false);
		int sessionStatus = new EtcMethods().checkSession(session, request);

		if (sessionStatus == 0 && session.getAttribute("role").toString().equals("4")) {

			return new ModelAndView("role4/login_history");

		} else {

			return new ModelAndView("404");
		}

	}

	// Login history
	// For admin
	@RequestMapping(value = "/eventHistoryData", method = RequestMethod.POST)
	@ResponseBody
	public void eventHistoryData(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		session = request.getSession(false);
		int sessionStatus = new EtcMethods().checkSession(session, request);

		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = null;

		if (sessionStatus == 0 && session.getAttribute("role").toString().equals("4")) {

			ArrayList<HashMap<String, Object>> eventHistory = new EventHistoryDAO().queryEventHistory();

			for (int i = 0; i < eventHistory.size(); i++) {
				jsonObject = new JSONObject();
				jsonObject.put("profile_image", eventHistory.get(i).get("profile_image"));
				jsonObject.put("firstname", eventHistory.get(i).get("firstname"));
				jsonObject.put("lastname", eventHistory.get(i).get("lastname"));
				jsonObject.put("email", eventHistory.get(i).get("email"));
				jsonObject.put("user_type", eventHistory.get(i).get("user_type"));
				jsonObject.put("detail", eventHistory.get(i).get("detail"));
				jsonObject.put("ip_address", eventHistory.get(i).get("ip_address"));
				jsonObject.put("time_reg", eventHistory.get(i).get("time_reg"));

				jsonArray.put(jsonObject);
			}

		}

		new EtcMethods().responseJSONArray(jsonArray, response);

	}

	// Event history sort
	// For admin
	@RequestMapping(value = "/eventHistoryDataSort", method = RequestMethod.POST)
	@ResponseBody
	public void eventHistoryDataSort(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		session = request.getSession(false);
		int sessionStatus = new EtcMethods().checkSession(session, request);

		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = null;

		if (sessionStatus == 0 && session.getAttribute("role").toString().equals("4")) {

			String data = request.getParameter("data");
			ArrayList<HashMap<String, Object>> eventHistory = null;

			if (data != null && !data.equals("")) {

				if (data.equals("1")) {

					eventHistory = new EventHistoryDAO().queryEventHistorySort("ASC");

				} else if (data.equals("2")) {

					eventHistory = new EventHistoryDAO().queryEventHistorySort("DESC");

				}

				for (int i = 0; i < eventHistory.size(); i++) {
					jsonObject = new JSONObject();
					jsonObject.put("profile_image", eventHistory.get(i).get("profile_image"));
					jsonObject.put("firstname", eventHistory.get(i).get("firstname"));
					jsonObject.put("lastname", eventHistory.get(i).get("lastname"));
					jsonObject.put("email", eventHistory.get(i).get("email"));
					jsonObject.put("user_type", eventHistory.get(i).get("user_type"));
					jsonObject.put("detail", eventHistory.get(i).get("detail"));
					jsonObject.put("ip_address", eventHistory.get(i).get("ip_address"));
					jsonObject.put("time_reg", eventHistory.get(i).get("time_reg"));

					jsonArray.put(jsonObject);
				}

			}

		}

		new EtcMethods().responseJSONArray(jsonArray, response);

	}

	// Event history sort user type
	// For admin
	@RequestMapping(value = "/eventHistoryDataSortUserType", method = RequestMethod.POST)
	@ResponseBody
	public void eventHistoryDataSortUserType(HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		session = request.getSession(false);
		int sessionStatus = new EtcMethods().checkSession(session, request);

		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = null;

		if (sessionStatus == 0 && session.getAttribute("role").toString().equals("4")) {

			String data = request.getParameter("data");

			if (data != null && !data.equals("")) {

				ArrayList<HashMap<String, Object>> eventHistory = new EventHistoryDAO()
						.queryEventHistorySortUserType(data);

				for (int i = 0; i < eventHistory.size(); i++) {
					jsonObject = new JSONObject();
					jsonObject.put("profile_image", eventHistory.get(i).get("profile_image"));
					jsonObject.put("firstname", eventHistory.get(i).get("firstname"));
					jsonObject.put("lastname", eventHistory.get(i).get("lastname"));
					jsonObject.put("email", eventHistory.get(i).get("email"));
					jsonObject.put("user_type", eventHistory.get(i).get("user_type"));
					jsonObject.put("detail", eventHistory.get(i).get("detail"));
					jsonObject.put("ip_address", eventHistory.get(i).get("ip_address"));
					jsonObject.put("time_reg", eventHistory.get(i).get("time_reg"));

					jsonArray.put(jsonObject);
				}

			}

		}

		new EtcMethods().responseJSONArray(jsonArray, response);

	}

	// Event history
	// For admin
	@RequestMapping(value = "/loginHistoryData", method = RequestMethod.POST)
	@ResponseBody
	public void loginHistoryData(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		session = request.getSession(false);
		int sessionStatus = new EtcMethods().checkSession(session, request);

		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = null;

		if (sessionStatus == 0 && session.getAttribute("role").toString().equals("4")) {

			ArrayList<HashMap<String, Object>> loginHistory = new LoginHistoryDAO().queryLoginHistory();

			for (int i = 0; i < loginHistory.size(); i++) {
				jsonObject = new JSONObject();
				jsonObject.put("profile_image", loginHistory.get(i).get("profile_image"));
				jsonObject.put("firstname", loginHistory.get(i).get("firstname"));
				jsonObject.put("lastname", loginHistory.get(i).get("lastname"));
				jsonObject.put("email", loginHistory.get(i).get("email"));
				jsonObject.put("user_type", loginHistory.get(i).get("user_type"));
				jsonObject.put("ip_address", loginHistory.get(i).get("ip_address"));
				jsonObject.put("time_reg", loginHistory.get(i).get("time_reg"));

				jsonArray.put(jsonObject);
			}

		}

		new EtcMethods().responseJSONArray(jsonArray, response);

	}

	// Send mail page
	// For admin
	@RequestMapping(value = "/sendMail", method = RequestMethod.GET)
	public ModelAndView sendMail(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");

		session = request.getSession(false);
		int sessionStatus = new EtcMethods().checkSession(session, request);

		if (sessionStatus == 0 && session.getAttribute("role").toString().equals("4")) {

			return new ModelAndView("role4/send_mail");

		} else {

			return new ModelAndView("404");
		}

	}

	@RequestMapping(value = "/emailHistory", method = RequestMethod.GET)
	public ModelAndView emailHistory(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");

		session = request.getSession(false);
		int sessionStatus = new EtcMethods().checkSession(session, request);

		if (sessionStatus == 0 && session.getAttribute("role").toString().equals("4")) {

			return new ModelAndView("role4/email_history");

		} else {

			return new ModelAndView("404");
		}

	}

	// Study management page
	// For admin
	@RequestMapping(value = "/studyManagement", method = RequestMethod.GET)
	public ModelAndView studyManagement(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");

		session = request.getSession(false);
		int sessionStatus = new EtcMethods().checkSession(session, request);

		if (sessionStatus == 0 && session.getAttribute("role").toString().equals("4")) {

			return new ModelAndView("role4/study_management");

		} else {

			return new ModelAndView("404");
		}

	}

	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public ModelAndView profile(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");

		session = request.getSession(false);
		int sessionStatus = new EtcMethods().checkSession(session, request);

		if (sessionStatus == 0 && session.getAttribute("role").toString().equals("1")) {

			return new ModelAndView("role1/profile_setting");

		}
		if (sessionStatus == 0 && session.getAttribute("role").toString().equals("2")) {

			return new ModelAndView("role2/profile_setting");

		}
		if (sessionStatus == 0 && session.getAttribute("role").toString().equals("3")) {

			return new ModelAndView("role3/profile_setting");

		}
		if (sessionStatus == 0 && session.getAttribute("role").toString().equals("4")) {

			return new ModelAndView("role4/profile_setting");

		} else {

			return new ModelAndView("404");
		}

	}

	// Get user data
	@RequestMapping(value = "/profileSetting", method = RequestMethod.POST)
	@ResponseBody
	public void profileSetting(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		EtcMethods etc = new EtcMethods();

		session = request.getSession(false);
		int sessionStatus = etc.checkSession(session, request);

		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = null;
		String[] address = {};

		if (sessionStatus == 0) {

			HashMap<String, Object> userData = new UserDAO().queryUserProfile(session.getAttribute("id").toString());

			jsonObject = new JSONObject();
			jsonObject.put("user_id", userData.get("user_id"));
			jsonObject.put("gender", userData.get("gender"));
			jsonObject.put("firstname", userData.get("firstname"));
			jsonObject.put("lastname", userData.get("lastname"));

			address = userData.get("address").toString().split("\\s+");

			for (int j = 0; j < address.length; j++) {
				jsonObject.put("address" + (j + 1), address[j]);
			}

			jsonObject.put("email", userData.get("email"));
			jsonObject.put("student_code", userData.get("student_code"));
			jsonObject.put("phone", userData.get("phone"));
			jsonObject.put("identified_number", userData.get("identified_number"));
			jsonObject.put("advisor", userData.get("advisor"));
			jsonObject.put("university", userData.get("university"));
			jsonObject.put("faculty", userData.get("faculty"));
			jsonObject.put("course", userData.get("course"));
			jsonObject.put("status", userData.get("status"));
			jsonObject.put("profile_image", userData.get("profile_image"));
			jsonObject.put("user_type", userData.get("user_type"));
			jsonObject.put("time_reg", userData.get("time_reg"));
			jsonObject.put("birthday", userData.get("birthday"));

			jsonArray.put(jsonObject);

		}

		new EtcMethods().responseJSONArray(jsonArray, response);

	}

	@RequestMapping(value = "/updateUserPassword", method = RequestMethod.POST)
	@ResponseBody
	public void updateUserPassword(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		EtcMethods etc = new EtcMethods();

		session = request.getSession(false);
		int sessionStatus = etc.checkSession(session, request);
		String status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
		String alert = "0";

		if (sessionStatus == 0) {

			String user_id = session.getAttribute("id").toString();
			String password = etc.HASH(request.getParameter("password"));
			String ip = request.getParameter("ip");

			if (user_id != null && !user_id.equals("") && password != null && !password.equals("") && ip != null
					&& !ip.equals("")) {

				HashMap<String, Object> salt = new UserDAO().querySaltByUserId(user_id);

				if (salt.size() != 0) {

					password = etc.HASH(password + salt.get("salt"));

					if (new UserDAO().updatePasswordByUserId(password, user_id) == 1) {

						status = "แก้ไขรหัสผ่านเรียบร้อย";
						alert = "1";
						new EventHistoryDAO().insertEventHistory(user_id, "แก้ไขรหัสผ่าน", ip);
					}
				}

			}
		}

		JSONObject jsonObject = new JSONObject();

		jsonObject.put("status", status);
		jsonObject.put("alert", alert);
		etc.responseJSONObject(jsonObject, response);

	}

	@RequestMapping(value = "/dashboardData", method = RequestMethod.POST)
	@ResponseBody
	public void dashboardData(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		session = request.getSession(false);
		int sessionStatus = new EtcMethods().checkSession(session, request);

		if (sessionStatus == 0 && session.getAttribute("role").toString().equals("4")) {

			UserDAO userDAO = new UserDAO();

			HashMap<String, Object> userStatus = userDAO.queryUserStatusForDashboard();
			HashMap<String, Object> userType = userDAO.queryUserTypeForDashboard();
			HashMap<String, Object> userDays = userDAO.queryUserDaysForDashboard();
			HashMap<String, Object> userMonths = userDAO.queryUserMonthsForDashboard();

			JSONObject jsonObject = new JSONObject();

			jsonObject.put("user_status0", userStatus.get("status0"));
			jsonObject.put("user_status1", userStatus.get("status1"));
			jsonObject.put("user_status2", userStatus.get("status2"));

			jsonObject.put("user_type1", userType.get("role1"));
			jsonObject.put("user_type2", userType.get("role2"));
			jsonObject.put("user_type3", userType.get("role3"));
			jsonObject.put("user_type4", userType.get("role4"));

			jsonObject.put("user_day1", userDays.get("day1"));
			jsonObject.put("user_day2", userDays.get("day2"));
			jsonObject.put("user_day3", userDays.get("day3"));
			jsonObject.put("user_day4", userDays.get("day4"));
			jsonObject.put("user_day5", userDays.get("day5"));
			jsonObject.put("user_day6", userDays.get("day6"));
			jsonObject.put("user_day7", userDays.get("day7"));

			jsonObject.put("user_month1", userMonths.get("month1"));
			jsonObject.put("user_month2", userMonths.get("month2"));
			jsonObject.put("user_month3", userMonths.get("month3"));
			jsonObject.put("user_month4", userMonths.get("month4"));
			jsonObject.put("user_month5", userMonths.get("month5"));
			jsonObject.put("user_month6", userMonths.get("month6"));
			jsonObject.put("user_month7", userMonths.get("month7"));
			jsonObject.put("user_month8", userMonths.get("month8"));
			jsonObject.put("user_month9", userMonths.get("month9"));
			jsonObject.put("user_month10", userMonths.get("month10"));
			jsonObject.put("user_month11", userMonths.get("month11"));
			jsonObject.put("user_month12", userMonths.get("month12"));

			new EtcMethods().responseJSONObject(jsonObject, response);
		}
	}

	@RequestMapping(value = "/dashboardDataByDate", method = RequestMethod.POST)
	@ResponseBody
	public void dashboardDataByDate(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		session = request.getSession(false);
		int sessionStatus = new EtcMethods().checkSession(session, request);

		if (sessionStatus == 0 && session.getAttribute("role").toString().equals("4")) {

			String begin = request.getParameter("begin");
			String end = request.getParameter("end");

			if (begin != null && end != null && !begin.equals("") && !end.equals("")) {

				UserDAO userDAO = new UserDAO();

				HashMap<String, Object> userStatus = userDAO.queryUserStatusForDashboardByDate(begin, end);
				HashMap<String, Object> userType = userDAO.queryUserTypeForDashboardByDate(begin, end);

				JSONObject jsonObject = new JSONObject();

				jsonObject.put("user_status0", userStatus.get("status0"));
				jsonObject.put("user_status1", userStatus.get("status1"));
				jsonObject.put("user_status2", userStatus.get("status2"));

				jsonObject.put("user_type1", userType.get("role1"));
				jsonObject.put("user_type2", userType.get("role2"));
				jsonObject.put("user_type3", userType.get("role3"));
				jsonObject.put("user_type4", userType.get("role4"));

				new EtcMethods().responseJSONObject(jsonObject, response);

			}

		}
	}

	@RequestMapping(value = "/studentRequest", method = RequestMethod.GET)
	public ModelAndView studentRequest(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");

		session = request.getSession(false);
		int sessionStatus = new EtcMethods().checkSession(session, request);

		if (sessionStatus == 0 && session.getAttribute("role").toString().equals("3")) {

			return new ModelAndView("role3/student_request");

		} else if (sessionStatus == 0 && session.getAttribute("role").toString().equals("2")) {

			return new ModelAndView("role2/student_request");

		} else {

			return new ModelAndView("404");
		}

	}

	@RequestMapping(value = "/studentDataForPlaceRequest", method = RequestMethod.POST)
	@ResponseBody
	public void studentDataForPlaceRequest(HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		EtcMethods etc = new EtcMethods();

		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = null;

		ArrayList<HashMap<String, Object>> userData = new UserDAO().studentData();

		for (int i = 0; i < userData.size(); i++) {
			jsonObject = new JSONObject();
			jsonObject.put("user_id", userData.get(i).get("user_id"));
			jsonObject.put("gender", userData.get(i).get("gender"));
			jsonObject.put("firstname", userData.get(i).get("firstname"));
			jsonObject.put("lastname", userData.get(i).get("lastname"));
			jsonObject.put("university_name", userData.get(i).get("university_name"));
			jsonObject.put("faculty_name", userData.get(i).get("faculty_name"));
			jsonObject.put("course_name", userData.get(i).get("course_name"));
			jsonObject.put("profile_image", userData.get(i).get("profile_image"));
			jsonObject.put("birthday", userData.get(i).get("birthday"));

			jsonObject.put("province", userData.get(i).get("address").toString().split("\\s+")[5]);

			jsonArray.put(jsonObject);
		}

		new EtcMethods().responseJSONArray(jsonArray, response);

	}

	// Filter zone
	@RequestMapping(value = "/findStudentByZone", method = RequestMethod.POST)
	@ResponseBody
	public void findStudentByZone(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = null;
		String zone = request.getParameter("zone_value");

		if (zone.equals("1") || zone.equals("2") || zone.equals("3") || zone.equals("4") || zone.equals("5")
				|| zone.equals("6")) {

			String[][] zone_filter = new AddressParameterConfig().zone;
			String[] zone_data = new String[zone_filter[Integer.parseInt(zone) - 1].length];

			for (int i = 0; i < zone_filter[Integer.parseInt(zone) - 1].length; i++) {
				zone_data[i] = zone_filter[Integer.parseInt(zone) - 1][i];
			}

			ArrayList<HashMap<String, Object>> userData = new UserDAO().studentDataByZone(zone_data);

			for (int i = 0; i < userData.size(); i++) {
				jsonObject = new JSONObject();
				jsonObject.put("user_id", userData.get(i).get("user_id"));
				jsonObject.put("gender", userData.get(i).get("gender"));
				jsonObject.put("firstname", userData.get(i).get("firstname"));
				jsonObject.put("lastname", userData.get(i).get("lastname"));
				jsonObject.put("university_name", userData.get(i).get("university_name"));
				jsonObject.put("faculty_name", userData.get(i).get("faculty_name"));
				jsonObject.put("course_name", userData.get(i).get("course_name"));
				jsonObject.put("profile_image", userData.get(i).get("profile_image"));
				jsonObject.put("birthday", userData.get(i).get("birthday"));

				jsonObject.put("province", userData.get(i).get("address").toString().split("\\s+")[5]);

				jsonArray.put(jsonObject);
			}

		}

		new EtcMethods().responseJSONArray(jsonArray, response);
	}

	@RequestMapping(value = "/requestStudent", method = RequestMethod.GET)
	public ModelAndView requestStudent(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");

		session = request.getSession(false);
		int sessionStatus = new EtcMethods().checkSession(session, request);

		if (sessionStatus == 0 && session.getAttribute("role").toString().equals("3")) {

			return new ModelAndView("role3/request_student");

		} else {

			return new ModelAndView("404");
		}

	}

	@RequestMapping(value = "/studentDataForRole3Request", method = RequestMethod.POST)
	@ResponseBody
	public void studentDataForRole3Request(HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		EtcMethods etc = new EtcMethods();

		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = null;

		session = request.getSession(false);
		int sessionStatus = etc.checkSession(session, request);

		if (sessionStatus == 0 && session.getAttribute("role").toString().equals("3")) {

			ArrayList<HashMap<String, Object>> userData = new UserDAO().studentDataRole3();

			for (int i = 0; i < userData.size(); i++) {
				jsonObject = new JSONObject();
				jsonObject.put("user_id", userData.get(i).get("user_id"));
				jsonObject.put("gender", userData.get(i).get("gender"));
				jsonObject.put("firstname", userData.get(i).get("firstname"));
				jsonObject.put("lastname", userData.get(i).get("lastname"));
				jsonObject.put("university_name", userData.get(i).get("university_name"));
				jsonObject.put("faculty_name", userData.get(i).get("faculty_name"));
				jsonObject.put("course_name", userData.get(i).get("course_name"));
				jsonObject.put("profile_image", userData.get(i).get("profile_image"));
				jsonObject.put("birthday", userData.get(i).get("birthday"));
				jsonObject.put("email", userData.get(i).get("email"));
				jsonObject.put("phone", userData.get(i).get("phone"));

				jsonObject.put("province", userData.get(i).get("address").toString().split("\\s+")[5]);

				jsonArray.put(jsonObject);
			}
		}

		new EtcMethods().responseJSONArray(jsonArray, response);

	}

	// Filter zone
	@RequestMapping(value = "/findStudentRole3ByZone", method = RequestMethod.POST)
	@ResponseBody
	public void findStudentRole3ByZone(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = null;
		String zone = request.getParameter("zone_value");

		EtcMethods etc = new EtcMethods();

		session = request.getSession(false);
		int sessionStatus = etc.checkSession(session, request);

		if (sessionStatus == 0 && session.getAttribute("role").toString().equals("3")) {

			if (zone.equals("1") || zone.equals("2") || zone.equals("3") || zone.equals("4") || zone.equals("5")
					|| zone.equals("6")) {

				String[][] zone_filter = new AddressParameterConfig().zone;
				String[] zone_data = new String[zone_filter[Integer.parseInt(zone) - 1].length];

				for (int i = 0; i < zone_filter[Integer.parseInt(zone) - 1].length; i++) {
					zone_data[i] = zone_filter[Integer.parseInt(zone) - 1][i];
				}

				ArrayList<HashMap<String, Object>> userData = new UserDAO().studentDataByZoneRole3(zone_data);

				for (int i = 0; i < userData.size(); i++) {
					jsonObject = new JSONObject();
					jsonObject.put("user_id", userData.get(i).get("user_id"));
					jsonObject.put("gender", userData.get(i).get("gender"));
					jsonObject.put("firstname", userData.get(i).get("firstname"));
					jsonObject.put("lastname", userData.get(i).get("lastname"));
					jsonObject.put("university_name", userData.get(i).get("university_name"));
					jsonObject.put("faculty_name", userData.get(i).get("faculty_name"));
					jsonObject.put("course_name", userData.get(i).get("course_name"));
					jsonObject.put("profile_image", userData.get(i).get("profile_image"));
					jsonObject.put("birthday", userData.get(i).get("birthday"));
					jsonObject.put("email", userData.get(i).get("email"));
					jsonObject.put("phone", userData.get(i).get("phone"));

					jsonObject.put("province", userData.get(i).get("address").toString().split("\\s+")[5]);

					jsonArray.put(jsonObject);
				}

			}

		}

		etc.responseJSONArray(jsonArray, response);
	}
	
	@RequestMapping(value = "/generateResume", method = RequestMethod.GET)
	public ModelAndView generateResume(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");

		session = request.getSession(false);
		int sessionStatus = new EtcMethods().checkSession(session, request);

		if (sessionStatus == 0 && session.getAttribute("role").toString().equals("1")) {

			return new ModelAndView("role1/generate_resume");

		} else {
			return new ModelAndView("404");
		}
	}
	
	@RequestMapping(value = "/getUserDataForGenerateResumeRole1", method = RequestMethod.POST)
	@ResponseBody
	public void getUserDataForGenerateResumeRole1(HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		EtcMethods etc = new EtcMethods();
		JSONObject jsonObject = null;

		session = request.getSession(false);
		int sessionStatus = etc.checkSession(session, request);

		if (sessionStatus == 0 && session.getAttribute("role").toString().equals("1")) {

			HashMap<String, Object> userData = new UserDAO().quesryUserData(session.getAttribute("id").toString());

				jsonObject = new JSONObject();
				jsonObject.put("profile_image", userData.get("profile_image"));
				jsonObject.put("firstname", userData.get("firstname"));
				jsonObject.put("lastname", userData.get("lastname"));
				jsonObject.put("birthday", userData.get("birthday"));
				jsonObject.put("email", userData.get("email"));
				jsonObject.put("phone", userData.get("phone"));
				jsonObject.put("university_name", userData.get("university_name"));
				jsonObject.put("faculty_name", userData.get("faculty_name"));
				jsonObject.put("course_name", userData.get("course_name"));
				jsonObject.put("gender", userData.get("gender"));
				
		}

		etc.responseJSONObject(jsonObject, response);

	}
	
	@RequestMapping(value = "/showResume", method = RequestMethod.GET)
	public ModelAndView showResume(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");

		session = request.getSession(false);
		int sessionStatus = new EtcMethods().checkSession(session, request);

		if (sessionStatus == 0 && session.getAttribute("role").toString().equals("1")) {

			return new ModelAndView("role1/view_resume");

		} else {
			return new ModelAndView("404");
		}
	}
	
	
	@RequestMapping(value = "/getStudentData", method = RequestMethod.POST)
	@ResponseBody
	public void getStudentData(HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		EtcMethods etc = new EtcMethods();
		JSONArray jsonArray = new JSONArray(); 
		JSONObject jsonObject = null;

		session = request.getSession(false);
		int sessionStatus = etc.checkSession(session, request);

		if (sessionStatus == 0 && session.getAttribute("role").toString().equals("1")) {
			
			String user_id = session.getAttribute("id").toString();
			
			HashMap<String, Object> userDataRole1 = new UserDAO().queryUserDataRole1(user_id);
			HashMap<String, Object> placesData = new UserDAO().queryHomeRole1(user_id);
				
			jsonObject = new JSONObject();
			jsonObject.put("profile_image", userDataRole1.get("profile_image"));
			jsonObject.put("firstname", userDataRole1.get("firstname"));
			jsonObject.put("lastname", userDataRole1.get("lastname"));
			jsonObject.put("university_name", userDataRole1.get("university_name"));
			jsonObject.put("faculty_name", userDataRole1.get("faculty_name"));
			jsonObject.put("course_name", userDataRole1.get("course_name"));
			
			jsonObject.put("internship_name", placesData.get("internship_name"));
			jsonObject.put("address", placesData.get("address"));
			jsonObject.put("phone", placesData.get("phone"));
			
			jsonArray.put(jsonObject);
				
		}

		etc.responseJSONObject(jsonObject, response);

	}
	
	@RequestMapping(value = "/getTeacherData", method = RequestMethod.POST)
	@ResponseBody
	public void getTeacherData(HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		EtcMethods etc = new EtcMethods();
		JSONArray jsonArray = new JSONArray(); 
		JSONObject jsonObject = null;

		session = request.getSession(false);
		int sessionStatus = etc.checkSession(session, request);

		if (sessionStatus == 0 && session.getAttribute("role").toString().equals("2")) {
			
			String user_id = session.getAttribute("id").toString();
			
			HashMap<String, Object> userDataRole1 = new UserDAO().queryUserDataRole1(user_id);
			HashMap<String, Object> placesData = new StudentPlaceOfInternshipDAO().queryInternshipRequestData(user_id);
				
			jsonObject = new JSONObject();
			jsonObject.put("profile_image", userDataRole1.get("profile_image"));
			jsonObject.put("firstname", userDataRole1.get("firstname"));
			jsonObject.put("lastname", userDataRole1.get("lastname"));
			jsonObject.put("university_name", userDataRole1.get("university_name"));
			jsonObject.put("faculty_name", userDataRole1.get("faculty_name"));
			jsonObject.put("course_name", userDataRole1.get("course_name"));
			
			jsonObject.put("student_request", placesData.get("student_request"));
			jsonObject.put("internship_request", placesData.get("internship_request"));
			
			jsonArray.put(jsonObject);
				
		}

		etc.responseJSONObject(jsonObject, response);

	}
	

}
