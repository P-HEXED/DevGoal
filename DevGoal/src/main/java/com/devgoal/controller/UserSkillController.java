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

import com.devgoal.dao.EventHistoryDAO;
import com.devgoal.dao.SkillDAO;
import com.devgoal.dao.UserDAO;
import com.devgoal.dao.UserSkillDAO;

@Controller
public class UserSkillController {
	
	@RequestMapping(value = "/findSkillByUser", method = RequestMethod.POST)
	@ResponseBody
	public void findSkillByUser(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		JSONArray jsonArray = new JSONArray();
		
			String user_id = request.getParameter("user_id");
			
			if(user_id != null && !user_id.equals("")) {
				
				ArrayList<HashMap<String, Object>> skillByUserId = new UserSkillDAO().queryUserSkillByUserId(user_id);

				JSONObject jsonObject = null;
				
				for(int i = 0; i < skillByUserId.size(); i++) {
					jsonObject = new JSONObject();
					jsonObject.put("detail", skillByUserId.get(i).get("detail"));
					jsonObject.put("level", skillByUserId.get(i).get("level"));
					
					jsonArray.put(jsonObject);
				}
			}
			
			
		
		new EtcMethods().responseJSONArray(jsonArray, response);
	}
	
	@RequestMapping(value = "/updateUserSkill", method = RequestMethod.POST)
	@ResponseBody
	public void updateUserSkill(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		EtcMethods etc = new EtcMethods();
		
		session = request.getSession(false);
		int sessionStatus = etc.checkSession(session, request);
		String status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
		String alert = "0";
		
		if(sessionStatus == 0) {
			String user_id = session.getAttribute("id").toString();
			String skill = request.getParameter("skill");
			String ip = request.getParameter("ip");
			
			if(user_id != null && !user_id.equals("") && skill != null && !skill.equals("") && ip != null && !ip.equals("")) {
				ArrayList<HashMap<String, String>> skillData = etc.checkSkill(skill);
				ArrayList<String> userSkillID = new SkillDAO().checkInsertDuplicateSkill(skillData);
				
				UserSkillDAO userSkillDAO = new UserSkillDAO();
				
				int deleteStatus = userSkillDAO.deleteUserSkillByUserId(user_id);
				int insertStatus = -1;
				
				for(int i = 0; i < userSkillID.size(); i++) {
					
					insertStatus = userSkillDAO.insertUserSkill(user_id, userSkillID.get(i));
				}
				
				if(deleteStatus > 0) {
					
					status = "แก้ไขข้อมูลความสามารถเรียบร้อย";
					alert = "1";
					new EventHistoryDAO().insertEventHistory(user_id, "แก้ไขข้อมูลความสามารถ", ip);
				}
				
				if(insertStatus > 0) {
					
					status = "แก้ไขข้อมูลความสามารถเรียบร้อย";
					alert = "1";
					new EventHistoryDAO().insertEventHistory(user_id, "แก้ไขข้อมูลความสามารถ", ip);
				}
				
			}
		}
		
		JSONObject jsonObject = new JSONObject();
		
		jsonObject.put("status", status);
		jsonObject.put("alert", alert);
		etc.responseJSONObject(jsonObject, response);
		
	}
	
	@RequestMapping(value = "/findSkillBySessionUserId", method = RequestMethod.POST)
	@ResponseBody
	public void findSkillBySessionUserId(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		JSONArray jsonArray = new JSONArray();
		EtcMethods etc = new EtcMethods();
		
		session = request.getSession(false);
		int sessionStatus = etc.checkSession(session, request);
			
			if(sessionStatus == 0 && session.getAttribute("role").toString().equals("1")) {
				
				ArrayList<HashMap<String, Object>> skillByUserId = new UserSkillDAO().queryUserSkillByUserId(session.getAttribute("id").toString());

				JSONObject jsonObject = null;
				
				for(int i = 0; i < skillByUserId.size(); i++) {
					jsonObject = new JSONObject();
					jsonObject.put("detail", skillByUserId.get(i).get("detail"));
					jsonObject.put("level", skillByUserId.get(i).get("level"));
					
					jsonArray.put(jsonObject);
				}
			}
			
			
		
		new EtcMethods().responseJSONArray(jsonArray, response);
	}

}
