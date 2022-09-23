package com.devgoal.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.devgoal.dao.impl.DAO;
import com.devgoal.database.Database;
import com.devgoal.model.PlaceOfInternshipSkillModel;

public class PlaceOfInternshipSkillDAO implements DAO<PlaceOfInternshipSkillModel>{
	
	Database db = new Database();

	@Override
	public int Add(PlaceOfInternshipSkillModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public int insertPlaceOfInternshipSkill(String place_of_internship_id, String skill_id) {
		
		String sql = "INSERT INTO place_of_internship_skill(place_of_internship_id, skill_id) VALUES(?, ?)";
		String[] data = {place_of_internship_id, skill_id};
		
		return db.execute(sql, data);
		
	}
	
	public int updatePlaceOfInternshipSkill(String skill_id, String place_of_internship_id) {
		
		String sql = "UPDATE place_of_internship_skill SET skill_id = ? WHERE place_of_internship_id = ?";
		String[] data = {skill_id, place_of_internship_id};
		
		return db.execute(sql, data);
		
	}
	
	public int deletePlaceOfInternshipSkill(String place_of_internship_id) {
		
		String sql = "DELETE FROM place_of_internship_skill WHERE place_of_internship_id = ?";
		String[] data = {place_of_internship_id};
		
		return db.execute(sql, data);
		
	}
	
	public ArrayList<HashMap<String, Object>> querySkillByInternshipId(String place_of_internship_id) {
		
		String sql = "SELECT \n" +
					"	skill.detail,\n" +
					"	skill.level\n" +
					"FROM \n" +
					"	place_of_internship_skill\n" +
					"INNER JOIN skill ON skill.skill_id = place_of_internship_skill.skill_id\n" +
					"INNER JOIN place_of_internship ON place_of_internship.place_of_internship_id = place_of_internship_skill.place_of_internship_id\n" +
					"WHERE place_of_internship.place_of_internship_id = ? AND skill.status = 1";
		String[] data = {place_of_internship_id};
		
		return db.queryListWithPrepare(sql, data);
		
	}
	
	public ArrayList<HashMap<String, Object>> queryInternshipSkillId(String place_of_internship_id) {
		
		String sql = "SELECT place_of_internship_skill_id FROM place_of_internship_skill WHERE place_of_internship_id = ?";
		String[] data = {place_of_internship_id};
		
		return db.queryListWithPrepare(sql, data);
		
	}

	@Override
	public int Delete(PlaceOfInternshipSkillModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int Update(PlaceOfInternshipSkillModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<PlaceOfInternshipSkillModel> FindAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PlaceOfInternshipSkillModel FindByID(PlaceOfInternshipSkillModel bean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PlaceOfInternshipSkillModel FindByID(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PlaceOfInternshipSkillModel MappingBeans(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

}
