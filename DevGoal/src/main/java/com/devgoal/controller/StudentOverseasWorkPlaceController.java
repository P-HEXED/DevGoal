package com.devgoal.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
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
import com.devgoal.dao.OverseasWorkPlaceDAO;
import com.devgoal.dao.StudentOverseasWorkPlaceDAO;
import com.devgoal.dao.UserDAO;

@Controller
@WebServlet("/sendResume")
@MultipartConfig
public class StudentOverseasWorkPlaceController extends HttpServlet {
	
	String url = new PathConfig().url;
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		EtcMethods etc = new EtcMethods();

		HttpSession session = request.getSession(false);
		int sessionStatus = etc.checkSession(session, request);
		String status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
		String alert = "0";

		
		if (sessionStatus == 0 && session.getAttribute("role").toString().equals("1")) {
			
			String emailRole3 = request.getParameter("emailRole3");
			Part pdfResume = request.getPart("pdfResume");
			
			if(emailRole3 != null && !emailRole3.equals("") && pdfResume.getSize() != 0 && pdfResume != null) {
				
				if (pdfResume.getContentType() != null) {
					
					String resumeFileName = etc.checkPDF(pdfResume);
					
					etc.sendEmail(session.getAttribute("id").toString(), emailRole3, "ข้อมูลเรซูมเม่ที่คุณร้องขอจากการประชุม", "ดูเรซูมเม่ได้ที่นี่ : "+url+"resources/resume/"+resumeFileName);
					status = "ส่งข้อมูลเรซูมเม่สำเร็จ";
					alert = "1";
				}
				
				
			}
			
			
			
			
			
		}
		
		try {
			
			JSONObject jsonObject = new JSONObject();
			
			jsonObject.put("status", status);
			jsonObject.put("alert", alert);
			etc.responseJSONObject(jsonObject, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping(value = "/sendDataToOverseas", method = RequestMethod.POST)
	@ResponseBody
	public void sendDataToOverseas(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		EtcMethods etc = new EtcMethods();
		
		session = request.getSession(false);
		int sessionStatus = etc.checkSession(session, request);
		String status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
		String alert = "0";
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("1")) {

			String user_id = session.getAttribute("id").toString();
			String overseas_id = request.getParameter("overseas_id");
			String ip = request.getParameter("ip");
			if(user_id != null && !user_id.equals("") && overseas_id != null && !overseas_id.equals("") && ip != null && !ip.equals("")) {

				int insertStatus = new StudentOverseasWorkPlaceDAO().insertOverseaAndUser(user_id, overseas_id, "1");
				HashMap<String, Object> email = new OverseasWorkPlaceDAO().queryEmailUser(overseas_id);
				
				if(insertStatus > 0) {
					
					status = "ส่งข้อมูลไปยังบริษัทเรียบร้อย";
					alert = "1";
					
					etc.sendEmail(user_id, email.get("email").toString(), "นิสิต/นักศึกษาสนใจบริษัทของคุณ", "โปรดตรวจสอบเพื่อดำเนินการต่อไปได้ที่นี่ : "+ new PathConfig().url+"studentRequest");
					
					new EventHistoryDAO().insertEventHistory(user_id, "ส่งข้อมูลไปยังสถานที่ทำงานรหัส "+overseas_id, ip);
				}
				
			}
		}
		
		JSONObject jsonObject = new JSONObject();
		
		jsonObject.put("status", status);
		jsonObject.put("alert", alert);
		etc.responseJSONObject(jsonObject, response);
		
	}
	
	@RequestMapping(value = "/studentRequestDataForRole3", method = RequestMethod.POST)
	@ResponseBody
	public void studentRequestDataForRole3(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		session = request.getSession(false);
		EtcMethods etc = new EtcMethods();
		int sessionStatus = etc.checkSession(session, request);
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = null;
		
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("3")) {
			
			ArrayList<HashMap<String, Object>> uerData = new StudentOverseasWorkPlaceDAO().queryUserDataRequest(session.getAttribute("id").toString());
			
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
				jsonObject.put("overseas_name", uerData.get(i).get("overseas_name"));
				jsonObject.put("student_overseas_work_place_id", uerData.get(i).get("student_overseas_work_place_id"));
				jsonObject.put("gender", uerData.get(i).get("gender"));
				jsonObject.put("status", uerData.get(i).get("status"));

				jsonArray.put(jsonObject);
			
			}
			
		}
		new EtcMethods().responseJSONArray(jsonArray, response);
	}
	
	@RequestMapping(value = "/managementUserAndOverseasStatus", method = RequestMethod.POST)
	@ResponseBody
	public void managementUserAndOverseasStatus(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		EtcMethods etc = new EtcMethods();
		
		session = request.getSession(false);
		int sessionStatus = etc.checkSession(session, request);
		String status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
		String alert = "0";
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("3")) {
			
			String role3_id = session.getAttribute("id").toString();
			String user_id = request.getParameter("user_id");
			String user_overseas_id = request.getParameter("user_overseas_id");
			String ip = request.getParameter("ip");
			String status_user = request.getParameter("status");
			
			
			if(user_overseas_id != null && !user_overseas_id.equals("") && role3_id != null && user_id != null && ip != null && status_user != null && !status_user.equals("") && !role3_id.equals("") && !user_id.equals("") && !ip.equals("")) {
				
				if(status_user.equals("1") || status_user.equals("0")) {
					
					String email = new UserDAO().findEmailByUserId(user_id).get("email").toString();
					String detail_event = "";
					
					if(new StudentOverseasWorkPlaceDAO().managementStatusUserOverseas(user_overseas_id, status_user) == 1) {
						
						status = "อัปเดทสถานะผู้ใช้งานและสถานที่ทำงานสำเร็จ";
						alert = "1";
						
						if(status_user.equals("1")) {
							
							etc.sendEmail(role3_id, email, "ผลการอนุมัติสถานที่ทำงานที่คุณสนใจ", "คุณผ่านการอนุมัติแล้ว\nกรุณารอผู้ประกาศแจ้งที่อยู่สำหรับการติดต่อ เพื่อดำเนินการต่อไป");
							detail_event = "อนุมัติความสนใจสถานที่ทำงานของผู้ใช้รหัส "+user_id;
							
						} else if(status_user.equals("0")) {
							
							etc.sendEmail(role3_id, email, "ผลการอนุมัติสถานที่ทำงานที่คุณสนใจ", "คุณไม่ผ่านการอนุมัติ\nคุณสามารถเลือกบริษัทใหม่ได้ที่นี่ "+url+"overseas");
							detail_event = "ไม่อนุมัติความสนใจสถานที่ทำงานของผู้ใช้รหัส "+user_id;
							
						}
						
						new EventHistoryDAO().insertEventHistory(role3_id, detail_event, ip);
						
					}
					
					
				}
				
			}
				
		}
			
		JSONObject jsonObject = new JSONObject();
		
		jsonObject.put("status", status);
		jsonObject.put("alert", alert);
		etc.responseJSONObject(jsonObject, response);
		
	}
	
	@RequestMapping(value = "/overseasRequestYou", method = RequestMethod.GET)
	public ModelAndView overseasRequestYou(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");
		
		session = request.getSession(false); 
		int sessionStatus = new EtcMethods().checkSession(session, request);
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("1")) {
			
			return new ModelAndView("role1/overseas_request_you");
				
		} else {
			
			return new ModelAndView("404");
		}

	}
	
	@RequestMapping(value = "/overseasRequestStudentData", method = RequestMethod.POST)
	@ResponseBody
	public void overseasRequestStudentData(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		session = request.getSession(false);
		EtcMethods etc = new EtcMethods();
		int sessionStatus = etc.checkSession(session, request);
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = null;
		String[] address = {};
		
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("1")) {
			
			ArrayList<HashMap<String, Object>> uerData = new StudentOverseasWorkPlaceDAO().queryOverseasRequestStudentRole1(session.getAttribute("id").toString());
		
			for(int i = 0; i < uerData.size(); i++) {
				jsonObject = new JSONObject();
				jsonObject.put("student_overseas_work_place_id", uerData.get(i).get("student_overseas_work_place_id"));
				jsonObject.put("overseas_id", uerData.get(i).get("overseas_id"));
				jsonObject.put("employer_email", uerData.get(i).get("employer_email"));
				jsonObject.put("name", uerData.get(i).get("name"));
				
				address = uerData.get(i).get("address").toString().split("\\s+");
				
				for(int j = 0; j < address.length; j++) {
					jsonObject.put("address"+(j+1), address[j]);
				}
				jsonObject.put("overseas_email", uerData.get(i).get("overseas_email"));
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
	
	//Management status std_overseas condition 2 role1
		@RequestMapping(value = "/managementOverseasAndUserStatus", method = RequestMethod.POST)
		@ResponseBody
		public void managementOverseasAndUserStatus(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException, ServletException {
			response.setContentType("text/html;charset=UTF-8");
			request.setCharacterEncoding("UTF-8");
			
			EtcMethods etc = new EtcMethods();
			
			session = request.getSession(false);
			int sessionStatus = etc.checkSession(session, request);
			String status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
			String alert = "0";
			
			if(sessionStatus == 0 && session.getAttribute("role").toString().equals("1")) {
				
				String role1_id = session.getAttribute("id").toString();
				String employer_email = request.getParameter("employer_email");
				String overseas_email = request.getParameter("overseas_email");
				String std_overseas_id = request.getParameter("std_overseas_id");
				String ip = request.getParameter("ip");
				String status_user = request.getParameter("status");
				String overseas_id = request.getParameter("overseas_id");
				
				
				if(role1_id != null && !role1_id.equals("") && employer_email != null && !employer_email.equals("") && overseas_email != null && !overseas_email.equals("") && std_overseas_id != null && !std_overseas_id.equals("") && ip != null && !ip.equals("") && status_user != null && !status_user.equals("") && overseas_id != null && !overseas_id.equals("")) {
					
					if(status_user.equals("1") || status_user.equals("0")) {
						
						String detail_event = "";
						
						if(new StudentOverseasWorkPlaceDAO().managementStatusUserOverseasRole1(std_overseas_id, status_user) == 1) {
							
							status = "อัปเดทสถานะผู้ใช้งานและสถานที่ทำงานสำเร็จ";
							alert = "1";
							
							if(status_user.equals("1")) {
								
								etc.sendEmail(role1_id, employer_email, "ผลการตัดสินใจของนิสิต/นักศึกษากับสถานที่ทำงานที่ร้องขอ", "นิสิต/นักศึกษา ตกลงเข้าทำงาน\nกรุณาแจ้งที่อยู่สำหรับการติดต่อ เพื่อดำเนินการต่อไป");
								etc.sendEmail(role1_id, overseas_email, "ผลการตัดสินใจของนิสิต/นักศึกษากับสถานที่ทำงานที่ร้องขอ", "นิสิต/นักศึกษา ตกลงเข้าทำงานกับบริษัทของคุณ");
								detail_event = "ตกลงทำงานกับสถานที่ทำงานรหัส "+overseas_id;
								
							} else if(status_user.equals("0")) {
								
								etc.sendEmail(role1_id, employer_email, "ผลการตัดสินใจของนิสิต/นักศึกษากับสถานที่ทำงานที่ร้องขอ", "นิสิต/นักศึกษา ไม่ตกลงเข้าทำงาน");
								etc.sendEmail(role1_id, overseas_email, "ผลการตัดสินใจของนิสิต/นักศึกษากับสถานที่ทำงานที่ร้องขอ", "นิสิต/นักศึกษา ไม่ตกลงเข้าทำงานกับบริษัทของคุณ");
								detail_event = "ไม่ตกลงทำงานกับสถานที่ทำงานรหัส "+overseas_id;
								
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
		
		@RequestMapping(value = "/overseasAndStudentMatchingData", method = RequestMethod.POST)
		@ResponseBody
		public void overseasAndStudentMatchingData(HttpSession session, HttpServletRequest request,
				HttpServletResponse response) throws JSONException, IOException, ServletException {
			response.setContentType("text/html;charset=UTF-8");
			request.setCharacterEncoding("UTF-8");

			EtcMethods etc = new EtcMethods();

			JSONArray jsonArray = new JSONArray();
			JSONObject jsonObject = null;

			session = request.getSession(false);
			int sessionStatus = etc.checkSession(session, request);

			if (sessionStatus == 0 && session.getAttribute("role").toString().equals("3")) {
				
				String overseas_id = request.getParameter("overseas");

				ArrayList<HashMap<String, Object>> userData = new StudentOverseasWorkPlaceDAO().queryStudentAndOverseasMatchingRole3(overseas_id);

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
					jsonObject.put("overseas_name", userData.get(i).get("overseas_name"));
					jsonObject.put("student_overseas_work_place_id", userData.get(i).get("student_overseas_work_place_id"));

					jsonObject.put("province", userData.get(i).get("address").toString().split("\\s+")[5]);

					jsonArray.put(jsonObject);
				}
			}

			new EtcMethods().responseJSONArray(jsonArray, response);

		}
		
		@RequestMapping(value = "/sendContact", method = RequestMethod.POST)
		@ResponseBody
		public void sendContact(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
			response.setContentType("text/html;charset=UTF-8");
			request.setCharacterEncoding("UTF-8");
			
			EtcMethods etc = new EtcMethods();
			String status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
			String alert = "0";
			
			session = request.getSession(false);
			int sessionStatus = etc.checkSession(session, request);
			
			if(sessionStatus == 0 && session.getAttribute("role").toString().equals("3")) {
				
				String ip = request.getParameter("ip");
				String contact = request.getParameter("contact");
				String std_overseas_id = request.getParameter("std_overseas_id");
				String overseas_name = request.getParameter("overseas_name");
				String date = request.getParameter("date");
				String time = request.getParameter("time");
				String email = "";
				String role3_email = "";
				String role3_phone = "";
			
				if(std_overseas_id != null && !std_overseas_id.equals("") && time != null && !time.equals("") && date != null && !date.equals("") && overseas_name != null && !overseas_name.equals("") && ip != null && !ip.equals("") && contact != null && !contact.equals("")) {
					
					HashMap<String, Object> role3Data = new UserDAO().findEmailAndPhoneByUserId(session.getAttribute("id").toString());
					role3_email = role3Data.get("email").toString();
					role3_phone = role3Data.get("phone").toString();
					
					std_overseas_id = std_overseas_id.replace("[", "");
					std_overseas_id = std_overseas_id.replace("]", "");
					std_overseas_id = std_overseas_id.replace("\"", "");
					
					String[] std_overseas_id_data = std_overseas_id.split(",");
					
					for(int i = 0; i < std_overseas_id_data.length; i++) {
						
						email = new StudentOverseasWorkPlaceDAO().queryEmailByStudentOverseasId(std_overseas_id_data[i]).get("email").toString();
						etc.sendEmail(session.getAttribute("id").toString(), email, "ที่อยู่สำหรับการติดต่อ", "ที่อยู่สำหรับการติดต่อเพื่อนัดประชุมก่อนทำงาน : "+contact+"\nภายใน : "+date+"\nเวลา : "+time+" น. เป็นต้นไป\n\nจากบริษัท : "+overseas_name+"\nอีเมลนายจ้าง : "+role3_email+"\nเบอร์โทร : "+role3_phone);
						
						new StudentOverseasWorkPlaceDAO().updateSendStatus(std_overseas_id_data[i]);
						
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
		
		@RequestMapping(value = "/overseasDataForResume", method = RequestMethod.POST)
		@ResponseBody
		public void overseasDataForResume(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
			response.setContentType("text/html;charset=UTF-8");
			request.setCharacterEncoding("UTF-8");
			
			session = request.getSession(false);
			EtcMethods etc = new EtcMethods();
			int sessionStatus = etc.checkSession(session, request);
			JSONArray jsonArray = new JSONArray();
			JSONObject jsonObject = null;
			
			
			if(sessionStatus == 0 && session.getAttribute("role").toString().equals("1")) {
				
				ArrayList<HashMap<String, Object>> overseasData = new StudentOverseasWorkPlaceDAO().queryOverseasAndRole3DataForResume(session.getAttribute("id").toString());
				
				for(int i = 0; i < overseasData.size(); i++) {
					jsonObject = new JSONObject();
					jsonObject.put("overseas_name", overseasData.get(i).get("overseas_name"));
					jsonObject.put("role3_email", overseasData.get(i).get("role3_email"));

					jsonArray.put(jsonObject);
				
				}
				
			}
			new EtcMethods().responseJSONArray(jsonArray, response);
		}
		

		
		@RequestMapping(value = "/getEmployerData", method = RequestMethod.POST)
		@ResponseBody
		public void getEmployerData(HttpSession session, HttpServletRequest request,
				HttpServletResponse response) throws JSONException, IOException, ServletException {
			response.setContentType("text/html;charset=UTF-8");
			request.setCharacterEncoding("UTF-8");

			EtcMethods etc = new EtcMethods();
			JSONArray jsonArray = new JSONArray(); 
			JSONObject jsonObject = null;

			session = request.getSession(false);
			int sessionStatus = etc.checkSession(session, request);

			if (sessionStatus == 0 && session.getAttribute("role").toString().equals("3")) {
				
				String user_id = session.getAttribute("id").toString();
				
				HashMap<String, Object> userDataRole3 = new UserDAO().queryUserDataRole3(user_id);
				HashMap<String, Object> placesData = new StudentOverseasWorkPlaceDAO().queryOverseasRequestCondition(user_id);
					
				jsonObject = new JSONObject();
				jsonObject.put("profile_image", userDataRole3.get("profile_image"));
				jsonObject.put("firstname", userDataRole3.get("firstname"));
				jsonObject.put("lastname", userDataRole3.get("lastname"));
				
				jsonObject.put("student_request", placesData.get("student_request"));
				jsonObject.put("request_student", placesData.get("request_student"));
				
				jsonArray.put(jsonObject);
					
			}

			etc.responseJSONObject(jsonObject, response);

		}
		
		
		@RequestMapping(value = "/getStudentCountWorking", method = RequestMethod.POST)
		@ResponseBody
		public void getStudentCountWorking(HttpSession session, HttpServletRequest request,
				HttpServletResponse response) throws JSONException, IOException, ServletException {
			response.setContentType("text/html;charset=UTF-8");
			request.setCharacterEncoding("UTF-8");

			EtcMethods etc = new EtcMethods();
			JSONArray jsonArray = new JSONArray(); 
			JSONObject jsonObject = null;

			session = request.getSession(false);
			int sessionStatus = etc.checkSession(session, request);

			if (sessionStatus == 0 && session.getAttribute("role").toString().equals("3")) {
				
				String user_id = session.getAttribute("id").toString();
				
				ArrayList<HashMap<String, Object>> studentCount = new StudentOverseasWorkPlaceDAO().queryStudentCountOverseasWorking(user_id);
					
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
