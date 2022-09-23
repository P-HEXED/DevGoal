package com.devgoal.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.devgoal.dao.impl.DAO;
import com.devgoal.database.Database;
import com.devgoal.model.PlaceOfInternshipModel;

public class PlaceOfInternshipDAO implements DAO<PlaceOfInternshipModel>{
	
	Database db = new Database();

	@Override
	public int Add(PlaceOfInternshipModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public HashMap<String, Object> queryEmailUser(String internship_id) {
		
		String sql = "SELECT \n" +
					"	user.email \n" +
					"FROM place_of_internship \n" +
					"INNER JOIN user ON user.user_id = place_of_internship.user_id \n" +
					"WHERE place_of_internship.place_of_internship_id = ?";
		
		String[] data = {internship_id};
		
		return db.querySingleWithPrepare(sql, data);
	}

	@Override
	public int Delete(PlaceOfInternshipModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int Update(PlaceOfInternshipModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public ArrayList<HashMap<String, Object>> queryPlaceOfInternshipRole4() {
		
		String sql = "SELECT\n" +
					"	place_of_internship.place_of_internship_id,\n" +
					"	place_of_internship.name,\n" +
					"	place_of_internship.address,\n" +
					"	place_of_internship.email,\n" +
					"	place_of_internship.phone,\n" +
					"	place_of_internship.recive_total,\n" +
					"	place_of_internship.time_reg,\n" +
					"	user.firstname,\n" +
					"	user.lastname,\n" +
					"	\n" +
					"CASE place_of_internship.type\n" +
					"	WHEN 1 THEN 'ในประเทศ'\n" +
					"	WHEN 2 THEN 'ต่างประเทศ'\n" +
					"END type,\n" +
					"CASE place_of_internship.status \n" +
					"	WHEN 0 THEN 'ไม่ผ่านการยืนยัน' \n" +
					"	WHEN 1 THEN 'ยืนยันแล้ว' \n" +
					"	WHEN 2 THEN 'รอการตรวจสอบ' \n" +
					"END status \n" +
					"	\n" +
					"FROM\n" +
					"	place_of_internship\n" +
					"	\n" +
					"INNER JOIN user ON user.user_id = place_of_internship.user_id";
		
		return db.queryList(sql);
	}
	
	public ArrayList<HashMap<String, Object>> queryPlaceOfInternshipRole2(String user_id) {
		
		String sql = "SELECT\n" +
					"	place_of_internship.place_of_internship_id,\n" +
					"	place_of_internship.name,\n" +
					"	place_of_internship.address,\n" +
					"	place_of_internship.email,\n" +
					"	place_of_internship.phone,\n" +
					"	place_of_internship.recive_total,\n" +
					"	place_of_internship.time_reg,\n" +
					"	user.firstname,\n" +
					"	user.lastname,\n" +
					"	\n" +
					"CASE place_of_internship.type \n" +
					"		WHEN 1 THEN\n" +
					"		'ในประเทศ' \n" +
					"		WHEN 2 THEN\n" +
					"		'ต่างประเทศ' \n" +
					"END type,\n" +
					"CASE place_of_internship.status \n" +
					"		WHEN 0 THEN\n" +
					"		'ไม่ผ่านการยืนยัน' \n" +
					"		WHEN 1 THEN\n" +
					"		'ยืนยันแล้ว' \n" +
					"		WHEN 2 THEN\n" +
					"		'รอการตรวจสอบ' \n" +
					"END status \n" +
					"FROM\n" +
					"	place_of_internship\n" +
					"INNER JOIN USER ON USER.user_id = place_of_internship.user_id\n" +
					"WHERE user.user_id = ? AND place_of_internship.request_status = 1";
		String[] data = {user_id};
		
		return db.queryListWithPrepare(sql, data);
	}
	
	public ArrayList<HashMap<String, Object>> queryPlaceOfInternshipReuqestRole2() {
		
		String sql = "SELECT \n" +
					"	place_of_internship.place_of_internship_id, \n" +
					"	place_of_internship.name, \n" +
					"	place_of_internship.address, \n" +
					"	place_of_internship.email, \n" +
					"	place_of_internship.phone, \n" +
					"	place_of_internship.recive_total, \n" +
					"	place_of_internship.time_reg, \n" +
					"	user.firstname, \n" +
					"	user.lastname, \n" +
					"	university.name AS university_name,\n" +
					"	faculty.name AS faculty_name,\n" +
					"	course.name AS course_name,\n" +
					"	 \n" +
					"CASE place_of_internship.type  \n" +
					"		WHEN 1 THEN \n" +
					"		'ในประเทศ'  \n" +
					"		WHEN 2 THEN \n" +
					"		'ต่างประเทศ'  \n" +
					"END type, \n" +
					"CASE place_of_internship.status  \n" +
					"		WHEN 0 THEN \n" +
					"		'ไม่ผ่านการยืนยัน'  \n" +
					"		WHEN 1 THEN \n" +
					"		'ยืนยันแล้ว'  \n" +
					"		WHEN 2 THEN \n" +
					"		'รอการตรวจสอบ'  \n" +
					"END status  \n" +
					"FROM \n" +
					"	place_of_internship \n" +
					"INNER JOIN user ON user.user_id = place_of_internship.user_id \n" +
					"INNER JOIN university ON university.university_id = user.university_id\n" +
					"INNER JOIN faculty ON faculty.faculty_id = user.faculty_id\n" +
					"INNER JOIN course ON course.course_id = user.course_id\n" +
					"WHERE place_of_internship.request_status = 2";
		
		return db.queryList(sql);
	}
	
	public int insertPlaceOfInternship(String user_id, String name, String address, String email, String phone, String recive_total, String type) {
		
		String sql = "INSERT INTO place_of_internship(name, address, email, phone, recive_total, type, user_id) VALUES(?, ?, ?, ?, ?, ?, ?)";
		String[] data = {name, address, email, phone, recive_total, type, user_id};
		String[] lastId = {"place_of_internship_id"};
		
		return db.executeReturnLastId(sql, data, lastId);
	}
	
	public int insertRequestPlaceOfInternship(String user_id, String name, String address, String email, String phone, String recive_total, String type) {
		
		String sql = "INSERT INTO place_of_internship(name, address, email, phone, recive_total, type, user_id, request_status) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
		String[] data = {name, address, email, phone, recive_total, type, user_id, "2"};
		String[] lastId = {"place_of_internship_id"};
		
		return db.executeReturnLastId(sql, data, lastId);
	}
	
	public int insertPlaceOfInternshipNoRole(String name, String address, String email, String phone, String recive_total, String type) {
		
		String sql = "INSERT INTO place_of_internship(name, address, email, phone, recive_total, type, request_status) VALUES(?, ?, ?, ?, ?, ?, ?)";
		String[] data = {name, address, email, phone, recive_total, type, "3"};
		String[] lastId = {"place_of_internship_id"};
		
		return db.executeReturnLastId(sql, data, lastId);
	}
	
	public int updatePlaceOfInternship(String place_of_internship, String name, String address, String email, String phone, String recive_total, String type) {
		
		String sql = "UPDATE place_of_internship SET name = ?, address = ?, email = ?, phone = ?, recive_total = ?, type = ? WHERE place_of_internship_id = ?";
		String[] data = {name, address, email, phone, recive_total, type, place_of_internship};
		
		return db.execute(sql, data);
	}
	
	public int updatePlaceOfInternshipRequest(String user_id, String place_of_internship, String name, String address, String email, String phone, String recive_total, String type) {
		
		String sql = "UPDATE place_of_internship SET name = ?, address = ?, email = ?, phone = ?, recive_total = ?, type = ?, user_id = ?, request_status = 1 WHERE place_of_internship_id = ?";
		String[] data = {name, address, email, phone, recive_total, type, user_id, place_of_internship};
		
		return db.execute(sql, data);
	}
	
//	public int deletePlaceOfInternship(String place_of_internship) {
//		
//		String sql = "DELETE FROM place_of_internship WHERE place_of_internship_id = ?";
//		String[] data = {place_of_internship};
//		
//		return db.execute(sql, data);
//	}
	
	public ArrayList<HashMap<String, Object>> queryPlaceOfInternshipReuqestStudentRole2() {
		
		String sql = "SELECT  \n" +
					"	place_of_internship.place_of_internship_id,  \n" +
					"	place_of_internship.name,  \n" +
					"	place_of_internship.address,  \n" +
					"	place_of_internship.email,  \n" +
					"	place_of_internship.phone,  \n" +
					"	place_of_internship.recive_total,  \n" +
					"	place_of_internship.time_reg,  \n" +
					"CASE place_of_internship.type   \n" +
					"		WHEN 1 THEN  \n" +
					"		'ในประเทศ'   \n" +
					"		WHEN 2 THEN  \n" +
					"		'ต่างประเทศ'   \n" +
					"END type,  \n" +
					"CASE place_of_internship.status   \n" +
					"		WHEN 0 THEN  \n" +
					"		'ไม่ผ่านการยืนยัน'   \n" +
					"		WHEN 1 THEN  \n" +
					"		'ยืนยันแล้ว'   \n" +
					"		WHEN 2 THEN  \n" +
					"		'รอการตรวจสอบ'   \n" +
					"END status   \n" +
					"FROM  \n" +
					"	place_of_internship  \n" +
					"WHERE place_of_internship.request_status = 3 AND place_of_internship.status = 2";
		
		return db.queryList(sql);
	}
	
	public ArrayList<HashMap<String, Object>> queryEmailPlaceOfInternshipReuqestStudentRole2(String internship_id) {
		
		String sql = "SELECT \n" +
					"	user.email\n" +
					"FROM user\n" +
					"INNER JOIN student_place_of_internship ON student_place_of_internship.user_id = user.user_id\n" +
					"INNER JOIN place_of_internship ON place_of_internship.place_of_internship_id = student_place_of_internship.place_of_internship_id\n" +
					"WHERE place_of_internship.request_status = 3 AND place_of_internship.status = 2 AND place_of_internship.place_of_internship_id = ?";
		
		String[] data = {internship_id};
		return db.queryListWithPrepare(sql, data);
	}
	
	public ArrayList<HashMap<String, Object>> queryPlaceOfInternshipReuqestStudentRole1(String user_id) {
		
		String sql = "SELECT    \n" +
					"	place_of_internship.place_of_internship_id,    \n" +
					"	place_of_internship.name,    \n" +
					"	place_of_internship.address,    \n" +
					"	place_of_internship.email,    \n" +
					"	place_of_internship.phone,    \n" +
					"	place_of_internship.recive_total,    \n" +
					"	place_of_internship.time_reg, \n" +
					"	user.email AS user_email,\n" +
					"CASE place_of_internship.type     \n" +
					"		WHEN 1 THEN    \n" +
					"		'ในประเทศ'     \n" +
					"		WHEN 2 THEN    \n" +
					"		'ต่างประเทศ'     \n" +
					"END type,    \n" +
					"CASE student_place_of_internship.status     \n" +
					"		WHEN 0 THEN    \n" +
					"		'ไม่ตอบรับ'     \n" +
					"		WHEN 1 THEN    \n" +
					"		'ตกลงฝึกงาน'     \n" +
					"		WHEN 2 THEN    \n" +
					"		'รอการตรวจสอบ'     \n" +
					"END status     \n" +
					"FROM    \n" +
					"	place_of_internship    \n" +
					"INNER JOIN student_place_of_internship ON student_place_of_internship.place_of_internship_id = place_of_internship.place_of_internship_id \n" +
					"INNER JOIN user ON user.user_id = place_of_internship.user_id\n" +
					"WHERE place_of_internship.request_status = 1 AND place_of_internship.status = 1 AND student_place_of_internship.condition = 2 AND student_place_of_internship.user_id = ?";
		
		String[] data = {user_id};
		return db.queryListWithPrepare(sql, data);
	}
	
	public int managementStatusInternship(String internship_id, String status) {
		
		String sql = "UPDATE place_of_internship SET status = ? WHERE place_of_internship_id = ?";
		String[] data = {status, internship_id};
		
		return db.execute(sql, data);
	}
	
	public int managementStatusInternshipRequest(String internship_id, String user_id, String status) {
		
		String sql = "UPDATE place_of_internship SET status = ?, user_id = ?, request_status = 1 WHERE place_of_internship_id = ?";
		String[] data = {status, user_id, internship_id};
		
		return db.execute(sql, data);
	}

	@Override
	public ArrayList<PlaceOfInternshipModel> FindAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PlaceOfInternshipModel FindByID(PlaceOfInternshipModel bean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PlaceOfInternshipModel FindByID(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PlaceOfInternshipModel MappingBeans(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}
	
//	public ArrayList<HashMap<String, Object>> queryPlaceOfInternshipRole1Matching(String user_id) {
//		
//		String sql = "SELECT  \n" +
//					"	place_of_internship.place_of_internship_id,  \n" +
//					"	place_of_internship.name, \n" +
//					"	place_of_internship.address,  \n" +
//					"	place_of_internship.email,  \n" +
//					"	place_of_internship.phone,  \n" +
//					"	place_of_internship.recive_total,  \n" +
//					"	place_of_internship.time_reg, \n" +
//					"	place_of_internship.status, \n" +
//					"	place_of_internship.user_id, \n" +
//					"							\n" +
//					" CASE place_of_internship.type  \n" +
//					"	WHEN 1 THEN 'ในประเทศ'  \n" +
//					"	WHEN 2 THEN 'ต่างประเทศ'  \n" +
//					" END type \n" +
//					"							\n" +
//					"FROM  \n" +
//					"	place_of_internship \n" +
//					"	 \n" +
//					"INNER JOIN place_of_internship_skill ON place_of_internship_skill.place_of_internship_id = place_of_internship.place_of_internship_id \n" +
//					"INNER JOIN skill ON skill.skill_id = place_of_internship_skill.skill_id \n" +
//					"WHERE skill.detail IN (SELECT skill.detail FROM skill  INNER JOIN user_skill ON user_skill.skill_id = skill.skill_id WHERE user_skill.user_id = ? AND skill.status = 1 \n" +
//					"GROUP BY skill.detail) \n" +
//					"AND place_of_internship.status = 1  \n" +
//					"OR skill.detail NOT IN (SELECT skill.detail FROM skill  INNER JOIN user_skill ON user_skill.skill_id = skill.skill_id WHERE user_skill.user_id = ? AND skill.status = 1 GROUP BY skill.detail)\n" +
//					"AND place_of_internship.status = 1  \n" +
//					"GROUP BY place_of_internship.place_of_internship_id\n" +
//					"ORDER BY skill.detail IN (SELECT skill.detail FROM skill  INNER JOIN user_skill ON user_skill.skill_id = skill.skill_id WHERE user_skill.user_id = ? AND skill.status = 1 \n" +
//					"GROUP BY skill.detail) DESC";
//		
//		String[] data = {user_id, user_id, user_id};
//		return db.queryListWithPrepare(sql, data);
//	}
	
	public ArrayList<HashMap<String, Object>> queryPlaceOfInternshipMatching(String user_id) {
		
		String sql = "SELECT   \n" +
						"	place_of_internship.place_of_internship_id,   \n" +
						"	place_of_internship.name,  \n" +
						"	place_of_internship.address,   \n" +
						"	place_of_internship.email,   \n" +
						"	place_of_internship.phone,   \n" +
						"	place_of_internship.recive_total,   \n" +
						"	place_of_internship.time_reg,  \n" +
						"	place_of_internship.status,  \n" +
						"	place_of_internship.user_id,  \n" +
						"							 \n" +
						" CASE place_of_internship.type   \n" +
						"	WHEN 1 THEN 'ในประเทศ'   \n" +
						"	WHEN 2 THEN 'ต่างประเทศ'   \n" +
						" END type,\n" +
						" 1 AS matching\n" +
						"							 \n" +
						"FROM   \n" +
						"	place_of_internship  \n" +
						"		\n" +
						"INNER JOIN place_of_internship_skill ON place_of_internship_skill.place_of_internship_id = place_of_internship.place_of_internship_id  \n" +
						"INNER JOIN skill ON skill.skill_id = place_of_internship_skill.skill_id  \n" +
						"WHERE skill.detail IN (SELECT skill.detail FROM skill  INNER JOIN user_skill ON user_skill.skill_id = skill.skill_id WHERE user_skill.user_id = ? AND skill.status = 1  \n" +
						"GROUP BY skill.detail)  \n" +
						"AND place_of_internship.status = 1   \n" +
						"GROUP BY place_of_internship.place_of_internship_id ";
		
		String[] data = {user_id};
		return db.queryListWithPrepare(sql, data);
	}
	
	public ArrayList<HashMap<String, Object>> queryPlaceOfInternshipNoMatching(String user_id) {
		
		String sql = "SELECT   \n" +
						"	place_of_internship.place_of_internship_id,   \n" +
						"	place_of_internship.name,  \n" +
						"	place_of_internship.address,   \n" +
						"	place_of_internship.email,   \n" +
						"	place_of_internship.phone,   \n" +
						"	place_of_internship.recive_total,   \n" +
						"	place_of_internship.time_reg,  \n" +
						"	place_of_internship.status,  \n" +
						"	place_of_internship.user_id,  \n" +
						"							 \n" +
						" CASE place_of_internship.type   \n" +
						"	WHEN 1 THEN 'ในประเทศ'   \n" +
						"	WHEN 2 THEN 'ต่างประเทศ'   \n" +
						" END type,\n" +
						" 0 AS matching\n" +
						"							 \n" +
						"FROM   \n" +
						"	place_of_internship  \n" +
						"		\n" +
						"INNER JOIN place_of_internship_skill ON place_of_internship_skill.place_of_internship_id = place_of_internship.place_of_internship_id  \n" +
						"INNER JOIN skill ON skill.skill_id = place_of_internship_skill.skill_id  \n" +
						"WHERE skill.detail NOT IN (SELECT skill.detail FROM skill  INNER JOIN user_skill ON user_skill.skill_id = skill.skill_id WHERE user_skill.user_id = ? AND skill.status = 1 GROUP BY skill.detail) \n" +
						"AND place_of_internship.status = 1  \n" +
						"GROUP BY place_of_internship.place_of_internship_id ";
		
		String[] data = {user_id};
		return db.queryListWithPrepare(sql, data);
	}
	
//	public ArrayList<HashMap<String, Object>> queryPlaceOfInternshipRole1MatchingByZone(String user_id, String[] zone_data) {
//		
//		String sub_sql = "";
//		
//		if(zone_data.length != 0) {
//			
//			sub_sql = "AND place_of_internship.address REGEXP '";
//			
//			for(int i = 0; i <zone_data.length; i++) {
//				
//				sub_sql += zone_data[i]+"|";
//				
//			}
//			
//			sub_sql = sub_sql.substring(0, sub_sql.length()-1);
//			sub_sql += "' \n";
//		}
//		
//		String sql = "SELECT  \n" +
//					"	place_of_internship.place_of_internship_id,  \n" +
//					"	place_of_internship.name, \n" +
//					"	place_of_internship.address,  \n" +
//					"	place_of_internship.email,  \n" +
//					"	place_of_internship.phone,  \n" +
//					"	place_of_internship.recive_total,  \n" +
//					"	place_of_internship.time_reg, \n" +
//					"	place_of_internship.status, \n" +
//					"	place_of_internship.user_id, \n" +
//					"							\n" +
//					" CASE place_of_internship.type  \n" +
//					"	WHEN 1 THEN 'ในประเทศ'  \n" +
//					"	WHEN 2 THEN 'ต่างประเทศ'  \n" +
//					" END type \n" +
//					"							\n" +
//					"FROM  \n" +
//					"	place_of_internship \n" +
//					"	 \n" +
//					"INNER JOIN place_of_internship_skill ON place_of_internship_skill.place_of_internship_id = place_of_internship.place_of_internship_id \n" +
//					"INNER JOIN skill ON skill.skill_id = place_of_internship_skill.skill_id \n" +
//					"WHERE skill.detail IN (SELECT skill.detail FROM skill  INNER JOIN user_skill ON user_skill.skill_id = skill.skill_id WHERE user_skill.user_id = ? AND skill.status = 1 \n" +
//					"GROUP BY skill.detail) \n" +
//					"AND place_of_internship.status = 1  \n" +
//					sub_sql +
//					"OR skill.detail NOT IN (SELECT skill.detail FROM skill  INNER JOIN user_skill ON user_skill.skill_id = skill.skill_id WHERE user_skill.user_id = ? AND skill.status = 1 GROUP BY skill.detail)\n" +
//					"AND place_of_internship.status = 1  \n" +
//					sub_sql +
//					"GROUP BY place_of_internship.place_of_internship_id\n" +
//					"ORDER BY skill.detail IN (SELECT skill.detail FROM skill  INNER JOIN user_skill ON user_skill.skill_id = skill.skill_id WHERE user_skill.user_id = ? AND skill.status = 1 \n" +
//					"GROUP BY skill.detail) DESC";
//		
//		String[] data = {user_id, user_id, user_id};
//		return db.queryListWithPrepare(sql, data);
//	}
	
	public ArrayList<HashMap<String, Object>> queryPlaceOfInternshipMatchingByZone(String user_id, String[] zone_data) {
		
		String sub_sql = "";
		
		if(zone_data.length != 0) {
			
			sub_sql = "AND place_of_internship.address REGEXP '";
			
			for(int i = 0; i <zone_data.length; i++) {
				
				sub_sql += zone_data[i]+"|";
				
			}
			
			sub_sql = sub_sql.substring(0, sub_sql.length()-1);
			sub_sql += "' \n";
		}
		
		String sql = "SELECT  \n" +
					"	place_of_internship.place_of_internship_id,  \n" +
					"	place_of_internship.name, \n" +
					"	place_of_internship.address,  \n" +
					"	place_of_internship.email,  \n" +
					"	place_of_internship.phone,  \n" +
					"	place_of_internship.recive_total,  \n" +
					"	place_of_internship.time_reg, \n" +
					"	place_of_internship.status, \n" +
					"	place_of_internship.user_id, \n" +
					"							\n" +
					" CASE place_of_internship.type  \n" +
					"	WHEN 1 THEN 'ในประเทศ'  \n" +
					"	WHEN 2 THEN 'ต่างประเทศ'  \n" +
					" END type, \n" +
					" 1 AS matching\n" +
					"							\n" +
					"FROM  \n" +
					"	place_of_internship \n" +
					"	 \n" +
					"INNER JOIN place_of_internship_skill ON place_of_internship_skill.place_of_internship_id = place_of_internship.place_of_internship_id \n" +
					"INNER JOIN skill ON skill.skill_id = place_of_internship_skill.skill_id \n" +
					"WHERE skill.detail IN (SELECT skill.detail FROM skill  INNER JOIN user_skill ON user_skill.skill_id = skill.skill_id WHERE user_skill.user_id = ? AND skill.status = 1 \n" +
					"GROUP BY skill.detail) \n" +
					"AND place_of_internship.status = 1  \n" +
					sub_sql +
					"GROUP BY place_of_internship.place_of_internship_id";
		
		String[] data = {user_id};
		return db.queryListWithPrepare(sql, data);
	}
	
	public ArrayList<HashMap<String, Object>> queryPlaceOfInternshipNoMatchingByZone(String user_id, String[] zone_data) {
		
		String sub_sql = "";
		
		if(zone_data.length != 0) {
			
			sub_sql = "AND place_of_internship.address REGEXP '";
			
			for(int i = 0; i <zone_data.length; i++) {
				
				sub_sql += zone_data[i]+"|";
				
			}
			
			sub_sql = sub_sql.substring(0, sub_sql.length()-1);
			sub_sql += "' \n";
		}
		
		String sql = "SELECT  \n" +
					"	place_of_internship.place_of_internship_id,  \n" +
					"	place_of_internship.name, \n" +
					"	place_of_internship.address,  \n" +
					"	place_of_internship.email,  \n" +
					"	place_of_internship.phone,  \n" +
					"	place_of_internship.recive_total,  \n" +
					"	place_of_internship.time_reg, \n" +
					"	place_of_internship.status, \n" +
					"	place_of_internship.user_id, \n" +
					"							\n" +
					" CASE place_of_internship.type  \n" +
					"	WHEN 1 THEN 'ในประเทศ'  \n" +
					"	WHEN 2 THEN 'ต่างประเทศ'  \n" +
					" END type, \n" +
					" 0 AS matching\n" +
					"							\n" +
					"FROM  \n" +
					"	place_of_internship \n" +
					"	 \n" +
					"INNER JOIN place_of_internship_skill ON place_of_internship_skill.place_of_internship_id = place_of_internship.place_of_internship_id \n" +
					"INNER JOIN skill ON skill.skill_id = place_of_internship_skill.skill_id \n" +
					"WHERE skill.detail NOT IN (SELECT skill.detail FROM skill  INNER JOIN user_skill ON user_skill.skill_id = skill.skill_id WHERE user_skill.user_id = ? AND skill.status = 1 \n" +
					"GROUP BY skill.detail) \n" +
					"AND place_of_internship.status = 1  \n" +
					sub_sql +
					"GROUP BY place_of_internship.place_of_internship_id";
		
		String[] data = {user_id};
		return db.queryListWithPrepare(sql, data);
	}
	
	public ArrayList<HashMap<String, Object>> queryPlaceOfInternshipChoice(String user_id) {
		
		String sql = "SELECT \n" +
					"	place_of_internship_id,\n" +
					"	name\n" +
					"FROM place_of_internship\n" +
					"WHERE status = 1 AND user_id = ?";
		
		String[] data = {user_id};
		return db.queryListWithPrepare(sql, data);
	}

}
