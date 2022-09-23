package com.devgoal.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import com.devgoal.dao.impl.DAO;
import com.devgoal.database.Database;
import com.devgoal.model.FacultyModel;
import com.devgoal.model.UniversityModel;

public class FacultyDAO implements DAO<FacultyModel> {

	Database db = new Database();

	@Override
	public int Add(FacultyModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int Delete(FacultyModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int Update(FacultyModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public int insertFaculty(String name, String university_id) {
		
		String sql = "INSERT INTO faculty(name, university_id) VALUES(?, ?)";
		String[] data = {name, university_id};
		String[] lastId = {"faculty_id"};
		
		return db.executeReturnLastId(sql, data, lastId);
	}
	
	public int updateFaculty(String name, String faculty_id) {
		
		String sql = "UPDATE faculty SET name = ? WHERE faculty_id = ?";
		String[] data = {name, faculty_id};
		
		return db.execute(sql, data);
	}
	
//	public int deleteFaculty(String faculty_id) {
//		
//		String sql = "DELETE FROM faculty WHERE faculty_id = ?";
//		String[] data = {faculty_id};
//		
//		return db.execute(sql, data);
//	}
	
	public int updateStatusFaculty(String faculty_id, String status) {
		
		String sql = "UPDATE faculty SET status = ? WHERE faculty_id = ?";
		String[] data = {status, faculty_id};
		
		return db.execute(sql, data);
	}
	
	public ArrayList<HashMap<String, Object>> queryFacultyData() {
		String sql = "SELECT\n" +
					"	university.name AS university_name,\n" +
					"	faculty.faculty_id,\n" +
					"	faculty.name AS faculty_name,\n" +
					"	faculty.time_reg,\n" +
					"	\n" +
					"CASE faculty.status \n" +
					"	WHEN 0 THEN 'ไม่ผ่านการยืนยัน' \n" +
					"	WHEN 1 THEN 'ยืนยันแล้ว' \n" +
					"	WHEN 2 THEN 'รอการตรวจสอบ' \n" +
					"END status \n" +
					"FROM faculty\n" +
					"INNER JOIN university ON university.university_id = faculty.university_id";
		
		return db.queryList(sql);
	}

	@Override
	public ArrayList<FacultyModel> FindAll() {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM faculty";

		ArrayList<HashMap<String, Object>> queryList = db.queryList(sql);
		ArrayList<FacultyModel> List = new ArrayList<FacultyModel>();
		for (Iterator<HashMap<String, Object>> iterator = queryList.iterator(); iterator.hasNext();) {
			HashMap<String, Object> next = iterator.next();
			FacultyModel model = MappingBeans(next);
			List.add(model);
		}
		return List;
	}
	
	public ArrayList<HashMap<String, Object>> querySelectOption(String university_id) {
		
		String sql = "SELECT faculty_id, name FROM faculty WHERE university_id = ? AND status = 1";
		String[] data = {university_id};
		
		return db.queryListWithPrepare(sql, data);
	}
	@Override
	public FacultyModel FindByID(FacultyModel bean) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM faculty WHERE faculty_id = ?";
		String [] data = {bean.getFaculty_id()};

		HashMap<String, Object> map = db.querySingleWithPrepare(sql, data);
		FacultyModel model = MappingBeans(map);
		return model;
	}

	@Override
	public FacultyModel FindByID(String id) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM faculty WHERE faculty_id = ?";
		String[] data = {id};

		HashMap<String, Object> map = db.querySingleWithPrepare(sql, data);
		FacultyModel model = MappingBeans(map);
		return model;
	}


	@Override
	public FacultyModel MappingBeans(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		
		FacultyModel model = new FacultyModel();
		UniversityModel university = new UniversityDAO().FindByID(map.get("university_id").toString());
		
		model.setFaculty_id(map.get("faculty_id").toString());
		model.setName(map.get("name").toString());
		model.setUniversity(university);
		model.setTime_reg(map.get("time_reg").toString());
		
		return model;
	}

}
