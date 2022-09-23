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

import com.devgoal.dao.PlaceOfInternshipSkillDAO;

@Controller
public class PlaceOfInternshipSkillController {
	
	@RequestMapping(value = "/findSkillByInternship", method = RequestMethod.POST)
	@ResponseBody
	public void findSkillByInternship(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		session = request.getSession(false);
		EtcMethods etc = new EtcMethods();
		int sessionStatus = etc.checkSession(session, request);
		JSONArray jsonArray = new JSONArray();
		
		if(sessionStatus == 0 && !session.getAttribute("role").toString().equals("3")) {
			
			String place_of_internship_id = request.getParameter("internship_id");

			if(place_of_internship_id != null && !place_of_internship_id.equals("")) {
				
				ArrayList<HashMap<String, Object>> skillByInternshipId = new PlaceOfInternshipSkillDAO().querySkillByInternshipId(place_of_internship_id);
				JSONObject jsonObject = null;
				
				for(int i = 0; i < skillByInternshipId.size(); i++) {
					jsonObject = new JSONObject();
					jsonObject.put("detail", skillByInternshipId.get(i).get("detail"));
					jsonObject.put("level", skillByInternshipId.get(i).get("level"));
					jsonArray.put(jsonObject);
				}
			}
			
			
		}
		
		new EtcMethods().responseJSONArray(jsonArray, response);
	}

}
