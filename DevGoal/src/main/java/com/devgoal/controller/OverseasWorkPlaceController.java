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
import com.devgoal.dao.OverseasWorkPlaceSkillDAO;
import com.devgoal.dao.PlaceOfInternshipSkillDAO;
import com.devgoal.dao.SkillDAO;
import com.devgoal.dao.StudentOverseasWorkPlaceDAO;
import com.devgoal.dao.UserDAO;

@Controller
public class OverseasWorkPlaceController {
	
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
	
	//Overseas work place 
	//For role 3 and 4
	@RequestMapping(value = "/overseasManagement", method = RequestMethod.GET)
	public ModelAndView overseasForAdminManagement(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");
		
		session = request.getSession(false); 
		int sessionStatus = new EtcMethods().checkSession(session, request);
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("3")) {
			
			return new ModelAndView("role3/overseas_place_management");
			
		} else if(sessionStatus == 0 && session.getAttribute("role").toString().equals("4")) {
			
			return new ModelAndView("role4/overseas_place_management");
			
		} else {
			
			return new ModelAndView("404");
		}
	
	}
	
	
	@RequestMapping(value = "/findOverseasWorkPlace", method = RequestMethod.POST)
	@ResponseBody
	public void findOverseasWorkPlace(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		session = request.getSession(false);
		EtcMethods etc = new EtcMethods();
		int sessionStatus = etc.checkSession(session, request);
		JSONArray jsonArray = new JSONArray();
		ArrayList<HashMap<String, Object>> overseasWorkPlace = null;
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("4")) {
			
			overseasWorkPlace = new OverseasWorkPlaceDAO().queryOverseasWorkPlaceRole4();
			
		} else if(sessionStatus == 0 && session.getAttribute("role").toString().equals("3")) {
			
			overseasWorkPlace = new OverseasWorkPlaceDAO().queryOverseasWorkPlaceRole3(session.getAttribute("id").toString());
		}
		
		JSONObject jsonObject = null;
		String[] address = {};
		
		for(int i = 0; i < overseasWorkPlace.size(); i++) {
			jsonObject = new JSONObject();
			jsonObject.put("overseas_work_place_id", overseasWorkPlace.get(i).get("overseas_work_place_id"));
			jsonObject.put("name", overseasWorkPlace.get(i).get("name"));
			
			address = overseasWorkPlace.get(i).get("address").toString().split("\\s+");
			
			for(int j = 0; j < address.length; j++) {
				jsonObject.put("address"+(j+1), address[j]);
			}
			jsonObject.put("email", overseasWorkPlace.get(i).get("email"));
			jsonObject.put("phone", overseasWorkPlace.get(i).get("phone"));
			jsonObject.put("receive_total", overseasWorkPlace.get(i).get("recive_total"));
			jsonObject.put("type", overseasWorkPlace.get(i).get("type"));
			jsonObject.put("status", overseasWorkPlace.get(i).get("status"));
			jsonObject.put("time_reg", overseasWorkPlace.get(i).get("time_reg"));
			jsonObject.put("firstname", overseasWorkPlace.get(i).get("firstname"));
			jsonObject.put("lastname", overseasWorkPlace.get(i).get("lastname"));
			
			jsonArray.put(jsonObject);
		
		}
		
		
		new EtcMethods().responseJSONArray(jsonArray, response);
	}
	
	//Insert Overseas work place
	@RequestMapping(value = "/overseasWorkPlaceInsert", method = RequestMethod.POST)
	@ResponseBody
	public void overseasWorkPlaceInsert(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		session = request.getSession(false);
		EtcMethods etc = new EtcMethods();
		int sessionStatus = etc.checkSession(session, request);
		String status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
		String alert = "0";
		
		if(sessionStatus == 0 && !session.getAttribute("role").toString().equals("1") && !session.getAttribute("role").toString().equals("2")) {
			
			String user_id = session.getAttribute("id").toString();
			String ip = request.getParameter("ip");
			
			String name = request.getParameter("overseas_name");
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
				ArrayList<String> overseasSkillID = new SkillDAO().checkInsertDuplicateSkill(skillData);
				
				String address = address1+" "+address2+" "+address3+" "+address4+" "+address5;
				int lastId = new OverseasWorkPlaceDAO().insertOverseasWorkPlace(user_id, name, address, email, phone, receive, type);
				
				if(lastId > 0) {
					
					for(int i = 0; i < overseasSkillID.size(); i++) {
						
						new OverseasWorkPlaceSkillDAO().insertOverseasWorkPlaceSkill(Integer.toString(lastId), overseasSkillID.get(i));
					}
					
					status = "บันทึกข้อมูลเรียบร้อย";
					alert = "1";
					
					new EventHistoryDAO().insertEventHistory(user_id, "บันทึกข้อมูลสถานที่ทำงานรหัส "+lastId, ip);
					
				}
				
				
			}
			
		}
		
		JSONObject jsonObject = new JSONObject();
		
		jsonObject.put("status", status);
		jsonObject.put("alert", alert);
		new EtcMethods().responseJSONObject(jsonObject, response);
		
	}
	
	//Update Overseas work place
	@RequestMapping(value = "/overseasWorkPlaceUpdate", method = RequestMethod.POST)
	@ResponseBody
	public void overseasWorkPlaceUpdate(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		session = request.getSession(false);
		EtcMethods etc = new EtcMethods();
		int sessionStatus = etc.checkSession(session, request);
		String status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
		String alert = "0";
		
		if(sessionStatus == 0 && !session.getAttribute("role").toString().equals("1") && !session.getAttribute("role").toString().equals("2")) {
			
			String user_id = session.getAttribute("id").toString();
			String ip = request.getParameter("ip");
			
			String overseas_work_place_id = request.getParameter("overseas_id");
			String name = request.getParameter("overseas_name");
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
			
			if(checkData(phone, receive, email, user_id, ip, name, type, address1, address2, address3, address4, address5) == 0 && overseas_work_place_id != null && !overseas_work_place_id.equals("")) {
				String address = address1+" "+address2+" "+address3+" "+address4+" "+address5;
				
				int updateStatus = new OverseasWorkPlaceDAO().updateOverseasWorkPlace(overseas_work_place_id, name, address, email, phone, receive, type);
				
				if(updateStatus == 1) {
					
					if(skill != null && !skill.equals("")) {
						
						if(new OverseasWorkPlaceSkillDAO().deleteOverseasWorkPlaceSkill(overseas_work_place_id) != -1) {
							
							ArrayList<HashMap<String, String>> skillData = etc.checkSkill(skill);
							ArrayList<String> overseasSkillID = new SkillDAO().checkInsertDuplicateSkill(skillData);
							
							int overseasSkillInsertStatus = -1;
							
							for(int i = 0; i < overseasSkillID.size(); i++) {
								
								overseasSkillInsertStatus = new OverseasWorkPlaceSkillDAO().insertOverseasWorkPlaceSkill(overseas_work_place_id, overseasSkillID.get(i));
							}
							
							if(overseasSkillInsertStatus != -1) {
								
								status = "แก้ไขข้อมูลสถานที่ทำงานสำเร็จ";	
								alert = "1";
								
								new EventHistoryDAO().insertEventHistory(user_id, "แก้ไขข้อมูลสถานที่ทำงานและข้อมูลทักษะความสามารถรหัส "+overseas_work_place_id, ip);
							
							} else if(overseasSkillID.size() == 0) {
								
								status = "แก้ไขข้อมูลสถานที่ทำงานสำเร็จ";	
								alert = "1";
								
								new EventHistoryDAO().insertEventHistory(user_id, "แก้ไขข้อมูลสถานที่ทำงานและลบข้อมูลทักษะความสามารถรหัส "+overseas_work_place_id, ip);
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
	
	//Delete Overseas work place
//	@RequestMapping(value = "/overseasWorkPlaceDelete", method = RequestMethod.POST)
//	@ResponseBody
//	public void overseasWorkPlaceDelete(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
//		response.setContentType("text/html;charset=UTF-8");
//		request.setCharacterEncoding("UTF-8");
//		
//		session = request.getSession(false);
//		int sessionStatus = new EtcMethods().checkSession(session, request);
//		String status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
//		
//		if(sessionStatus == 0 && !session.getAttribute("role").toString().equals("1") && !session.getAttribute("role").toString().equals("2")) {
//			
//			String overseas_work_place_id = request.getParameter("overseas_id");
//			String ip = request.getParameter("ip");
//			
//			String user_id = session.getAttribute("id").toString();
//			
//			if(overseas_work_place_id != null && ip != null && user_id != null && !overseas_work_place_id.equals("") && !ip.equals("") && !user_id.equals("")) {
//				
//				status = (new OverseasWorkPlaceDAO().deleteOverseasWorkPlace(overseas_work_place_id) == 1)? "ลบข้อมูลเรียบร้อย":"เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
//				
//				new EventHistoryDAO().insertEventHistory(user_id, "ลบข้อมูลสถานที่ทำงานรหัส "+overseas_work_place_id, ip);
//				
//				
//			}
//			
//		}
//		
//		JSONObject jsonObject = new JSONObject();
//		
//		jsonObject.put("status", status);
//		new EtcMethods().responseJSONObject(jsonObject, response);
//		
//	}
	
	@RequestMapping(value = "/managementOverseasStatusByAdmin", method = RequestMethod.POST)
	@ResponseBody
	public void managementOverseasStatusByAdmin(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		EtcMethods etc = new EtcMethods();
		
		session = request.getSession(false);
		int sessionStatus = etc.checkSession(session, request);
		String status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
		String alert = "0";
		
		if(sessionStatus == 0 && !session.getAttribute("role").toString().equals("1") && !session.getAttribute("role").toString().equals("2")) {
			
			String admin_id = session.getAttribute("id").toString();
			String overseas_id = request.getParameter("overseas_id");
			String ip = request.getParameter("ip");
			String status_overseas = request.getParameter("status");
			
			
			if(admin_id != null && overseas_id != null && ip != null && status_overseas != null && !status_overseas.equals("") && !admin_id.equals("") && !overseas_id.equals("") && !ip.equals("")) {
				
				if(new OverseasWorkPlaceDAO().managementStatusOverseas(overseas_id, status_overseas) == 1) {
					
					status = "อัปเดทสถานะสถานที่ทำงานสำเร็จ";
					alert = "1";
					String detail_event = (status_overseas.equals("1"))? "ยืนยันสถานที่ทำงานรหัส "+overseas_id: "ยกเลิกการยืนยันสถานที่ทำงานรหัส "+overseas_id;
					new EventHistoryDAO().insertEventHistory(admin_id, detail_event, ip);
					
				}
				
				
			}
				
		}
			
		JSONObject jsonObject = new JSONObject();
		
		jsonObject.put("status", status);
		jsonObject.put("alert", alert);
		etc.responseJSONObject(jsonObject, response);
		
	}
	
	@RequestMapping(value = "/overseas", method = RequestMethod.GET)
	public ModelAndView overseas(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");
		
		session = request.getSession(false); 
		int sessionStatus = new EtcMethods().checkSession(session, request);
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("1")) {
			
			return new ModelAndView("role1/oversea");
			
		} else {
			
			return new ModelAndView("404");
		}
	
	}
	
	
	//Student oversea query
	@RequestMapping(value = "/findOverseasWorkPlaceBySkill", method = RequestMethod.POST)
	@ResponseBody
	public void findOverseasWorkPlaceBySkill(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		session = request.getSession(false);
		EtcMethods etc = new EtcMethods();
		int sessionStatus = etc.checkSession(session, request);
		JSONArray jsonArray = new JSONArray();
		ArrayList<HashMap<String, Object>> overseasWorkPlace = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<HashMap<String, Object>> overseasWorkPlaceMatching = null;
		ArrayList<HashMap<String, Object>> overseasWorkPlaceNoMatching = null;
		ArrayList<HashMap<String, Object>> overseasWorkPlaceNoSkill = null;
		
		JSONObject jsonObject = null;
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("1")) {
			
			overseasWorkPlaceMatching = new OverseasWorkPlaceDAO().queryOverseasWorkPlaceMatching(session.getAttribute("id").toString());
			overseasWorkPlaceNoMatching = new OverseasWorkPlaceDAO().queryOverseasWorkPlaceNoMatching(session.getAttribute("id").toString());
			overseasWorkPlaceNoSkill = new OverseasWorkPlaceDAO().queryOverseasWorkPlaceNoSkill();
			
			for(int i = 0; i < overseasWorkPlaceMatching.size(); i++) {
				overseasWorkPlace.add(overseasWorkPlaceMatching.get(i));
			}
			
			for(int i = 0; i < overseasWorkPlaceNoMatching.size(); i++) {
				overseasWorkPlace.add(overseasWorkPlaceNoMatching.get(i));
			}
			
			for(int i = 0; i < overseasWorkPlaceNoSkill.size(); i++) {
				overseasWorkPlace.add(overseasWorkPlaceNoSkill.get(i));
			}
			
			for(int i = 0; i < overseasWorkPlace.size(); i++) {
				jsonObject = new JSONObject();
				jsonObject.put("overseas_work_place_id", overseasWorkPlace.get(i).get("overseas_work_place_id"));
				jsonObject.put("name", overseasWorkPlace.get(i).get("name"));
				jsonObject.put("address", overseasWorkPlace.get(i).get("address"));
				jsonObject.put("email", overseasWorkPlace.get(i).get("email"));
				jsonObject.put("phone", overseasWorkPlace.get(i).get("phone"));
				jsonObject.put("recive_total", overseasWorkPlace.get(i).get("recive_total"));
				jsonObject.put("time_reg", overseasWorkPlace.get(i).get("time_reg"));
				jsonObject.put("status", overseasWorkPlace.get(i).get("status"));
				jsonObject.put("user_id", overseasWorkPlace.get(i).get("user_id"));
				jsonObject.put("type", overseasWorkPlace.get(i).get("type"));
				jsonObject.put("matching", overseasWorkPlace.get(i).get("matching"));
				
				jsonObject.put("province", overseasWorkPlace.get(i).get("address").toString().split("\\s+")[1]);

				jsonArray.put(jsonObject);
				
			}
			
		}
		
		new EtcMethods().responseJSONArray(jsonArray, response);
	}
	
	//Filter zone
	@RequestMapping(value = "/findOverseasWorkPlaceByZone", method = RequestMethod.POST)
	@ResponseBody
	public void findOverseasWorkPlaceByZone(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		session = request.getSession(false);
		EtcMethods etc = new EtcMethods();
		int sessionStatus = etc.checkSession(session, request);
		JSONArray jsonArray = new JSONArray();
		ArrayList<HashMap<String, Object>> overseasWorkPlace = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<HashMap<String, Object>> overseasWorkPlaceMatching = null;
		ArrayList<HashMap<String, Object>> overseasWorkPlaceNoMatching = null;
		ArrayList<HashMap<String, Object>> overseasWorkPlaceNoSkill = null;
		
		JSONObject jsonObject = null;
		String zone = request.getParameter("zone_value");
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("1") && zone != null && !zone.equals("")) {
			
			if(zone.equals("1") || zone.equals("2") || zone.equals("3") || zone.equals("4") || zone.equals("5") || zone.equals("6")) {
				
				String[][] zone_filter = new AddressParameterConfig().zone; 
				String[] zone_data = new String[zone_filter[Integer.parseInt(zone)-1].length];
				
				for(int i = 0; i < zone_filter[Integer.parseInt(zone)-1].length; i++) {
					zone_data[i] = zone_filter[Integer.parseInt(zone)-1][i];
				}
				
				overseasWorkPlaceMatching = new OverseasWorkPlaceDAO().queryOverseasWorkPlaceMatchingByZone(session.getAttribute("id").toString(), zone_data);
				overseasWorkPlaceNoMatching = new OverseasWorkPlaceDAO().queryOverseasWorkPlaceNoMatchingByZone(session.getAttribute("id").toString(), zone_data);
				overseasWorkPlaceNoSkill = new OverseasWorkPlaceDAO().queryOverseasWorkPlaceNoSkillByZone(zone_data);
				
				for(int i = 0; i < overseasWorkPlaceMatching.size(); i++) {
					overseasWorkPlace.add(overseasWorkPlaceMatching.get(i));
				}

				for(int i = 0; i < overseasWorkPlaceNoMatching.size(); i++) {
					overseasWorkPlace.add(overseasWorkPlaceNoMatching.get(i));
				}
				
				for(int i = 0; i < overseasWorkPlaceNoSkill.size(); i++) {
					overseasWorkPlace.add(overseasWorkPlaceNoSkill.get(i));
				}
				
				for(int i = 0; i < overseasWorkPlace.size(); i++) {
					jsonObject = new JSONObject();
					jsonObject.put("overseas_work_place_id", overseasWorkPlace.get(i).get("overseas_work_place_id"));
					jsonObject.put("name", overseasWorkPlace.get(i).get("name"));
					jsonObject.put("address", overseasWorkPlace.get(i).get("address"));
					jsonObject.put("email", overseasWorkPlace.get(i).get("email"));
					jsonObject.put("phone", overseasWorkPlace.get(i).get("phone"));
					jsonObject.put("recive_total", overseasWorkPlace.get(i).get("recive_total"));
					jsonObject.put("time_reg", overseasWorkPlace.get(i).get("time_reg"));
					jsonObject.put("status", overseasWorkPlace.get(i).get("status"));
					jsonObject.put("user_id", overseasWorkPlace.get(i).get("user_id"));
					jsonObject.put("type", overseasWorkPlace.get(i).get("type"));
					jsonObject.put("matching", overseasWorkPlace.get(i).get("matching"));
					
					jsonObject.put("province", overseasWorkPlace.get(i).get("address").toString().split("\\s+")[1]);

					jsonArray.put(jsonObject);
					
				}
				
			}
			
		}
		
		new EtcMethods().responseJSONArray(jsonArray, response);
	}
	
	@RequestMapping(value = "/findOverseasWorkPlaceChoice", method = RequestMethod.POST)
	@ResponseBody
	public void findOverseasWorkPlaceChoice(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		session = request.getSession(false);
		EtcMethods etc = new EtcMethods();
		int sessionStatus = etc.checkSession(session, request);
		JSONArray jsonArray = new JSONArray();
		ArrayList<HashMap<String, Object>> overseasWorkPlace = null;
		JSONObject jsonObject = null;
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("3")) {
			
			overseasWorkPlace = new OverseasWorkPlaceDAO().queryOverseasWorkPlaceChoice(session.getAttribute("id").toString());
			
			for(int i = 0; i < overseasWorkPlace.size(); i++) {
				jsonObject = new JSONObject();
				jsonObject.put("overseas_work_place_id", overseasWorkPlace.get(i).get("overseas_work_place_id"));
				jsonObject.put("name", overseasWorkPlace.get(i).get("name"));

				jsonArray.put(jsonObject);
				
			}
			
		}
		
		new EtcMethods().responseJSONArray(jsonArray, response);
	}
	
	@RequestMapping(value = "/insertUserAndOverseasRole3", method = RequestMethod.POST)
	@ResponseBody
	public void insertUserAndOverseasRole3(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		EtcMethods etc = new EtcMethods();
		int sessionStatus = etc.checkSession(session, request);
		String status = "เกิดข้อผิดพลาด กรุณาดำเนินการใหม่ภายหลัง";
		String alert = "0";
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("3")) {
		
		String ip = request.getParameter("ip");
		String overseas_work_place_id = request.getParameter("overseas_id");
		String user_id_list = request.getParameter("user_id");
		String role3_id = session.getAttribute("id").toString();
		String email = "";
		
		if(user_id_list != null && !user_id_list.equals("") && ip != null && !ip.equals("") && overseas_work_place_id != null && !overseas_work_place_id.equals("")) {
			
			user_id_list = user_id_list.replace("[", "");
			user_id_list = user_id_list.replace("]", "");
			user_id_list = user_id_list.replace("\"", "");
			
			String[] user_id_data = user_id_list.split(",");
			
			for(int i = 0; i < user_id_data.length; i++) {
				
				new StudentOverseasWorkPlaceDAO().insertOverseasAndUser(user_id_data[i], overseas_work_place_id, "2");
				
				email = new UserDAO().findEmailByUserId(user_id_data[i]).get("email").toString();
				
				etc.sendEmail(role3_id, email, "มีบริษัทสนใจอยากรับคุณเข้าทำงาน", "มีบริษัทสนใจอยากรับคุณเข้าทำงาน\nสามารถตรวจสอบได้ที่นี่ "+url+"overseasRequestYou");
			}
				
				
			status = "ส่งข้อมูลบริษัทให้นิสิต/นักศึกษาแล้ว";
			alert = "1";
			}
		}
					
		JSONObject jsonObject = new JSONObject();
		
		jsonObject.put("status", status);
		jsonObject.put("alert", alert);
		new EtcMethods().responseJSONObject(jsonObject, response);
		
	}
	
	@RequestMapping(value = "/sendContact", method = RequestMethod.GET)
	public ModelAndView sendContact(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");
		
		session = request.getSession(false); 
		int sessionStatus = new EtcMethods().checkSession(session, request);
		
		if(sessionStatus == 0 && session.getAttribute("role").toString().equals("2")) {
			
			return new ModelAndView("role2/send_contact_to_student");
			
		} else if(sessionStatus == 0 && session.getAttribute("role").toString().equals("3")) {
			
			return new ModelAndView("role3/send_contact_to_student");
			
		} else {
			
			return new ModelAndView("404");
		}
	
	}

}
