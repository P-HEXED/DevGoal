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

import com.devgoal.dao.AssessmentInternshipDAO;
import com.devgoal.dao.AssessmentInternshipDetDAO;
import com.devgoal.dao.EventHistoryDAO;
import com.devgoal.dao.ResultInternshipDAO;
import com.devgoal.dao.ResultInternshipDetDAO;

@Controller
public class ResultInternshipController {
	
	@RequestMapping(value = "/insertInternshipCriterionForm", method = RequestMethod.POST)
	@ResponseBody
	public void insertInternshipCriterionForm(HttpSession session, HttpServletRequest request, HttpServletResponse response)
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
			String criterionData = request.getParameter("criterion_data");
			String result_internship_name = request.getParameter("result_internship_name");
			String ip = request.getParameter("ip");
			String form_type = request.getParameter("form_type");

			if (form_type != null && !form_type.equals("") && !form_type.equals("0") && result_internship_name != null && !result_internship_name.equals("") && role2_id != null && !role2_id.equals("") && criterionData != null && !criterionData.equals("") && ip != null && !ip.equals("")) {
				
				if(form_type.equals("1") || form_type.equals("2")) {
					
					int lastResultInternshipId = new ResultInternshipDAO().insertResultInternship(role2_id, result_internship_name, form_type);
					
					if(lastResultInternshipId > 0) {
						
						JSONArray jsonArray = new JSONArray(criterionData);
						
						int insertStatus = 0;
						
						for (int i = 0; i < jsonArray.length(); i++) {
							
							insertStatus = new ResultInternshipDetDAO().insertResultInternshipDet(Integer.toString(lastResultInternshipId), jsonArray.getJSONArray(i).get(0).toString(), jsonArray.getJSONArray(i).get(1).toString());
							
						}
						
						if(insertStatus == 1) {
							
							status = "บันทึกแบบฟอร์มการประเมินสำเร็จ";
							alert = "1";
							
							new EventHistoryDAO().insertEventHistory(role2_id, "บันทึกแบบฟอร์มการประเมินรหัส "+lastResultInternshipId, ip);
							
						}
						
					}
					
				}
				
				
				
			}

		}

		JSONObject jsonObject = new JSONObject();

		jsonObject.put("status", status);
		jsonObject.put("alert", alert);
		etc.responseJSONObject(jsonObject, response);

	}
	
	
	@RequestMapping(value = "/getResultInternshipForm", method = RequestMethod.POST)
	@ResponseBody
	public void getResultInternshipForm(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		session = request.getSession(false);
		EtcMethods etc = new EtcMethods();
		int sessionStatus = etc.checkSession(session, request);
		JSONArray jsonArray = new JSONArray();
		ArrayList<HashMap<String, Object>> resultInternshipForm = null;
		JSONObject jsonObject = null;
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("2")) {
			
			resultInternshipForm = new ResultInternshipDAO().queryResultInternshipForm(session.getAttribute("id").toString());
			
			for(int i = 0; i < resultInternshipForm.size(); i++) {
				jsonObject = new JSONObject();
				jsonObject.put("result_internship_id", resultInternshipForm.get(i).get("result_internship_id"));
				jsonObject.put("result_internship_name", resultInternshipForm.get(i).get("result_internship_name"));
				jsonObject.put("time_reg", resultInternshipForm.get(i).get("time_reg"));
				jsonObject.put("status", resultInternshipForm.get(i).get("status"));
				jsonObject.put("type", resultInternshipForm.get(i).get("type"));

				jsonArray.put(jsonObject);
				
			}
			
		}
		
		new EtcMethods().responseJSONArray(jsonArray, response);
	}
	
	
	@RequestMapping(value = "/updateStatusCriterionForm", method = RequestMethod.POST)
	@ResponseBody
	public void updateStatusCriterionForm(HttpSession session, HttpServletRequest request, HttpServletResponse response)
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
			String result_internship_id = request.getParameter("result_internship_id");
			String statusCriterion = request.getParameter("status");
			String ip = request.getParameter("ip");

			if (result_internship_id != null && !result_internship_id.equals("") && role2_id != null && !role2_id.equals("") && statusCriterion != null && !statusCriterion.equals("") && ip != null && !ip.equals("")) {
				
				if(statusCriterion.equals("1") || statusCriterion.equals("0")) {
					
					int updateStatusCriterionForm = new ResultInternshipDAO().updateStatusResultInternshipForm(statusCriterion, result_internship_id);
					
					if(updateStatusCriterionForm != -1) {
						status = "แก้ไขสถานนะแบบฟอร์มเกณฑ์การประเมินสำเร็จ";
						alert = "1";
						
						new EventHistoryDAO().insertEventHistory(role2_id, "แก้ไขสถานนะแบบฟอร์มเกณฑ์การประเมินรหัส "+result_internship_id, ip);
					}
				}

				
			}

		}

		JSONObject jsonObject = new JSONObject();

		jsonObject.put("status", status);
		jsonObject.put("alert", alert);
		etc.responseJSONObject(jsonObject, response);

	}
	
	
	@RequestMapping(value = "/getResultInternshipFormName", method = RequestMethod.POST)
	@ResponseBody
	public void getResultInternshipFormName(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		session = request.getSession(false);
		EtcMethods etc = new EtcMethods();
		int sessionStatus = etc.checkSession(session, request);
		JSONArray jsonArray = new JSONArray();
		ArrayList<HashMap<String, Object>> resultInternshipForm = null;
		JSONObject jsonObject = null;
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("2")) {
			
			resultInternshipForm = new ResultInternshipDAO().queryResultInternshipFormName(session.getAttribute("id").toString());
			
			for(int i = 0; i < resultInternshipForm.size(); i++) {
				jsonObject = new JSONObject();
				jsonObject.put("result_internship_id", resultInternshipForm.get(i).get("result_internship_id"));
				jsonObject.put("result_internship_name", resultInternshipForm.get(i).get("result_internship_name"));

				jsonArray.put(jsonObject);
				
			}
			
		}
		
		new EtcMethods().responseJSONArray(jsonArray, response);
	}
	
	@RequestMapping(value = "/getResultInternshipType1FormName", method = RequestMethod.POST)
	@ResponseBody
	public void getResultInternshipType1FormName(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		session = request.getSession(false);
		EtcMethods etc = new EtcMethods();
		int sessionStatus = etc.checkSession(session, request);
		JSONArray jsonArray = new JSONArray();
		ArrayList<HashMap<String, Object>> resultInternshipForm = null;
		JSONObject jsonObject = null;
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("2")) {
			
			resultInternshipForm = new ResultInternshipDAO().queryResultInternshipType1FormName(session.getAttribute("id").toString());
			
			for(int i = 0; i < resultInternshipForm.size(); i++) {
				jsonObject = new JSONObject();
				jsonObject.put("result_internship_id", resultInternshipForm.get(i).get("result_internship_id"));
				jsonObject.put("result_internship_name", resultInternshipForm.get(i).get("result_internship_name"));

				jsonArray.put(jsonObject);
				
			}
			
		}
		
		new EtcMethods().responseJSONArray(jsonArray, response);
	}
	
	@RequestMapping(value = "/getCriterionFormById", method = RequestMethod.POST)
	@ResponseBody
	public void getCriterionFormById(HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		EtcMethods etc = new EtcMethods();

		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = null;
		
		String secret_code = request.getParameter("data1");
		String criterion_form_id = request.getParameter("data3");
		
		if(secret_code != null && !secret_code.equals("") && criterion_form_id != null && !criterion_form_id.equals("")) {
			
			ArrayList<HashMap<String, Object>> criterionFormData = new ResultInternshipDetDAO().queryCriterionForm(criterion_form_id, secret_code);

			for (int i = 0; i < criterionFormData.size(); i++) {
				jsonObject = new JSONObject();
				jsonObject.put("criterion_id", criterionFormData.get(i).get("criterion_id"));
				jsonObject.put("detail", criterionFormData.get(i).get("detail"));
				jsonObject.put("input_type", criterionFormData.get(i).get("input_type"));

				jsonArray.put(jsonObject);
			}
			
			
		}

		etc.responseJSONArray(jsonArray, response);

	}
	
	@RequestMapping(value = "/insertAssessmentByInternship", method = RequestMethod.POST)
	@ResponseBody
	public void insertAssessmentByInternship(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		EtcMethods etc = new EtcMethods();

		session = request.getSession(false);
		int sessionStatus = etc.checkSession(session, request);
		String status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
		String alert = "0";
		
		String criterion_data = request.getParameter("criterion_data");
		String result_internship_id = request.getParameter("data3");
		String result_internship_id_for_role_2 = request.getParameter("data4");
		String std_internship_id = request.getParameter("std_internship_id");
		String ip = request.getParameter("ip");
		
		JSONArray jsonArray = new JSONArray(criterion_data);
		
		if (criterion_data != null && !criterion_data.equals("") && result_internship_id != null && !result_internship_id.equals("") && std_internship_id != null && !std_internship_id.equals("") && ip != null && !ip.equals("") && result_internship_id_for_role_2 != null && !result_internship_id_for_role_2.equals("")) {

			if (sessionStatus == 0 && session.getAttribute("role").toString().equals("2")) {
				
				HashMap<String, Object> data = new AssessmentInternshipDAO().checkAssessmentInternshipExist(std_internship_id, result_internship_id_for_role_2);
				
				if(data.size() != 0) {
					
					String assessmentInternshipId = data.get("assessment_internship_id").toString();
					
					int insertStatus = -1;
					
					for(int i = 0; i < jsonArray.length(); i++) {
						
						insertStatus = new AssessmentInternshipDetDAO().insertAssessmentInternshipDet(assessmentInternshipId, "1", jsonArray.getJSONArray(i).get(0).toString(), jsonArray.getJSONArray(i).get(1).toString());
						
					}
					
					if(insertStatus != -1) {
						
						int updateStatus = new AssessmentInternshipDAO().updateStatusAssessmentInternship(assessmentInternshipId);

						if(updateStatus == 1) {
							
							status = "ประเมินการฝึกงานสำเร็จ";
							alert = "1";
							
							new EventHistoryDAO().insertEventHistory(session.getAttribute("id").toString(), "ประเมินการฝึกงานรหัส "+assessmentInternshipId, ip);
						}
						
						
						
					}
					
					
				} 
	
			} else {
				
				int assessmentInternshipLastId = new AssessmentInternshipDAO().insertAssessmentInternship(result_internship_id, std_internship_id);
				int assessmentInternshipLastIdForRole2 = new AssessmentInternshipDAO().insertAssessmentInternship(result_internship_id_for_role_2, std_internship_id);
				
				if(assessmentInternshipLastId > 0 && assessmentInternshipLastIdForRole2 > 0) {
					
					int insertStatus = -1;
					
					for(int i = 0; i < jsonArray.length(); i++) {
						
						insertStatus = new AssessmentInternshipDetDAO().insertAssessmentInternshipDet(Integer.toString(assessmentInternshipLastId), "2", jsonArray.getJSONArray(i).get(0).toString(), jsonArray.getJSONArray(i).get(1).toString());
						
					}
					
					if(insertStatus != -1) {
						
						new AssessmentInternshipDAO().updateStatusAssessmentInternship(Integer.toString(assessmentInternshipLastId));
						
						status = "ประเมินการฝึกงานสำเร็จ";
						alert = "1";

					}
					
				}
			}
			
		}

		JSONObject jsonObject = new JSONObject();

		jsonObject.put("status", status);
		jsonObject.put("alert", alert);
		etc.responseJSONObject(jsonObject, response);

	}

	@RequestMapping(value = "/getCriterionFormByStudentInternshipId", method = RequestMethod.POST)
	@ResponseBody
	public void getCriterionFormByStudentInternshipId(HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		EtcMethods etc = new EtcMethods();

		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = null;
		
		session = request.getSession(false); 
		int sessionStatus = new EtcMethods().checkSession(session, request);
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("2")) {
			
			String std_internship_id = request.getParameter("std_internship_id");
		
			if(std_internship_id != null && !std_internship_id.equals("")) {
				
				ArrayList<HashMap<String, Object>> criterionFormData = new ResultInternshipDetDAO().queryCriterionFormRole2(std_internship_id, session.getAttribute("id").toString());

				for (int i = 0; i < criterionFormData.size(); i++) {
					jsonObject = new JSONObject();
					jsonObject.put("result_internship_id", criterionFormData.get(i).get("result_internship_id"));
					jsonObject.put("result_internship_name", criterionFormData.get(i).get("result_internship_name"));
					jsonObject.put("criterion_id", criterionFormData.get(i).get("criterion_id"));
					jsonObject.put("detail", criterionFormData.get(i).get("detail"));
					jsonObject.put("input_type", criterionFormData.get(i).get("input_type"));
					
	
					jsonArray.put(jsonObject);
				}
				
				
			}
		}
		etc.responseJSONArray(jsonArray, response);

	}
	
}
