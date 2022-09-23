package com.devgoal.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import com.devgoal.dao.impl.DAO;
import com.devgoal.database.Database;
import com.devgoal.model.LoginHistoryModel;
import com.devgoal.model.UserModel;

public class LoginHistoryDAO implements DAO<LoginHistoryModel>{
	
	Database db = new Database();

	@Override
	public int Add(LoginHistoryModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public int insertLoginHistory(String user_id, String ip_address) {
		
		String sql = "INSERT INTO login_history(user_id, ip_address) VALUES(?, ?)";
		String[] data = {user_id, ip_address};
		
		return db.execute(sql, data);
	}
	
	public ArrayList<HashMap<String, Object>> queryLoginHistory() {
		
		String sql = "SELECT \n" +
					"	user.profile_image AS profile_image,\n" +
					"	user.firstname AS firstname,\n" +
					"	user.lastname AS lastname,\n" +
					"	user.email AS email,\n" +
					"	login_history.ip_address AS ip_address,\n" +
					"	login_history.time_reg AS time_reg,\n" +
					"CASE user.user_type \n" +
					"		WHEN 1 THEN 'นิสิต/นักศึกษา' \n" +
					"		WHEN 2 THEN 'อาจารย์' \n" +
					"		WHEN 3 THEN 'นายจ้าง' \n" +
					"		WHEN 4 THEN 'ผู้ดูแลระบบ' \n" +
					"	END user_type \n" +
					"FROM\n" +
					"	login_history\n" +
					"INNER JOIN user ON user.user_id = login_history.user_id ORDER BY login_history.time_reg DESC";
		
		return db.queryList(sql);
	}

	@Override
	public int Delete(LoginHistoryModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int Update(LoginHistoryModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<LoginHistoryModel> FindAll() {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM login_history";

		ArrayList<HashMap<String, Object>> queryList = db.queryList(sql);
		ArrayList<LoginHistoryModel> List = new ArrayList<LoginHistoryModel>();
		for (Iterator<HashMap<String, Object>> iterator = queryList.iterator(); iterator.hasNext();) {
			HashMap<String, Object> next = iterator.next();
			LoginHistoryModel model = MappingBeans(next);
			List.add(model);
		}
		return List;
	}

	@Override
	public LoginHistoryModel FindByID(LoginHistoryModel bean) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM login_history WHERE login_history_id = ?";
		String[] data = {bean.getLogin_history_id()};

		HashMap<String, Object> map = db.querySingleWithPrepare(sql, data);
		LoginHistoryModel model = MappingBeans(map);
		return model;
	}

	@Override
	public LoginHistoryModel FindByID(String id) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM login_history WHERE login_history_id = ?";
		String[] data = {id};

		HashMap<String, Object> map = db.querySingleWithPrepare(sql, data);
		LoginHistoryModel model = MappingBeans(map);
		return model;
	}


	@Override
	public LoginHistoryModel MappingBeans(HashMap<String, Object> map) {
		
		// TODO Auto-generated method stub
		LoginHistoryModel model = new LoginHistoryModel();
		UserModel user = new UserModel();
		
		model.setLogin_history_id(map.get("login_history_id").toString());
		model.setUser_id(user);
		model.setIp_address(map.get("ip_address").toString());
		model.setTime_reg(map.get("time_reg").toString());
		
		return model;
	}

}
