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

import com.devgoal.dao.ResultInternshipDetDAO;

@Controller
public class ResultInternshipDetController {
	
	@RequestMapping(value = "/getCriterionFormData", method = RequestMethod.POST)
	@ResponseBody
	public void getCriterionFormData(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		session = request.getSession(false);
		EtcMethods etc = new EtcMethods();
		int sessionStatus = etc.checkSession(session, request);
		JSONArray jsonArray = new JSONArray();
		ArrayList<HashMap<String, Object>> resultInternshipForm = null;
		JSONObject jsonObject = null;
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("2")) {
			
			String result_internship_id = request.getParameter("result_internship_id");
			
			if(result_internship_id != null && !result_internship_id.equals("")) {
				
				resultInternshipForm = new ResultInternshipDetDAO().queryResultInternshipDetForm(result_internship_id);
				
				for(int i = 0; i < resultInternshipForm.size(); i++) {
					jsonObject = new JSONObject();
					jsonObject.put("detail", resultInternshipForm.get(i).get("detail"));
					jsonObject.put("input_type", resultInternshipForm.get(i).get("input_type"));

					jsonArray.put(jsonObject);
					
				}
			}
			
		}
		
		new EtcMethods().responseJSONArray(jsonArray, response);
	}
	

}
