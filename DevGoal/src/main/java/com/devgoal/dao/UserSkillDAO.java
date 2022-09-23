package com.devgoal.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import com.devgoal.dao.impl.DAO;
import com.devgoal.database.Database;
import com.devgoal.model.SkillModel;
import com.devgoal.model.UserModel;
import com.devgoal.model.UserSkillModel;

public class UserSkillDAO implements DAO<UserSkillModel>{
	
	Database db = new Database();

	@Override
	public int Add(UserSkillModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public int insertUserSkill(String user_id, String skill_id) {
		
		String sql = "INSERT INTO user_skill(user_id, skill_id) VALUES(?, ?)";
		String[] data = {user_id, skill_id};
		
		return db.execute(sql, data);
		
	}
	
	public ArrayList<HashMap<String, Object>> queryUserSkillByUserId(String user_id) {
		
		String sql = "SELECT \n" +
					"	skill.detail,\n" +
					"	skill.level\n" +
					"	\n" +
					"FROM user_skill\n" +
					"INNER JOIN skill ON skill.skill_id = user_skill.skill_id\n" +
					"INNER JOIN user ON user.user_id = user_skill.user_id\n" +
					"WHERE user.user_id = ? AND skill.status = 1";
		String[] data = {user_id};
		
		return db.queryListWithPrepare(sql, data);
	}

	@Override
	public int Delete(UserSkillModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public int deleteUserSkillByUserId(String user_id) {
		
		String sql = "DELETE FROM user_skill WHERE user_id = ?";
		String[] data = {user_id};
		
		return db.execute(sql, data);
	}

	@Override
	public int Update(UserSkillModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<UserSkillModel> FindAll() {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM user_skill";

		ArrayList<HashMap<String, Object>> queryList = db.queryList(sql);
		ArrayList<UserSkillModel> List = new ArrayList<UserSkillModel>();
		for (Iterator<HashMap<String, Object>> iterator = queryList.iterator(); iterator.hasNext();) {
			HashMap<String, Object> next = iterator.next();
			UserSkillModel model = MappingBeans(next);
			List.add(model);
		}
		return List;
	}

	@Override
	public UserSkillModel FindByID(UserSkillModel bean) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM user_skill WHERE user_skill_id = ?";
		String[] data = {bean.getUser_skill_id()};

		HashMap<String, Object> map = db.querySingleWithPrepare(sql, data);
		UserSkillModel model = MappingBeans(map);
		return model;
		
	}

	@Override
	public UserSkillModel FindByID(String id) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM user_skill WHERE user_skill_id = ?";
		String[] data = {id};

		HashMap<String, Object> map = db.querySingleWithPrepare(sql, data);
		UserSkillModel model = MappingBeans(map);
		return model;
	}


	@Override
	public UserSkillModel MappingBeans(HashMap<String, Object> map) {
		// TODO Auto-generated method stub

		UserSkillModel model = new UserSkillModel();
		UserModel user = new UserDAO().FindByID(map.get("user_id").toString());
		SkillModel skill = new SkillDAO().FindByID(map.get("skill_id").toString());
		
		
		model.setUser_skill_id(map.get("user_skill_id").toString());
		model.setUser_id(user);
		model.setSkill_id(skill);
		model.setTime_reg(map.get("time_reg").toString());
		
		return model;
	}

}
