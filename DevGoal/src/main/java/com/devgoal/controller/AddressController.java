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

import com.devgoal.dao.AmphuresDAO;
import com.devgoal.dao.DistrictsDAO;
import com.devgoal.dao.ProvincesDAO;

@Controller
public class AddressController {
	
	@RequestMapping(value = "/findProvinces", method = RequestMethod.POST)
	@ResponseBody
	public void findProvinces(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		ArrayList<HashMap<String, Object>> provinces = new ProvincesDAO().queryProvinces();
		
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = null;
		
		for(int i = 0; i < provinces.size(); i++) {
			jsonObject = new JSONObject();
			jsonObject.put("province_id", provinces.get(i).get("province_id"));
			jsonObject.put("province_name", provinces.get(i).get("name_th"));
			
			jsonArray.put(jsonObject);
		}
		
		new EtcMethods().responseJSONArray(jsonArray, response);
		
		
	}
	
	@RequestMapping(value = "/findAmphure", method = RequestMethod.POST)
	@ResponseBody
	public void findAmphure(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		String province_id = request.getParameter("province_id");
		
		if(province_id != null && !province_id.equals("")) {
			
			ArrayList<HashMap<String, Object>> amphure = new AmphuresDAO().queryAmphures(province_id);
			
			JSONArray jsonArray = new JSONArray();
			JSONObject jsonObject = null;
			
			for(int i = 0; i < amphure.size(); i++) {
				jsonObject = new JSONObject();
				jsonObject.put("amphure_id", amphure.get(i).get("amphure_id"));
				jsonObject.put("amphure_name", amphure.get(i).get("name_th"));
				
				jsonArray.put(jsonObject);
			}
			
			new EtcMethods().responseJSONArray(jsonArray, response);
			
		}
		
		
	}
	
	@RequestMapping(value = "/findDistricts", method = RequestMethod.POST)
	@ResponseBody
	public void findDistricts(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		String amphure_id = request.getParameter("amphure_id");
		
		if(amphure_id != null && !amphure_id.equals("")) {
			
			ArrayList<HashMap<String, Object>> districts = new DistrictsDAO().queryDistricts(amphure_id);
			
			JSONArray jsonArray = new JSONArray();
			JSONObject jsonObject = null;
			
			for(int i = 0; i < districts.size(); i++) {
				jsonObject = new JSONObject();
				jsonObject.put("zip_code", districts.get(i).get("zip_code"));
				jsonObject.put("districts_name", districts.get(i).get("name_th"));
				
				jsonArray.put(jsonObject);
			}
			
			new EtcMethods().responseJSONArray(jsonArray, response);
			
		}
		
		
	}

}
