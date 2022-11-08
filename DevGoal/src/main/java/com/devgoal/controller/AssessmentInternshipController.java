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

import com.devgoal.dao.AssessmentInternshipDetDAO;
import com.devgoal.dao.StudentPlaceOfInternshipDAO;
import com.devgoal.dao.TermDAO;

@Controller
public class AssessmentInternshipController {
	
	@RequestMapping(value = "/reportResultAssessment", method = RequestMethod.GET)
	public ModelAndView reportResultAssessment(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");
		
		session = request.getSession(false); 
		int sessionStatus = new EtcMethods().checkSession(session, request);
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("2")) {
			
			return new ModelAndView("role2/report_result_assessment");
				
		} else {
			
			return new ModelAndView("404");
		}

	}
	
	
	
	@RequestMapping(value = "/getReportResultAssessmentDetail", method = RequestMethod.POST)
	@ResponseBody
	public void getReportResultAssessmentDetail(HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		EtcMethods etc = new EtcMethods();

		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = null;
		
		session = request.getSession(false); 
		int sessionStatus = new EtcMethods().checkSession(session, request);
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("2")) {
			
			String assessment_internship_id = request.getParameter("assessment_internship_id");
		
			if(assessment_internship_id != null && !assessment_internship_id.equals("")) {
				
				HashMap<String, Object> std_internship_id = new AssessmentInternshipDetDAO().queryStudentPlaceOfInternshipIdByAssessmentId(assessment_internship_id);
				
				if(std_internship_id != null) {
					
					ArrayList<HashMap<String, Object>> assessmentScore = new AssessmentInternshipDetDAO().queryAssessmentScore(std_internship_id.get("student_place_of_internship_id").toString());
					
					for (int i = 0; i < assessmentScore.size(); i++) {
						jsonObject = new JSONObject();
						jsonObject.put("result_internship_name", assessmentScore.get(i).get("result_internship_name"));
						jsonObject.put("condition", assessmentScore.get(i).get("condition"));
						jsonObject.put("detail", assessmentScore.get(i).get("detail"));
						jsonObject.put("score", assessmentScore.get(i).get("score"));
						jsonObject.put("full_score", assessmentScore.get(i).get("full_score"));
		
						jsonArray.put(jsonObject);
					}
					
				}
				
			}
			
		}
		
		etc.responseJSONArray(jsonArray, response);

	}
	
	@RequestMapping(value = "/statisticsInternship", method = RequestMethod.GET)
	public ModelAndView statisticsInternship(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");
		
		session = request.getSession(false); 
		int sessionStatus = new EtcMethods().checkSession(session, request);
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("2")) {
			
			return new ModelAndView("role2/statistics_internship");
				
		} else {
			
			return new ModelAndView("404");
		}

	}
	
	@RequestMapping(value = "/getStatisticsInternshipCompleteDataCard", method = RequestMethod.POST)
	@ResponseBody
	public void getStatisticsInternshipCompleteDataCard(HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		EtcMethods etc = new EtcMethods();

		JSONObject jsonObject = null;
		
		session = request.getSession(false); 
		int sessionStatus = new EtcMethods().checkSession(session, request);
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("2")) {
			
			HashMap<String, Object> role1InternshipComplete = new AssessmentInternshipDetDAO().queryStudentInternshipComplete(session.getAttribute("id").toString());
			HashMap<String, Object> role1Internshiping = new AssessmentInternshipDetDAO().queryStudentInternshiping(session.getAttribute("id").toString());
			
			
			jsonObject = new JSONObject();
			jsonObject.put("role1_complete", role1InternshipComplete.get("role1_complete"));
			jsonObject.put("role1_internshiping", role1Internshiping.get("role1_internshiping"));
			
		}
		
		etc.responseJSONObject(jsonObject, response);

	}
	
	@RequestMapping(value = "/getStatisticsInternshipingDataDonut", method = RequestMethod.POST)
	@ResponseBody
	public void getStatisticsInternshipingDataDonut(HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		EtcMethods etc = new EtcMethods();
		
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = null;
		
		session = request.getSession(false); 
		int sessionStatus = new EtcMethods().checkSession(session, request);
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("2")) {
			
			ArrayList<HashMap<String, Object>> role1Internshiping = new StudentPlaceOfInternshipDAO().queryStudentCountInternshiping(session.getAttribute("id").toString());
		
			for(int i = 0; i < role1Internshiping.size(); i++) {
				jsonObject = new JSONObject();
				jsonObject.put("internship_id", role1Internshiping.get(i).get("internship_id"));
				jsonObject.put("internship_name", role1Internshiping.get(i).get("internship_name"));
				jsonObject.put("role1_count", role1Internshiping.get(i).get("role1_count"));
				
				jsonArray.put(jsonObject);
				
			}
		
		
		
		}
		
		etc.responseJSONArray(jsonArray, response);

	}
	
	
	@RequestMapping(value = "/getStudentStatisticsInternshipingData", method = RequestMethod.POST)
	@ResponseBody
	public void getStudentStatisticsInternshipingData(HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		EtcMethods etc = new EtcMethods();
		
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = null;
		
		session = request.getSession(false); 
		int sessionStatus = new EtcMethods().checkSession(session, request);
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("2")) {
			
			String year = request.getParameter("year");
			String term = request.getParameter("term");
			
			
			if(year != null && !year.equals("") && !year.equals("0") && term != null && !term.equals("") && !term.equals("0")) {
				
				HashMap<String, Object> term_id = new TermDAO().queryTermId(year, term);
				
				if(term_id != null) {

					ArrayList<HashMap<String, Object>> role1InternshipData = new StudentPlaceOfInternshipDAO().queryStudentDataInternshipForAssessment(term_id.get("term_id").toString());
					
					for(int i = 0; i < role1InternshipData.size(); i++) {
						jsonObject = new JSONObject();
						jsonObject.put("profile_image", role1InternshipData.get(i).get("profile_image"));
						jsonObject.put("firstname", role1InternshipData.get(i).get("firstname"));
						jsonObject.put("lastname", role1InternshipData.get(i).get("lastname"));
						jsonObject.put("email", role1InternshipData.get(i).get("email"));
						jsonObject.put("time_reg", role1InternshipData.get(i).get("time_reg"));
						jsonObject.put("internship_name", role1InternshipData.get(i).get("internship_name"));
						jsonObject.put("internship_status", role1InternshipData.get(i).get("internship_status"));
						
						jsonArray.put(jsonObject);
						
					}
				}
				
			} 
			
		}
		
		etc.responseJSONArray(jsonArray, response);

	}
	
	@RequestMapping(value = "/getStudentStatisticsInternshipingDataNoFilter", method = RequestMethod.POST)
	@ResponseBody
	public void getStudentStatisticsInternshipingDataNoFilter(HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		EtcMethods etc = new EtcMethods();
		
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = null;
		
		session = request.getSession(false); 
		int sessionStatus = new EtcMethods().checkSession(session, request);
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("2")) {
			
			ArrayList<HashMap<String, Object>> role1InternshipData = new StudentPlaceOfInternshipDAO().queryStudentDataInternshipForAssessmentNoFilter();
			
			for(int i = 0; i < role1InternshipData.size(); i++) {
				jsonObject = new JSONObject();
				jsonObject.put("profile_image", role1InternshipData.get(i).get("profile_image"));
				jsonObject.put("firstname", role1InternshipData.get(i).get("firstname"));
				jsonObject.put("lastname", role1InternshipData.get(i).get("lastname"));
				jsonObject.put("email", role1InternshipData.get(i).get("email"));
				jsonObject.put("time_reg", role1InternshipData.get(i).get("time_reg"));
				jsonObject.put("internship_name", role1InternshipData.get(i).get("internship_name"));
				jsonObject.put("internship_status", role1InternshipData.get(i).get("internship_status"));
				
				jsonArray.put(jsonObject);
				
			}
				
			
		}
		
		etc.responseJSONArray(jsonArray, response);

	}
	
	// Card เล็ก Filter date
	@RequestMapping(value = "/getStatisticsInternshipCompleteDataCardFilter", method = RequestMethod.POST)
	@ResponseBody
	public void getStatisticsInternshipCompleteDataCardFilter(HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		EtcMethods etc = new EtcMethods();

		JSONObject jsonObject = new JSONObject();
		
		session = request.getSession(false); 
		int sessionStatus = new EtcMethods().checkSession(session, request);
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("2")) {
			
			String year = request.getParameter("year");
			String term = request.getParameter("term");
			
			if(year != null && !year.equals("") && !year.equals("0") && term != null && !term.equals("") && !term.equals("0")) {
				
				
				HashMap<String, Object> term_id = new TermDAO().queryTermId(year, term);
				
				if(term_id != null) {
					
					HashMap<String, Object> role1InternshipComplete = new AssessmentInternshipDetDAO().queryStudentInternshipCompleteFilter(session.getAttribute("id").toString(), term_id.get("term_id").toString());
					HashMap<String, Object> role1Internshiping = new AssessmentInternshipDetDAO().queryStudentInternshipingFilter(session.getAttribute("id").toString(), term_id.get("term_id").toString());
					
					jsonObject.put("role1_complete", role1InternshipComplete.get("role1_complete"));
					jsonObject.put("role1_internshiping", role1Internshiping.get("role1_internshiping"));
				}
				
				
			}
			
			
		}
		
		etc.responseJSONObject(jsonObject, response);

	}
	
	@RequestMapping(value = "/getStatisticsInternshipingDataDonutFilter", method = RequestMethod.POST)
	@ResponseBody
	public void getStatisticsInternshipingDataDonutFilter(HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		EtcMethods etc = new EtcMethods();
		
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = null;
		
		session = request.getSession(false); 
		int sessionStatus = new EtcMethods().checkSession(session, request);
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("2")) {
			
			String year = request.getParameter("year");
			String term = request.getParameter("term");
			
			if(year != null && !year.equals("") && !year.equals("0") && term != null && !term.equals("") && !term.equals("0")) {
				
				HashMap<String, Object> term_id = new TermDAO().queryTermId(year, term);
				
				if(term_id != null) {
					
					ArrayList<HashMap<String, Object>> role1Internshiping = new StudentPlaceOfInternshipDAO().queryStudentCountInternshipingFilter(session.getAttribute("id").toString(), term_id.get("term_id").toString());
					
					for(int i = 0; i < role1Internshiping.size(); i++) {
						jsonObject = new JSONObject();
						jsonObject.put("internship_id", role1Internshiping.get(i).get("internship_id"));
						jsonObject.put("internship_name", role1Internshiping.get(i).get("internship_name"));
						jsonObject.put("role1_count", role1Internshiping.get(i).get("role1_count"));
						
						jsonArray.put(jsonObject);
						
					}
				}
				
				
				
			}
			
		
		}
		
		etc.responseJSONArray(jsonArray, response);

	}

}
