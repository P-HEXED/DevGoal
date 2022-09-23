package com.devgoal.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.devgoal.dao.impl.DAO;
import com.devgoal.database.Database;
import com.devgoal.model.RequestUserDataChangeModel;

public class RequestUserDataChangeDAO implements DAO<RequestUserDataChangeModel>{

	Database db = new Database();
	
	public ArrayList<HashMap<String, Object>> queryUserDataChange() {
		
		String sql = "SELECT\n" +
					"	request_user_data_change_id,\n" +
					"	user_data,\n" +
					"	email,\n" +
					"	time_reg,\n" +
					"	\n" +
					"CASE status\n" +
					"	\n" +
					"	WHEN 0 THEN 'ไม่ผ่านการยืนยัน'\n" +
					"	WHEN 1 THEN 'ยืนยันแล้ว'\n" +
					"	WHEN 2 THEN 'รอตรวจสอบ'\n" +
					"	\n" +
					"END status\n" +
					"FROM request_user_data_change ORDER BY time_reg DESC";
		
		return db.queryList(sql);
	}
	
	public HashMap<String, Object> findEmailById(String request_user_data_change_id) {
		
		String sql = "SELECT email FROM request_user_data_change WHERE request_user_data_change_id = ? LIMIT 1";
		String[] data = {request_user_data_change_id};
		
		return db.querySingleWithPrepare(sql, data);
	}
	
	public int managementStatus(String request_user_data_change_id, String status) {
		
		String sql = "UPDATE request_user_data_change SET status = ? WHERE request_user_data_change_id = ?";
		String[] data = {status, request_user_data_change_id};
		
		return db.execute(sql, data);
	}
	
	public int insertUserDataChange(String user_data, String email) {
		
		String sql = "INSERT INTO request_user_data_change(user_data, email) VALUES(?, ?)";
		String[] data = {user_data, email};
		
		return db.execute(sql, data);
	}
	
	@Override
	public int Add(RequestUserDataChangeModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int Delete(RequestUserDataChangeModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int Update(RequestUserDataChangeModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<RequestUserDataChangeModel> FindAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public RequestUserDataChangeModel FindByID(RequestUserDataChangeModel bean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public RequestUserDataChangeModel FindByID(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public RequestUserDataChangeModel MappingBeans(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

}
