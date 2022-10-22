package com.devgoal.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.devgoal.dao.impl.DAO;
import com.devgoal.database.Database;
import com.devgoal.model.OverseasWorkPlaceModel;

public class OverseasWorkPlaceDAO implements DAO<OverseasWorkPlaceModel>{
	
	Database db = new Database();

	@Override
	public int Add(OverseasWorkPlaceModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int Delete(OverseasWorkPlaceModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int Update(OverseasWorkPlaceModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public ArrayList<HashMap<String, Object>> queryOverseasWorkPlaceRole4() {
		
		String sql = "SELECT\n" +
					"	overseas_work_place.overseas_work_place_id,\n" +
					"	overseas_work_place.name,\n" +
					"	overseas_work_place.address,\n" +
					"	overseas_work_place.email,\n" +
					"	overseas_work_place.phone,\n" +
					"	overseas_work_place.recive_total,\n" +
					"	overseas_work_place.time_reg,\n" +
					"	user.firstname,\n" +
					"	user.lastname,\n" +
					"	\n" +
					"CASE overseas_work_place.type\n" +
					"	WHEN 1 THEN 'ในประเทศ'\n" +
					"	WHEN 2 THEN 'ต่างประเทศ'\n" +
					"END type,\n" +
					"CASE overseas_work_place.status \n" +
					"	WHEN 0 THEN 'ไม่ผ่านการยืนยัน' \n" +
					"	WHEN 1 THEN 'ยืนยันแล้ว' \n" +
					"	WHEN 2 THEN 'รอการตรวจสอบ' \n" +
					"END status \n" +
					"	\n" +
					"FROM\n" +
					"	overseas_work_place\n" +
					"	\n" +
					"INNER JOIN user ON user.user_id = overseas_work_place.user_id";
		
		return db.queryList(sql);
	}
	
	public ArrayList<HashMap<String, Object>> queryOverseasWorkPlaceRole3(String user_id) {
		
		String sql = "SELECT\n" +
					"	overseas_work_place.overseas_work_place_id,\n" +
					"	overseas_work_place.name,\n" +
					"	overseas_work_place.address,\n" +
					"	overseas_work_place.email,\n" +
					"	overseas_work_place.phone,\n" +
					"	overseas_work_place.recive_total,\n" +
					"	overseas_work_place.time_reg,\n" +
					"	user.firstname,\n" +
					"	user.lastname,\n" +
					"	\n" +
					"CASE overseas_work_place.type \n" +
					"		WHEN 1 THEN\n" +
					"		'ในประเทศ' \n" +
					"		WHEN 2 THEN\n" +
					"		'ต่างประเทศ' \n" +
					"END type,\n" +
					"CASE overseas_work_place.status \n" +
					"		WHEN 0 THEN\n" +
					"		'ไม่ผ่านการยืนยัน' \n" +
					"		WHEN 1 THEN\n" +
					"		'ยืนยันแล้ว' \n" +
					"		WHEN 2 THEN\n" +
					"		'รอการตรวจสอบ' \n" +
					"END status \n" +
					"FROM\n" +
					"	overseas_work_place\n" +
					"INNER JOIN USER ON USER.user_id = overseas_work_place.user_id\n" +
					"WHERE user.user_id = ?";
		String[] data = {user_id};
		
		return db.queryListWithPrepare(sql, data);
	}
	
//	public ArrayList<HashMap<String, Object>> queryOverseasWorkPlaceRole1Matching(String user_id) {
//		
//		String sql = "SELECT  \n" +
//					"	overseas_work_place.overseas_work_place_id,  \n" +
//					"	overseas_work_place.name, \n" +
//					"	overseas_work_place.address,  \n" +
//					"	overseas_work_place.email,  \n" +
//					"	overseas_work_place.phone,  \n" +
//					"	overseas_work_place.recive_total,  \n" +
//					"	overseas_work_place.time_reg, \n" +
//					"	overseas_work_place.status, \n" +
//					"	overseas_work_place.user_id, \n" +
//					"							\n" +
//					" CASE overseas_work_place.type  \n" +
//					"	WHEN 1 THEN 'ในประเทศ'  \n" +
//					"	WHEN 2 THEN 'ต่างประเทศ'  \n" +
//					" END type \n" +
//					"							\n" +
//					"FROM  \n" +
//					"	overseas_work_place \n" +
//					"	 \n" +
//					"INNER JOIN overseas_work_place_skill ON overseas_work_place_skill.overseas_work_place_id = overseas_work_place.overseas_work_place_id \n" +
//					"INNER JOIN skill ON skill.skill_id = overseas_work_place_skill.skill_id \n" +
//					"WHERE skill.detail IN (SELECT skill.detail FROM skill  INNER JOIN user_skill ON user_skill.skill_id = skill.skill_id WHERE user_skill.user_id = ? AND skill.status = 1 \n" +
//					"GROUP BY skill.detail) \n" +
//					"AND overseas_work_place.status = 1  \n" +
//					"OR skill.detail NOT IN (SELECT skill.detail FROM skill  INNER JOIN user_skill ON user_skill.skill_id = skill.skill_id WHERE user_skill.user_id = ? AND skill.status = 1 GROUP BY skill.detail)\n" +
//					"AND overseas_work_place.status = 1  \n" +
//					"GROUP BY overseas_work_place.overseas_work_place_id\n" +
//					"ORDER BY skill.detail IN (SELECT skill.detail FROM skill  INNER JOIN user_skill ON user_skill.skill_id = skill.skill_id WHERE user_skill.user_id = ? AND skill.status = 1 \n" +
//					"GROUP BY skill.detail) DESC";
//		
//		String[] data = {user_id, user_id, user_id};
//		return db.queryListWithPrepare(sql, data);
//	}
	
	public ArrayList<HashMap<String, Object>> queryOverseasWorkPlaceMatching(String user_id) {
		
		String sql = "SELECT  \n" +
					"	overseas_work_place.overseas_work_place_id,  \n" +
					"	overseas_work_place.name, \n" +
					"	overseas_work_place.address,  \n" +
					"	overseas_work_place.email,  \n" +
					"	overseas_work_place.phone,  \n" +
					"	overseas_work_place.recive_total,  \n" +
					"	overseas_work_place.time_reg, \n" +
					"	overseas_work_place.status, \n" +
					"	overseas_work_place.user_id, \n" +
					"							\n" +
					" CASE overseas_work_place.type  \n" +
					"	WHEN 1 THEN 'ในประเทศ'  \n" +
					"	WHEN 2 THEN 'ต่างประเทศ'  \n" +
					" END type, \n" +
					" 1 AS matching\n" +
					"							\n" +
					"FROM  \n" +
					"	overseas_work_place \n" +
					"	 \n" +
					"INNER JOIN overseas_work_place_skill ON overseas_work_place_skill.overseas_work_place_id = overseas_work_place.overseas_work_place_id \n" +
					"INNER JOIN skill ON skill.skill_id = overseas_work_place_skill.skill_id \n" +
					"WHERE skill.detail IN (SELECT skill.detail FROM skill  INNER JOIN user_skill ON user_skill.skill_id = skill.skill_id WHERE user_skill.user_id = ? AND skill.status = 1 \n" +
					"GROUP BY skill.detail) \n" +
					"AND overseas_work_place.status = 1  \n" +
					
					"GROUP BY overseas_work_place.overseas_work_place_id";
		
		String[] data = {user_id};
		return db.queryListWithPrepare(sql, data);
	}
	
	public ArrayList<HashMap<String, Object>> queryOverseasWorkPlaceNoMatching(String user_id) {
		
		String sql = "SELECT  \n" +
					"	overseas_work_place.overseas_work_place_id,  \n" +
					"	overseas_work_place.name, \n" +
					"	overseas_work_place.address,  \n" +
					"	overseas_work_place.email,  \n" +
					"	overseas_work_place.phone,  \n" +
					"	overseas_work_place.recive_total,  \n" +
					"	overseas_work_place.time_reg, \n" +
					"	overseas_work_place.status, \n" +
					"	overseas_work_place.user_id, \n" +
					"							\n" +
					" CASE overseas_work_place.type  \n" +
					"	WHEN 1 THEN 'ในประเทศ'  \n" +
					"	WHEN 2 THEN 'ต่างประเทศ'  \n" +
					" END type, \n" +
					" 0 AS matching\n" +
					"							\n" +
					"FROM  \n" +
					"	overseas_work_place \n" +
					"	 \n" +
					"INNER JOIN overseas_work_place_skill ON overseas_work_place_skill.overseas_work_place_id = overseas_work_place.overseas_work_place_id \n" +
					"INNER JOIN skill ON skill.skill_id = overseas_work_place_skill.skill_id \n" +
					"WHERE skill.detail NOT IN (SELECT skill.detail FROM skill  INNER JOIN user_skill ON user_skill.skill_id = skill.skill_id WHERE user_skill.user_id = ? AND skill.status = 1 \n" +
					"GROUP BY skill.detail) \n" +
					"AND overseas_work_place.status = 1  \n" +
					
					"GROUP BY overseas_work_place.overseas_work_place_id";
		
		String[] data = {user_id};
		return db.queryListWithPrepare(sql, data);
	}
	
	public ArrayList<HashMap<String, Object>> queryOverseasWorkPlaceNoSkill() {
		
		String sql = "SELECT    \n" +
				"	overseas_work_place.overseas_work_place_id,    \n" +
				"	overseas_work_place.name,   \n" +
				"	overseas_work_place.address,    \n" +
				"	overseas_work_place.email,    \n" +
				"	overseas_work_place.phone,    \n" +
				"	overseas_work_place.recive_total,    \n" +
				"	overseas_work_place.time_reg,   \n" +
				"	overseas_work_place.status,   \n" +
				"	overseas_work_place.user_id,   \n" +
				"								\n" +
				" CASE overseas_work_place.type    \n" +
				"	WHEN 1 THEN 'ในประเทศ'    \n" +
				"	WHEN 2 THEN 'ต่างประเทศ'    \n" +
				" END type, \n" +
				" 0 AS matching \n" +
				"								\n" +
				"FROM    \n" +
				"	overseas_work_place   \n" +
				"WHERE overseas_work_place.overseas_work_place_id NOT IN (SELECT overseas_work_place_skill.overseas_work_place_id FROM overseas_work_place_skill)\n" +
				"GROUP BY overseas_work_place.overseas_work_place_id";
		
		return db.queryList(sql);
	}
	
	
	public int insertOverseasWorkPlace(String user_id, String name, String address, String email, String phone, String recive_total, String type) {
		
		String sql = "INSERT INTO overseas_work_place(name, address, email, phone, recive_total, type, user_id) VALUES(?, ?, ?, ?, ?, ?, ?)";
		String[] data = {name, address, email, phone, recive_total, type, user_id};
		String[] lastId = {"overseas_work_place_id"};
		
		return db.executeReturnLastId(sql, data, lastId);
	}
	
	public int updateOverseasWorkPlace(String overseas_work_place, String name, String address, String email, String phone, String receive_total, String type) {
		
		String sql = "UPDATE overseas_work_place SET name = ?, address = ?, email = ?, phone = ?, recive_total = ?, type = ? WHERE overseas_work_place_id = ?";
		String[] data = {name, address, email, phone, receive_total, type, overseas_work_place};
		
		return db.execute(sql, data);
	}
	
//	public int deleteOverseasWorkPlace(String overseas_work_place) {
//		
//		String sql = "DELETE FROM overseas_work_place WHERE overseas_work_place_id = ?";
//		String[] data = {overseas_work_place};
//		
//		return db.execute(sql, data);
//	}
	
	public int managementStatusOverseas(String overseas_id, String status) {
		
		String sql = "UPDATE overseas_work_place SET status = ? WHERE overseas_work_place_id = ?";
		String[] data = {status, overseas_id};
		
		return db.execute(sql, data);
	}
	
	public HashMap<String, Object> queryEmailUser(String oversea_id) {
		
		String sql = "SELECT \n" +
					"	user.email \n" +
					"FROM overseas_work_place \n" +
					"INNER JOIN user ON user.user_id = overseas_work_place.user_id \n" +
					"WHERE overseas_work_place.overseas_work_place_id = ?";
		
		String[] data = {oversea_id};
		
		return db.querySingleWithPrepare(sql, data);
	}

	@Override
	public ArrayList<OverseasWorkPlaceModel> FindAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public OverseasWorkPlaceModel FindByID(OverseasWorkPlaceModel bean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public OverseasWorkPlaceModel FindByID(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public OverseasWorkPlaceModel MappingBeans(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}
	
//	public ArrayList<HashMap<String, Object>> queryOverseasWorkPlaceRole1MatchingByZone(String user_id, String[] zone_data) {
//		
//		String sub_sql = "";
//		
//		if(zone_data.length != 0) {
//			
//			sub_sql = "AND overseas_work_place.address REGEXP '";
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
//					"	overseas_work_place.overseas_work_place_id,  \n" +
//					"	overseas_work_place.name, \n" +
//					"	overseas_work_place.address,  \n" +
//					"	overseas_work_place.email,  \n" +
//					"	overseas_work_place.phone,  \n" +
//					"	overseas_work_place.recive_total,  \n" +
//					"	overseas_work_place.time_reg, \n" +
//					"	overseas_work_place.status, \n" +
//					"	overseas_work_place.user_id, \n" +
//					"							\n" +
//					" CASE overseas_work_place.type  \n" +
//					"	WHEN 1 THEN 'ในประเทศ'  \n" +
//					"	WHEN 2 THEN 'ต่างประเทศ'  \n" +
//					" END type \n" +
//					"							\n" +
//					"FROM  \n" +
//					"	overseas_work_place \n" +
//					"	 \n" +
//					"INNER JOIN overseas_work_place_skill ON overseas_work_place_skill.overseas_work_place_id = overseas_work_place.overseas_work_place_id \n" +
//					"INNER JOIN skill ON skill.skill_id = overseas_work_place_skill.skill_id \n" +
//					"WHERE skill.detail IN (SELECT skill.detail FROM skill  INNER JOIN user_skill ON user_skill.skill_id = skill.skill_id WHERE user_skill.user_id = ? AND skill.status = 1 \n" +
//					"GROUP BY skill.detail) \n" +
//					"AND overseas_work_place.status = 1  \n" +
//					sub_sql +
//					"OR skill.detail NOT IN (SELECT skill.detail FROM skill  INNER JOIN user_skill ON user_skill.skill_id = skill.skill_id WHERE user_skill.user_id = ? AND skill.status = 1 GROUP BY skill.detail)\n" +
//					"AND overseas_work_place.status = 1  \n" +
//					sub_sql +
//					"GROUP BY overseas_work_place.overseas_work_place_id\n" +
//					"ORDER BY skill.detail IN (SELECT skill.detail FROM skill  INNER JOIN user_skill ON user_skill.skill_id = skill.skill_id WHERE user_skill.user_id = ? AND skill.status = 1 \n" +
//					"GROUP BY skill.detail) DESC";
//		
//		String[] data = {user_id, user_id, user_id};
//		return db.queryListWithPrepare(sql, data);
//	}
	
	public ArrayList<HashMap<String, Object>> queryOverseasWorkPlaceMatchingByZone(String user_id, String[] zone_data) {
		
		String sub_sql = "";
		
		if(zone_data.length != 0) {
			
			sub_sql = "AND overseas_work_place.address REGEXP '";
			
			for(int i = 0; i <zone_data.length; i++) {
				
				sub_sql += zone_data[i]+"|";
				
			}
			
			sub_sql = sub_sql.substring(0, sub_sql.length()-1);
			sub_sql += "' \n";
		}
		
		String sql = "SELECT  \n" +
					"	overseas_work_place.overseas_work_place_id,  \n" +
					"	overseas_work_place.name, \n" +
					"	overseas_work_place.address,  \n" +
					"	overseas_work_place.email,  \n" +
					"	overseas_work_place.phone,  \n" +
					"	overseas_work_place.recive_total,  \n" +
					"	overseas_work_place.time_reg, \n" +
					"	overseas_work_place.status, \n" +
					"	overseas_work_place.user_id, \n" +
					"							\n" +
					" CASE overseas_work_place.type  \n" +
					"	WHEN 1 THEN 'ในประเทศ'  \n" +
					"	WHEN 2 THEN 'ต่างประเทศ'  \n" +
					" END type, \n" +
					" 1 AS matching\n" +
					"							\n" +
					"FROM  \n" +
					"	overseas_work_place \n" +
					"	 \n" +
					"INNER JOIN overseas_work_place_skill ON overseas_work_place_skill.overseas_work_place_id = overseas_work_place.overseas_work_place_id \n" +
					"INNER JOIN skill ON skill.skill_id = overseas_work_place_skill.skill_id \n" +
					"WHERE skill.detail IN (SELECT skill.detail FROM skill  INNER JOIN user_skill ON user_skill.skill_id = skill.skill_id WHERE user_skill.user_id = ? AND skill.status = 1 \n" +
					"GROUP BY skill.detail) \n" +
					"AND overseas_work_place.status = 1  \n" +
					sub_sql +
					"GROUP BY overseas_work_place.overseas_work_place_id";
		
		String[] data = {user_id};
		return db.queryListWithPrepare(sql, data);
	}
	
	public ArrayList<HashMap<String, Object>> queryOverseasWorkPlaceNoMatchingByZone(String user_id, String[] zone_data) {
		
		String sub_sql = "";
		
		if(zone_data.length != 0) {
			
			sub_sql = "AND overseas_work_place.address REGEXP '";
			
			for(int i = 0; i <zone_data.length; i++) {
				
				sub_sql += zone_data[i]+"|";
				
			}
			
			sub_sql = sub_sql.substring(0, sub_sql.length()-1);
			sub_sql += "' \n";
		}
		
		String sql = "SELECT  \n" +
					"	overseas_work_place.overseas_work_place_id,  \n" +
					"	overseas_work_place.name, \n" +
					"	overseas_work_place.address,  \n" +
					"	overseas_work_place.email,  \n" +
					"	overseas_work_place.phone,  \n" +
					"	overseas_work_place.recive_total,  \n" +
					"	overseas_work_place.time_reg, \n" +
					"	overseas_work_place.status, \n" +
					"	overseas_work_place.user_id, \n" +
					"							\n" +
					" CASE overseas_work_place.type  \n" +
					"	WHEN 1 THEN 'ในประเทศ'  \n" +
					"	WHEN 2 THEN 'ต่างประเทศ'  \n" +
					" END type, \n" +
					" 0 AS matching\n" +
					"							\n" +
					"FROM  \n" +
					"	overseas_work_place \n" +
					"	 \n" +
					"INNER JOIN overseas_work_place_skill ON overseas_work_place_skill.overseas_work_place_id = overseas_work_place.overseas_work_place_id \n" +
					"INNER JOIN skill ON skill.skill_id = overseas_work_place_skill.skill_id \n" +
					"WHERE skill.detail NOT IN (SELECT skill.detail FROM skill  INNER JOIN user_skill ON user_skill.skill_id = skill.skill_id WHERE user_skill.user_id = ? AND skill.status = 1 \n" +
					"GROUP BY skill.detail) \n" +
					"AND overseas_work_place.status = 1  \n" +
					sub_sql +
					"GROUP BY overseas_work_place.overseas_work_place_id";
		
		String[] data = {user_id};
		return db.queryListWithPrepare(sql, data);
	}
	
	public ArrayList<HashMap<String, Object>> queryOverseasWorkPlaceNoSkillByZone(String[] zone_data) {
		
		String sub_sql = "";
		
		if(zone_data.length != 0) {
			
			sub_sql = "AND overseas_work_place.address REGEXP '";
			
			for(int i = 0; i <zone_data.length; i++) {
				
				sub_sql += zone_data[i]+"|";
				
			}
			
			sub_sql = sub_sql.substring(0, sub_sql.length()-1);
			sub_sql += "' \n";
		}
		
		String sql = "SELECT    \n" +
				"	overseas_work_place.overseas_work_place_id,    \n" +
				"	overseas_work_place.name,   \n" +
				"	overseas_work_place.address,    \n" +
				"	overseas_work_place.email,    \n" +
				"	overseas_work_place.phone,    \n" +
				"	overseas_work_place.recive_total,    \n" +
				"	overseas_work_place.time_reg,   \n" +
				"	overseas_work_place.status,   \n" +
				"	overseas_work_place.user_id,   \n" +
				"								\n" +
				" CASE overseas_work_place.type    \n" +
				"	WHEN 1 THEN 'ในประเทศ'    \n" +
				"	WHEN 2 THEN 'ต่างประเทศ'    \n" +
				" END type, \n" +
				" 0 AS matching \n" +
				"								\n" +
				"FROM    \n" +
				"	overseas_work_place   \n" +
				"WHERE overseas_work_place.overseas_work_place_id NOT IN (SELECT overseas_work_place_skill.overseas_work_place_id FROM overseas_work_place_skill)\n " +
				sub_sql+
				"GROUP BY overseas_work_place.overseas_work_place_id";
		
		return db.queryList(sql);
	}
	
	
	public ArrayList<HashMap<String, Object>> queryOverseasWorkPlaceChoice(String user_id) {
		
		String sql = "SELECT \n" +
					"	overseas_work_place_id,\n" +
					"	name\n" +
					"FROM overseas_work_place\n" +
					"WHERE status = 1 AND user_id = ?";
		
		String[] data = {user_id};
		return db.queryListWithPrepare(sql, data);
	}

}
