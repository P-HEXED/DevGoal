package com.devgoal.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import com.devgoal.dao.impl.DAO;
import com.devgoal.database.Database;
import com.devgoal.model.UniversityModel;

public class UniversityDAO implements DAO<UniversityModel> {

	Database db = new Database();

	@Override
	public int Add(UniversityModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int Delete(UniversityModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int Update(UniversityModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public int insertUniversity(String name, String short_name, String address) {
		
		String sql = "INSERT INTO university(name, sort_name, address) VALUES(?, ?, ?)";
		String[] data = {name, short_name, address};
		String[] lastId = {"university_id"};
		
		return db.executeReturnLastId(sql, data, lastId);
	}
	
	public int updateUniversity(String university_id, String name, String short_name, String address) {
		
		String sql = "UPDATE university SET name = ?, sort_name = ?, address = ? WHERE university_id = ?";
		String[] data = {name, short_name, address, university_id};
		
		return db.execute(sql, data);
	}
	
//	public int deleteUniversity(String university_id) {
//		
//		String sql = "DELETE FROM university WHERE university_id = ?";
//		String[] data = {university_id};
//		
//		return db.execute(sql, data);
//	}
	
	public int UpdateStatusUniversity(String university_id, String status) {
		
		String sql = "UPDATE university SET status = ? WHERE university_id = ?";
		String[] data = {status, university_id};
		
		return db.execute(sql, data);
	}

	@Override
	public ArrayList<UniversityModel> FindAll() {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM university";

		ArrayList<HashMap<String, Object>> queryList = db.queryList(sql);
		ArrayList<UniversityModel> List = new ArrayList<UniversityModel>();
		for (Iterator<HashMap<String, Object>> iterator = queryList.iterator(); iterator.hasNext();) {
			HashMap<String, Object> next = iterator.next();
			UniversityModel model = MappingBeans(next);
			List.add(model);
		}
		return List;
	}
	
	public ArrayList<HashMap<String, Object>> querySelectOption() {
		String sql = "SELECT university_id, name FROM university WHERE status = 1";
		
		return db.queryList(sql);
	}
	
	public int queryShortName(String university_id, String short_name) {
		
		String sql = "SELECT university_id FROM university WHERE university_id = ? AND sort_name = ? AND status = 1";
		String[] data = {university_id, short_name};
		
		if(db.querySingleWithPrepare(sql, data).size() != 0) {
			return 0;
		}
		
		return -1;
	}
	
	public ArrayList<HashMap<String, Object>> queryUniversityData() {
		String sql = "SELECT\n" +
					"university_id,\n" +
					"name,\n" +
					"sort_name,\n" +
					"address,\n" +
					"time_reg,\n" +
					"CASE status\n" +
					"	WHEN 0 THEN 'ไม่ผ่านการยืนยัน'\n" +
					"	WHEN 1 THEN 'ยืนยันแล้ว'\n" +
					"	WHEN 2 THEN 'รอการตรวจสอบ'\n" +
					"END status\n" +
					"FROM university";
		
		return db.queryList(sql);
	}

	@Override
	public UniversityModel FindByID(UniversityModel bean) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM university WHERE university_id = ?";
		String[] data = {bean.getUniversity_id()};

		HashMap<String, Object> map = db.querySingleWithPrepare(sql, data);
		UniversityModel model = MappingBeans(map);
		return model;
	}

	@Override
	public UniversityModel FindByID(String id) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM university WHERE university_id = ?";
		String[] data = {id};

		HashMap<String, Object> map = db.querySingleWithPrepare(sql, data);
		UniversityModel model = MappingBeans(map);
		return model;
	}


	@Override
	public UniversityModel MappingBeans(HashMap<String, Object> map) {
		// TODO Auto-generated method stub

		UniversityModel model = new UniversityModel();

		model.setUniversity_id(map.get("university_id").toString());
		model.setName(map.get("name").toString());
		model.setSort_name(map.get("sort_name").toString());
		model.setAddress(map.get("address").toString());
		model.setTime_reg(map.get("time_reg").toString());

		return model;
	}

}
