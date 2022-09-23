package com.devgoal.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

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

import com.devgoal.dao.CourseDAO;
import com.devgoal.dao.EventHistoryDAO;
import com.devgoal.dao.FacultyDAO;
import com.devgoal.dao.UniversityDAO;

@Controller
public class FacultyController {
	
	//Find faculty by university id
	@RequestMapping(value = "/findFacultyByUniversity", method = RequestMethod.POST)
	@ResponseBody
	public void findFacultyByUniversity(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		String university_id = request.getParameter("university_id");
		
		if(university_id != null && !university_id.equals("")) {
			
			ArrayList<HashMap<String, Object>> faculty = new FacultyDAO().querySelectOption(university_id);
			
			JSONArray jsonArray = new JSONArray();
			JSONObject jsonObject = null;
			
			for(int i = 0; i < faculty.size(); i++) {
				jsonObject = new JSONObject();
				jsonObject.put("faculty_id", faculty.get(i).get("faculty_id"));
				jsonObject.put("name", faculty.get(i).get("name"));
				
				jsonArray.put(jsonObject);
			}
			
			new EtcMethods().responseJSONArray(jsonArray, response);
			
		}
		
		
	}
	
	@RequestMapping(value = "/findFacultyData", method = RequestMethod.POST)
	@ResponseBody
	public void findFacultyData(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		ArrayList<HashMap<String, Object>> faculty = new FacultyDAO().queryFacultyData();
		
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = null;
		
		for(int i = 0; i < faculty.size(); i++) {
			jsonObject = new JSONObject();
			jsonObject.put("faculty_id", faculty.get(i).get("faculty_id"));
			jsonObject.put("faculty_name", faculty.get(i).get("faculty_name"));
			jsonObject.put("university_name", faculty.get(i).get("university_name"));
			jsonObject.put("time_reg", faculty.get(i).get("time_reg"));
			jsonObject.put("status", faculty.get(i).get("status"));
			
			jsonArray.put(jsonObject);
			
		}
		
		new EtcMethods().responseJSONArray(jsonArray, response);
	}
	
	//Insert Faculty
	@RequestMapping(value = "/facultyInsert", method = RequestMethod.POST)
	@ResponseBody
	public void facultyInsert(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		session = request.getSession(false);
		int sessionStatus = new EtcMethods().checkSession(session, request);
		String status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
		String alert = "0";
		
		if(sessionStatus == 0 && !session.getAttribute("role").toString().equals("1") && !session.getAttribute("role").toString().equals("3")) {
			
			String name = request.getParameter("faculty_name");
			String university_id = request.getParameter("university_id");
			String ip = request.getParameter("ip");
			
			String user_id = session.getAttribute("id").toString();
			
			if(name != null && university_id != null && ip != null && user_id != null && !name.equals("") && !university_id.equals("") && !university_id.equals("0") && !ip.equals("") && !user_id.equals("")) {
				
				int lastId = new FacultyDAO().insertFaculty(name, university_id);
				
				if(lastId > 0) {
					
					status = "บันทึกข้อมูลเรียบร้อย";
					alert = "1";
					new EventHistoryDAO().insertEventHistory(user_id, "บันทึกข้อมูลคณะรหัส "+lastId, ip);
				}
				
			}
			
		}
		
		JSONObject jsonObject = new JSONObject();
		
		jsonObject.put("status", status);
		jsonObject.put("alert", alert);
		new EtcMethods().responseJSONObject(jsonObject, response);
		
	}
	
	//Update Faculty
	@RequestMapping(value = "/facultyUpdate", method = RequestMethod.POST)
	@ResponseBody
	public void facultyUpdate(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		session = request.getSession(false);
		int sessionStatus = new EtcMethods().checkSession(session, request);
		String status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
		String alert = "0";
		
		if(sessionStatus == 0 && !session.getAttribute("role").toString().equals("1") && !session.getAttribute("role").toString().equals("3")) {
			
			String name = request.getParameter("faculty_name");
			String faculty_id = request.getParameter("faculty_id");
			String ip = request.getParameter("ip");
			
			String user_id = session.getAttribute("id").toString();
			
			if(name != null && faculty_id != null && ip != null && user_id != null && !name.equals("") && !faculty_id.equals("") && !ip.equals("") && !user_id.equals("")) {
				
				if(new FacultyDAO().updateFaculty(name, faculty_id) == 1) {
					
					status = "แก้ไขข้อมูลเรียบร้อย";
					alert = "1";
					new EventHistoryDAO().insertEventHistory(user_id, "แก้ไขข้อมูลคณะรหัส "+faculty_id, ip);
				}
				
			}
			
		}
		
		JSONObject jsonObject = new JSONObject();
		
		jsonObject.put("status", status);
		jsonObject.put("alert", alert);
		new EtcMethods().responseJSONObject(jsonObject, response);
		
	}
	
	//Delete Faculty
	@RequestMapping(value = "/facultyUpdateStatus", method = RequestMethod.POST)
	@ResponseBody
	public void facultyUpdateStatus(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		session = request.getSession(false);
		int sessionStatus = new EtcMethods().checkSession(session, request);
		String status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
		String alert = "0";
		
		if(sessionStatus == 0 && !session.getAttribute("role").toString().equals("1") && !session.getAttribute("role").toString().equals("3")) {
			
			String faculty_id = request.getParameter("faculty_id");
			String ip = request.getParameter("ip");
			String faculty_status = request.getParameter("status");	
			
			String user_id = session.getAttribute("id").toString();
			
			if(faculty_status != null && !faculty_status.equals("") && faculty_id != null && ip != null && user_id != null && !faculty_id.equals("") && !ip.equals("") && !user_id.equals("")) {
				
				
				if(new FacultyDAO().updateStatusFaculty(faculty_id, faculty_status) == 1) {
					
					status = "อัปเดทสถานะคณะสำเร็จ";
					alert = "1";
					String detail_event = (faculty_status.equals("1"))? "ยืนยันข้อมูลคณะรหัส "+faculty_id: "ยกเลิกการยืนยันข้อมูลคณะรหัส "+faculty_id;
					new EventHistoryDAO().insertEventHistory(user_id, detail_event, ip);
				}
				
			}
			
		}
		
		JSONObject jsonObject = new JSONObject();
		
		jsonObject.put("status", status);
		jsonObject.put("alert", alert);
		new EtcMethods().responseJSONObject(jsonObject, response);
		
	}
	

}
