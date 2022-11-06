package com.devgoal.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.devgoal.dao.impl.DAO;
import com.devgoal.database.Database;
import com.devgoal.model.StudentPlaceOfInternshipDailyModel;

public class StudentPlaceOfInternshipDailyDAO implements DAO<StudentPlaceOfInternshipDailyModel>{
	
	Database db = new Database();

	public int insertInternshipDetailDaily(String student_place_of_internship_id, String detail) {
		
		String sql = "INSERT INTO student_place_of_internship_daily(student_place_of_internship_id, detail) VALUES(?, ?)";
		String[] data = {student_place_of_internship_id, detail};
		
		return db.execute(sql, data);
	}
	
	public ArrayList<HashMap<String, Object>> internshipDataRole2(String user_id) {
		
		String sql = "SELECT	 \n" +
				"student_place_of_internship.student_place_of_internship_id AS std_internship_id, \n" +
				" \n" +
				"(SELECT user.profile_image FROM student_place_of_internship INNER JOIN user ON user.user_id = student_place_of_internship.user_id WHERE student_place_of_internship.student_place_of_internship_id = std_internship_id) profile_image, \n" +
				" \n" +
				"(SELECT user.firstname FROM student_place_of_internship INNER JOIN user ON user.user_id = student_place_of_internship.user_id WHERE student_place_of_internship.student_place_of_internship_id = std_internship_id) firstname, \n" +
				" \n" +
				"(SELECT user.lastname FROM student_place_of_internship INNER JOIN user ON user.user_id = student_place_of_internship.user_id WHERE student_place_of_internship.student_place_of_internship_id = std_internship_id) lastname, \n" +
				" \n" +
				"(SELECT university.name FROM student_place_of_internship INNER JOIN user ON user.user_id = student_place_of_internship.user_id INNER JOIN university ON university.university_id = user.university_id WHERE student_place_of_internship.student_place_of_internship_id = std_internship_id) university_name, \n" +
				" \n" +
				"place_of_internship.name AS internship_name, \n" +
				"student_place_of_internship.time_reg,\n" +
				"CONCAT(term.year, '/', term.term_no) AS term\n" +
				" \n" +
				"FROM student_place_of_internship \n" +
				"INNER JOIN place_of_internship ON place_of_internship.place_of_internship_id = student_place_of_internship.place_of_internship_id \n" +
				"INNER JOIN term ON term.term_id = student_place_of_internship.term_id\n" +
				"WHERE student_place_of_internship.status = 1 AND student_place_of_internship.send_status = 1 AND place_of_internship.status = 1 AND place_of_internship.user_id = ? ORDER BY student_place_of_internship.time_reg DESC";
		String[] data = {user_id};
		
		return db.queryListWithPrepare(sql, data);

		
	}
	
	public ArrayList<HashMap<String, Object>> queryInternshipDailyDetail(String std_internship_id) {
		
		String sql = "SELECT \n" +
					"	student_place_of_internship_daily.detail,\n" +
					"	student_place_of_internship_daily.time_reg\n" +
					"FROM student_place_of_internship_daily\n" +
					"INNER JOIN student_place_of_internship ON student_place_of_internship.student_place_of_internship_id = student_place_of_internship_daily.student_place_of_internship_id\n" +
					"WHERE student_place_of_internship.student_place_of_internship_id = ?";
		String[] data = {std_internship_id};
		
		return db.queryListWithPrepare(sql, data);

		
	}
	
	@Override
	public int Add(StudentPlaceOfInternshipDailyModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int Delete(StudentPlaceOfInternshipDailyModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int Update(StudentPlaceOfInternshipDailyModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<StudentPlaceOfInternshipDailyModel> FindAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public StudentPlaceOfInternshipDailyModel FindByID(StudentPlaceOfInternshipDailyModel bean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public StudentPlaceOfInternshipDailyModel FindByID(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public StudentPlaceOfInternshipDailyModel MappingBeans(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

}
