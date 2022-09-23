package com.devgoal.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.devgoal.dao.impl.DAO;
import com.devgoal.database.Database;
import com.devgoal.model.AdminEmailHistoryModel;

public class AdminEmailHistoryDAO implements DAO<AdminEmailHistoryModel>{
	
	Database db = new Database();

	@Override
	public int Add(AdminEmailHistoryModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int Delete(AdminEmailHistoryModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int Update(AdminEmailHistoryModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public int insertEmailHistory(String user_id, String email_send, String email_recive, String detail) {
		
		String sql = "INSERT INTO admin_email_history(user_id, email_send, email_recive, detail) VALUES(?, ?, ?, ?)";
		String[] data = {user_id, email_send, email_recive, detail.replace("\n", " ")};
		
		return db.execute(sql, data);
	}
	
	public ArrayList<HashMap<String, Object>> queryEmailHistoryData() {
		
		String sql = "SELECT \n" +
					"	user.firstname,\n" +
					"	user.lastname,\n" +
					"	user.profile_image,\n" +
					"	\n" +
					"	CASE user.user_type\n" +
					"		WHEN 1 THEN 'นิสิต/นักศึกษา'\n" +
					"		WHEN 2 THEN 'อาจารย์'\n" +
					"		WHEN 3 THEN 'นายจ้าง'\n" +
					"		WHEN 4 THEN 'ผู้ดูแลระบบ'\n" +
					"	END user_type,\n" +
					"	\n" +
					"	admin_email_history.email_send,\n" +
					"	admin_email_history.email_recive,\n" +
					"	admin_email_history.detail,\n" +
					"	admin_email_history.time_reg\n" +
					"FROM admin_email_history\n" +
					"INNER JOIN user ON user.user_id = admin_email_history.user_id ORDER BY admin_email_history.time_reg DESC";
		
		return db.queryList(sql);
	}

	@Override
	public ArrayList<AdminEmailHistoryModel> FindAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public AdminEmailHistoryModel FindByID(AdminEmailHistoryModel bean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public AdminEmailHistoryModel FindByID(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public AdminEmailHistoryModel MappingBeans(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

}
