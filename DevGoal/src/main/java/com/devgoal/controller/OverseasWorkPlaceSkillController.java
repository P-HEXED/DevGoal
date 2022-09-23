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

import com.devgoal.dao.OverseasWorkPlaceSkillDAO;

@Controller
public class OverseasWorkPlaceSkillController {
	
	@RequestMapping(value = "/findSkillByOverseas", method = RequestMethod.POST)
	@ResponseBody
	public void findSkillByOverseas(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		session = request.getSession(false);
		EtcMethods etc = new EtcMethods();
		int sessionStatus = etc.checkSession(session, request);
		JSONArray jsonArray = new JSONArray();
		
		if(sessionStatus == 0 && !session.getAttribute("role").toString().equals("2")) {
			
			String overseas_work_place_id = request.getParameter("overseas_id");
			
			if(overseas_work_place_id != null && !overseas_work_place_id.equals("")) {
				
				ArrayList<HashMap<String, Object>> skillByOverseasId = new OverseasWorkPlaceSkillDAO().querySkillByOverseasId(overseas_work_place_id);
				
				JSONObject jsonObject = null;
				
				for(int i = 0; i < skillByOverseasId.size(); i++) {
					jsonObject = new JSONObject();
					jsonObject.put("detail", skillByOverseasId.get(i).get("detail"));
					jsonObject.put("level", skillByOverseasId.get(i).get("level"));
					
					jsonArray.put(jsonObject);
				}
			}
			
			
		}
		
		new EtcMethods().responseJSONArray(jsonArray, response);
	}

}
