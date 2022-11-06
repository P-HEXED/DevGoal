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
import com.devgoal.dao.StudentPlaceOfInternshipDAO;
import com.devgoal.dao.StudentPlaceOfInternshipDailyDAO;

@Controller
public class StudentPlaceOfInternshipDailyController {
	
	@RequestMapping(value = "/internshipEventDaily", method = RequestMethod.GET)
	public ModelAndView internshipEventDaily(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");
		
		session = request.getSession(false); 
		int sessionStatus = new EtcMethods().checkSession(session, request);
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("1")) {
			
			return new ModelAndView("role1/internship_daily");
			
		} else {
			
			return new ModelAndView("404");
		}
	
	}
	
	@RequestMapping(value = "/sendInternshipDetailDaily", method = RequestMethod.POST)
	@ResponseBody
	public void sendInternshipDetailDaily(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		session = request.getSession(false);
		int sessionStatus = new EtcMethods().checkSession(session, request);
		String status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
		String alert = "0";
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("1")) {
			
			String detail = request.getParameter("detail");
			String ip = request.getParameter("ip");
			
			String user_id = session.getAttribute("id").toString();
			
			if(detail != null && !detail.equals("") && ip != null && user_id != null && !ip.equals("") && !user_id.equals("")) {
				
				String student_place_of_internship_id = new StudentPlaceOfInternshipDAO().queryStudentInternshipIdStatus1ByStudentId(user_id).get("student_place_of_internship_id").toString();
				
				if(new StudentPlaceOfInternshipDailyDAO().insertInternshipDetailDaily(student_place_of_internship_id, detail) == 1) {
					
					status = "บันทึกข้อมูลการฝึกงานรายวันสำเร็จ";
					alert = "1";
					new EventHistoryDAO().insertEventHistory(user_id, "บันทึกข้อมูลการฝึกงานรายวัน", ip);
					
				}
				
			}
			
		}
		
		JSONObject jsonObject = new JSONObject();
		
		jsonObject.put("status", status);
		jsonObject.put("alert", alert);
		new EtcMethods().responseJSONObject(jsonObject, response);
		
	}
	
	@RequestMapping(value = "/internshipDailyReport", method = RequestMethod.GET)
	public ModelAndView internshipDailyReport(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");
		
		session = request.getSession(false); 
		int sessionStatus = new EtcMethods().checkSession(session, request);
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("2")) {
			
			return new ModelAndView("role2/internship_daily_data");
			
		} else {
			
			return new ModelAndView("404");
		}
	
	}
	
	@RequestMapping(value = "/internshipDailyData", method = RequestMethod.POST)
	@ResponseBody
	public void internshipDailyData(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		EtcMethods etc = new EtcMethods();

		session = request.getSession(false);
		int sessionStatus = etc.checkSession(session, request);

		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = null;

		if (sessionStatus == 0 && session.getAttribute("role").toString().equals("2")) {

			ArrayList<HashMap<String, Object>> userData = new StudentPlaceOfInternshipDailyDAO().internshipDataRole2(session.getAttribute("id").toString());

			for (int i = 0; i < userData.size(); i++) {
				jsonObject = new JSONObject();
				jsonObject.put("std_internship_id", userData.get(i).get("std_internship_id"));
				jsonObject.put("firstname", userData.get(i).get("firstname"));
				jsonObject.put("lastname", userData.get(i).get("lastname"));
				jsonObject.put("university_name", userData.get(i).get("university_name"));
				jsonObject.put("internship_name", userData.get(i).get("internship_name"));
				jsonObject.put("time_reg", userData.get(i).get("time_reg"));
				jsonObject.put("profile_image", userData.get(i).get("profile_image"));
				jsonObject.put("term", userData.get(i).get("term"));

				jsonArray.put(jsonObject);
			}

		}

		new EtcMethods().responseJSONArray(jsonArray, response);

	}
	
	@RequestMapping(value = "/internshipDailyDetailData", method = RequestMethod.POST)
	@ResponseBody
	public void internshipDailyDetailData(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		EtcMethods etc = new EtcMethods();

		session = request.getSession(false);
		int sessionStatus = etc.checkSession(session, request);

		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = null;

		if (sessionStatus == 0 && session.getAttribute("role").toString().equals("2")) {
			
			String std_internship_id = request.getParameter("std_internship_id");
			
			if(std_internship_id != null && !std_internship_id.equals("")) {
				
				ArrayList<HashMap<String, Object>> userData = new StudentPlaceOfInternshipDailyDAO().queryInternshipDailyDetail(std_internship_id);

				for (int i = 0; i < userData.size(); i++) {
					jsonObject = new JSONObject();
					jsonObject.put("detail", userData.get(i).get("detail"));
					jsonObject.put("time_reg", userData.get(i).get("time_reg"));

					jsonArray.put(jsonObject);
				}
			}

			

		}

		new EtcMethods().responseJSONArray(jsonArray, response);

	}

}
