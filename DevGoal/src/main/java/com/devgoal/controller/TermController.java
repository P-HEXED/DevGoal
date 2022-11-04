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

import com.devgoal.dao.EventHistoryDAO;
import com.devgoal.dao.TermDAO;

@Controller
public class TermController {
	
	@RequestMapping(value = "/termManagement", method = RequestMethod.GET)
	public ModelAndView termManagement(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");
		
		session = request.getSession(false); 
		int sessionStatus = new EtcMethods().checkSession(session, request);
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("4")) {
			
			return new ModelAndView("role4/term_management");
			
		} else {
			return new ModelAndView("404");
		}
	}
	
	@RequestMapping(value = "/findTerm", method = RequestMethod.POST)
	@ResponseBody
	public void findTerm(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		session = request.getSession(false);
		EtcMethods etc = new EtcMethods();
		int sessionStatus = etc.checkSession(session, request);
		JSONArray jsonArray = new JSONArray();
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("4")) {
			
			ArrayList<HashMap<String, Object>> term = new TermDAO().queryTerm();
			
			JSONObject jsonObject = null;
			
			for(int i = 0; i < term.size(); i++) {
				jsonObject = new JSONObject();
				jsonObject.put("term_id", term.get(i).get("term_id"));
				jsonObject.put("year", term.get(i).get("year"));
				jsonObject.put("term_no", term.get(i).get("term_no"));
				jsonObject.put("begin_date", term.get(i).get("begin_date"));
				jsonObject.put("end_date", term.get(i).get("end_date"));
				jsonObject.put("status", term.get(i).get("status"));
				
				jsonArray.put(jsonObject);
			}
			
		}
		
		new EtcMethods().responseJSONArray(jsonArray, response);
		
		
	}
	
	@RequestMapping(value = "/termInsert", method = RequestMethod.POST)
	@ResponseBody
	public void termInsert(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		session = request.getSession(false);
		int sessionStatus = new EtcMethods().checkSession(session, request);
		String status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
		String alert = "0";
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("4")) {
			
			String year = request.getParameter("year");
			String term = request.getParameter("term");
			String begin_date = request.getParameter("begin_date");
			String end_date = request.getParameter("end_date");
			String ip = request.getParameter("ip");
			
			String user_id = session.getAttribute("id").toString();
			
			if(year != null && !year.equals("") && !year.equals("0") && term != null && !term.equals("") && !term.equals("0") && begin_date != null && !begin_date.equals("") && end_date != null && !end_date.equals("") && ip != null && !ip.equals("")) {
				
				if(new TermDAO().checkDuplicateterm(year, term).get("term_id") == null) {
					
					int last_id = new TermDAO().insertTerm(year, term, begin_date, end_date);
					
					if(last_id != -1) {
						
						status = "เพิ่มข้อมูลเรียบร้อย";
						alert = "1";
						
						new EventHistoryDAO().insertEventHistory(user_id, "เพิ่มข้อมูลเทอมรหัส "+ last_id, ip);
					}
					
				} else {
					
					status = "มีข้อมูลเทอมนี้อยู่แล้ว";
					alert = "2";
					
				}
				
				
			}
			
		}
		
		JSONObject jsonObject = new JSONObject();
		
		jsonObject.put("status", status);
		jsonObject.put("alert", alert);
		new EtcMethods().responseJSONObject(jsonObject, response);
		
	}
	
	@RequestMapping(value = "/termUpdate", method = RequestMethod.POST)
	@ResponseBody
	public void termUpdate(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		session = request.getSession(false);
		int sessionStatus = new EtcMethods().checkSession(session, request);
		String status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
		String alert = "0";
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("4")) {
			
			String year = request.getParameter("year");
			String term = request.getParameter("term");
			String term_id = request.getParameter("term_id");
			String begin_date = request.getParameter("begin_date");
			String end_date = request.getParameter("end_date");
			String ip = request.getParameter("ip");
			
			String user_id = session.getAttribute("id").toString();
			
			if(year != null && !year.equals("") && !year.equals("0") && term != null && !term.equals("") && !term.equals("0") && begin_date != null && !begin_date.equals("") && end_date != null && !end_date.equals("") && ip != null && !ip.equals("") && term_id != null && !term_id.equals("")) {
				
					
				int updateStatus = new TermDAO().updateTerm(year, term, begin_date, end_date, term_id);
				
				if(updateStatus != -1) {
					
					status = "แก้ไขข้อมูลเรียบร้อย";
					alert = "1";
					
					new EventHistoryDAO().insertEventHistory(user_id, "แก้ไขข้อมูลเทอมรหัส "+ term_id, ip);
				}
				
			}
			
		}
		
		JSONObject jsonObject = new JSONObject();
		
		jsonObject.put("status", status);
		jsonObject.put("alert", alert);
		new EtcMethods().responseJSONObject(jsonObject, response);
		
	}

}
