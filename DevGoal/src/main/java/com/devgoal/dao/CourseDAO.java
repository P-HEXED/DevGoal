package com.devgoal.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import com.devgoal.dao.impl.DAO;
import com.devgoal.database.Database;
import com.devgoal.model.CourseModel;
import com.devgoal.model.FacultyModel;

public class CourseDAO implements DAO<CourseModel> {
	
	Database db = new Database();

	@Override
	public int Add(CourseModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int Delete(CourseModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int Update(CourseModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public ArrayList<HashMap<String, Object>> querySelectOption(String faculty_id) {
		
		String sql = "SELECT course_id, name FROM course WHERE faculty_id = ? AND status = 1";
		String[] data = {faculty_id};
		
		return db.queryListWithPrepare(sql, data);
	}
	
	public int queryFkStudyRefTables(String university_id, String faculty_id, String course_id) {
		
		String sql = "SELECT course.course_id \n" +
						"FROM course \n" +
						"INNER JOIN faculty ON course.faculty_id = faculty.faculty_id\n" +
						"INNER JOIN university ON faculty.university_id = university.university_id\n" +
						"WHERE course.course_id = ?\n" +
						"AND faculty.faculty_id = ?\n" +
						"AND university.university_id = ?\n" +
						"AND course.status = 1\n" +
						"AND faculty.status = 1\n" +
						"AND university.status = 1\n";
		String[] data = {course_id, faculty_id, university_id};
		
		if(db.querySingleWithPrepare(sql, data).size() != 0) {
			return 0;
		}
		
		return -1;
	}
	
	public int insertCourse(String name, String faculty_id) {
		
		String sql = "INSERT INTO course(name, faculty_id) VALUES(?, ?)";
		String[] data = {name, faculty_id};
		String[] lastId = {"course_id"};
		
		return db.executeReturnLastId(sql, data, lastId);
	}
	
	public int updateCourse(String name, String course_id) {
		
		String sql = "UPDATE course SET name = ? WHERE course_id = ?";
		String[] data = {name, course_id};
		
		return db.execute(sql, data);
	}
	
//	public int deleteCourse(String course_id) {
//		
//		String sql = "DELETE FROM course WHERE course_id = ?";
//		String[] data = {course_id};
//		
//		return db.execute(sql, data);
//	}
	
	public int updateStatusCourse(String course_id, String status) {
		
		String sql = "UPDATE course SET status = ? WHERE course_id = ?";
		String[] data = {status, course_id};
		
		return db.execute(sql, data);
	}
	
	public ArrayList<HashMap<String, Object>> queryCourseData() {
		
		String sql = "SELECT\n" +
					"	university.name AS university_name,\n" +
					"	faculty.name AS faculty_name,\n" +
					"	course.course_id,\n" +
					"	course.name AS course_name,\n" +
					"	course.time_reg,\n" +
					"	\n" +
					"CASE course.status \n" +
					"	WHEN 0 THEN 'ไม่ผ่านการยืนยัน' \n" +
					"	WHEN 1 THEN 'ยืนยันแล้ว' \n" +
					"	WHEN 2 THEN 'รอการตรวจสอบ' \n" +
					"END status \n" +
					"FROM course\n" +
					"	\n" +
					"INNER JOIN faculty ON faculty.faculty_id = course.faculty_id\n" +
					"INNER JOIN university ON university.university_id = faculty.university_id";
		
		return db.queryList(sql);
	}

	@Override
	public ArrayList<CourseModel> FindAll() {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM course";

		ArrayList<HashMap<String, Object>> queryList = db.queryList(sql);
		ArrayList<CourseModel> List = new ArrayList<CourseModel>();
		for (Iterator<HashMap<String, Object>> iterator = queryList.iterator(); iterator.hasNext();) {
			HashMap<String, Object> next = iterator.next();
			CourseModel model = MappingBeans(next);
			List.add(model);
		}
		return List;
	}

	@Override
	public CourseModel FindByID(CourseModel bean) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM course WHERE course_id = ?";
		String[] data = {bean.getCourse_id()};

		HashMap<String, Object> map = db.querySingleWithPrepare(sql, data);
		CourseModel model = MappingBeans(map);
		return model;
	}

	@Override
	public CourseModel FindByID(String id) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM course WHERE course_id = ?";
		String[] data = {id};
 
		HashMap<String, Object> map = db.querySingleWithPrepare(sql, data);
		CourseModel model = MappingBeans(map);
		return model;
	}

	@Override
	public CourseModel MappingBeans(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		
		CourseModel model = new CourseModel();
		FacultyModel faculty = new FacultyDAO().FindByID(map.get("faculty_id").toString());
		
		model.setCourse_id(map.get("course_id").toString());
		model.setName(map.get("name").toString());
		model.setFaculty(faculty);
		model.setTime_reg(map.get("time_reg").toString());
		
		return model;
	}


}
