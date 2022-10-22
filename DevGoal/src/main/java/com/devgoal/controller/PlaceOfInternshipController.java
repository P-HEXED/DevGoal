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

import com.devgoal.dao.EventHistoryDAO;
import com.devgoal.dao.OverseasWorkPlaceDAO;
import com.devgoal.dao.PlaceOfInternshipDAO;
import com.devgoal.dao.PlaceOfInternshipSkillDAO;
import com.devgoal.dao.SkillDAO;
import com.devgoal.dao.StudentPlaceOfInternshipDAO;

@Controller
public class PlaceOfInternshipController {
	
	String url = new PathConfig().url;
	
public int checkData(String phone, String receive, String email, String user_id, String ip, String name, String type, String address1, String address2, String address3, String address4, String address5) {
		
		if(phone != null &&
				receive != null &&
				email != null &&
				user_id != null &&
				ip != null &&
				name != null &&
				type != null &&
				address1 != null &&
				address2 != null &&
				address3 != null &&
				address4 != null &&
				address5 != null &&
				
				!phone.equals("") &&
				!receive.equals("") &&
				!email.equals("") &&
				!user_id.equals("") &&
				!ip.equals("") &&
				!name.equals("") &&
				!type.equals("") &&
				!type.equals("0") &&
				!address1.equals("") &&
				!address2.equals("") &&
				!address3.equals("") &&
				!address4.equals("") &&
				!address5.equals("") &&
				
				Long.parseLong(phone) > 0 &&
				phone.length() > 8 &&
				phone.length() < 11 &&
				Integer.parseInt(receive) > 0 &&
				Integer.parseInt(address5) > 0 &&
				new EtcMethods().isValid(email) == true) {
			
			if(type.equals("1") || type.equals("2")){
				
				return 0;
			}
			
		} 
			
			return -1;
		
	}

public int checkDataNoRole(String phone, String receive, String email, String ip, String name, String type, String address1, String address2, String address3, String address4, String address5) {
	
	if(phone != null &&
			receive != null &&
			email != null &&
			ip != null &&
			name != null &&
			type != null &&
			address1 != null &&
			address2 != null &&
			address3 != null &&
			address4 != null &&
			address5 != null &&
			
			!phone.equals("") &&
			!receive.equals("") &&
			!email.equals("") &&
			!ip.equals("") &&
			!name.equals("") &&
			!type.equals("") &&
			!type.equals("0") &&
			!address1.equals("") &&
			!address2.equals("") &&
			!address3.equals("") &&
			!address4.equals("") &&
			!address5.equals("") &&
			
			Long.parseLong(phone) > 0 &&
			phone.length() > 8 &&
			phone.length() < 11 &&
			Integer.parseInt(receive) > 0 &&
			Integer.parseInt(address5) > 0 &&
			new EtcMethods().isValid(email) == true) {
		
		if(type.equals("1") || type.equals("2")){
			
			return 0;
		}
		
	} 
		
		return -1;
	
}

//Place of internship 
//For role 3 and 4
@RequestMapping(value = "/internshipManagement", method = RequestMethod.GET)
public ModelAndView internshipForAdminManagement(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
	response.setContentType("text/html;charset=UTF-8");
	
	session = request.getSession(false); 
	int sessionStatus = new EtcMethods().checkSession(session, request);
	
	if(sessionStatus == 0 && session.getAttribute("role").toString().equals("2")) {
		
		return new ModelAndView("role2/internship_place_management");
			
	} else if(sessionStatus == 0 && session.getAttribute("role").toString().equals("4")) {
		
		return new ModelAndView("role4/internship_place_management");
			
	} else {
		
		return new ModelAndView("404");
	}

}
	
@RequestMapping(value = "/findPlaceOfInternship", method = RequestMethod.POST)
@ResponseBody
public void findPlaceOfInternship(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
	response.setContentType("text/html;charset=UTF-8");
	request.setCharacterEncoding("UTF-8");
	
	session = request.getSession(false);
	EtcMethods etc = new EtcMethods();
	int sessionStatus = etc.checkSession(session, request);
	JSONArray jsonArray = new JSONArray();
	ArrayList<HashMap<String, Object>> placeOfInternship = null;
	
	if(sessionStatus == 0 && session.getAttribute("role").toString().equals("4")) {
		
		placeOfInternship = new PlaceOfInternshipDAO().queryPlaceOfInternshipRole4();
		
	} else if(sessionStatus == 0 && session.getAttribute("role").toString().equals("2")) {
		
		placeOfInternship = new PlaceOfInternshipDAO().queryPlaceOfInternshipRole2(session.getAttribute("id").toString());
	}
	
	JSONObject jsonObject = null;
	String[] address = {};
	
	for(int i = 0; i < placeOfInternship.size(); i++) {
		jsonObject = new JSONObject();
		jsonObject.put("place_of_insternship_id", placeOfInternship.get(i).get("place_of_internship_id"));
		jsonObject.put("name", placeOfInternship.get(i).get("name"));
		
		address = placeOfInternship.get(i).get("address").toString().split("\\s+");
		
		for(int j = 0; j < address.length; j++) {
			jsonObject.put("address"+(j+1), address[j]);
		}
		jsonObject.put("email", placeOfInternship.get(i).get("email"));
		jsonObject.put("phone", placeOfInternship.get(i).get("phone"));
		jsonObject.put("receive_total", placeOfInternship.get(i).get("recive_total"));
		jsonObject.put("type", placeOfInternship.get(i).get("type"));
		jsonObject.put("status", placeOfInternship.get(i).get("status"));
		jsonObject.put("time_reg", placeOfInternship.get(i).get("time_reg"));
		jsonObject.put("firstname", placeOfInternship.get(i).get("firstname"));
		jsonObject.put("lastname", placeOfInternship.get(i).get("lastname"));
		
		jsonArray.put(jsonObject);
	
	}
	
	
	new EtcMethods().responseJSONArray(jsonArray, response);
}

@RequestMapping(value = "/placeOfInternshipInsert", method = RequestMethod.POST)
@ResponseBody
public void placeOfInternshipInsert(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
	response.setContentType("text/html;charset=UTF-8");
	request.setCharacterEncoding("UTF-8");
	
	session = request.getSession(false);
	EtcMethods etc = new EtcMethods();
	int sessionStatus = etc.checkSession(session, request);
	String status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
	String alert = "0";
	
	if(sessionStatus == 0 && !session.getAttribute("role").toString().equals("1") && !session.getAttribute("role").toString().equals("3")) {
		
		String user_id = session.getAttribute("id").toString();
		String ip = request.getParameter("ip");
		
		String name = request.getParameter("internship_name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String receive = request.getParameter("receive_total");
		String type = request.getParameter("type");
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		String address3 = request.getParameter("address3");
		String address4 = request.getParameter("address4");
		String address5 = request.getParameter("address5");
		String skill = request.getParameter("skill");
		
		if(checkData(phone, receive, email, user_id, ip, name, type, address1, address2, address3, address4, address5) == 0 && skill != null && !skill.equals("")) {
			
			ArrayList<HashMap<String, String>> skillData = etc.checkSkill(skill);
			ArrayList<String> internshipSkillID = new SkillDAO().checkInsertDuplicateSkill(skillData);
			
			String address = address1+" "+address2+" "+address3+" "+address4+" "+address5;
			int lastId = new PlaceOfInternshipDAO().insertPlaceOfInternship(user_id, name, address, email, phone, receive, type);
			
			if(lastId > 0) {
				
				for(int i = 0; i < internshipSkillID.size(); i++) {
					
					new PlaceOfInternshipSkillDAO().insertPlaceOfInternshipSkill(Integer.toString(lastId), internshipSkillID.get(i));
				}
				
				status = "บันทึกข้อมูลเรียบร้อย";
				alert = "1";
				
				new EventHistoryDAO().insertEventHistory(user_id, "บันทึกข้อมูลสถานที่ฝึกงานรหัส "+lastId, ip);
				
			}
			
			
		}
		
	}
	
	JSONObject jsonObject = new JSONObject();
	
	jsonObject.put("status", status);
	jsonObject.put("alert", alert);
	new EtcMethods().responseJSONObject(jsonObject, response);
	
}

@RequestMapping(value = "/placeOfInternshipUpdate", method = RequestMethod.POST)
@ResponseBody
public void placeOfInternshipUpdate(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
	response.setContentType("text/html;charset=UTF-8");
	request.setCharacterEncoding("UTF-8");
	
	session = request.getSession(false);
	EtcMethods etc = new EtcMethods();
	int sessionStatus = etc.checkSession(session, request);
	String status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
	String alert = "0";
	
	if(sessionStatus == 0 && !session.getAttribute("role").toString().equals("1") && !session.getAttribute("role").toString().equals("3")) {
		
		String user_id = session.getAttribute("id").toString();
		String ip = request.getParameter("ip");
		
		String place_of_internship_id = request.getParameter("internship_id");
		String name = request.getParameter("internship_name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String receive = request.getParameter("receive_total");
		String type = request.getParameter("type");
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		String address3 = request.getParameter("address3");
		String address4 = request.getParameter("address4");
		String address5 = request.getParameter("address5");
		String skill = request.getParameter("skill");
		
		if(checkData(phone, receive, email, user_id, ip, name, type, address1, address2, address3, address4, address5) == 0 && place_of_internship_id != null && !place_of_internship_id.equals("")) {
			String address = address1+" "+address2+" "+address3+" "+address4+" "+address5;
			
			
			int updateStatus = new PlaceOfInternshipDAO().updatePlaceOfInternship(place_of_internship_id, name, address, email, phone, receive, type);
			
			if(updateStatus == 1) {
				
				if(skill != null && !skill.equals("")) {
					
					if(new PlaceOfInternshipSkillDAO().deletePlaceOfInternshipSkill(place_of_internship_id) != -1) {
						
						ArrayList<HashMap<String, String>> skillData = etc.checkSkill(skill);
						ArrayList<String> internshipSkillID = new SkillDAO().checkInsertDuplicateSkill(skillData);
						
						int internshipSkillInsertStatus = -1;
						
						for(int i = 0; i < internshipSkillID.size(); i++) {
							
							internshipSkillInsertStatus = new PlaceOfInternshipSkillDAO().insertPlaceOfInternshipSkill(place_of_internship_id, internshipSkillID.get(i));
						}
						
						if(internshipSkillInsertStatus != -1) {
							
							status = "แก้ไขข้อมูลสถานที่ฝึกงานสำเร็จ";	
							alert = "1";
							
							new EventHistoryDAO().insertEventHistory(user_id, "แก้ไขข้อมูลสถานที่ฝึกงานและข้อมูลทักษะความสามารถรหัส "+place_of_internship_id, ip);
						
						} else if(internshipSkillID.size() == 0) {
							
							status = "แก้ไขข้อมูลสถานที่ฝึกงานสำเร็จ";	
							alert = "1";
							
							new EventHistoryDAO().insertEventHistory(user_id, "แก้ไขข้อมูลสถานที่ฝึกงานและลบข้อมูลทักษะความสามารถรหัส "+place_of_internship_id, ip);
						}
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

//@RequestMapping(value = "/placeOfInternshipDelete", method = RequestMethod.POST)
//@ResponseBody
//public void placeOfInternshipDelete(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
//	response.setContentType("text/html;charset=UTF-8");
//	request.setCharacterEncoding("UTF-8");
//	
//	session = request.getSession(false);
//	int sessionStatus = new EtcMethods().checkSession(session, request);
//	String status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
//	
//	if(sessionStatus == 0 && !session.getAttribute("role").toString().equals("1") && !session.getAttribute("role").toString().equals("3")) {
//		
//		String place_of_internship_id = request.getParameter("internship_id");
//		String ip = request.getParameter("ip");
//		
//		String user_id = session.getAttribute("id").toString();
//		
//		if(place_of_internship_id != null && ip != null && user_id != null && !place_of_internship_id.equals("") && !ip.equals("") && !user_id.equals("")) {
//			status = (new PlaceOfInternshipDAO().deletePlaceOfInternship(place_of_internship_id) == 1)? "ลบข้อมูลเรียบร้อย":"เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
//			
//			new EventHistoryDAO().insertEventHistory(user_id, "ลบข้อมูลสถานที่ฝึกงานรหัส "+place_of_internship_id, ip);
//			
//			
//		}
//		
//	}
//	
//	JSONObject jsonObject = new JSONObject();
//	
//	jsonObject.put("status", status);
//	new EtcMethods().responseJSONObject(jsonObject, response);
//	
//}

@RequestMapping(value = "/managementInternshipStatusByAdmin", method = RequestMethod.POST)
@ResponseBody
public void managementInternshipStatusByAdmin(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException, ServletException {
	response.setContentType("text/html;charset=UTF-8");
	request.setCharacterEncoding("UTF-8");
	
	EtcMethods etc = new EtcMethods();
	
	session = request.getSession(false);
	int sessionStatus = etc.checkSession(session, request);
	String status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
	String alert = "0";
	
	if(sessionStatus == 0 && !session.getAttribute("role").toString().equals("1") && !session.getAttribute("role").toString().equals("3")) {
		
		String admin_id = session.getAttribute("id").toString();
		String internship_id = request.getParameter("internship_id");
		String ip = request.getParameter("ip");
		String status_internship = request.getParameter("status");
		
		
		if(admin_id != null && internship_id != null && ip != null && status_internship != null && !status_internship.equals("") && !admin_id.equals("") && !internship_id.equals("") && !ip.equals("")) {
			
			if(new PlaceOfInternshipDAO().managementStatusInternship(internship_id, status_internship) == 1) {
				
				status = "อัปเดทสถานะสถานที่ฝึกงานสำเร็จ";
				alert = "1";
				String detail_event = (status_internship.equals("1"))? "ยืนยันสถานที่ฝึกงานรหัส "+internship_id: "ยกเลิกการยืนยันสถานที่ฝึกงานรหัส "+internship_id;
				new EventHistoryDAO().insertEventHistory(admin_id, detail_event, ip);
				
			}
			
			
		}
			
	}
		
	JSONObject jsonObject = new JSONObject();
	
	jsonObject.put("status", status);
	jsonObject.put("alert", alert);
	etc.responseJSONObject(jsonObject, response);
	
}

	@RequestMapping(value = "/internship", method = RequestMethod.GET)
	public ModelAndView internship(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");
		
		session = request.getSession(false); 
		int sessionStatus = new EtcMethods().checkSession(session, request);
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("1")) {
			
			return new ModelAndView("role1/internship");
			
		} else {
			
			return new ModelAndView("404");
		}
	
	}

	//Student internship query
	@RequestMapping(value = "/findPlaceOfInternshipBySkill", method = RequestMethod.POST)
	@ResponseBody
	public void findPlaceOfInternshipBySkill(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		session = request.getSession(false);
		EtcMethods etc = new EtcMethods();
		int sessionStatus = etc.checkSession(session, request);
		JSONArray jsonArray = new JSONArray();
		ArrayList<HashMap<String, Object>> placeOfInternship = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<HashMap<String, Object>> placeOfInternshipMatching = null;
		ArrayList<HashMap<String, Object>> placeOfInternshipNoMatching = null;
		ArrayList<HashMap<String, Object>> placeOfInternshipNoSkill = null;
		JSONObject jsonObject = null;
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("1")) {
			
			placeOfInternshipMatching = new PlaceOfInternshipDAO().queryPlaceOfInternshipMatching(session.getAttribute("id").toString());
			placeOfInternshipNoMatching = new PlaceOfInternshipDAO().queryPlaceOfInternshipNoMatching(session.getAttribute("id").toString());
			placeOfInternshipNoSkill = new PlaceOfInternshipDAO().queryPlaceOfInternshipNoSkill();
			
			for(int i = 0; i < placeOfInternshipMatching.size(); i++) {
				placeOfInternship.add(placeOfInternshipMatching.get(i));
			}
			
			for(int i = 0; i < placeOfInternshipNoMatching.size(); i++) {
				placeOfInternship.add(placeOfInternshipNoMatching.get(i));
			}
			
			for(int i = 0; i < placeOfInternshipNoSkill.size(); i++) {
				placeOfInternship.add(placeOfInternshipNoSkill.get(i));
			}
			
			for(int i = 0; i < placeOfInternship.size(); i++) {
				jsonObject = new JSONObject();
				jsonObject.put("place_of_internship_id", placeOfInternship.get(i).get("place_of_internship_id"));
				jsonObject.put("name", placeOfInternship.get(i).get("name"));
				jsonObject.put("address", placeOfInternship.get(i).get("address"));
				jsonObject.put("email", placeOfInternship.get(i).get("email"));
				jsonObject.put("phone", placeOfInternship.get(i).get("phone"));
				jsonObject.put("recive_total", placeOfInternship.get(i).get("recive_total"));
				jsonObject.put("time_reg", placeOfInternship.get(i).get("time_reg"));
				jsonObject.put("status", placeOfInternship.get(i).get("status"));
				jsonObject.put("user_id", placeOfInternship.get(i).get("user_id"));
				jsonObject.put("type", placeOfInternship.get(i).get("type"));
				jsonObject.put("matching", placeOfInternship.get(i).get("matching"));
				
				jsonObject.put("province", placeOfInternship.get(i).get("address").toString().split("\\s+")[1]);

				jsonArray.put(jsonObject);
				
			}
			
		}
		
		new EtcMethods().responseJSONArray(jsonArray, response);
	}
	
	//Filter zone
	@RequestMapping(value = "/findPlaceOfInternshipByZone", method = RequestMethod.POST)
	@ResponseBody
	public void findPlaceOfInternshipByZone(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		session = request.getSession(false);
		EtcMethods etc = new EtcMethods();
		int sessionStatus = etc.checkSession(session, request);
		JSONArray jsonArray = new JSONArray();
		ArrayList<HashMap<String, Object>> placeOfInternship = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<HashMap<String, Object>> placeOfInternshipMatching = null;
		ArrayList<HashMap<String, Object>> placeOfInternshipNoMatching = null;
		ArrayList<HashMap<String, Object>> placeOfInternshipNoSkill = null;
		JSONObject jsonObject = null;
		String zone = request.getParameter("zone_value");
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("1") && zone != null && !zone.equals("")) {
			
			if(zone.equals("1") || zone.equals("2") || zone.equals("3") || zone.equals("4") || zone.equals("5") || zone.equals("6")) {
				
				String[][] zone_filter = new AddressParameterConfig().zone; 
				String[] zone_data = new String[zone_filter[Integer.parseInt(zone)-1].length];
				
				for(int i = 0; i < zone_filter[Integer.parseInt(zone)-1].length; i++) {
					zone_data[i] = zone_filter[Integer.parseInt(zone)-1][i];
				}
				
				placeOfInternshipMatching = new PlaceOfInternshipDAO().queryPlaceOfInternshipMatchingByZone(session.getAttribute("id").toString(), zone_data);
				placeOfInternshipNoMatching = new PlaceOfInternshipDAO().queryPlaceOfInternshipNoMatchingByZone(session.getAttribute("id").toString(), zone_data);
				placeOfInternshipNoSkill = new PlaceOfInternshipDAO().queryPlaceOfInternshipNoSkillByZone(zone_data);
				
				for(int i = 0; i < placeOfInternshipMatching.size(); i++) {
					placeOfInternship.add(placeOfInternshipMatching.get(i));
				}
				
				for(int i = 0; i < placeOfInternshipNoMatching.size(); i++) {
					placeOfInternship.add(placeOfInternshipNoMatching.get(i));
				}
				
				for(int i = 0; i < placeOfInternshipNoSkill.size(); i++) {
					placeOfInternship.add(placeOfInternshipNoSkill.get(i));
				}
				
				for(int i = 0; i < placeOfInternship.size(); i++) {
					jsonObject = new JSONObject();
					jsonObject.put("place_of_internship_id", placeOfInternship.get(i).get("place_of_internship_id"));
					jsonObject.put("name", placeOfInternship.get(i).get("name"));
					jsonObject.put("address", placeOfInternship.get(i).get("address"));
					jsonObject.put("email", placeOfInternship.get(i).get("email"));
					jsonObject.put("phone", placeOfInternship.get(i).get("phone"));
					jsonObject.put("recive_total", placeOfInternship.get(i).get("recive_total"));
					jsonObject.put("time_reg", placeOfInternship.get(i).get("time_reg"));
					jsonObject.put("status", placeOfInternship.get(i).get("status"));
					jsonObject.put("user_id", placeOfInternship.get(i).get("user_id"));
					jsonObject.put("type", placeOfInternship.get(i).get("type"));
					jsonObject.put("matching", placeOfInternship.get(i).get("matching"));
					
					jsonObject.put("province", placeOfInternship.get(i).get("address").toString().split("\\s+")[1]);

					jsonArray.put(jsonObject);
					
				}
				
			}
			
		}
		
		new EtcMethods().responseJSONArray(jsonArray, response);
	}
	
	//Student request internship place
	@RequestMapping(value = "/internshipRequest", method = RequestMethod.GET)
	public ModelAndView internshipRequest(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");
		
		session = request.getSession(false); 
		int sessionStatus = new EtcMethods().checkSession(session, request);
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("1")) {
			
			return new ModelAndView("role1/internship_request");
				
		} else {
			
			return new ModelAndView("404");
		}

	}
	
	@RequestMapping(value = "/requestPlaceOfInternship", method = RequestMethod.POST)
	@ResponseBody
	public void requestPlaceOfInternship(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		session = request.getSession(false);
		EtcMethods etc = new EtcMethods();
		int sessionStatus = etc.checkSession(session, request);
		String status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
		String alert = "0";
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("1")) {
			
			String user_id = session.getAttribute("id").toString();
			String ip = request.getParameter("ip");
			
			String name = request.getParameter("internship_name");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String receive = request.getParameter("receive_total");
			String type = request.getParameter("type");
			String address1 = request.getParameter("address1");
			String address2 = request.getParameter("address2");
			String address3 = request.getParameter("address3");
			String address4 = request.getParameter("address4");
			String address5 = request.getParameter("address5");
			String skill = request.getParameter("skill");
			
			if(checkData(phone, receive, email, user_id, ip, name, type, address1, address2, address3, address4, address5) == 0 && skill != null && !skill.equals("")) {
				
				ArrayList<HashMap<String, String>> skillData = etc.checkSkill(skill);
				ArrayList<String> internshipSkillID = new SkillDAO().checkInsertDuplicateSkill(skillData);
				
				String address = address1+" "+address2+" "+address3+" "+address4+" "+address5;
				int lastId = new PlaceOfInternshipDAO().insertRequestPlaceOfInternship(user_id, name, address, email, phone, receive, type);
				
				if(lastId > 0) {
					
					for(int i = 0; i < internshipSkillID.size(); i++) {
						
						new PlaceOfInternshipSkillDAO().insertPlaceOfInternshipSkill(Integer.toString(lastId), internshipSkillID.get(i));
					}
					
					status = "ร้องขอสถานที่ฝึกงานเรียบร้อย";
					alert = "1";
					
					new EventHistoryDAO().insertEventHistory(user_id, "ร้องขอสถานที่ฝึกงานรหัส "+lastId, ip);
					
				}
				
				
			}
			
		}
		
		JSONObject jsonObject = new JSONObject();
		
		jsonObject.put("status", status);
		jsonObject.put("alert", alert);
		new EtcMethods().responseJSONObject(jsonObject, response);
		
	}
	
	//Management internship place from request by student
	@RequestMapping(value = "/internshipRequestManagement", method = RequestMethod.GET)
	public ModelAndView internshipRequestManagement(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");
		
		session = request.getSession(false); 
		int sessionStatus = new EtcMethods().checkSession(session, request);
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("2")) {
			
			return new ModelAndView("role2/internship_place_request_management");
				
		} else {
			
			return new ModelAndView("404");
		}

	}
	
	@RequestMapping(value = "/findPlaceOfInternshipRequest", method = RequestMethod.POST)
	@ResponseBody
	public void findPlaceOfInternshipRequest(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		session = request.getSession(false);
		EtcMethods etc = new EtcMethods();
		int sessionStatus = etc.checkSession(session, request);
		JSONArray jsonArray = new JSONArray();
		ArrayList<HashMap<String, Object>> placeOfInternship = null;
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("2")) {
			
			placeOfInternship = new PlaceOfInternshipDAO().queryPlaceOfInternshipReuqestRole2();
		}
		
		JSONObject jsonObject = null;
		String[] address = {};
		
		for(int i = 0; i < placeOfInternship.size(); i++) {
			jsonObject = new JSONObject();
			jsonObject.put("place_of_insternship_id", placeOfInternship.get(i).get("place_of_internship_id"));
			jsonObject.put("name", placeOfInternship.get(i).get("name"));
			
			address = placeOfInternship.get(i).get("address").toString().split("\\s+");
			
			for(int j = 0; j < address.length; j++) {
				jsonObject.put("address"+(j+1), address[j]);
			}
			jsonObject.put("email", placeOfInternship.get(i).get("email"));
			jsonObject.put("phone", placeOfInternship.get(i).get("phone"));
			jsonObject.put("receive_total", placeOfInternship.get(i).get("recive_total"));
			jsonObject.put("type", placeOfInternship.get(i).get("type"));
			jsonObject.put("status", placeOfInternship.get(i).get("status"));
			jsonObject.put("time_reg", placeOfInternship.get(i).get("time_reg"));
			jsonObject.put("firstname", placeOfInternship.get(i).get("firstname"));
			jsonObject.put("lastname", placeOfInternship.get(i).get("lastname"));
			jsonObject.put("university_name", placeOfInternship.get(i).get("university_name"));
			jsonObject.put("faculty_name", placeOfInternship.get(i).get("faculty_name"));
			jsonObject.put("course_name", placeOfInternship.get(i).get("course_name"));
			
			jsonArray.put(jsonObject);
		
		}
		
		
		new EtcMethods().responseJSONArray(jsonArray, response);
	}
	
	@RequestMapping(value = "/placeOfInternshipRequestUpdate", method = RequestMethod.POST)
	@ResponseBody
	public void placeOfInternshipRequestUpdate(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		session = request.getSession(false);
		int sessionStatus = new EtcMethods().checkSession(session, request);
		String status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
		String alert = "0";
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("2")) {
			
			String user_id = session.getAttribute("id").toString();
			String ip = request.getParameter("ip");
			
			String place_of_internship_id = request.getParameter("internship_id");
			String name = request.getParameter("internship_name");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String receive = request.getParameter("receive_total");
			String type = request.getParameter("type");
			String address1 = request.getParameter("address1");
			String address2 = request.getParameter("address2");
			String address3 = request.getParameter("address3");
			String address4 = request.getParameter("address4");
			String address5 = request.getParameter("address5");
			
			if(checkData(phone, receive, email, user_id, ip, name, type, address1, address2, address3, address4, address5) == 0 && place_of_internship_id != null && !place_of_internship_id.equals("")) {
				String address = address1+" "+address2+" "+address3+" "+address4+" "+address5;
				
				
				if(new PlaceOfInternshipDAO().updatePlaceOfInternshipRequest(user_id, place_of_internship_id, name, address, email, phone, receive, type) == 1) {
					
					status = "แก้ไขข้อมูลเรียบร้อย";
					alert = "1";
					new EventHistoryDAO().insertEventHistory(user_id, "แก้ไขข้อมูลสถานที่ฝึกงานรหัส "+place_of_internship_id, ip);
				}
			}
			
		}
		
		JSONObject jsonObject = new JSONObject();
		
		jsonObject.put("status", status);
		jsonObject.put("alert", alert);
		new EtcMethods().responseJSONObject(jsonObject, response);
		
	}
	
	@RequestMapping(value = "/managementInternshipStatus", method = RequestMethod.POST)
	@ResponseBody
	public void managementInternshipStatus(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		EtcMethods etc = new EtcMethods();
		
		session = request.getSession(false);
		int sessionStatus = etc.checkSession(session, request);
		String status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
		String alert = "0";
		
		if(sessionStatus == 0 && !session.getAttribute("role").toString().equals("1") && !session.getAttribute("role").toString().equals("3")) {
			
			String admin_id = session.getAttribute("id").toString();
			String internship_id = request.getParameter("internship_id");
			String ip = request.getParameter("ip");
			String status_internship = request.getParameter("status");
			
			
			if(admin_id != null && internship_id != null && ip != null && status_internship != null && !status_internship.equals("") && !admin_id.equals("") && !internship_id.equals("") && !ip.equals("")) {
				
				if(new PlaceOfInternshipDAO().managementStatusInternshipRequest(internship_id, admin_id, status_internship) == 1) {
					
					status = "อัปเดทสถานะสถานที่ฝึกงานสำเร็จ";
					alert = "1";
					String detail_event = (status_internship.equals("1"))? "ยืนยันสถานที่ฝึกงานรหัส "+internship_id: "ยกเลิกการยืนยันสถานที่ฝึกงานรหัส "+internship_id;
					new EventHistoryDAO().insertEventHistory(admin_id, detail_event, ip);
					
				}
				
				
			}
				
		}
			
		JSONObject jsonObject = new JSONObject();
		
		jsonObject.put("status", status);
		jsonObject.put("alert", alert);
		etc.responseJSONObject(jsonObject, response);
		
	}
	
	@RequestMapping(value = "/managementInternshipRequestStatus", method = RequestMethod.POST)
	@ResponseBody
	public void managementInternshipRequestStatus(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		EtcMethods etc = new EtcMethods();
		
		session = request.getSession(false);
		int sessionStatus = etc.checkSession(session, request);
		String status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
		String alert = "0";
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("2")) {
			
			String user_id = session.getAttribute("id").toString();
			String internship_id = request.getParameter("internship_id");
			String ip = request.getParameter("ip");
			String status_internship = request.getParameter("status");
			String internship_email = request.getParameter("email");
			String detail_event = "";
			String[] student_email = request.getParameter("student_email").split(",");
			
			
			if(user_id != null && internship_id != null && ip != null && status_internship != null && !status_internship.equals("") && !user_id.equals("") && !internship_id.equals("") && !ip.equals("")) {
				
				if(new PlaceOfInternshipDAO().managementStatusInternshipRequest(internship_id, user_id, status_internship) == 1) {
					
					status = "อัปเดทสถานะสถานที่ฝึกงานสำเร็จ";
					alert = "1";
					
					if(status_internship.equals("1")) {
						detail_event = "ยืนยันสถานที่ฝึกงานรหัส "+internship_id;
						
						for(int i = 0; i < student_email.length; i++) {
							
							etc.sendEmail(user_id, student_email[i], "มีบริษัทสนใจอยากรับคุณเข้าฝึกงาน", "มีบริษัทสนใจอยากรับคุณเข้าฝึกงาน\nสามารถตรวจสอบได้ที่นี่ "+url+"internshipRequestYou");
							
						}
						
						etc.sendEmail(user_id, internship_email, "สถานะการอนุมัติการร้องขอนิสิต/นักศึกษาเพื่อเข้าฝึกงาน", "บริษัทของคุณได้รับการอนุมัติแล้ว\nกรุณารอนิสิต/นักศึกษาตอบรับ");
						
					} else if(status_internship.equals("0")) {
						detail_event = "ยกเลิกการยืนยันสถานที่ฝึกงานรหัส "+internship_id;
						etc.sendEmail(user_id, internship_email, "สถานะการอนุมัติการร้องขอนิสิต/นักศึกษาเพื่อเข้าฝึกงาน", "บริษัทของคุณไม่ผ่านการอนุมัติ\nกรุณาตรวจสอบข้อมูลใหม่ และส่งคำร้องในภายหลัง");
					}
					
					new EventHistoryDAO().insertEventHistory(user_id, detail_event, ip);
					
				}
				
				
			}
				
		}
			
		JSONObject jsonObject = new JSONObject();
		
		jsonObject.put("status", status);
		jsonObject.put("alert", alert);
		etc.responseJSONObject(jsonObject, response);
		
	}
	
	@RequestMapping(value = "/insertPlaceOfInternshipNoRole", method = RequestMethod.POST)
	@ResponseBody
	public void insertPlaceOfInternshipNoRole(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		EtcMethods etc = new EtcMethods();
		String status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
		String alert = "0";
		
		String ip = request.getParameter("ip");
		
		String name = request.getParameter("internship_name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String receive = request.getParameter("receive_total");
		String type = request.getParameter("type");
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		String address3 = request.getParameter("address3");
		String address4 = request.getParameter("address4");
		String address5 = request.getParameter("address5");
		String skill = request.getParameter("skill");
		String user_id_list = request.getParameter("user_id");
		
		if(checkDataNoRole(phone, receive, email, ip, name, type, address1, address2, address3, address4, address5) == 0 && skill != null && !skill.equals("") && user_id_list != null && !user_id_list.equals("")) {
			
			ArrayList<HashMap<String, String>> skillData = etc.checkSkill(skill);
			ArrayList<String> internshipSkillID = new SkillDAO().checkInsertDuplicateSkill(skillData);
			
			String address = address1+" "+address2+" "+address3+" "+address4+" "+address5;
			int lastIdInternship = new PlaceOfInternshipDAO().insertPlaceOfInternshipNoRole(name, address, email, phone, receive, type);
			
			if(lastIdInternship > 0) {
				
				for(int i = 0; i < internshipSkillID.size(); i++) {
					
					new PlaceOfInternshipSkillDAO().insertPlaceOfInternshipSkill(Integer.toString(lastIdInternship), internshipSkillID.get(i));
				}
				
				user_id_list = user_id_list.replace("[", "");
				user_id_list = user_id_list.replace("]", "");
				user_id_list = user_id_list.replace("\"", "");
				
				String[] user_id_data = user_id_list.split(",");
				
				for(int i = 0; i < user_id_data.length; i++) {
					
					new StudentPlaceOfInternshipDAO().insertInternshipAndUser(user_id_data[i], Integer.toString(lastIdInternship), "2");
				}
					
					
				status = "ส่งข้อมูลบริษัทและนิสิต/นักศึกษาให้ระบบตรวจสอบแล้ว";
				alert = "1";
					
		}
			
		
		JSONObject jsonObject = new JSONObject();
		
		jsonObject.put("status", status);
		jsonObject.put("alert", alert);
		new EtcMethods().responseJSONObject(jsonObject, response);
		}
		
	}
	
	@RequestMapping(value = "/internshipRequestStudent", method = RequestMethod.GET)
	public ModelAndView internshipRequestStudent(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");
		
		session = request.getSession(false); 
		int sessionStatus = new EtcMethods().checkSession(session, request);
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("2")) {
			
			return new ModelAndView("role2/internship_request_student");
				
		} else {
			
			return new ModelAndView("404");
		}

	}
	
	@RequestMapping(value = "/findPlaceOfInternshipRequestStudent", method = RequestMethod.POST)
	@ResponseBody
	public void findPlaceOfInternshipRequestStudent(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		session = request.getSession(false);
		EtcMethods etc = new EtcMethods();
		int sessionStatus = etc.checkSession(session, request);
		JSONArray jsonArray = new JSONArray();
		ArrayList<HashMap<String, Object>> placeOfInternship = null;
		ArrayList<HashMap<String, Object>> emailStudent = null;
		JSONObject jsonObject = null;
		String[] address = {};
		String student_email = "";
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("2")) {
			
			placeOfInternship = new PlaceOfInternshipDAO().queryPlaceOfInternshipReuqestStudentRole2();
			
			for(int i = 0; i < placeOfInternship.size(); i++) {
				jsonObject = new JSONObject();
				jsonObject.put("place_of_insternship_id", placeOfInternship.get(i).get("place_of_internship_id"));
				jsonObject.put("name", placeOfInternship.get(i).get("name"));
				
				address = placeOfInternship.get(i).get("address").toString().split("\\s+");
				
				for(int j = 0; j < address.length; j++) {
					jsonObject.put("address"+(j+1), address[j]);
				}
				jsonObject.put("email", placeOfInternship.get(i).get("email"));
				jsonObject.put("phone", placeOfInternship.get(i).get("phone"));
				jsonObject.put("receive_total", placeOfInternship.get(i).get("recive_total"));
				jsonObject.put("type", placeOfInternship.get(i).get("type"));
				jsonObject.put("status", placeOfInternship.get(i).get("status"));
				jsonObject.put("time_reg", placeOfInternship.get(i).get("time_reg"));
				
				emailStudent = new PlaceOfInternshipDAO().queryEmailPlaceOfInternshipReuqestStudentRole2(placeOfInternship.get(i).get("place_of_internship_id").toString());
				
				for(int k = 0; k < emailStudent.size(); k++) {
					student_email += emailStudent.get(i).get("email");
					student_email += ", ";
				}
				
				student_email = student_email.substring(0, student_email.length()-2);
				
				jsonObject.put("student_email", student_email);
				student_email = "";
				
				jsonArray.put(jsonObject);
			
			}
			
		}
		
		
		new EtcMethods().responseJSONArray(jsonArray, response);
	}
	
	
	@RequestMapping(value = "/findPlaceOfInternshipChoice", method = RequestMethod.POST)
	@ResponseBody
	public void findPlaceOfInternshipChoice(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		session = request.getSession(false);
		EtcMethods etc = new EtcMethods();
		int sessionStatus = etc.checkSession(session, request);
		JSONArray jsonArray = new JSONArray();
		ArrayList<HashMap<String, Object>> placeOfInternship = null;
		JSONObject jsonObject = null;
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("2")) {
			
			placeOfInternship = new PlaceOfInternshipDAO().queryPlaceOfInternshipChoice(session.getAttribute("id").toString());
			
			for(int i = 0; i < placeOfInternship.size(); i++) {
				jsonObject = new JSONObject();
				jsonObject.put("place_of_internship_id", placeOfInternship.get(i).get("place_of_internship_id"));
				jsonObject.put("name", placeOfInternship.get(i).get("name"));
				
				jsonArray.put(jsonObject);
				
			}
			
		}
		
		new EtcMethods().responseJSONArray(jsonArray, response);
	}
	
	
	
	
	

}
