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
import org.springframework.web.servlet.ModelAndView;

import com.devgoal.dao.CourseDAO;
import com.devgoal.dao.EventHistoryDAO;
import com.devgoal.dao.SkillDAO;

@Controller
public class SkillController {
	
	@RequestMapping(value = "/findSkill", method = RequestMethod.POST)
	@ResponseBody
	public void findSkill(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
			
		ArrayList<HashMap<String, Object>> skill = new SkillDAO().querySkill();
		
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = null;
		
		for(int i = 0; i < skill.size(); i++) {
			jsonObject = new JSONObject();
			jsonObject.put("detail", skill.get(i).get("detail"));
			
			jsonArray.put(jsonObject);
		}
		
		new EtcMethods().responseJSONArray(jsonArray, response);
		
		
	}
	
	@RequestMapping(value = "/skillManagement", method = RequestMethod.GET)
	public ModelAndView skillManagement(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");
		
		session = request.getSession(false); 
		int sessionStatus = new EtcMethods().checkSession(session, request);
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("4")) {
			
			return new ModelAndView("role4/skill_management");
			
		} else {
			return new ModelAndView("404");
		}
	}
	
	@RequestMapping(value = "/skillInsert", method = RequestMethod.POST)
	@ResponseBody
	public void skillInsert(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		session = request.getSession(false);
		int sessionStatus = new EtcMethods().checkSession(session, request);
		String status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
		String alert = "0";
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("4")) {
			
			String skill = request.getParameter("skill");
			String ip = request.getParameter("ip");
			
			String user_id = session.getAttribute("id").toString();
			
			if(skill != null && !skill.equals("") && ip != null && !ip.equals("")) {
				
				if(new SkillDAO().checkDuplicateSkill(skill).get("skill_id") == null) {
					
					int skillInsertStatus = -1;
					
					for(int i = 1; i <= 3; i++) {
						
						skillInsertStatus = new SkillDAO().insertSkill(skill, Integer.toString(i));
					}
					
					
					if(skillInsertStatus != -1) {
						
						status = "เพิ่มข้อมูลเรียบร้อย";
						alert = "1";
						new EventHistoryDAO().insertEventHistory(user_id, "เพิ่มข้อมูลทักษะความสามารถรหัส "+ (skillInsertStatus - 2) +", "+ (skillInsertStatus - 1)+", "+ skillInsertStatus, ip);
					}
					
				} else {
					
					status = "มีข้อมูลทักษะความสามารถนี้อยู่แล้ว";
					alert = "2";
					
				}
				
				
			}
			
		}
		
		JSONObject jsonObject = new JSONObject();
		
		jsonObject.put("status", status);
		jsonObject.put("alert", alert);
		new EtcMethods().responseJSONObject(jsonObject, response);
		
	}
	
	@RequestMapping(value = "/findAllSkill", method = RequestMethod.POST)
	@ResponseBody
	public void findAllSkill(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
			
		ArrayList<HashMap<String, Object>> skill = new SkillDAO().queryAllSkill();
		
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = null;
		
		for(int i = 0; i < skill.size(); i++) {
			jsonObject = new JSONObject();
			jsonObject.put("skill_id", skill.get(i).get("skill_id"));
			jsonObject.put("detail", skill.get(i).get("detail"));
			jsonObject.put("status", skill.get(i).get("status"));
			jsonObject.put("time_reg", skill.get(i).get("time_reg"));
			
			jsonArray.put(jsonObject);
		}
		
		new EtcMethods().responseJSONArray(jsonArray, response);
		
		
	}
	
	@RequestMapping(value = "/skillUpdate", method = RequestMethod.POST)
	@ResponseBody
	public void skillUpdate(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		session = request.getSession(false);
		int sessionStatus = new EtcMethods().checkSession(session, request);
		String status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
		String alert = "0";
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("4")) {
			
			String skill_id = request.getParameter("skill_id");
			String skill = request.getParameter("skill");
			String ip = request.getParameter("ip");
			
			String user_id = session.getAttribute("id").toString();
			
			if(skill_id != null && !skill_id.equals("") && skill != null && !skill.equals("") && ip != null && !ip.equals("")) {
				
				if(new SkillDAO().checkDuplicateSkill(skill).get("skill_id") == null) {
					
					ArrayList<HashMap<String, Object>> oldSkillIdList = new SkillDAO().getSkillIdForMultipleUpdate(skill_id);
					
					int skillUpdateStatus = -1;
					
					for(int i = 0; i < oldSkillIdList.size(); i++) {
						
						
						skillUpdateStatus = new SkillDAO().updateSkill(skill, oldSkillIdList.get(i).get("skill_id").toString());
					}

					if(skillUpdateStatus != -1) {
						
						status = "แก้ไขข้อมูลเรียบร้อย";
						alert = "1";
						new EventHistoryDAO().insertEventHistory(user_id, "แก้ไขข้อมูลทักษะความสามารถรหัส "+ (oldSkillIdList.get(0).get("skill_id").toString()) +", "+ (oldSkillIdList.get(1).get("skill_id").toString())+", "+ oldSkillIdList.get(2).get("skill_id").toString(), ip);
					}
					
				} else {
					
					status = "มีข้อมูลทักษะความสามารถนี้อยู่แล้ว";
					alert = "2";
				}
				
				
			}
			
		}
		
		JSONObject jsonObject = new JSONObject();
		
		jsonObject.put("status", status);
		jsonObject.put("alert", alert);
		new EtcMethods().responseJSONObject(jsonObject, response);
		
	}
	
	@RequestMapping(value = "/skillUpdateStatus", method = RequestMethod.POST)
	@ResponseBody
	public void skillUpdateStatus(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		session = request.getSession(false);
		int sessionStatus = new EtcMethods().checkSession(session, request);
		String status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
		String alert = "0";
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("4")) {
			
			String skill_id = request.getParameter("skill_id");
			String ip = request.getParameter("ip");
			String skill_status = request.getParameter("status");	
			
			String user_id = session.getAttribute("id").toString();
			
			if(skill_status != null && !skill_status.equals("") && skill_id != null && ip != null && !skill_id.equals("") && !ip.equals("")) {
				
				ArrayList<HashMap<String, Object>> skillIdList = new SkillDAO().getSkillIdForMultipleUpdate(skill_id);
				
				int skillUpdateStatus = -1;
				
				for(int i = 0; i < skillIdList.size(); i++) {
					
					
					skillUpdateStatus = new SkillDAO().updateStatusSkill(skill_status, skillIdList.get(i).get("skill_id").toString());
				}
				
				if(skillUpdateStatus != -1) {
					
					status = "อัปเดทสถานะทักษะความสามารถสำเร็จ";
					alert = "1";
					String detail_event = (skill_status.equals("1"))? "ยืนยันข้อมูลทักษะความสามารถรหัส "+ skillIdList.get(0).get("skill_id").toString() + ", " + skillIdList.get(1).get("skill_id").toString() +", "+ skillIdList.get(2).get("skill_id").toString(): "ยกเลิกการยืนยันข้อมูลทักษะความสามารถรหัส "+skillIdList.get(0).get("skill_id").toString() + ", " + skillIdList.get(1).get("skill_id").toString() +", "+ skillIdList.get(2).get("skill_id").toString();
					
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
