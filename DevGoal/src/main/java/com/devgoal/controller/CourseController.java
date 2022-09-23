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

@Controller
public class CourseController {
	
	//Find course by faculty_id
	@RequestMapping(value = "/findCourseByFaculty", method = RequestMethod.POST)
	@ResponseBody
	public void findCourseByFaculty(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		String faculty_id = request.getParameter("faculty_id");
		
		if(faculty_id != null && !faculty_id.equals("")) {
			
			ArrayList<HashMap<String, Object>> course = new CourseDAO().querySelectOption(faculty_id);
			
			JSONArray jsonArray = new JSONArray();
			JSONObject jsonObject = null;
			
			for(int i = 0; i < course.size(); i++) {
				jsonObject = new JSONObject();
				jsonObject.put("course_id", course.get(i).get("course_id"));
				jsonObject.put("name", course.get(i).get("name"));
				
				jsonArray.put(jsonObject);
			}
			
			new EtcMethods().responseJSONArray(jsonArray, response);
		}
		
		
	}
	
	@RequestMapping(value = "/findCourseData", method = RequestMethod.POST)
	@ResponseBody
	public void findCourseData(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		ArrayList<HashMap<String, Object>> course = new CourseDAO().queryCourseData();
		
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = null;
		
		for(int i = 0; i < course.size(); i++) {
			jsonObject = new JSONObject();
			jsonObject.put("university_name", course.get(i).get("university_name"));
			jsonObject.put("faculty_name", course.get(i).get("faculty_name"));
			jsonObject.put("course_id", course.get(i).get("course_id"));
			jsonObject.put("course_name", course.get(i).get("course_name"));
			jsonObject.put("time_reg", course.get(i).get("time_reg"));
			jsonObject.put("status", course.get(i).get("status"));
			
			jsonArray.put(jsonObject);
			
		}
		
		new EtcMethods().responseJSONArray(jsonArray, response);
	}
	
	//Insert Course
	@RequestMapping(value = "/courseInsert", method = RequestMethod.POST)
	@ResponseBody
	public void courseInsert(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		session = request.getSession(false);
		int sessionStatus = new EtcMethods().checkSession(session, request);
		String status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
		String alert = "0";
		
		if(sessionStatus == 0 && !session.getAttribute("role").toString().equals("1") && !session.getAttribute("role").toString().equals("3")) {
			
			String name = request.getParameter("course_name");
			String faculty_id = request.getParameter("faculty_id");
			String ip = request.getParameter("ip");
			
			String user_id = session.getAttribute("id").toString();
			
			if(name != null && faculty_id != null && ip != null && user_id != null && !name.equals("") && !faculty_id.equals("") && !faculty_id.equals("0") && !ip.equals("") && !user_id.equals("")) {
				int lastId = new CourseDAO().insertCourse(name, faculty_id);
				
				if(lastId > 0) {
					
					status = "บันทึกข้อมูลเรียบร้อย";
					alert = "1";
					new EventHistoryDAO().insertEventHistory(user_id, "บันทึกข้อมูลหลักสูตรรหัส "+lastId, ip);
				}
				
			}
			
		}
		
		JSONObject jsonObject = new JSONObject();
		
		jsonObject.put("status", status);
		jsonObject.put("alert", alert);
		new EtcMethods().responseJSONObject(jsonObject, response);
		
	}
	
	//Update Course
	@RequestMapping(value = "/courseUpdate", method = RequestMethod.POST)
	@ResponseBody
	public void courseUpdate(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		session = request.getSession(false);
		int sessionStatus = new EtcMethods().checkSession(session, request);
		String status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
		String alert = "0";
		
		if(sessionStatus == 0 && !session.getAttribute("role").toString().equals("1") && !session.getAttribute("role").toString().equals("3")) {
			
			String name = request.getParameter("course_name");
			String course_id = request.getParameter("course_id");
			String ip = request.getParameter("ip");
			
			String user_id = session.getAttribute("id").toString();
			
			if(name != null && course_id != null && ip != null && user_id != null && !name.equals("") && !course_id.equals("") && !ip.equals("") && !user_id.equals("")) {
				
				if(new CourseDAO().updateCourse(name, course_id) == 1) {
					
					status = "แก้ไขข้อมูลเรียบร้อย";
					alert = "1";
					new EventHistoryDAO().insertEventHistory(user_id, "แก้ไขข้อมูลหลักสูตรรหัส "+course_id, ip);
				}
				
			}
			
		}
		
		JSONObject jsonObject = new JSONObject();
		
		jsonObject.put("status", status);
		jsonObject.put("alert", alert);
		new EtcMethods().responseJSONObject(jsonObject, response);
		
	}
	
	//Delete Course
	@RequestMapping(value = "/courseUpdateStatus", method = RequestMethod.POST)
	@ResponseBody
	public void courseUpdateStatus(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		session = request.getSession(false);
		int sessionStatus = new EtcMethods().checkSession(session, request);
		String status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
		String alert = "0";
		
		if(sessionStatus == 0 && !session.getAttribute("role").toString().equals("1") && !session.getAttribute("role").toString().equals("3")) {
			
			String course_id = request.getParameter("course_id");
			String ip = request.getParameter("ip");
			String course_status = request.getParameter("status");	
			
			String user_id = session.getAttribute("id").toString();
			
			if(course_status != null && !course_status.equals("") && course_id != null && ip != null && user_id != null && !course_id.equals("") && !ip.equals("") && !user_id.equals("")) {
				
				
				if(new CourseDAO().updateStatusCourse(course_id, course_status) == 1) {
					
					status = "อัปเดทสถานะหลักสูตรสำเร็จ";
					alert = "1";
					String detail_event = (course_status.equals("1"))? "ยืนยันข้อมูลหลักสูตรรหัส "+course_id: "ยกเลิกการยืนยันข้อมูลหลักสูตรรหัส "+course_id;
					
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
