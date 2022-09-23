package com.devgoal.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.devgoal.dao.impl.DAO;
import com.devgoal.database.Database;
import com.devgoal.model.StudentOverseasWorkPlaceModel;

public class StudentOverseasWorkPlaceDAO implements DAO<StudentOverseasWorkPlaceModel>{
	
	Database db = new Database();
	
	public int insertOverseaAndUser(String user_id, String overseas_id, String condition) {
		
		String sql = "INSERT INTO student_overseas_work_place(user_id, overseas_work_place_id, student_overseas_work_place.condition) VALUES(?, ?, ?)";
		String[] data = {user_id, overseas_id, condition};
		
		return db.execute(sql, data);
	}
	
	public int insertOverseasAndUser(String user_id, String overseas_id, String condition) {
		
		String sql = "INSERT INTO student_overseas_work_place(user_id, overseas_work_place_id, student_overseas_work_place.condition) VALUES(?, ?, ?)";
		String[] data = {user_id, overseas_id, condition};
		
		return db.execute(sql, data);
	}
	
	public ArrayList<HashMap<String, Object>> queryUserDataRequest(String user_id) {
		
		String sql = "SELECT  \n" +
					"	user.user_id AS user_id,  \n" +
					"	user.firstname AS firstname,  \n" +
					"	user.lastname AS lastname,  \n" +
					"	user.address AS address,  \n" +
					"	user.email AS email,  \n" +
					"	user.phone AS phone,  \n" +
					"	user.profile_image AS profile_image,  \n" +
					"	user.birthday AS birthday, \n" +
					"	university.name AS university_name,  \n" +
					"	faculty.name AS faculty_name,  \n" +
					"	course.name AS course_name,  \n" +
					"	\n" +
					"	student_overseas_work_place.student_overseas_work_place_id AS student_overseas_work_place_id,  \n" +
					"	student_overseas_work_place.time_reg AS time_reg,  \n" +
					"	student_overseas_work_place.status AS status,  \n" +
					"	overseas_work_place.name AS overseas_name,\n" +
					"	\n" +
					"					  \n" +
					"CASE user.gender  \n" +
					"	WHEN 1 THEN 'ชาย'  \n" +
					"	WHEN 2 THEN 'หญิง'  \n" +
					"END gender,\n" +
					"CASE student_overseas_work_place.status  \n" +
					"	WHEN 0 THEN 'ไม่ผ่านการยืนยัน'  \n" +
					"	WHEN 1 THEN 'ผ่านการยืนยัน'  \n" +
					"	WHEN 2 THEN 'รอตรวจสอบ'\n" +
					"END status\n" +
					"	\n" +
					"FROM user   \n" +
					"LEFT JOIN university ON university.university_id = user.university_id  \n" +
					"LEFT JOIN faculty ON faculty.faculty_id = user.faculty_id  \n" +
					"LEFT JOIN course ON course.course_id = user.course_id  \n" +
					"INNER JOIN student_overseas_work_place ON student_overseas_work_place.user_id = user.user_id\n" +
					"INNER JOIN overseas_work_place ON overseas_work_place.overseas_work_place_id = student_overseas_work_place.overseas_work_place_id\n" +
					"WHERE overseas_work_place.status = 1 AND student_overseas_work_place.condition = 1 AND overseas_work_place.user_id = ?\n" +
					"ORDER BY student_overseas_work_place.status DESC";
		
		String[] data = {user_id};
		
		return db.queryListWithPrepare(sql, data);
	}
	
	public int managementStatusUserOverseas(String student_overseas_work_place_id, String status) {
		
		String sql = "UPDATE student_overseas_work_place SET status = ? WHERE student_overseas_work_place_id = ?";
		String[] data = {status, student_overseas_work_place_id};
		
		return db.execute(sql, data);
	}
	
	public ArrayList<HashMap<String, Object>> queryOverseasRequestStudentRole1(String user_id) {
		
		String sql = "SELECT    \n" +
					"	student_overseas_work_place.student_overseas_work_place_id, \n" +
					"	overseas_work_place.overseas_work_place_id AS overseas_id,    \n" +
					"	 \n" +
					"	(SELECT user.email FROM overseas_work_place INNER JOIN user ON user.user_id = overseas_work_place.user_id WHERE overseas_work_place.overseas_work_place_id = overseas_id) AS employer_email, \n" +
					"	 \n" +
					"	overseas_work_place.name,    \n" +
					"	overseas_work_place.address,    \n" +
					"	overseas_work_place.email AS overseas_email,    \n" +
					"	overseas_work_place.phone,    \n" +
					"	overseas_work_place.recive_total,    \n" +
					"	student_overseas_work_place.time_reg,    \n" +
					"CASE overseas_work_place.type     \n" +
					"		WHEN 1 THEN    \n" +
					"		'ในประเทศ'     \n" +
					"		WHEN 2 THEN    \n" +
					"		'ต่างประเทศ'     \n" +
					"END type,    \n" +
					"CASE student_overseas_work_place.status     \n" +
					"		WHEN 0 THEN    \n" +
					"		'ไม่ตอบรับ'     \n" +
					"		WHEN 1 THEN    \n" +
					"		'ตอบรับแล้ว'     \n" +
					"		WHEN 2 THEN    \n" +
					"		'รอตรวจสอบ'     \n" +
					"END status     \n" +
					"FROM    \n" +
					"	student_overseas_work_place \n" +
					"INNER JOIN overseas_work_place ON overseas_work_place.overseas_work_place_id = student_overseas_work_place.overseas_work_place_id	 \n" +
					"INNER JOIN user ON user.user_id = student_overseas_work_place.user_id \n" +
					"	 \n" +
					"WHERE overseas_work_place.status = 1  \n" +
					"AND student_overseas_work_place.status = 2 \n" +
					"AND student_overseas_work_place.condition = 2 \n" +
					"AND student_overseas_work_place.user_id = ?";
		
		String[] data = {user_id};
		
		return db.queryListWithPrepare(sql, data);
	}
	
	public int updateSendStatus(String student_overseas_work_place_id) {
		
		String sql = "UPDATE student_overseas_work_place SET send_status = 1 WHERE student_overseas_work_place_id = ?";
		String[] data = {student_overseas_work_place_id};
		
		return db.execute(sql, data);
	}
	
	public HashMap<String, Object> queryEmailByStudentOverseasId(String std_overseas_id) {
		
		String sql = "SELECT \n" +
					"	user.email\n" +
					"FROM student_overseas_work_place\n" +
					"INNER JOIN user ON user.user_id = student_overseas_work_place.user_id\n" +
					"WHERE student_overseas_work_place.student_overseas_work_place_id = ?";
		
		String[] data = {std_overseas_id};
		
		return db.querySingleWithPrepare(sql, data);
	}

	@Override
	public int Add(StudentOverseasWorkPlaceModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int Delete(StudentOverseasWorkPlaceModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int Update(StudentOverseasWorkPlaceModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<StudentOverseasWorkPlaceModel> FindAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public StudentOverseasWorkPlaceModel FindByID(StudentOverseasWorkPlaceModel bean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public StudentOverseasWorkPlaceModel FindByID(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public StudentOverseasWorkPlaceModel MappingBeans(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public int managementStatusUserOverseasRole1(String student_overseas_work_place_id, String status) {
		
		String sql = "UPDATE student_overseas_work_place SET status = ? WHERE student_overseas_work_place_id = ?";
		String[] data = {status, student_overseas_work_place_id};
		
		return db.execute(sql, data);
	}
	
	public ArrayList<HashMap<String, Object>> queryStudentAndOverseasMatchingRole3(String overseas_id) {
		
		String sql = "SELECT     \n" +
					"	user.user_id AS user_id,     \n" +
					"	user.firstname AS firstname,     \n" +
					"	user.lastname AS lastname,          \n" +
					"	university.name AS university_name,     \n" +
					"	faculty.name AS faculty_name,   \n" +
					"	course.name AS course_name,   \n" +
					"	user.profile_image AS profile_image,     \n" +
					"	user.birthday AS birthday,     \n" +
					"	user.address AS address,   \n" +
					"	user.email,  \n" +
					"	user.phone,  \n" +
					"	overseas_work_place.name AS overseas_name, \n" +
					"	student_overseas_work_place.student_overseas_work_place_id AS student_overseas_work_place_id, \n" +
					"		 \n" +
					"CASE user.gender     \n" +
					"	WHEN 1 THEN 'ชาย'     \n" +
					"	WHEN 2 THEN 'หญิง'     \n" +
					"END gender   \n" +
					"		 \n" +
					"FROM student_overseas_work_place \n" +
					"INNER JOIN user ON user.user_id = student_overseas_work_place.user_id     \n" +
					"INNER JOIN overseas_work_place ON overseas_work_place.overseas_work_place_id = student_overseas_work_place.overseas_work_place_id  \n" +
					"INNER JOIN university ON university.university_id = user.university_id     \n" +
					"INNER JOIN faculty ON faculty.faculty_id = user.faculty_id   \n" +
					"INNER JOIN course ON course.course_id = user.course_id   \n" +
					"WHERE user.user_type = 1 AND user.status = 1 AND student_overseas_work_place.status = 1 AND student_overseas_work_place.send_status = 2 AND student_overseas_work_place.overseas_work_place_id = ?";
		
		String[] data = {overseas_id};
		return db.queryListWithPrepare(sql, data);
	}
	
	public ArrayList<HashMap<String, Object>> queryOverseasAndRole3DataForResume(String user_id) {
		
		String sql = "SELECT \n" +
				"	overseas_work_place.overseas_work_place_id AS overseas_id,\n" +
				"	overseas_work_place.name AS overseas_name,\n" +
				"	(SELECT user.email FROM overseas_work_place INNER JOIN user ON user.user_id = overseas_work_place.user_id WHERE overseas_work_place.overseas_work_place_id = overseas_id) AS role3_email\n" +
				"	\n" +
				"FROM student_overseas_work_place\n" +
				"INNER JOIN overseas_work_place ON overseas_work_place.overseas_work_place_id = student_overseas_work_place.overseas_work_place_id\n" +
				"WHERE student_overseas_work_place.status = 1 AND overseas_work_place.status = 1 AND student_overseas_work_place.user_id = ?";
		String[] data = {user_id};
		
		return db.queryListWithPrepare(sql, data);
	}
	
	
	public HashMap<String, Object> queryOverseasRequestCondition(String user_id) {
		
		String sql = "SELECT\n" +
				"	\n" +
				"	(SELECT COUNT(student_overseas_work_place_id) FROM student_overseas_work_place \n" +
				"	INNER JOIN overseas_work_place ON overseas_work_place.overseas_work_place_id = student_overseas_work_place.overseas_work_place_id \n" +
				"	WHERE student_overseas_work_place.status = 2 AND student_overseas_work_place.send_status = 2 AND student_overseas_work_place.condition = 1 AND overseas_work_place.user_id = ?) AS student_request,\n" +
				"	\n" +
				"	(SELECT COUNT(student_overseas_work_place_id) FROM student_overseas_work_place \n" +
				"	INNER JOIN overseas_work_place ON overseas_work_place.overseas_work_place_id = student_overseas_work_place.overseas_work_place_id \n" +
				"	WHERE student_overseas_work_place.status = 2 AND student_overseas_work_place.send_status = 2 AND student_overseas_work_place.condition = 2 AND overseas_work_place.user_id = ?) AS request_student";
		String[] data = {user_id, user_id};
		
		return db.querySingleWithPrepare(sql, data);
	}
	
	public ArrayList<HashMap<String, Object>> queryStudentCountOverseasWorking(String user_id) {
		
		String sql = "SELECT	\n" +
				"	overseas_work_place.name,\n" +
				"	COUNT(student_overseas_work_place.student_overseas_work_place_id) AS count\n" +
				"	\n" +
				"FROM student_overseas_work_place\n" +
				"INNER JOIN overseas_work_place ON overseas_work_place.overseas_work_place_id = student_overseas_work_place.overseas_work_place_id\n" +
				"WHERE student_overseas_work_place.status = 1 AND send_status = 1 AND overseas_work_place.user_id = ?\n" +
				"GROUP BY overseas_work_place.overseas_work_place_id";
		String[] data = {user_id};
		
		return db.queryListWithPrepare(sql, data);
	}
	
	
}
