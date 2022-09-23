package com.devgoal.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import com.devgoal.dao.impl.DAO;
import com.devgoal.database.Database;
import com.devgoal.model.SkillModel;

public class SkillDAO implements DAO<SkillModel>{
	
	Database db = new Database();

	@Override
	public int Add(SkillModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public HashMap<String, Object> checkDuplicateSkill(String detail) {
		
		String sql = "SELECT skill_id FROM skill WHERE detail = ? LIMIT 1";
		String[] data = {detail};
		
		return db.querySingleWithPrepare(sql, data);
		
	}
	
	public ArrayList<HashMap<String, Object>> getSkillIdForMultipleUpdate(String skill_id) {
		
		String sql = "SELECT skill_id FROM skill WHERE detail = (SELECT detail FROM skill WHERE skill_id = ?)";
		String[] data = {skill_id};
		
		return db.queryListWithPrepare(sql, data);
		
	}
	
	public int updateStatusSkill(String status, String skill_id) {
		
		String sql = "UPDATE skill SET status = ? WHERE skill_id = ?";
		String[] data = {status, skill_id};
		
		return db.execute(sql, data);
	}
	
	public int insertSkill(String detail, String level) {
		
		String sql = "INSERT INTO skill(detail, level) VALUES(?, ?)";
		String[] data = {detail, level};
		String[] lastId = {"skill_id"};
		
		return db.executeReturnLastId(sql, data, lastId);
	}
	
	public ArrayList<HashMap<String, Object>> querySkill() {
		
		String sql = "SELECT detail FROM skill WHERE status = 1 GROUP BY detail";
		
		return db.queryList(sql);
	}
	
	public ArrayList<HashMap<String, Object>> queryAllSkill() {
		
		String sql = "SELECT \n" +
					"	skill_id, \n" +
					"	detail, \n" +
					"	time_reg,\n" +
					"	\n" +
					"CASE status\n" +
					"	WHEN 0 THEN 'ไม่ผ่านการยืนยัน'\n" +
					"	WHEN 1 THEN 'ยืนยันแล้ว'\n" +
					"	WHEN 2 THEN 'รอการตรวจสอบ'\n" +
					"END status\n" +
					"	\n" +
					"FROM \n" +
					"	skill \n" +
					"	\n" +
					"GROUP BY detail";
		
		return db.queryList(sql);
	}
	
	public int updateSkill(String skill, String skill_id) {
		
		String sql = "UPDATE skill SET detail = ? WHERE skill_id = ?";
		String[] data = {skill, skill_id};
		String[] lastId = {"skill_id"};
		
		return db.executeReturnLastId(sql, data, lastId);
	}

	@Override
	public int Delete(SkillModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int Update(SkillModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<SkillModel> FindAll() {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM skill WHERE status = 1";

		ArrayList<HashMap<String, Object>> queryList = db.queryList(sql);
		ArrayList<SkillModel> List = new ArrayList<SkillModel>();
		for (Iterator<HashMap<String, Object>> iterator = queryList.iterator(); iterator.hasNext();) {
			HashMap<String, Object> next = iterator.next();
			SkillModel model = MappingBeans(next);
			List.add(model);
		}
		return List;
	}

	@Override
	public SkillModel FindByID(SkillModel bean) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM skill WHERE skill_id = ? AND status = 1";
		String[] data = {bean.getSkill_id()};

		HashMap<String, Object> map = db.querySingleWithPrepare(sql, data);
		SkillModel model = MappingBeans(map);
		return model;
	}

	@Override
	public SkillModel FindByID(String id) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM skill WHERE skill_id = ? AND status = 1";
		String[] data = {id};

		HashMap<String, Object> map = db.querySingleWithPrepare(sql, data);
		SkillModel model = MappingBeans(map);
		return model;
	}
	
//	public ArrayList<String> checkInsertDuplicateSkill(ArrayList<HashMap<String, String>> skill_data) {
//		
//		ArrayList<String> skillDataForMapUserSkill = new ArrayList<String>();
//		String sql = "";
//		String detail = "";
//		String level = "";
//		
//		for(int i = 0; i < skill_data.size(); i++) {
//			
//			//Check Duplicate skill before insert
//			detail = skill_data.get(i).get("skill");
//			level = skill_data.get(i).get("level");
//			
//			sql = "SELECT skill_id FROM skill WHERE detail = ? LIMIT 1";
//			String[] data1 = {detail};
//			
//			if(db.querySingleWithPrepare(sql, data1).size() == 0) {
//				System.out.println("New skill");
//				
//				for (int j = 0; j < 3; j++) {
//					insertSkill(detail, Integer.toString(j+1));
//				}
//				
//			} else {
//				System.out.println("Skill Duplicate");
//			}
//			
//			//Append skill_id for mapping user_skill table
//			sql = "SELECT skill_id FROM skill WHERE detail = ? AND level = ?";
//			String[] data2 = {detail, level};
//			skillDataForMapUserSkill.add(db.querySingleWithPrepare(sql, data2).get("skill_id").toString());
//		}
//		
//		return skillDataForMapUserSkill;
//		
//	}
	
	public ArrayList<String> checkInsertDuplicateSkill(ArrayList<HashMap<String, String>> skill_data) {
		
		ArrayList<String> skillDataForMapUserSkill = new ArrayList<String>();
		String sql = "";
		String detail = "";
		String level = "";
		
		for(int i = 0; i < skill_data.size(); i++) {
			
			detail = skill_data.get(i).get("skill");
			level = skill_data.get(i).get("level");
			
			sql = "SELECT skill_id FROM skill WHERE detail = ? AND level = ? AND status = 1";
			String[] data2 = {detail, level};
			
			skillDataForMapUserSkill.add(db.querySingleWithPrepare(sql, data2).get("skill_id").toString());
		}
		
		return skillDataForMapUserSkill;
		
	}


	@Override
	public SkillModel MappingBeans(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		
		SkillModel model = new SkillModel();
		
		model.setSkill_id(map.get("skill_id").toString());
		model.setDetail(map.get("detail").toString());
		model.setLevel(map.get("level").toString());
		model.setTime_reg(map.get("time_reg").toString());
		
		return model;
	}

}
