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

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.devgoal.dao.CourseDAO;
import com.devgoal.dao.LoginHistoryDAO;
import com.devgoal.dao.SkillDAO;
import com.devgoal.dao.UniversityDAO;
import com.devgoal.dao.UserDAO;
import com.devgoal.dao.UserSkillDAO;

@Controller
@WebServlet("/register_user")
@MultipartConfig 
public class HomeController extends HttpServlet {
	
	String url = new PathConfig().url;
	
	//Check data null value and data form same parameter
	public int checkData(String gender, String firstname, String lastname, String address_1, String address_2, String address_3, String address_4, String address_5, String address_6, String address_7, String email, String phone, String identified, String password, Part image) {
		
		if(gender != null &&
		   firstname != null &&
		   lastname != null &&
		   address_1 != null &&
		   address_2 != null &&
		   address_3 != null &&
		   address_4 != null &&
		   address_5 != null &&
		   address_6 != null &&
		   address_7 != null &&
		   email != null &&
		   phone != null &&
		   identified != null &&
		   password != null &&
		   image != null &&
		   
		   !gender.equals("") &&
		   !firstname.equals("") &&
		   !lastname.equals("") &&
		   !address_1.equals("") &&
		   !address_2.equals("") &&
		   !address_3.equals("") &&
		   !address_4.equals("") &&
		   !address_5.equals("") &&
		   !address_6.equals("") &&
		   !address_7.equals("") &&
		   !email.equals("") &&
		   !phone.equals("") &&
		   !identified.equals("") &&
		   !password.equals("") &&
		   
		   image.getSize() != 0 &&
		   Integer.parseInt(address_2) > 0 && 
		   Integer.parseInt(address_3) > 0 && 
		   Integer.parseInt(address_7) > 0 && 
		   Long.parseLong(phone) > 0 && 
		   phone.length() == 10 && 
		   Long.parseLong(identified) > 0 && 
		   identified.length() == 13 &&
		   new EtcMethods().isValid(email) == true ) {
			
			if(gender.equals("1") ||
			   gender.equals("2")) {
				
				return 0; 
			}
			
		}
		
		return -1;
		
	}
	
	
	//Register
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String gender = request.getParameter("gender");
		String firstname = request.getParameter("firstname");
		String birthday = request.getParameter("birthday");
		String lastname = request.getParameter("lastname");
		String address_1 = request.getParameter("address_1");
		String address_2 = request.getParameter("address_2");
		String address_3 = request.getParameter("address_3");
		String address_4 = request.getParameter("address_4");
		String address_5 = request.getParameter("address_5");
		String address_6 = request.getParameter("address_6");
		String address_7 = request.getParameter("address_7");
		String email = request.getParameter("email");
		String student_code = request.getParameter("student_code");
		String phone = request.getParameter("phone");
		String identified = request.getParameter("identified");
		String advisor = request.getParameter("advisor");
		String university = request.getParameter("university");
		String faculty = request.getParameter("faculty");
		String course = request.getParameter("course");
		String password = request.getParameter("password");
		String register_choice = request.getParameter("register_choice");
		String skill = request.getParameter("skill");
		Part image = request.getPart("profile_image");
		
		EtcMethods etc = new EtcMethods();
		JSONObject jsonObject = new JSONObject();
		String status = "";
		String alert = "";
		
		if(register_choice != null) {
			
			
			if(register_choice.equals("1") && 
					checkData(gender, firstname, lastname, address_1, address_2, address_3, address_4, address_5, address_6, address_7, email, phone, identified, password, image) == 0 &&
					student_code != null &&
					advisor != null &&
					university != null &&
					faculty != null &&
					course != null &&
					
					!student_code.equals("") &&
					!advisor.equals("") &&
					!university.equals("") &&
					!faculty.equals("") &&
					!course.equals("") &&
					
					Long.parseLong(student_code) > 0) {
					
					String short_name = email.substring(email.lastIndexOf("@") + 1);
					short_name = short_name.substring(0, short_name.indexOf('.'));
				
					ArrayList<HashMap<String, String>> skillData = etc.checkSkill(skill);
					String imagesPath = etc.checkImages(image);
					int studyEmailStatus = new UniversityDAO().queryShortName(university, short_name);
					int studyFkStatus = new CourseDAO().queryFkStudyRefTables(university, faculty, course);
					
					if(studyEmailStatus == 0) {
						
						if(!imagesPath.equals("") && studyFkStatus == 0) {
							
							password = etc.HASH(password);
							
							String salt = etc.randomSalt();
							password = etc.HASH(password+salt);
							
//							String address = ""+address_1+" เลชที่"+address_2+" หมูที่"+address_3+" ตำบล"+address_4+" อำเภอ"+address_5+" จังหวัด"+address_6+" รหัสไปรษณีย์"+address_7+"";
							String address = address_1+" "+address_2+" "+address_3+" "+address_4+" "+address_5+" "+address_6+" "+address_7;
							ArrayList<String> userSkillID = new SkillDAO().checkInsertDuplicateSkill(skillData);
							String secret_code = etc.randomSalt();
							
							
							HashMap<String, Object> identifiedStatus = new UserDAO().checkIdentifiedID(identified);
							
							if(identifiedStatus.size() == 0) {
								
								int lastIdUser = new UserDAO().insertUser(birthday, gender, firstname, lastname, address, email, password, salt, phone, identified, imagesPath, student_code, advisor, university, faculty, course, register_choice, secret_code);
								
								if(lastIdUser > 0) {
									
									//Insert user and skill mapping
									for(int i = 0; i < userSkillID.size(); i++) {
										
										new UserSkillDAO().insertUserSkill(Integer.toString(lastIdUser), userSkillID.get(i));
									}
									
								etc.sendEmail(Integer.toString(lastIdUser), email, "กรุณายืนยันตัวตน", "ขั้นตอนที่ 1 : ยืนยันตัวตนที่นี่ URL : "+url+"confirm/?data="+secret_code+"\nขั้นตอนที่ 2 : รอผลการตรวจสอบข้อมูลภายใน 6-12 ชม. โดยจะแจ้งผลผ่านทางอีเมลนี้");
									status = "บันทึกข้อมูลเรียบร้อย กรุณายืนยันอีเมล";
									alert = "1";
								} else if(lastIdUser == -2) {
									
									status = "อีเมลนี้มีในระบบแล้ว กรุณาเข้าสู่ระบบ";
									alert = "2";
								} else {
									
									status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
									alert = "0";
								}
								
							} else {
								
								status = "เลขบัตรประจำตัวประชาชนนี้มีในระบบแล้ว";
								alert = "2";
							}
							
							
							
						} 
						// else {
						// 	System.out.println("Images type or study tables ref error");
						// }
						
					} else {
						
						status = "อีเมลมหาลัยไม่สัมพันธ์กับมหาลัยที่ท่านเลือก";
						alert = "2";
						
					}
					
			}else if(register_choice.equals("2") && 
					checkData(gender, firstname, lastname, address_1, address_2, address_3, address_4, address_5, address_6, address_7, email, phone, identified, password, image) == 0 &&
					university != null &&
					faculty != null &&
					course != null &&
					
					!university.equals("") &&
					!faculty.equals("") &&
					!course.equals("")) {
				
					String short_name = email.substring(email.lastIndexOf("@") + 1);
					short_name = short_name.substring(0, short_name.indexOf('.'));
				
					ArrayList<HashMap<String, String>> skillData = etc.checkSkill(skill);
					String imagesPath = etc.checkImages(image);
					int studyEmailStatus = new UniversityDAO().queryShortName(university, short_name);
					int studyFkStatus = new CourseDAO().queryFkStudyRefTables(university, faculty, course);
					
					if(studyEmailStatus == 0) {
						
						if(!imagesPath.equals("") && studyFkStatus == 0) {
							
							password = etc.HASH(password);
							
							String salt = etc.randomSalt();
							password = etc.HASH(password+salt);
							
//							String address = ""+address_1+" เลชที่"+address_2+" หมูที่"+address_3+" ตำบล"+address_4+" อำเภอ"+address_5+" จังหวัด"+address_6+" รหัสไปรษณีย์"+address_7+"";
							String address = address_1+" "+address_2+" "+address_3+" "+address_4+" "+address_5+" "+address_6+" "+address_7;
							ArrayList<String> userSkillID = new SkillDAO().checkInsertDuplicateSkill(skillData);
							String secret_code = etc.randomSalt();
							
							
							HashMap<String, Object> identifiedStatus = new UserDAO().checkIdentifiedID(identified);
							
							if(identifiedStatus.size() == 0) {
								
								int lastIdUser = new UserDAO().insertUser(birthday, gender, firstname, lastname, address, email, password, salt, phone, identified, imagesPath, null, null, university, faculty, course, register_choice, secret_code);
								
								if(lastIdUser > 0) {
									
									//Insert user and skill mapping
									for(int i = 0; i < userSkillID.size(); i++) {
										
										new UserSkillDAO().insertUserSkill(Integer.toString(lastIdUser), userSkillID.get(i));
									}
									
									etc.sendEmail(Integer.toString(lastIdUser), email, "กรุณายืนยันตัวตน", "ขั้นตอนที่ 1 : ยืนยันตัวตนที่นี่ URL : "+url+"confirm/?data="+secret_code+"\nขั้นตอนที่ 2 : รอผลการตรวจสอบข้อมูลภายใน 6-12 ชม. โดยจะแจ้งผลผ่านทางอีเมลนี้");
									status = "บันทึกข้อมูลเรียบร้อย กรุณายืนยันอีเมล";
									alert = "1";
									
								} else if(lastIdUser == -2) {
									
									status = "อีเมลนี้มีในระบบแล้ว กรุณาเข้าสู่ระบบ";
									alert = "2";
								} else {
									
									status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
									alert = "0";
								}
								
							} else {
								
								status = "เลขบัตรประจำตัวประชาชนนี้มีในระบบแล้ว";
								alert = "2";
							}
							
						} 
						// else {
						// 	System.out.println("Images type or study tables ref error");
						// }
						
					} else {
						
						status = "อีเมลมหาลัยไม่สัมพันธ์กับมหาลัยที่ท่านเลือก";
						alert = "2";
						
					}
					
			}else if(register_choice.equals("3") &&
					checkData(gender, firstname, lastname, address_1, address_2, address_3, address_4, address_5, address_6, address_7, email, phone, identified, password, image) == 0) {
				
					ArrayList<HashMap<String, String>> skillData = etc.checkSkill(skill);
					String imagesPath = etc.checkImages(image);
					
					if(!imagesPath.equals("")) {
						
						password = etc.HASH(password);
						
						String salt = etc.randomSalt();
						password = etc.HASH(password+salt);
						
//						String address = ""+address_1+" เลชที่"+address_2+" หมูที่"+address_3+" ตำบล"+address_4+" อำเภอ"+address_5+" จังหวัด"+address_6+" รหัสไปรษณีย์"+address_7+"";
						String address = address_1+" "+address_2+" "+address_3+" "+address_4+" "+address_5+" "+address_6+" "+address_7;
						ArrayList<String> userSkillID = new SkillDAO().checkInsertDuplicateSkill(skillData);
						String secret_code = etc.randomSalt();
						
						HashMap<String, Object> identifiedStatus = new UserDAO().checkIdentifiedID(identified);
						
						if(identifiedStatus.size() == 0) {
							
							int lastIdUser = new UserDAO().insertUser(birthday, gender, firstname, lastname, address, email, password, salt, phone, identified, imagesPath, null, null, null, null, null, register_choice, secret_code);
						
							if(lastIdUser > 0) {
								
								//Insert user and skill mapping
								for(int i = 0; i < userSkillID.size(); i++) {
									
									new UserSkillDAO().insertUserSkill(Integer.toString(lastIdUser), userSkillID.get(i));
								}
								
								etc.sendEmail(Integer.toString(lastIdUser), email, "กรุณายืนยันตัวตน", "ขั้นตอนที่ 1 : ยืนยันตัวตนที่นี่ URL : "+url+"confirm/?data="+secret_code+"\nขั้นตอนที่ 2 : รอผลการตรวจสอบข้อมูลภายใน 6-12 ชม. โดยจะแจ้งผลผ่านทางอีเมลนี้");
								status = "บันทึกข้อมูลเรียบร้อย กรุณายืนยันอีเมล";
								alert = "1";
								
							} else if(lastIdUser == -2) {
								
								status = "อีเมลนี้มีในระบบแล้ว กรุณาเข้าสู่ระบบ";
								alert = "2";
							} else {
								
								status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
								alert = "0";
							}
							
						} else {
							
							status = "เลขบัตรประจำตัวประชาชนนี้มีในระบบแล้ว";
							alert = "2";
						}
						
						
					} 
					// else {
					// 	System.out.println("Images type error");
					// }
						
			} 
			// else {
			// 	System.out.println("Out of case");
			// }
			
		} 
		// else {
		// 	System.out.println("Register choice is null");
		// }
		
		try {
			jsonObject.put("status", status);
			jsonObject.put("alert", alert);
			etc.responseJSONObject(jsonObject, response);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
	}
	
	//Home page
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");
 
		return new ModelAndView("index");
	}
	
	//Login page
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");
		
		session = request.getSession(false);
		int sessionStatus = new EtcMethods().checkSession(session, request);
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("1")) {
			
			return new ModelAndView("role1/home");
			
		} else if(sessionStatus == 0 && session.getAttribute("role").toString().equals("2")) {
			
			return new ModelAndView("role2/home");
			
		} else if(sessionStatus == 0 && session.getAttribute("role").toString().equals("3")) {
			
			return new ModelAndView("role3/home");
			
		} else if(sessionStatus == 0 && session.getAttribute("role").toString().equals("4")) {
			
			return new ModelAndView("role4/home");
			
		} else {
			
			return new ModelAndView("login");
		}
		
	}
	
	//Login 
	@RequestMapping(value = "/login_validate", method = RequestMethod.POST)
	@ResponseBody
	public void login_validate(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, JSONException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		EtcMethods etc = new EtcMethods();
		
		String email = request.getParameter("email");
		String password = etc.HASH(request.getParameter("password"));
		String ip = request.getParameter("ip");
		
		if(email != null && password != null && ip != null && !email.equals("") && !password.equals("") && !ip.equals("")) {
			
			session = request.getSession(); 
			JSONObject jsonObject = new JSONObject();
			
			String status = "";
			String redirect = "";
			String alert = "";
			
			
			HashMap<String, Object> salt = new UserDAO().querySaltByEmail(email);
			
			if(salt.size() > 0) {
				password = etc.HASH(password+salt.get("salt"));
				
				HashMap<String, Object> userData = new UserDAO().queryUser(email, password);
				
				if(userData.size() > 0) {
					
					if(userData.get("status").equals("1")) {
						
						new LoginHistoryDAO().insertLoginHistory(userData.get("user_id").toString(), ip);
							
						session.setAttribute("id",userData.get("user_id"));
						session.setAttribute("role",userData.get("user_type"));
						
						status = "เข้าสู่ระบบสำเร็จ";
						redirect = "home";
						alert = "1";
						
					} else if(userData.get("status").equals("2")) {
						
						status = "กรุณารอผู้ดูแลระบบตรวจสอบข้อมูลก่อนเข้าสู่ระบบ";
						redirect = "login";
						alert = "2";
						
					} else if(userData.get("status").equals("0")) {
						
						status = "กรุณายืนยันอีเมลก่อนเข้าสู่ระบบ";
						redirect = "login";
						alert = "2";
						
					}
					
					
				} else {
					status = "ไม่พบบัญชีผู้ใช้ กรุณาตรวจสอบอีเมล และรหัสผ่าน";
					redirect = "login";
					alert = "0";
				}
				
			} else {
				status = "ไม่พบบัญชีผู้ใช้ กรุณาตรวจสอบอีเมล และรหัสผ่าน";
				redirect = "login";
				alert = "0";
			}
			
			jsonObject.put("status", status);
			jsonObject.put("redirect", redirect);
			jsonObject.put("alert", alert);
			
			etc.responseJSONObject(jsonObject, response);
			
		}
		
	}
	
	//Logout
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");
		
		session = request.getSession(false);
		
		session.removeAttribute("id");
		session.removeAttribute("role");
		
		session.invalidate();
		
		return new ModelAndView("login");
	}
	
	//Register page
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView register(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");
		
		return new ModelAndView("register");
	}
		
	//Confirm email page
	@RequestMapping(value = "/confirm", method = RequestMethod.GET)
	public ModelAndView confirm(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");
		
		String secret_code = request.getParameter("data");
		
		if(secret_code != null && !secret_code.equals("")) {
			
			int status = new UserDAO().confirmUserEmailBySalt(secret_code);
			int update_status = new UserDAO().updateSecretCode(new EtcMethods().randomSalt(), secret_code);
			
			if(status == 1 && update_status == 1) {
				return new ModelAndView("confirm");
			}
		}
		
		return new ModelAndView("404");
	}
		
	//Send reset password url page
	@RequestMapping(value = "/resetPassword", method = RequestMethod.GET)
	public ModelAndView resetPassword(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");
		
		return new ModelAndView("resetPassword");
	}
	
	//Send reset password url 
	@RequestMapping(value = "/sendResetPasswordUrl", method = RequestMethod.POST)
	@ResponseBody
	public void sendResetPasswordUrl(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, JSONException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		EtcMethods etc = new EtcMethods();
		
		JSONObject jsonObject = new JSONObject();
		String email = request.getParameter("email");
		String status = "ไม่พบอีเมลผู้ใช้ในระบบ";
		String alert = "0";
		
		if(email != null && !email.equals("")) {
			
			HashMap<String, Object> secret_code = new UserDAO().querySecretCode(email);
			
			if(secret_code.size() != 0) {
				etc.sendEmailNoUserId(email, "ตั้งค่ารหัสผ่าน", "ตั้งค่ารหัสผ่านใหม่ที่นี่ URL : "+url+"resetNewPassword/?data="+secret_code.get("secret_code"));
				status = "เสร็จสิ้น กรุณาตรวจสอบอีเมล เพื่อตั้งค่ารหัสผ่านใหม่";
				alert = "1";
			}
		}
		
		jsonObject.put("status", status);
		jsonObject.put("alert", alert);
		etc.responseJSONObject(jsonObject, response);
		
		
	}
	
	//Reset new password page
	@RequestMapping(value = "/resetNewPassword", method = RequestMethod.GET)
	public ModelAndView resetNewPassword(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");
		
		String secret_code = request.getParameter("data");
		
		if(secret_code != null && !secret_code.equals("")) {
			
			return new ModelAndView("resetNewPassword");
		}
		
		return new ModelAndView("404");
		
	}
	
	
	//Reset new password
	@RequestMapping(value = "/sendNewPasswordReset", method = RequestMethod.POST)
	@ResponseBody
	public void sendNewPasswordReset(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, JSONException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		EtcMethods etc = new EtcMethods();
		
		String password = etc.HASH(request.getParameter("password"));
		String secret_code = request.getParameter("data");
		
		JSONObject jsonObject = new JSONObject();
		String status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
		String redirect = "../404";
		String alert = "0";
		
		if(password != null && secret_code != null && !password.equals("") && !secret_code.equals("")) {
			
			HashMap<String, Object> salt = new UserDAO().querySaltBySecretCode(secret_code);
			
			if(salt.size() != 0) {
				
				password = etc.HASH(password+salt.get("salt"));
				
				int statusExecute = new UserDAO().updatePasswordBySecretCode(password, secret_code);
				int update_status = new UserDAO().updateSecretCode(etc.randomSalt(), secret_code);
				
				if(statusExecute == 1 && update_status == 1) {
					
					status = "เปลี่ยนรหัสผ่านสำเร็จ";
					redirect = "../login";
					alert = "1";
				}
				
			}
		
		}
		
		jsonObject.put("status", status);
		jsonObject.put("redirect", redirect);
		jsonObject.put("alert", alert);
		
		etc.responseJSONObject(jsonObject, response);		
		
		
	}
	
	//404 page
	@RequestMapping(value = "/404", method = RequestMethod.GET)
	public ModelAndView pageNotFound(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");
		
		return new ModelAndView("404");
		
	}
	
	//User data change request page
	@RequestMapping(value = "/requestForm", method = RequestMethod.GET)
	public ModelAndView requestForm(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");
		
		session = request.getSession(false); 
		int sessionStatus = new EtcMethods().checkSession(session, request);
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("1")) {
			
			return new ModelAndView("role1/data_change_request_form");
			
		} else if(sessionStatus == 0 && session.getAttribute("role").toString().equals("2")) {
			
			return new ModelAndView("role2/data_change_request_form");
			
		} else if(sessionStatus == 0 && session.getAttribute("role").toString().equals("3")) {
			
			return new ModelAndView("role3/data_change_request_form");
			
		} else if(sessionStatus == 0 && session.getAttribute("role").toString().equals("4")) {
			
			return new ModelAndView("404");
			
		} else {
			
			return new ModelAndView("data_change_request_form");
		}
		
		
	}
	
	@RequestMapping(value = "/placeRequest", method = RequestMethod.GET)
	public ModelAndView placeRequest(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");
		
		return new ModelAndView("place_request");
		
	}
	
	@RequestMapping(value = "/viewResume", method = RequestMethod.GET)
	public ModelAndView viewResume(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");
		
		session = request.getSession(false); 
		int sessionStatus = new EtcMethods().checkSession(session, request);
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("1")) {
			
			return new ModelAndView("role1/view_resume");
		} else {
			return new ModelAndView("404");
		}
		
		
	}


}
