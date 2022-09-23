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

import com.devgoal.dao.EventHistoryDAO;
import com.devgoal.dao.RequestUserDataChangeDAO;
import com.devgoal.dao.UserDAO;

@Controller
@WebServlet("/sendUserDataChange")
@MultipartConfig 
public class DataChangeRequestController extends HttpServlet  {
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		EtcMethods etc = new EtcMethods();
		
		HttpSession session = request.getSession(false);
		int sessionStatus = etc.checkSession(session, request);
		String status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
		String alert = "0";
		
		String user_id = "";
		String ip = request.getParameter("ip");
		String user_type = request.getParameter("user_type");
		String gender = request.getParameter("gender");
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		Part image = request.getPart("image");
		String student_code = request.getParameter("student_code");
		String identified = request.getParameter("identified");
		String birthday = request.getParameter("birthday");
		String phone = request.getParameter("phone");
		String address1 = request.getParameter("address_1");
		String address2 = request.getParameter("address_2");
		String address3 = request.getParameter("address_3");
		String address4 = request.getParameter("address_4");
		String address5 = request.getParameter("address_5");
		String address6 = request.getParameter("address_6");
		String address7 = request.getParameter("address_7");
		String email = request.getParameter("email");
		String advisor = request.getParameter("advisor");
		String university = request.getParameter("university");
		String faculty = request.getParameter("faculty");
		String course = request.getParameter("course");
		String skill = request.getParameter("skill");
		
		String skillChange = "";
		
		if(skill != null && !skill.equals("") && skill.length() > 2) {
			
			 ArrayList<HashMap<String, String>> skillData = etc.checkSkill(skill);
			 
			 for(int i = 0; i < skillData.size(); i++) {
				 
				 skillChange += skillData.get(i).get("skill") + " = ";
				 
				 if(skillData.get(i).get("level").equals("1")) {
					 
					 skillChange += "ระดับเริ่มต้น, ";
					 
				 } else if(skillData.get(i).get("level").equals("2")) {
					 
					 skillChange += "ระดับปานกลาง, ";
					 
				 } else if(skillData.get(i).get("level").equals("3")) {
					 
					 skillChange += "ระดับสูง, ";
					 
				 }
				 
				 
			 }
			 
			 skillChange = skillChange.substring(0, skillChange.length()-2);
			
		}
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("1")) {
			
			user_id = session.getAttribute("id").toString();
			
			 if(email != null && !email.equals("") && etc.isValid(email) == true) {
					
					if(image != null) {
						
						if(image.getContentType() != null) {
							//Update image
							
							String imagesPath = etc.checkImages(image);
							
							if(!imagesPath.equals("")) {
								
								String user_data = "สิทธิ์ผู้ใช้งาน : นิสิต/นักศึกษา เพศ : "+gender+" ชื่อ : "+firstname+" นามสกุล : "+lastname+" รูปถ่ายหน้าตรง : "+imagesPath+" รหัสนิสิต/นักศึกษา : "+student_code+ " เลขบัตรประชาชน : "+identified+ " วันเกิด : "+birthday+" เบอร์โทร : "+phone+" ชื่อที่พัก/ชื่อหมู่บ้าน : "+address1+" เลขที่ : "+address2+" หมู่ที่ : "+address3+" ตำบล : "+address4+" อำเภอ : "+address5+" จังหวัด : "+address6+" รหัสไปรษณีย์ : "+address7+" อีเมล : "+email+" ชื่ออาจารย์ที่ปรึกษา : "+advisor+" มหาวิทยาลัย : "+university+" คณะ : "+faculty+" หลักสูตร : "+course+" ภาษาโปรแกรมมิ่ง และระดับความชำนาญ : "+skillChange;
								
								
								if(new RequestUserDataChangeDAO().insertUserDataChange(user_data, email) == 1) {
									
									status = "ส่งข้อมูลที่ต้องการแก้ไขเรียบร้อย";
									alert = "1";
									new EventHistoryDAO().insertEventHistory(user_id, "ส่งข้อมูลที่ต้องการแก้ไข", ip);
									
								}
							}
							
						}
					} else {
						//Old image
						
						String user_data = "สิทธิ์ผู้ใช้งาน : นิสิต/นักศึกษา เพศ : "+gender+" ชื่อ : "+firstname+" นามสกุล : "+lastname+" รูปถ่ายหน้าตรง : รหัสนิสิต/นักศึกษา : "+student_code+ " เลขบัตรประชาชน : "+identified+ " วันเกิด : "+birthday+" เบอร์โทร : "+phone+" ชื่อที่พัก/ชื่อหมู่บ้าน : "+address1+" เลขที่ : "+address2+" หมู่ที่ : "+address3+" ตำบล : "+address4+" อำเภอ : "+address5+" จังหวัด : "+address6+" รหัสไปรษณีย์ : "+address7+" อีเมล : "+email+" ชื่ออาจารย์ที่ปรึกษา : "+advisor+" มหาวิทยาลัย : "+university+" คณะ : "+faculty+" หลักสูตร : "+course+" ภาษาโปรแกรมมิ่ง และระดับความชำนาญ : "+skillChange;

						if(new RequestUserDataChangeDAO().insertUserDataChange(user_data, email) == 1) {
							
							status = "ส่งข้อมูลที่ต้องการแก้ไขเรียบร้อย";
							alert = "1";
							new EventHistoryDAO().insertEventHistory(user_id, "ส่งข้อมูลที่ต้องการแก้ไข", ip);
							
						}
					}
				}
			
		}else if(sessionStatus == 0 && session.getAttribute("role").toString().equals("2")) {
			
			user_id = session.getAttribute("id").toString();
			
			 if(email != null && !email.equals("") && etc.isValid(email) == true) {
					
					if(image != null) {
						
						if(image.getContentType() != null) {
							//Update image
							
							String imagesPath = etc.checkImages(image);
							
							if(!imagesPath.equals("")) {
								
								String user_data = "สิทธิ์ผู้ใช้งาน : อาจารย์ เพศ : "+gender+" ชื่อ : "+firstname+" นามสกุล : "+lastname+" รูปถ่ายหน้าตรง : "+imagesPath+" เลขบัตรประชาชน : "+identified+ " วันเกิด : "+birthday+" เบอร์โทร : "+phone+" ชื่อที่พัก/ชื่อหมู่บ้าน : "+address1+" เลขที่ : "+address2+" หมู่ที่ : "+address3+" ตำบล : "+address4+" อำเภอ : "+address5+" จังหวัด : "+address6+" รหัสไปรษณีย์ : "+address7+" อีเมล : "+email+" มหาวิทยาลัย : "+university+" คณะ : "+faculty+" หลักสูตร : "+course+" ภาษาโปรแกรมมิ่ง และระดับความชำนาญ : "+skillChange;
								
								
								if(new RequestUserDataChangeDAO().insertUserDataChange(user_data, email) == 1) {
									
									status = "ส่งข้อมูลที่ต้องการแก้ไขเรียบร้อย";
									alert = "1";
									new EventHistoryDAO().insertEventHistory(user_id, "ส่งข้อมูลที่ต้องการแก้ไข", ip);
									
								}
							}
							
						}
					} else {
						//Old image
						
						String user_data = "สิทธิ์ผู้ใช้งาน : อาจารย์ เพศ : "+gender+" ชื่อ : "+firstname+" นามสกุล : "+lastname+" รูปถ่ายหน้าตรง : เลขบัตรประชาชน : "+identified+ " วันเกิด : "+birthday+" เบอร์โทร : "+phone+" ชื่อที่พัก/ชื่อหมู่บ้าน : "+address1+" เลขที่ : "+address2+" หมู่ที่ : "+address3+" ตำบล : "+address4+" อำเภอ : "+address5+" จังหวัด : "+address6+" รหัสไปรษณีย์ : "+address7+" อีเมล : "+email+" มหาวิทยาลัย : "+university+" คณะ : "+faculty+" หลักสูตร : "+course+" ภาษาโปรแกรมมิ่ง และระดับความชำนาญ : "+skillChange;

						if(new RequestUserDataChangeDAO().insertUserDataChange(user_data, email) == 1) {
							
							status = "ส่งข้อมูลที่ต้องการแก้ไขเรียบร้อย";
							alert = "1";
							new EventHistoryDAO().insertEventHistory(user_id, "ส่งข้อมูลที่ต้องการแก้ไข", ip);
							
						}
					}
				}
			
		} else if(sessionStatus == 0 && session.getAttribute("role").toString().equals("3")) {
			
			user_id = session.getAttribute("id").toString();
			
			 if(email != null && !email.equals("") && etc.isValid(email) == true) {
					
					if(image != null) {
						
						if(image.getContentType() != null) {
							//Update image
							
							String imagesPath = etc.checkImages(image);
							
							if(!imagesPath.equals("")) {
								
								String user_data = "สิทธิ์ผู้ใช้งาน : นายจ้าง เพศ : "+gender+" ชื่อ : "+firstname+" นามสกุล : "+lastname+" รูปถ่ายหน้าตรง : "+imagesPath+" เลขบัตรประชาชน : "+identified+ " วันเกิด : "+birthday+" เบอร์โทร : "+phone+" ชื่อที่พัก/ชื่อหมู่บ้าน : "+address1+" เลขที่ : "+address2+" หมู่ที่ : "+address3+" ตำบล : "+address4+" อำเภอ : "+address5+" จังหวัด : "+address6+" รหัสไปรษณีย์ : "+address7+" อีเมล : "+email+" ภาษาโปรแกรมมิ่ง และระดับความชำนาญ : "+skillChange;
								
								
								if(new RequestUserDataChangeDAO().insertUserDataChange(user_data, email) == 1) {
									
									status = "ส่งข้อมูลที่ต้องการแก้ไขเรียบร้อย";
									alert = "1";
									new EventHistoryDAO().insertEventHistory(user_id, "ส่งข้อมูลที่ต้องการแก้ไข", ip);
									
								}
							}
							
						}
					} else {
						//Old image
						
						String user_data = "สิทธิ์ผู้ใช้งาน : นายจ้าง เพศ : "+gender+" ชื่อ : "+firstname+" นามสกุล : "+lastname+" รูปถ่ายหน้าตรง : เลขบัตรประชาชน : "+identified+ " วันเกิด : "+birthday+" เบอร์โทร : "+phone+" ชื่อที่พัก/ชื่อหมู่บ้าน : "+address1+" เลขที่ : "+address2+" หมู่ที่ : "+address3+" ตำบล : "+address4+" อำเภอ : "+address5+" จังหวัด : "+address6+" รหัสไปรษณีย์ : "+address7+" อีเมล : "+email+" ภาษาโปรแกรมมิ่ง และระดับความชำนาญ : "+skillChange;

						if(new RequestUserDataChangeDAO().insertUserDataChange(user_data, email) == 1) {
							
							status = "ส่งข้อมูลที่ต้องการแก้ไขเรียบร้อย";
							alert = "1";
							new EventHistoryDAO().insertEventHistory(user_id, "ส่งข้อมูลที่ต้องการแก้ไข", ip);
							
						}
					}
				}
			
		}  else {
			
			 if(email != null && !email.equals("") && etc.isValid(email) == true) {
					
					if(image != null) {
						
						if(image.getContentType() != null) {
							//Update image
							
							String imagesPath = etc.checkImages(image);
							
							if(!imagesPath.equals("")) {
								
								String user_data = "สิทธิ์ผู้ใช้งาน : "+user_type+" เพศ : "+gender+" ชื่อ : "+firstname+" นามสกุล : "+lastname+" รูปถ่ายหน้าตรง : "+imagesPath+" รหัสนิสิต/นักศึกษา : "+student_code+ " เลขบัตรประชาชน : "+identified+ " วันเกิด : "+birthday+" เบอร์โทร : "+phone+" ชื่อที่พัก/ชื่อหมู่บ้าน : "+address1+" เลขที่ : "+address2+" หมู่ที่ : "+address3+" ตำบล : "+address4+" อำเภอ : "+address5+" จังหวัด : "+address6+" รหัสไปรษณีย์ : "+address7+" อีเมล : "+email+" ชื่ออาจารย์ที่ปรึกษา : "+advisor+" มหาวิทยาลัย : "+university+" คณะ : "+faculty+" หลักสูตร : "+course+" ภาษาโปรแกรมมิ่ง และระดับความชำนาญ : "+skillChange;
								
								if(new RequestUserDataChangeDAO().insertUserDataChange(user_data, email) == 1) {
									
									status = "ส่งข้อมูลที่ต้องการแก้ไขเรียบร้อย";
									alert = "1";
								}
							}
							
						}
					} else {
						//Old image
						
						String user_data = "สิทธิ์ผู้ใช้งาน : "+user_type+" เพศ : "+gender+" ชื่อ : "+firstname+" นามสกุล : "+lastname+" รูปถ่ายหน้าตรง : รหัสนิสิต/นักศึกษา : "+student_code+ " เลขบัตรประชาชน : "+identified+ " วันเกิด : "+birthday+" เบอร์โทร : "+phone+" ชื่อที่พัก/ชื่อหมู่บ้าน : "+address1+" เลขที่ : "+address2+" หมู่ที่ : "+address3+" ตำบล : "+address4+" อำเภอ : "+address5+" จังหวัด : "+address6+" รหัสไปรษณีย์ : "+address7+" อีเมล : "+email+" ชื่ออาจารย์ที่ปรึกษา : "+advisor+" มหาวิทยาลัย : "+university+" คณะ : "+faculty+" หลักสูตร : "+course+" ภาษาโปรแกรมมิ่ง และระดับความชำนาญ : "+skillChange;

						if(new RequestUserDataChangeDAO().insertUserDataChange(user_data, email) == 1) {
							
							status = "ส่งข้อมูลที่ต้องการแก้ไขเรียบร้อย";
							alert = "1";
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
	
	
	@RequestMapping(value = "/userRequestChange", method = RequestMethod.GET)
	public ModelAndView userRequestChange(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");
		
		session = request.getSession(false); 
		int sessionStatus = new EtcMethods().checkSession(session, request);
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("4")) {
			
			return new ModelAndView("role4/data_request_change");
			
		} else {
			return new ModelAndView("404");
		}
	}
	
	@RequestMapping(value = "/userDataChange", method = RequestMethod.POST)
	@ResponseBody
	public void userDataChange(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		EtcMethods etc = new EtcMethods();
		
		session = request.getSession(false);
		int sessionStatus = etc.checkSession(session, request);
		
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = null;
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("4")) {
			
			ArrayList<HashMap<String, Object>> userDataChange = new RequestUserDataChangeDAO().queryUserDataChange();
			
			for(int i = 0; i < userDataChange.size(); i++) {
				jsonObject = new JSONObject();
				jsonObject.put("request_user_data_change_id", userDataChange.get(i).get("request_user_data_change_id"));
				jsonObject.put("user_data", userDataChange.get(i).get("user_data"));
				jsonObject.put("email", userDataChange.get(i).get("email"));
				jsonObject.put("status", userDataChange.get(i).get("status"));
				jsonObject.put("time_reg", userDataChange.get(i).get("time_reg"));
				
				jsonArray.put(jsonObject);
			}
			
				
		}
		
		new EtcMethods().responseJSONArray(jsonArray, response);
			
	}
	
	@RequestMapping(value = "/managementUserDataChangeStatusByAdmin", method = RequestMethod.POST)
	@ResponseBody
	public void managementUserDataChangeStatusByAdmin(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		EtcMethods etc = new EtcMethods();
		
		session = request.getSession(false);
		int sessionStatus = etc.checkSession(session, request);
		String status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
		String alert = "0";
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("4")) {
			
			String admin_id = session.getAttribute("id").toString();
			String ip = request.getParameter("ip");
			String request_user_data_change_id = request.getParameter("request_user_data_change_id");
			String status_request_user_data_change = request.getParameter("status");
			
			if(admin_id != null && request_user_data_change_id != null && ip != null && status_request_user_data_change != null && !status_request_user_data_change.equals("") && !admin_id.equals("") && !request_user_data_change_id.equals("") && !ip.equals("")) {
				
				if(status_request_user_data_change.equals("1") || status_request_user_data_change.equals("0")) {
					
					String email = new RequestUserDataChangeDAO().findEmailById(request_user_data_change_id).get("email").toString();
					String detail_event = "";
					
					if(new RequestUserDataChangeDAO().managementStatus(request_user_data_change_id, status_request_user_data_change) == 1) {
						
						status = "อัปเดทสถานะข้อมูลผู้ใช้งานที่ร้องขอสำเร็จ";
						alert = "1";
						
						if(status_request_user_data_change.equals("1")) {
							
							etc.sendEmail(admin_id, email, "ผลการตรวจสอบข้อมูลที่ต้องการแก้ไข", "ข้อมูลที่คุณต้องการเปลี่ยน ได้รับการยืนยันและแก้ไขแล้ว\nเข้าสู่ระบบได้ที่นี่ http://localhost:8080/DevGoal/login");
							detail_event = "ยืนยันข้อมูลที่ผู้ใช้งานที่ร้องขอรหัส "+request_user_data_change_id;
							
						} else if(status_request_user_data_change.equals("0")) {
							
							etc.sendEmail(admin_id, email, "ผลการตรวจสอบข้อมูลที่ต้องการแก้ไข", "ข้อมูลที่คุณต้องการเปลี่ยน ไม่ถูกต้องกรุณาส่งข้อมูลใหม่\nคุณสามารถสมัครสมาชิกใหม่ได้ที่นี่ http://localhost:8080/DevGoal/register");
							detail_event = "ยกเลิกข้อมูลที่ผู้ใช้งานที่ร้องขอรหัส "+request_user_data_change_id;
							
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

}
