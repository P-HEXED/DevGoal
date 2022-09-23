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
import org.springframework.web.servlet.ModelAndView;

import com.devgoal.dao.CriterionDAO;
import com.devgoal.dao.EventHistoryDAO;
import com.devgoal.dao.UserDAO;

@Controller
public class CriterionController {
	
	@RequestMapping(value = "/dynamicForm", method = RequestMethod.GET)
	public ModelAndView dynamicForm(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");
		
		session = request.getSession(false); 
		int sessionStatus = new EtcMethods().checkSession(session, request);
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("2")) {
			
			return new ModelAndView("role2/dynamic_form");
			
		} else {
			return new ModelAndView("404");
		}
	}
	
	
	
	@RequestMapping(value = "/insertCriterion", method = RequestMethod.POST)
	@ResponseBody
	public void insertCriterion(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		EtcMethods etc = new EtcMethods();

		session = request.getSession(false);
		int sessionStatus = etc.checkSession(session, request);
		String status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
		String alert = "0";

		if (sessionStatus == 0 && session.getAttribute("role").toString().equals("2")) {

			String role2_id = session.getAttribute("id").toString();
			String nameCriterion = request.getParameter("name_criterion");
			String scoreCriterion = request.getParameter("score_riterion");
			String ip = request.getParameter("ip");

			if (role2_id != null && !role2_id.equals("") && nameCriterion != null && !nameCriterion.equals("") && Integer.parseInt(scoreCriterion) > 0 && scoreCriterion != null && !scoreCriterion.equals("") && ip != null && !ip.equals("")) {

				int lastCriterionId = new CriterionDAO().insertCriterion(nameCriterion, scoreCriterion, role2_id);
				
				if(lastCriterionId > 0) {
					status = "บันทึกเกณฑ์การประเมินสำเร็จ";
					alert = "1";
					
					new EventHistoryDAO().insertEventHistory(role2_id, "บันทึกเกณฑ์การประเมินรหัส "+lastCriterionId, ip);
				}

				
			}

		}

		JSONObject jsonObject = new JSONObject();

		jsonObject.put("status", status);
		jsonObject.put("alert", alert);
		etc.responseJSONObject(jsonObject, response);

	}
	
	
	@RequestMapping(value = "/criterionData", method = RequestMethod.POST)
	@ResponseBody
	public void criterionData(HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		EtcMethods etc = new EtcMethods();

		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = null;

		session = request.getSession(false);
		int sessionStatus = etc.checkSession(session, request);

		if (sessionStatus == 0 && session.getAttribute("role").toString().equals("2")) {

			ArrayList<HashMap<String, Object>> userData = new CriterionDAO().queryCriterionData(session.getAttribute("id").toString());

			for (int i = 0; i < userData.size(); i++) {
				jsonObject = new JSONObject();
				jsonObject.put("detail", userData.get(i).get("detail"));
				jsonObject.put("score", userData.get(i).get("score"));
				jsonObject.put("time_reg", userData.get(i).get("time_reg"));
				jsonObject.put("criterion_id", userData.get(i).get("criterion_id"));
				jsonObject.put("status", userData.get(i).get("status"));

				jsonArray.put(jsonObject);
			}
		}

		new EtcMethods().responseJSONArray(jsonArray, response);

	}
	
	@RequestMapping(value = "/updateCriterion", method = RequestMethod.POST)
	@ResponseBody
	public void updateCriterion(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		EtcMethods etc = new EtcMethods();

		session = request.getSession(false);
		int sessionStatus = etc.checkSession(session, request);
		String status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
		String alert = "0";

		if (sessionStatus == 0 && session.getAttribute("role").toString().equals("2")) {

			String role2_id = session.getAttribute("id").toString();
			String idCriterion = request.getParameter("criterion_id");
			String nameCriterion = request.getParameter("detail");
			String scoreCriterion = request.getParameter("score");
			String ip = request.getParameter("ip");

			if (idCriterion != null && !idCriterion.equals("") && role2_id != null && !role2_id.equals("") && nameCriterion != null && !nameCriterion.equals("") && Integer.parseInt(scoreCriterion) > 0 && scoreCriterion != null && !scoreCriterion.equals("") && ip != null && !ip.equals("")) {

				int updateStatus = new CriterionDAO().updateCriterion(nameCriterion, scoreCriterion, idCriterion);
				
				if(updateStatus != -1) {
					status = "แก้ไขเกณฑ์การประเมินสำเร็จ";
					alert = "1";
					
					new EventHistoryDAO().insertEventHistory(role2_id, "แก้ไขเกณฑ์การประเมินรหัส "+idCriterion, ip);
				}

				
			}

		}

		JSONObject jsonObject = new JSONObject();

		jsonObject.put("status", status);
		jsonObject.put("alert", alert);
		etc.responseJSONObject(jsonObject, response);

	}
	
	@RequestMapping(value = "/updateStatusCriterion", method = RequestMethod.POST)
	@ResponseBody
	public void updateStatusCriterion(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		EtcMethods etc = new EtcMethods();

		session = request.getSession(false);
		int sessionStatus = etc.checkSession(session, request);
		String status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
		String alert = "0";

		if (sessionStatus == 0 && session.getAttribute("role").toString().equals("2")) {

			String role2_id = session.getAttribute("id").toString();
			String idCriterion = request.getParameter("criterion_id");
			String statusCriterion = request.getParameter("status");
			String ip = request.getParameter("ip");

			if (idCriterion != null && !idCriterion.equals("") && role2_id != null && !role2_id.equals("") && statusCriterion != null && !statusCriterion.equals("") && ip != null && !ip.equals("")) {
				
				if(statusCriterion.equals("1") || statusCriterion.equals("0")) {
					
					int updateStatusCriterion = new CriterionDAO().updateStatusCriterion(statusCriterion, idCriterion);
					
					if(updateStatusCriterion != -1) {
						status = "แก้ไขสถานนะเกณฑ์การประเมินสำเร็จ";
						alert = "1";
						
						new EventHistoryDAO().insertEventHistory(role2_id, "แก้ไขสถานนะเกณฑ์การประเมินรหัส "+idCriterion, ip);
					}
				}

				
			}

		}

		JSONObject jsonObject = new JSONObject();

		jsonObject.put("status", status);
		jsonObject.put("alert", alert);
		etc.responseJSONObject(jsonObject, response);

	}
	
	
	@RequestMapping(value = "/getCriterionDetail", method = RequestMethod.POST)
	@ResponseBody
	public void getCriterionDetail(HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		EtcMethods etc = new EtcMethods();

		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = null;

		session = request.getSession(false);
		int sessionStatus = etc.checkSession(session, request);

		if (sessionStatus == 0 && session.getAttribute("role").toString().equals("2")) {

			ArrayList<HashMap<String, Object>> userData = new CriterionDAO().queryCriterionDataForSelectOption(session.getAttribute("id").toString());

			for (int i = 0; i < userData.size(); i++) {
				jsonObject = new JSONObject();
				jsonObject.put("criterion_id", userData.get(i).get("criterion_id"));
				jsonObject.put("detail", userData.get(i).get("detail"));

				jsonArray.put(jsonObject);
			}
		}

		new EtcMethods().responseJSONArray(jsonArray, response);

	}
	
	

}
