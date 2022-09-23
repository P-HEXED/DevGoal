package com.devgoal.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.devgoal.dao.impl.DAO;
import com.devgoal.database.Database;
import com.devgoal.model.EventHistoryModel;

public class EventHistoryDAO implements DAO<EventHistoryModel>{
	
	Database db = new Database();

	@Override
	public int Add(EventHistoryModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public int insertEventHistory(String user_id, String detail, String ip_address) {
		
		String sql = "INSERT INTO event_history(user_id, detail, ip_address) VALUES(?, ?, ?)";
		String[] data = {user_id, detail, ip_address};
		
		return db.execute(sql, data);
		
	}
	
	public ArrayList<HashMap<String, Object>> queryEventHistory() {
		
		String sql = "SELECT \n" +
					"	user.profile_image AS profile_image,\n" +
					"	user.firstname AS firstname, \n" +
					"	user.lastname AS lastname, \n" +
					"	user.email AS email,\n" +
					"	event_history.detail AS detail, \n" +
					"	event_history.ip_address AS ip_address, \n" +
					"	event_history.time_reg AS time_reg,\n" +
					"CASE user.user_type\n" +
					"	WHEN 1 THEN 'นิสิต/นักศึกษา'\n" +
					"	WHEN 2 THEN 'อาจารย์'\n" +
					"	WHEN 3 THEN 'นายจ้าง'\n" +
					"	WHEN 4 THEN 'ผู้ดูแลระบบ'\n" +
					"END user_type\n" +
					"FROM event_history\n" +
					"INNER JOIN user ON user.user_id = event_history.user_id ORDER BY event_history.time_reg DESC";
		
		return db.queryList(sql);
	}
	
	public ArrayList<HashMap<String, Object>> queryEventHistorySort(String sort) {
		
		String sql = "SELECT \n" +
					"	user.profile_image AS profile_image,\n" +
					"	user.firstname AS firstname, \n" +
					"	user.lastname AS lastname, \n" +
					"	user.email AS email,\n" +
					"	event_history.detail AS detail, \n" +
					"	event_history.ip_address AS ip_address, \n" +
					"	event_history.time_reg AS time_reg,\n" +
					"CASE user.user_type\n" +
					"	WHEN 1 THEN 'นิสิต/นักศึกษา'\n" +
					"	WHEN 2 THEN 'อาจารย์'\n" +
					"	WHEN 3 THEN 'นายจ้าง'\n" +
					"	WHEN 4 THEN 'ผู้ดูแลระบบ'\n" +
					"END user_type\n" +
					"FROM event_history\n" +
					"INNER JOIN user ON user.user_id = event_history.user_id\n" +
					"ORDER BY user.user_id "+ sort;
		
		return db.queryList(sql);
	}
	
	public ArrayList<HashMap<String, Object>> queryEventHistorySortUserType(String user_type) {
		
		String sql = "SELECT \n" +
					"	user.profile_image AS profile_image,\n" +
					"	user.firstname AS firstname, \n" +
					"	user.lastname AS lastname, \n" +
					"	user.email AS email,\n" +
					"	event_history.detail AS detail, \n" +
					"	event_history.ip_address AS ip_address, \n" +
					"	event_history.time_reg AS time_reg,\n" +
					"CASE user.user_type\n" +
					"	WHEN 1 THEN 'นิสิต/นักศึกษา'\n" +
					"	WHEN 2 THEN 'อาจารย์'\n" +
					"	WHEN 3 THEN 'นายจ้าง'\n" +
					"	WHEN 4 THEN 'ผู้ดูแลระบบ'\n" +
					"END user_type\n" +
					"FROM event_history\n" +
					"INNER JOIN user ON user.user_id = event_history.user_id\n" +
					"WHERE user.user_type = ?";
		
		String[] data = {user_type};
		return db.queryListWithPrepare(sql, data);
	}

	@Override
	public int Delete(EventHistoryModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int Update(EventHistoryModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<EventHistoryModel> FindAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public EventHistoryModel FindByID(EventHistoryModel bean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public EventHistoryModel FindByID(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public EventHistoryModel MappingBeans(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

}
