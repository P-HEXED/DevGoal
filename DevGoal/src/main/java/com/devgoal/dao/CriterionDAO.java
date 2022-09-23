package com.devgoal.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.devgoal.dao.impl.DAO;
import com.devgoal.database.Database;
import com.devgoal.model.CriterionModel;

public class CriterionDAO implements DAO<CriterionModel>{
	
	Database db = new Database();

	@Override
	public int Add(CriterionModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public int insertCriterion(String detail, String score, String user_id) {
		
		String sql = "INSERT INTO criterion(detail, score, user_id) VALUES(?, ?, ?)";
		String[] data = {detail, score, user_id};
		String[] lastId = {"criterion_id"};
		
		return db.executeReturnLastId(sql, data, lastId);
	}
	
	public int updateCriterion(String detail, String score, String criterion_id) {
		
		String sql = "UPDATE criterion SET detail = ?, score = ? WHERE criterion_id = ?";
		String[] data = {detail, score, criterion_id};
		
		return db.execute(sql, data);
	}
	
	public int updateStatusCriterion(String status, String criterion_id) {
		
		String sql = "UPDATE criterion SET status = ? WHERE criterion_id = ?";
		String[] data = {status, criterion_id};
		
		return db.execute(sql, data);
	}
	
	public ArrayList<HashMap<String, Object>> queryCriterionData(String user_id) {
		
		String sql = "SELECT \n" +
					"	detail, \n" +
					"	score, \n" +
					"	time_reg, \n" +
					"	criterion_id, \n" +
					"CASE status \n" +
					"	WHEN 0 THEN 'ไม่ผ่านการยืนยัน'\n" +
					"	WHEN 1 THEN 'ยืนยันแล้ว'\n" +
					"	WHEN 2 THEN 'รอการตรวจสอบ'\n" +
					"END status\n" +
					"FROM criterion \n" +
					"WHERE user_id = ?";
		String[] data = {user_id};
		
		return db.queryListWithPrepare(sql, data);
	}
	
	public ArrayList<HashMap<String, Object>> queryCriterionDataForSelectOption(String user_id) {
		
		String sql = "SELECT \n" +
					"	criterion_id,\n" +
					"	detail\n" +
					"FROM criterion\n" +
					"WHERE status = 1 AND user_id = ?";
		String[] data = {user_id};
		
		return db.queryListWithPrepare(sql, data);
	}
	

	@Override
	public int Delete(CriterionModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int Update(CriterionModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<CriterionModel> FindAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CriterionModel FindByID(CriterionModel bean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CriterionModel FindByID(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CriterionModel MappingBeans(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

}
