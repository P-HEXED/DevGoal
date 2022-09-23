package com.devgoal.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.devgoal.dao.impl.DAO;
import com.devgoal.database.Database;
import com.devgoal.model.ResultInternshipModel;

public class ResultInternshipDAO implements DAO<ResultInternshipModel>{
	
	Database db = new  Database();
	
	public int insertResultInternship(String user_id, String result_internship_name) {
		
		String sql = "INSERT INTO result_internship(user_id, result_internship_name) VALUES(?, ?)";
		String[] data = {user_id, result_internship_name};
		String[] lastId = {"result_internship_id"};
		
		return db.executeReturnLastId(sql, data, lastId);
	}
	
	public ArrayList<HashMap<String, Object>> queryResultInternshipForm(String user_id) {
		
		String sql = "SELECT \n" +
					"	result_internship_id,\n" +
					"	result_internship_name,\n" +
					"	time_reg,\n" +
					"	\n" +
					"CASE status\n" +
					"	WHEN 0 THEN 'ไม่ผ่านการยืนยัน'\n" +
					"	WHEN 1 THEN 'ยืนยันแล้ว'\n" +
					"	WHEN 2 THEN 'รอการตรวจสอบ'\n" +
					"END status\n" +
					"FROM result_internship\n" +
					"WHERE user_id = ?";
		String[] data = {user_id};
		
		return db.queryListWithPrepare(sql, data);
		
	}
	
	public int updateStatusResultInternshipForm(String status, String result_internship_id) {
		
		String sql = "UPDATE result_internship SET status = ? WHERE result_internship_id = ?";
		String[] data = {status, result_internship_id};
		
		return db.execute(sql, data);
	}

	@Override
	public int Add(ResultInternshipModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int Delete(ResultInternshipModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int Update(ResultInternshipModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<ResultInternshipModel> FindAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultInternshipModel FindByID(ResultInternshipModel bean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultInternshipModel FindByID(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultInternshipModel MappingBeans(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public ArrayList<HashMap<String, Object>> queryResultInternshipFormName(String user_id) {
		
		String sql = "SELECT \n" +
					"	result_internship.result_internship_id,\n" +
					"	result_internship.result_internship_name\n" +
					"	\n" +
					"FROM result_internship\n" +
					"INNER JOIN user ON user.user_id = result_internship.user_id\n" +
					"WHERE result_internship.status = 1 AND result_internship.user_id = ?";
		String[] data = {user_id};
		
		return db.queryListWithPrepare(sql, data);
		
	}

}
