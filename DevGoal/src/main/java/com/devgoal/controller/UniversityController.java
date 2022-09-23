package com.devgoal.controller;

import java.io.IOException;
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

import com.devgoal.dao.EventHistoryDAO;
import com.devgoal.dao.FacultyDAO;
import com.devgoal.dao.UniversityDAO;

@Controller
public class UniversityController {
	
	@RequestMapping(value = "/findUniversity", method = RequestMethod.POST)
	@ResponseBody
	public void findCourseByFaculty(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		ArrayList<HashMap<String, Object>> university = new UniversityDAO().querySelectOption();
		
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = null;
		
		for(int i = 0; i < university.size(); i++) {
			jsonObject = new JSONObject();
			jsonObject.put("university_id", university.get(i).get("university_id"));
			jsonObject.put("name", university.get(i).get("name"));
			
			jsonArray.put(jsonObject);
		}
		
		new EtcMethods().responseJSONArray(jsonArray, response);
	}
	
	@RequestMapping(value = "/findUniversityData", method = RequestMethod.POST)
	@ResponseBody
	public void findUniversityData(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		ArrayList<HashMap<String, Object>> university = new UniversityDAO().queryUniversityData();
		
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = null;
		String[] address = {};
		
		for(int i = 0; i < university.size(); i++) {
			jsonObject = new JSONObject();
			jsonObject.put("university_id", university.get(i).get("university_id"));
			jsonObject.put("name", university.get(i).get("name"));
			jsonObject.put("sort_name", university.get(i).get("sort_name"));
			address = university.get(i).get("address").toString().split("\\s+");
			
			for(int j = 0; j < address.length; j++) {
				jsonObject.put("address"+(j+1), address[j]);
			}
			jsonObject.put("time_reg", university.get(i).get("time_reg"));
			jsonObject.put("status", university.get(i).get("status"));
			
			jsonArray.put(jsonObject);
			
		}
		
		new EtcMethods().responseJSONArray(jsonArray, response);
	}
	
	//Insert University
	@RequestMapping(value = "/universityInsert", method = RequestMethod.POST)
	@ResponseBody
	public void universityInsert(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		session = request.getSession(false);
		int sessionStatus = new EtcMethods().checkSession(session, request);
		String status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
		String alert = "0";
		
		if(sessionStatus == 0 && !session.getAttribute("role").toString().equals("1") && !session.getAttribute("role").toString().equals("3")) {
			
			String name = request.getParameter("university_name");
			String short_name = request.getParameter("short_name");
			String address1 = request.getParameter("address1");
			String address2 = request.getParameter("address2");
			String address3 = request.getParameter("address3");
			String address4 = request.getParameter("address4");
			String address5 = request.getParameter("address5");
			String ip = request.getParameter("ip");
			
			String user_id = session.getAttribute("id").toString();
			
			if(name != null && short_name != null && ip != null && user_id != null && address1 != null && address2 != null && address3 != null && address4 != null && address5 != null && !name.equals("") && !short_name.equals("") && !ip.equals("") && !user_id.equals("") && !address1.equals("") && !address2.equals("") && !address3.equals("") && !address4.equals("") && !address5.equals("")) {
				
				String address = address1+" "+address2+" "+address3+" "+address4+" "+address5;
				
				int lastId = new UniversityDAO().insertUniversity(name, short_name, address);
				
				
				if(lastId > 0) {
					
					status = "บันทึกข้อมูลเรียบร้อย";
					alert = "1";
					new EventHistoryDAO().insertEventHistory(user_id, "บันทึกข้อมูลมหาวิทยาลัยรหัส "+lastId, ip);
				}
				
			}
			
		}
		
		JSONObject jsonObject = new JSONObject();
		
		jsonObject.put("status", status);
		jsonObject.put("alert", alert);
		new EtcMethods().responseJSONObject(jsonObject, response);
		
	}
	
	//Update University
	@RequestMapping(value = "/universityUpdate", method = RequestMethod.POST)
	@ResponseBody
	public void universityUpdate(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		session = request.getSession(false);
		int sessionStatus = new EtcMethods().checkSession(session, request);
		String status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
		String alert = "0";
		
		if(sessionStatus == 0 && !session.getAttribute("role").toString().equals("1") && !session.getAttribute("role").toString().equals("3")) {
			
			String university_id = request.getParameter("university_id");
			String name = request.getParameter("university_name");
			String short_name = request.getParameter("short_name");
			String address1 = request.getParameter("address1");
			String address2 = request.getParameter("address2");
			String address3 = request.getParameter("address3");
			String address4 = request.getParameter("address4");
			String address5 = request.getParameter("address5");
			String ip = request.getParameter("ip");
			
			String user_id = session.getAttribute("id").toString();
			
			if(university_id != null && name != null && short_name != null && address1 != null && address2 != null && address3 != null && address4 != null && address5 != null && ip != null && user_id != null && !university_id.equals("") && !name.equals("") && !short_name.equals("") && !address1.equals("") && !address2.equals("") && !address3.equals("") && !address4.equals("") && !address5.equals("") && !ip.equals("") && !user_id.equals("")) {
				
				String address = address1+" "+address2+" "+address3+" "+address4+" "+address5;
				
				if(new UniversityDAO().updateUniversity(university_id, name, short_name, address) == 1) {
					
					status ="แก้ไขข้อมูลเรียบร้อย";
					alert = "1";
					new EventHistoryDAO().insertEventHistory(user_id, "แก้ไขข้อมูลมหาวิทยาลัยรหัส "+university_id, ip);
					
				}
				
			}
			
		}
		
		JSONObject jsonObject = new JSONObject();
		
		jsonObject.put("status", status);
		jsonObject.put("alert", alert);
		new EtcMethods().responseJSONObject(jsonObject, response);
		
	}
	
	//Delete University
	@RequestMapping(value = "/universityUpdateStatus", method = RequestMethod.POST)
	@ResponseBody
	public void universityUpdateStatus(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		session = request.getSession(false);
		int sessionStatus = new EtcMethods().checkSession(session, request);
		String status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
		String alert = "0";
		
		if(sessionStatus == 0 && !session.getAttribute("role").toString().equals("1") && !session.getAttribute("role").toString().equals("3")) {
			
			String university_id = request.getParameter("university_id");
			String ip = request.getParameter("ip");
			String university_status = request.getParameter("status");	
			
			String user_id = session.getAttribute("id").toString();
			
			if(university_status != null && !university_status.equals("") && university_id != null && ip != null && user_id != null && !university_id.equals("") && !ip.equals("") && !user_id.equals("")) {
				
				if(new UniversityDAO().UpdateStatusUniversity(university_id, university_status) == 1) {
					
					status = "อัปเดทสถานะมหาวิทยาลัยสำเร็จ";
					alert = "1";
					String detail_event = (university_status.equals("1"))? "ยืนยันข้อมูลมหาวิทยาลัยรหัส "+university_id: "ยกเลิกการยืนยันข้อมูลมหาวิทยาลัยรหัส "+university_id;
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
