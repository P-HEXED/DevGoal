package com.devgoal.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.devgoal.dao.EventHistoryDAO;
import com.devgoal.dao.PlaceOfInternshipDAO;
import com.devgoal.dao.StudentPlaceOfInternshipDAO;
import com.devgoal.dao.TermDAO;
import com.devgoal.dao.UserDAO;

@Controller
public class StudentPlaceOfInternshipController {
	
	String url = new PathConfig().url;
	
	//Student request internship
	@RequestMapping(value = "/sendDataToInternship", method = RequestMethod.POST)
	@ResponseBody
	public void sendDataToInternship(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		EtcMethods etc = new EtcMethods();
		
		session = request.getSession(false);
		int sessionStatus = etc.checkSession(session, request);
		String status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
		String alert = "0";
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("1")) {

			String user_id = session.getAttribute("id").toString();
			String internship_id = request.getParameter("internship_id");
			String ip = request.getParameter("ip");
			String year = request.getParameter("year");
			String term = request.getParameter("term");
			
			if(year != null && !year.equals("") && !year.equals("0") && term != null && !term.equals("") && !term.equals("0") && user_id != null && !user_id.equals("") && internship_id != null && !internship_id.equals("") && ip != null && !ip.equals("")) {

				HashMap<String, Object> term_id = new TermDAO().queryTermId(year, term);
				
				if(term_id.get("term_id") != null) {
					
					int insertStatus = new StudentPlaceOfInternshipDAO().insertInternshipAndUser(user_id, internship_id, "1", term_id.get("term_id").toString());
					HashMap<String, Object> email = new PlaceOfInternshipDAO().queryEmailUser(internship_id);
					
					if(insertStatus > 0) {
						
						status = "ส่งข้อมูลไปยังบริษัทเรียบร้อย";
						alert = "1";
						
						etc.sendEmail(user_id, email.get("email").toString(), "นิสิต/นักศึกษาสนใจบริษัทของคุณ", "โปรดตรวจสอบเพื่อดำเนินการต่อไปได้ที่นี่ : "+ new PathConfig().url+"studentRequest");
						
						new EventHistoryDAO().insertEventHistory(user_id, "ส่งข้อมูลไปยังสถานที่ฝึกงานรหัส "+internship_id, ip);
					}
				}
				
				
			}
		}
		
		JSONObject jsonObject = new JSONObject();
		
		jsonObject.put("status", status);
		jsonObject.put("alert", alert);
		etc.responseJSONObject(jsonObject, response);
		
	}
	
	@RequestMapping(value = "/studentRequestDataForRole2", method = RequestMethod.POST)
	@ResponseBody
	public void studentRequestDataForRole2(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		session = request.getSession(false);
		EtcMethods etc = new EtcMethods();
		int sessionStatus = etc.checkSession(session, request);
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = null;
		
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("2")) {
			
			ArrayList<HashMap<String, Object>> uerData = new StudentPlaceOfInternshipDAO().queryUserDataRequest(session.getAttribute("id").toString());
			
			for(int i = 0; i < uerData.size(); i++) {
				jsonObject = new JSONObject();
				jsonObject.put("user_id", uerData.get(i).get("user_id"));
				jsonObject.put("firstname", uerData.get(i).get("firstname"));
				jsonObject.put("lastname", uerData.get(i).get("lastname"));
				jsonObject.put("address", uerData.get(i).get("address"));
				jsonObject.put("email", uerData.get(i).get("email"));
				jsonObject.put("phone", uerData.get(i).get("phone"));
				jsonObject.put("profile_image", uerData.get(i).get("profile_image"));
				jsonObject.put("birthday", uerData.get(i).get("birthday"));
				jsonObject.put("university_name", uerData.get(i).get("university_name"));
				jsonObject.put("faculty_name", uerData.get(i).get("faculty_name"));
				jsonObject.put("course_name", uerData.get(i).get("course_name"));
				jsonObject.put("time_reg", uerData.get(i).get("time_reg"));
				jsonObject.put("internship_name", uerData.get(i).get("internship_name"));
				jsonObject.put("student_place_of_internship_id", uerData.get(i).get("student_place_of_internship_id"));
				jsonObject.put("gender", uerData.get(i).get("gender"));
				jsonObject.put("status", uerData.get(i).get("status"));
				jsonObject.put("term", uerData.get(i).get("term"));

				jsonArray.put(jsonObject);
			
			}
			
		}
		new EtcMethods().responseJSONArray(jsonArray, response);
	}
	
	@RequestMapping(value = "/managementUserAndInternshipStatus", method = RequestMethod.POST)
	@ResponseBody
	public void managementUserAndInternshipStatus(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		EtcMethods etc = new EtcMethods();
		
		session = request.getSession(false);
		int sessionStatus = etc.checkSession(session, request);
		String status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
		String alert = "0";
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("2")) {
			
			String role2_id = session.getAttribute("id").toString();
			String user_id = request.getParameter("user_id");
			String user_internship_id = request.getParameter("user_internship_id");
			String ip = request.getParameter("ip");
			String status_user = request.getParameter("status");
			
			
			if(user_internship_id != null && !user_internship_id.equals("") && role2_id != null && user_id != null && ip != null && status_user != null && !status_user.equals("") && !role2_id.equals("") && !user_id.equals("") && !ip.equals("")) {
				
				if(status_user.equals("1") || status_user.equals("0")) {
					
					String email = new UserDAO().findEmailByUserId(user_id).get("email").toString();
					String detail_event = "";
					
					if(new StudentPlaceOfInternshipDAO().managementStatusUserInternship(user_internship_id, status_user) == 1) {
						
						status = "อัปเดทสถานะผู้ใช้งานและสถานที่ฝึกงานสำเร็จ";
						alert = "1";
						
						if(status_user.equals("1")) {
							
							etc.sendEmail(role2_id, email, "ผลการอนุมัติสถานที่ฝึกงานที่คุณสนใจ", "คุณผ่านการอนุมัติแล้ว\nกรุณารอผู้ประกาศแจ้งที่อยู่สำหรับการติดต่อ เพื่อดำเนินการต่อไป");
							detail_event = "อนุมัติความสนใจสถานที่ฝึกงานของผู้ใช้รหัส "+user_id;
							
						} else if(status_user.equals("0")) {
							
							etc.sendEmail(role2_id, email, "ผลการอนุมัติสถานที่ฝึกงานที่คุณสนใจ", "คุณไม่ผ่านการอนุมัติ\nคุณสามารถเลือกบริษัทใหม่ได้ที่นี่ "+url+"internship");
							detail_event = "ไม่อนุมัติความสนใจสถานที่ฝึกงานของผู้ใช้รหัส "+user_id;
							
						}
						
						new EventHistoryDAO().insertEventHistory(role2_id, detail_event, ip);
						
					}
					
					
				}
				
			}
				
		}
			
		JSONObject jsonObject = new JSONObject();
		
		jsonObject.put("status", status);
		jsonObject.put("alert", alert);
		etc.responseJSONObject(jsonObject, response);
		
	}
	
	@RequestMapping(value = "/internshipRequestYou", method = RequestMethod.GET)
	public ModelAndView internshipRequestYou(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");
		
		session = request.getSession(false); 
		int sessionStatus = new EtcMethods().checkSession(session, request);
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("1")) {
			
			return new ModelAndView("role1/internship_request_you");
				
		} else {
			
			return new ModelAndView("404");
		}

	}
	
	@RequestMapping(value = "/studentRequestDataForRole1", method = RequestMethod.POST)
	@ResponseBody
	public void studentRequestDataForRole1(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		session = request.getSession(false);
		EtcMethods etc = new EtcMethods();
		int sessionStatus = etc.checkSession(session, request);
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = null;
		String[] address = {};
		
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("1")) {
			
			ArrayList<HashMap<String, Object>> uerData = new StudentPlaceOfInternshipDAO().queryInternshipRequestStudentRole1(session.getAttribute("id").toString());
		
			for(int i = 0; i < uerData.size(); i++) {
				jsonObject = new JSONObject();
				jsonObject.put("student_place_of_internship_id", uerData.get(i).get("student_place_of_internship_id"));
				jsonObject.put("internship_id", uerData.get(i).get("internship_id"));
				jsonObject.put("teacher_email", uerData.get(i).get("teacher_email"));
				jsonObject.put("name", uerData.get(i).get("name"));
				
				address = uerData.get(i).get("address").toString().split("\\s+");
				
				for(int j = 0; j < address.length; j++) {
					jsonObject.put("address"+(j+1), address[j]);
				}
				jsonObject.put("internship_email", uerData.get(i).get("internship_email"));
				jsonObject.put("phone", uerData.get(i).get("phone"));
				jsonObject.put("recive_total", uerData.get(i).get("recive_total"));
				jsonObject.put("time_reg", uerData.get(i).get("time_reg"));
				jsonObject.put("type", uerData.get(i).get("type"));
				jsonObject.put("status", uerData.get(i).get("status"));

				jsonArray.put(jsonObject);
			
			}
			
		}
		new EtcMethods().responseJSONArray(jsonArray, response);
	}
	//Management status std_internship condition 2 role1
	@RequestMapping(value = "/managementInternshipAndUserStatus", method = RequestMethod.POST)
	@ResponseBody
	public void managementInternshipAndUserStatus(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		EtcMethods etc = new EtcMethods();
		
		session = request.getSession(false);
		int sessionStatus = etc.checkSession(session, request);
		String status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
		String alert = "0";
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("1")) {
			
			String role1_id = session.getAttribute("id").toString();
			String teacher_email = request.getParameter("teacher_email");
			String internship_email = request.getParameter("internship_email");
			String std_internship_id = request.getParameter("std_internship_id");
			String ip = request.getParameter("ip");
			String status_user = request.getParameter("status");
			String internship_id = request.getParameter("internship_id");
			
			
			if(role1_id != null && !role1_id.equals("") && teacher_email != null && !teacher_email.equals("") && internship_email != null && !internship_email.equals("") && std_internship_id != null && !std_internship_id.equals("") && ip != null && !ip.equals("") && status_user != null && !status_user.equals("") && internship_id != null && !internship_id.equals("")) {
				
				if(status_user.equals("1") || status_user.equals("0")) {
					
					String detail_event = "";
					
					if(new StudentPlaceOfInternshipDAO().managementStatusUserInternship(std_internship_id, status_user) == 1) {
						
						status = "อัปเดทสถานะผู้ใช้งานและสถานที่ฝึกงานสำเร็จ";
						alert = "1";
						
						if(status_user.equals("1")) {
							
							etc.sendEmail(role1_id, teacher_email, "ผลการตัดสินใจของนิสิต/นักศึกษากับสถานที่ฝึกงานที่ร้องขอ", "นิสิต/นักศึกษา ตกลงเข้าฝึกงาน\nกรุณาแจ้งที่อยู่สำหรับการติดต่อ เพื่อดำเนินการต่อไป");
							etc.sendEmail(role1_id, internship_email, "ผลการตัดสินใจของนิสิต/นักศึกษากับสถานที่ฝึกงานที่ร้องขอ", "นิสิต/นักศึกษา ตกลงเข้าฝึกงานกับบริษัทของคุณ");
							detail_event = "ตกลงฝึกงานกับสถานที่ฝึกงานรหัส "+internship_id;
							
						} else if(status_user.equals("0")) {
							
							etc.sendEmail(role1_id, teacher_email, "ผลการตัดสินใจของนิสิต/นักศึกษากับสถานที่ฝึกงานที่ร้องขอ", "นิสิต/นักศึกษา ไม่ตกลงเข้าฝึกงาน");
							etc.sendEmail(role1_id, internship_email, "ผลการตัดสินใจของนิสิต/นักศึกษากับสถานที่ฝึกงานที่ร้องขอ", "นิสิต/นักศึกษา ไม่ตกลงเข้าฝึกงานกับบริษัทของคุณ");
							detail_event = "ไม่ตกลงฝึกงานกับสถานที่ฝึกงานรหัส "+internship_id;
							
						}
						
						new EventHistoryDAO().insertEventHistory(role1_id, detail_event, ip);
						
					}
					
					
				}
				
			}
				
		}
			
		JSONObject jsonObject = new JSONObject();
		
		jsonObject.put("status", status);
		jsonObject.put("alert", alert);
		etc.responseJSONObject(jsonObject, response);
		
	}
	
	@RequestMapping(value = "/internshipAndStudentMatchingData", method = RequestMethod.POST)
	@ResponseBody
	public void internshipAndStudentMatchingData(HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		EtcMethods etc = new EtcMethods();

		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = null;

		session = request.getSession(false);
		int sessionStatus = etc.checkSession(session, request);

		if (sessionStatus == 0 && session.getAttribute("role").toString().equals("2")) {
			
			String internship_id = request.getParameter("internship");

			ArrayList<HashMap<String, Object>> userData = new StudentPlaceOfInternshipDAO().queryStudentAndInternshipMatchingRole3(internship_id);

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
				jsonObject.put("internship_name", userData.get(i).get("internship_name"));
				jsonObject.put("student_place_of_internship_id", userData.get(i).get("student_place_of_internship_id"));

				jsonObject.put("province", userData.get(i).get("address").toString().split("\\s+")[5]);

				jsonArray.put(jsonObject);
			}
		}

		new EtcMethods().responseJSONArray(jsonArray, response);

	}
	
	@RequestMapping(value = "/sendContactRole2", method = RequestMethod.POST)
	@ResponseBody
	public void sendContactRole2(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		EtcMethods etc = new EtcMethods();
		String status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
		String alert = "0";
		
		session = request.getSession(false);
		int sessionStatus = etc.checkSession(session, request);
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("2")) {
			
			String ip = request.getParameter("ip");
			String contact = request.getParameter("contact");
			String std_internship_id = request.getParameter("std_internship_id");
			String internship_name = request.getParameter("internship_name");
			String date = request.getParameter("date");
			String time = request.getParameter("time");
			String email = "";
			String role3_email = "";
			String role3_phone = "";
		
			if(std_internship_id != null && !std_internship_id.equals("") && time != null && !time.equals("") && date != null && !date.equals("") && internship_name != null && !internship_name.equals("") && ip != null && !ip.equals("") && contact != null && !contact.equals("")) {
				
				HashMap<String, Object> role3Data = new UserDAO().findEmailAndPhoneByUserId(session.getAttribute("id").toString());
				role3_email = role3Data.get("email").toString();
				role3_phone = role3Data.get("phone").toString();
				
				std_internship_id = std_internship_id.replace("[", "");
				std_internship_id = std_internship_id.replace("]", "");
				std_internship_id = std_internship_id.replace("\"", "");
				
				String[] std_internship_id_data = std_internship_id.split(",");
				
				for(int i = 0; i < std_internship_id_data.length; i++) {
					
					email = new StudentPlaceOfInternshipDAO().queryEmailByStudentInternshipId(std_internship_id_data[i]).get("email").toString();
					etc.sendEmail(session.getAttribute("id").toString(), email, "ที่อยู่สำหรับการติดต่อ", "ที่อยู่สำหรับการติดต่อเพื่อนัดประชุมก่อนฝึกงาน : "+contact+"\nภายใน : "+date+"\nเวลา : "+time+" น. เป็นต้นไป\n\nจากบริษัท : "+internship_name+"\nอีเมลอาจารย์ : "+role3_email+"\nเบอร์โทร : "+role3_phone);
					
					new StudentPlaceOfInternshipDAO().updateSendStatus(std_internship_id_data[i]);
					
				}
					
				status = "ส่งข้อมูลที่อยู่การติดต่อให้นิสิต/นักศึกษาแล้ว";
				alert = "1";
						
			}
			
		}
		JSONObject jsonObject = new JSONObject();
		
		jsonObject.put("status", status);
		jsonObject.put("alert", alert);
		new EtcMethods().responseJSONObject(jsonObject, response);
		
	}
	
	@RequestMapping(value = "/sendAssessment", method = RequestMethod.GET)
	public ModelAndView sendAssessment(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");
		
		session = request.getSession(false); 
		int sessionStatus = new EtcMethods().checkSession(session, request);
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("2")) {
			
			return new ModelAndView("role2/send_assessment");
				
		} else {
			
			return new ModelAndView("404");
		}

	}
	
	
	@RequestMapping(value = "/getStudentInternshipComplete", method = RequestMethod.POST)
	@ResponseBody
	public void getStudentInternshipComplete(HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		EtcMethods etc = new EtcMethods();

		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = null;

		session = request.getSession(false);
		int sessionStatus = etc.checkSession(session, request);

		if (sessionStatus == 0 && session.getAttribute("role").toString().equals("2")) {
			
			ArrayList<HashMap<String, Object>> userData = new StudentPlaceOfInternshipDAO().getStudentInternshipForSendAssessment(session.getAttribute("id").toString());

			for (int i = 0; i < userData.size(); i++) {
				jsonObject = new JSONObject();
				jsonObject.put("name", userData.get(i).get("name"));
				jsonObject.put("email", userData.get(i).get("email"));
				jsonObject.put("place_of_internship_id", userData.get(i).get("place_of_internship_id"));

				jsonArray.put(jsonObject);
			}
		}

		new EtcMethods().responseJSONArray(jsonArray, response);

	}
	
	@RequestMapping(value = "/sendAssessmentToInternship", method = RequestMethod.POST)
	@ResponseBody
	public void sendAssessmentToInternship(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		EtcMethods etc = new EtcMethods();
		
		session = request.getSession(false);
		int sessionStatus = etc.checkSession(session, request);
		String status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
		String alert = "0";
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("2")) {
			
			String ip = request.getParameter("ip");
			String email = request.getParameter("internship_email");
			String internship_id = request.getParameter("internship_id");
			String criterion_form_id = request.getParameter("criterion_form_id");
			
			
			if(ip != null && !ip.equals("") && email != null && !email.equals("") && internship_id != null && !internship_id.equals("") && criterion_form_id != null && !criterion_form_id.equals("")) {
				
				
				String secret_code = new UserDAO().querySecretCodeByUserId(session.getAttribute("id").toString()).get("secret_code").toString();
				
				int updateSendAssessmentStatus = new StudentPlaceOfInternshipDAO().updateStatusSendAssessment(internship_id);

				if(!secret_code.equals("") && updateSendAssessmentStatus > 0) {
					
					etc.sendEmail(session.getAttribute("id").toString(), email, "กรุณาประเมินนิสิต/นักศึกษาฝึกงาน", "สามารถเข้าประเมินนิสิต/นักศึกษาได้ที่นี่ URL : "+url+"getStudentDataForAssessment/?data1="+secret_code+"&data2="+internship_id+"&data3="+criterion_form_id);
					status = "ส่งแบบฟอร์มการประเมินสำเร็จ";
					alert = "1";
				}
				
			}
				
		}
			
		JSONObject jsonObject = new JSONObject();
		
		jsonObject.put("status", status);
		jsonObject.put("alert", alert);
		etc.responseJSONObject(jsonObject, response);
		
	}
	
	@RequestMapping(value = "/getStudentDataForAssessment", method = RequestMethod.GET)
	public ModelAndView getStudentDataForAssessment(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");
		
		String secret_code = request.getParameter("data1");
		String internship_id = request.getParameter("data2");
		String criterion_form_id = request.getParameter("data3");
		
		if(secret_code != null && !secret_code.equals("") && internship_id != null && !internship_id.equals("") && criterion_form_id != null && !criterion_form_id.equals("")) {
			
			ArrayList<HashMap<String, Object>> intershipAndRole2Id = new StudentPlaceOfInternshipDAO().checkInternshipForAssessment(secret_code, internship_id);
			
			if(intershipAndRole2Id.size() != 0) {

				return new ModelAndView("redirect:/assessmentForInternship?data1="+secret_code+"&data2="+internship_id+"&data3="+criterion_form_id);
			}
			
				
		}
		
		return new ModelAndView("404");
	}
	
	@RequestMapping(value = "/assessmentForInternship", method = RequestMethod.GET)
	public ModelAndView assessmentForInternship(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");
		
		String secret_code = request.getParameter("data1");
		String internship_id = request.getParameter("data2");
		String criterion_form_id = request.getParameter("data3");
		
		if(secret_code != null && !secret_code.equals("") && internship_id != null && !internship_id.equals("") && criterion_form_id != null && !criterion_form_id.equals("")) {
			
			ArrayList<HashMap<String, Object>> intershipAndRole2Id = new StudentPlaceOfInternshipDAO().checkInternshipForAssessment(secret_code, internship_id);
			
			if(intershipAndRole2Id.size() != 0) {

				return new ModelAndView("assessment_for_internship");
			}
			
				
		}
		
		return new ModelAndView("404");
	}
	
	@RequestMapping(value = "/getStudentInternshipCompleteUnRole", method = RequestMethod.POST)
	@ResponseBody
	public void getStudentInternshipCompleteUnRole(HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		EtcMethods etc = new EtcMethods();

		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = null;
		
		String secret_code = request.getParameter("data1");
		String internship_id = request.getParameter("data2");
		
		if(secret_code != null && !secret_code.equals("") && internship_id != null && !internship_id.equals("")) {
			
			ArrayList<HashMap<String, Object>> userData = new StudentPlaceOfInternshipDAO().queryStudentDataInternshipComplete(internship_id, secret_code);

			for (int i = 0; i < userData.size(); i++) {
				jsonObject = new JSONObject();
				jsonObject.put("profile_image", userData.get(i).get("profile_image"));
				jsonObject.put("firstname", userData.get(i).get("firstname"));
				jsonObject.put("lastname", userData.get(i).get("lastname"));
				jsonObject.put("university_name", userData.get(i).get("university_name"));
				jsonObject.put("faculty_name", userData.get(i).get("faculty_name"));
				jsonObject.put("course_name", userData.get(i).get("course_name"));
				jsonObject.put("internship_name", userData.get(i).get("internship_name"));
				jsonObject.put("time_reg", userData.get(i).get("time_reg"));
				jsonObject.put("student_place_of_internship_id", userData.get(i).get("student_place_of_internship_id"));

				jsonArray.put(jsonObject);
			}
			
			
		}

		etc.responseJSONArray(jsonArray, response);

	}
	
	
	// Assessment Role2
	@RequestMapping(value = "/assessmentInternship", method = RequestMethod.GET)
	public ModelAndView assessmentInternship(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");
		
		session = request.getSession(false); 
		int sessionStatus = new EtcMethods().checkSession(session, request);
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("2")) {
			
			return new ModelAndView("role2/assessment_for_role2");
				
		} else {
			
			return new ModelAndView("404");
		}

	}
	
	@RequestMapping(value = "/getStudentInternshipCompleteRole2", method = RequestMethod.POST)
	@ResponseBody
	public void getStudentInternshipCompleteRole2(HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		EtcMethods etc = new EtcMethods();

		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = null;
		
		session = request.getSession(false); 
		int sessionStatus = new EtcMethods().checkSession(session, request);
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("2")) {
			
			String internship_id = request.getParameter("internship_id");
		
			if(internship_id != null && !internship_id.equals("")) {
				
				ArrayList<HashMap<String, Object>> userData = new StudentPlaceOfInternshipDAO().queryStudentDataInternshipCompleteRole2(internship_id, session.getAttribute("id").toString());
				
				for (int i = 0; i < userData.size(); i++) {
					jsonObject = new JSONObject();
					jsonObject.put("profile_image", userData.get(i).get("profile_image"));
					jsonObject.put("firstname", userData.get(i).get("firstname"));
					jsonObject.put("lastname", userData.get(i).get("lastname"));
					jsonObject.put("university_name", userData.get(i).get("university_name"));
					jsonObject.put("faculty_name", userData.get(i).get("faculty_name"));
					jsonObject.put("course_name", userData.get(i).get("course_name"));
					jsonObject.put("internship_name", userData.get(i).get("internship_name"));
					jsonObject.put("time_reg", userData.get(i).get("time_reg"));
					jsonObject.put("student_place_of_internship_id", userData.get(i).get("student_place_of_internship_id"));
	
					jsonArray.put(jsonObject);
				}
				
				
			}
			
		}

		etc.responseJSONArray(jsonArray, response);

	}
	
	@RequestMapping(value = "/getStudentInternshipCompleteForReport", method = RequestMethod.POST)
	@ResponseBody
	public void getStudentInternshipCompleteForReport(HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		EtcMethods etc = new EtcMethods();

		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = null;
		
		session = request.getSession(false); 
		int sessionStatus = new EtcMethods().checkSession(session, request);
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("2")) {
			
			String internship_id = request.getParameter("internship_id");
		
			if(internship_id != null && !internship_id.equals("")) {
				
				ArrayList<HashMap<String, Object>> userData = new StudentPlaceOfInternshipDAO().queryStudentDataInternshipCompleteForReport(internship_id, session.getAttribute("id").toString());
				
				for (int i = 0; i < userData.size(); i++) {
					jsonObject = new JSONObject();
					jsonObject.put("profile_image", userData.get(i).get("profile_image"));
					jsonObject.put("firstname", userData.get(i).get("firstname"));
					jsonObject.put("lastname", userData.get(i).get("lastname"));
					jsonObject.put("university_name", userData.get(i).get("university_name"));
					jsonObject.put("faculty_name", userData.get(i).get("faculty_name"));
					jsonObject.put("course_name", userData.get(i).get("course_name"));
					jsonObject.put("internship_name", userData.get(i).get("internship_name"));
					jsonObject.put("time_reg", userData.get(i).get("time_reg"));
					jsonObject.put("student_place_of_internship_id", userData.get(i).get("student_place_of_internship_id"));
					jsonObject.put("assessment_internship_id", userData.get(i).get("assessment_internship_id"));
	
					jsonArray.put(jsonObject);
				}
				
				
			}
			
		}

		etc.responseJSONArray(jsonArray, response);

	}
	
	
	@RequestMapping(value = "/getStudentCountInternshiping", method = RequestMethod.POST)
	@ResponseBody
	public void getStudentCountInternshiping(HttpSession session, HttpServletRequest request,
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
			
			ArrayList<HashMap<String, Object>> studentCount = new StudentPlaceOfInternshipDAO().queryStudentCountOverseasInternshiping(user_id);
				
			for(int i = 0; i < studentCount.size(); i++) {
				
				jsonObject = new JSONObject();
				jsonObject.put("name", studentCount.get(i).get("name"));
				jsonObject.put("count", studentCount.get(i).get("count"));
				
				jsonArray.put(jsonObject);
			}
			
		
				
		}

		etc.responseJSONArray(jsonArray, response);

	}
	
	

}
