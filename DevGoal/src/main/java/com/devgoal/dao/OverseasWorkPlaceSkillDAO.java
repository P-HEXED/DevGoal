package com.devgoal.dao;

import java.util.ArrayList;
import java.util.HashMap;

import javax.swing.plaf.basic.BasicTreeUI;

import com.devgoal.dao.impl.DAO;
import com.devgoal.database.Database;
import com.devgoal.model.OverseasWorkPlaceSkillModel;

public class OverseasWorkPlaceSkillDAO implements DAO<OverseasWorkPlaceSkillModel>{

	Database db = new Database();
	
	@Override
	public int Add(OverseasWorkPlaceSkillModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public int deleteOverseasWorkPlaceSkill(String overseas_work_place_id) {
		
		String sql = "DELETE FROM overseas_work_place_skill WHERE overseas_work_place_id = ?";
		String[] data = {overseas_work_place_id};
		
		return db.execute(sql, data);
		
	}
	
	public int insertOverseasWorkPlaceSkill(String overseas_work_place_id, String skill_id) {
		
		String sql = "INSERT INTO overseas_work_place_skill(overseas_work_place_id, skill_id) VALUES(?, ?)";
		String[] data = {overseas_work_place_id, skill_id};
		
		return db.execute(sql, data);
		
	}
	
	public ArrayList<HashMap<String, Object>> querySkillByOverseasId(String overseas_work_place_id) {
		
		String sql = "SELECT \n" +
					"	skill.detail,\n" +
					"	skill.level\n" +
					"FROM \n" +
					"	overseas_work_place_skill\n" +
					"INNER JOIN skill ON skill.skill_id = overseas_work_place_skill.skill_id\n" +
					"INNER JOIN overseas_work_place ON overseas_work_place.overseas_work_place_id = overseas_work_place_skill.overseas_work_place_id\n" +
					"WHERE overseas_work_place.overseas_work_place_id = ? AND skill.status = 1";
		String[] data = {overseas_work_place_id};
		
		return db.queryListWithPrepare(sql, data);
		
	}

	@Override
	public int Delete(OverseasWorkPlaceSkillModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int Update(OverseasWorkPlaceSkillModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<OverseasWorkPlaceSkillModel> FindAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public OverseasWorkPlaceSkillModel FindByID(OverseasWorkPlaceSkillModel bean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public OverseasWorkPlaceSkillModel FindByID(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public OverseasWorkPlaceSkillModel MappingBeans(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

}
