package com.devgoal.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.devgoal.dao.impl.DAO;
import com.devgoal.database.Database;
import com.devgoal.model.StudentPlaceOfInternshipModel;

public class StudentPlaceOfInternshipDAO implements DAO<StudentPlaceOfInternshipModel>{
	
	Database db = new Database();
	
	public int insertInternshipAndUser(String user_id, String internship_id, String condition) {
		
		String sql = "INSERT INTO student_place_of_internship(user_id, place_of_internship_id, student_place_of_internship.condition) VALUES(?, ?, ?)";
		String[] data = {user_id, internship_id, condition};
		
		return db.execute(sql, data);
	}
	
	public HashMap<String, Object> queryStudentInternshipIdStatus1ByStudentId(String user_id) {
		
		String sql = "SELECT student_place_of_internship_id FROM student_place_of_internship WHERE user_id = ? AND status = 1 LIMIT 1";
		String[] data = {user_id};
		
		return db.querySingleWithPrepare(sql, data);
	}
	
	public ArrayList<HashMap<String, Object>> queryUserDataRequest(String user_id) {
		
		String sql = "SELECT   \n" +
					"	user.user_id AS user_id,   \n" +
					"	user.firstname AS firstname,   \n" +
					"	user.lastname AS lastname,   \n" +
					"	user.address AS address,   \n" +
					"	user.email AS email,   \n" +
					"	user.phone AS phone,   \n" +
					"	user.profile_image AS profile_image,   \n" +
					"	user.birthday AS birthday,  \n" +
					"	university.name AS university_name,   \n" +
					"	faculty.name AS faculty_name,   \n" +
					"	course.name AS course_name,   \n" +
					"	 \n" +
					"	student_place_of_internship.student_place_of_internship_id AS student_place_of_internship_id,   \n" +
					"	student_place_of_internship.time_reg AS time_reg,   \n" +
					"	student_place_of_internship.status AS status,   \n" +
					"	place_of_internship.name AS internship_name, \n" +
					"	 \n" +
					"						 \n" +
					"CASE user.gender   \n" +
					"	WHEN 1 THEN 'ชาย'   \n" +
					"	WHEN 2 THEN 'หญิง'   \n" +
					"END gender, \n" +
					"CASE student_place_of_internship.status   \n" +
					"	WHEN 0 THEN 'ไม่ผ่านการยืนยัน'   \n" +
					"	WHEN 1 THEN 'ผ่านการยืนยัน'   \n" +
					"	WHEN 2 THEN 'รอตรวจสอบ' \n" +
					"END status \n" +
					"	 \n" +
					"FROM user    \n" +
					"LEFT JOIN university ON university.university_id = user.university_id   \n" +
					"LEFT JOIN faculty ON faculty.faculty_id = user.faculty_id   \n" +
					"LEFT JOIN course ON course.course_id = user.course_id   \n" +
					"INNER JOIN student_place_of_internship ON student_place_of_internship.user_id = user.user_id \n" +
					"INNER JOIN place_of_internship ON place_of_internship.place_of_internship_id = student_place_of_internship.place_of_internship_id \n" +
					"WHERE place_of_internship.status = 1 AND student_place_of_internship.condition = 1 AND place_of_internship.user_id = ?\n" +
					"ORDER BY student_place_of_internship.status DESC";
		
		String[] data = {user_id};
		
		return db.queryListWithPrepare(sql, data);
	}
	
	public ArrayList<HashMap<String, Object>> queryInternshipRequestStudentRole1(String user_id) {
		
		String sql = "SELECT   \n" +
					"	student_place_of_internship.student_place_of_internship_id,\n" +
					"	place_of_internship.place_of_internship_id AS internship_id,   \n" +
					"	\n" +
					"	(SELECT user.email FROM place_of_internship INNER JOIN user ON user.user_id = place_of_internship.user_id WHERE place_of_internship.place_of_internship_id = internship_id) AS teacher_email,\n" +
					"	\n" +
					"	place_of_internship.name,   \n" +
					"	place_of_internship.address,   \n" +
					"	place_of_internship.email AS internship_email,   \n" +
					"	place_of_internship.phone,   \n" +
					"	place_of_internship.recive_total,   \n" +
					"	student_place_of_internship.time_reg,   \n" +
					"CASE place_of_internship.type    \n" +
					"		WHEN 1 THEN   \n" +
					"		'ในประเทศ'    \n" +
					"		WHEN 2 THEN   \n" +
					"		'ต่างประเทศ'    \n" +
					"END type,   \n" +
					"CASE student_place_of_internship.status    \n" +
					"		WHEN 0 THEN   \n" +
					"		'ไม่ตอบรับ'    \n" +
					"		WHEN 1 THEN   \n" +
					"		'ตอบรับแล้ว'    \n" +
					"		WHEN 2 THEN   \n" +
					"		'รอตรวจสอบ'    \n" +
					"END status    \n" +
					"FROM   \n" +
					"	student_place_of_internship\n" +
					"INNER JOIN place_of_internship ON place_of_internship.place_of_internship_id = student_place_of_internship.place_of_internship_id	\n" +
					"INNER JOIN user ON user.user_id = student_place_of_internship.user_id\n" +
					"	\n" +
					"WHERE place_of_internship.request_status = 1 \n" +
					"AND place_of_internship.status = 1 \n" +
					"AND student_place_of_internship.status = 2\n" +
					"AND student_place_of_internship.condition = 2\n" +
					"AND student_place_of_internship.user_id = ?";
		
		String[] data = {user_id};
		
		return db.queryListWithPrepare(sql, data);
	}
	
	public int managementStatusUserInternship(String student_place_of_internship_id, String status) {
		
		String sql = "UPDATE student_place_of_internship SET status = ? WHERE student_place_of_internship_id = ?";
		String[] data = {status, student_place_of_internship_id};
		
		return db.execute(sql, data);
	}
	
	@Override
	public int Add(StudentPlaceOfInternshipModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int Delete(StudentPlaceOfInternshipModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int Update(StudentPlaceOfInternshipModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<StudentPlaceOfInternshipModel> FindAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public StudentPlaceOfInternshipModel FindByID(StudentPlaceOfInternshipModel bean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public StudentPlaceOfInternshipModel FindByID(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public StudentPlaceOfInternshipModel MappingBeans(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public ArrayList<HashMap<String, Object>> queryStudentAndInternshipMatchingRole3(String internship_id) {
		
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
					"	place_of_internship.name AS internship_name, \n" +
					"	student_place_of_internship.student_place_of_internship_id AS student_place_of_internship_id, \n" +
					"		 \n" +
					"CASE user.gender     \n" +
					"	WHEN 1 THEN 'ชาย'     \n" +
					"	WHEN 2 THEN 'หญิง'     \n" +
					"END gender   \n" +
					"		 \n" +
					"FROM student_place_of_internship \n" +
					"INNER JOIN user ON user.user_id = student_place_of_internship.user_id     \n" +
					"INNER JOIN place_of_internship ON place_of_internship.place_of_internship_id = student_place_of_internship.place_of_internship_id  \n" +
					"INNER JOIN university ON university.university_id = user.university_id     \n" +
					"INNER JOIN faculty ON faculty.faculty_id = user.faculty_id   \n" +
					"INNER JOIN course ON course.course_id = user.course_id   \n" +
					"WHERE user.user_type = 1 AND user.status = 1 AND student_place_of_internship.status = 1 AND student_place_of_internship.send_status = 2 AND student_place_of_internship.place_of_internship_id = ?";
		
		String[] data = {internship_id};
		return db.queryListWithPrepare(sql, data);
	}
	
	public HashMap<String, Object> queryEmailByStudentInternshipId(String std_overseas_id) {
		
		String sql = "SELECT \n" +
					"	user.email\n" +
					"FROM student_place_of_internship\n" +
					"INNER JOIN user ON user.user_id = student_place_of_internship.user_id\n" +
					"WHERE student_place_of_internship.student_place_of_internship_id = ?";
		
		String[] data = {std_overseas_id};
		
		return db.querySingleWithPrepare(sql, data);
	}
	
	public int updateSendStatus(String student_place_of_internship_id) {
		
		String sql = "UPDATE student_place_of_internship SET send_status = 1 WHERE student_place_of_internship_id = ?";
		String[] data = {student_place_of_internship_id};
		
		return db.execute(sql, data);
	}
	
	public ArrayList<HashMap<String, Object>> getStudentInternshipForSendAssessment(String user_id) {
		
		String sql = "SELECT	 \n" +
				"	place_of_internship.place_of_internship_id, \n" +
				"	place_of_internship.name, \n" +
				"	place_of_internship.email \n" +
				"	 \n" +
				"FROM place_of_internship \n" +
				"INNER JOIN student_place_of_internship ON student_place_of_internship.place_of_internship_id = place_of_internship.place_of_internship_id \n" +
				"WHERE student_place_of_internship.status = 1 AND student_place_of_internship.send_assessment_status = 0 AND student_place_of_internship.send_status = 1 AND place_of_internship.user_id = ?\n" +
				"GROUP BY place_of_internship.place_of_internship_id";
		String[] data = {user_id};
		
		return db.queryListWithPrepare(sql, data);
	}
	
	public ArrayList<HashMap<String, Object>> checkInternshipForAssessment(String secret, String internship_id) {
		
		String sql = "SELECT	\n" +
					"	(SELECT user_id FROM user WHERE secret_code = ? LIMIT 1) AS user_id,\n" +
					"	student_place_of_internship.place_of_internship_id\n" +
					"	\n" +
					"FROM student_place_of_internship\n" +
					"WHERE student_place_of_internship.user_id = user_id AND student_place_of_internship.status = 1 AND student_place_of_internship.place_of_internship_id = ?\n" +
					"LIMIT 1";
		String[] data = {secret, internship_id};
		
		return db.queryListWithPrepare(sql, data);
	}
	
	public ArrayList<HashMap<String, Object>> queryStudentDataInternshipComplete(String internship_id, String secret_code) {
		
		String sql = "SELECT	 \n" +
				"	user.profile_image, \n" +
				"	user.firstname, \n" +
				"	user.lastname, \n" +
				"	university.name AS university_name, \n" +
				"	faculty.name AS faculty_name, \n" +
				"	course.name AS course_name, \n" +
				"	place_of_internship.name AS internship_name, \n" +
				"	student_place_of_internship.time_reg, \n" +
				"	student_place_of_internship.student_place_of_internship_id \n" +
				"	 \n" +
				"FROM student_place_of_internship \n" +
				"INNER JOIN user ON user.user_id = student_place_of_internship.user_id \n" +
				"INNER JOIN university ON university.university_id = user.university_id \n" +
				"INNER JOIN faculty ON faculty.faculty_id = user.faculty_id \n" +
				"INNER JOIN course ON course.course_id = user.course_id \n" +
				"INNER JOIN place_of_internship ON place_of_internship.place_of_internship_id = student_place_of_internship.place_of_internship_id \n" +
				"WHERE student_place_of_internship.status = 1 AND place_of_internship.place_of_internship_id = ? AND place_of_internship.user_id = (SELECT user_id FROM user WHERE secret_code = ? LIMIT 1) AND student_place_of_internship.student_place_of_internship_id NOT IN (SELECT student_place_of_internship_id FROM assessment_internship)";
		String[] data = {internship_id, secret_code};
		
		return db.queryListWithPrepare(sql, data);
	}
	
	
	public ArrayList<HashMap<String, Object>> queryStudentDataInternshipCompleteRole2(String internship_id, String user_id) {
		
		String sql = "SELECT	  \n" +
				"	user.profile_image,  \n" +
				"	user.firstname,  \n" +
				"	user.lastname,  \n" +
				"	university.name AS university_name,  \n" +
				"	faculty.name AS faculty_name,  \n" +
				"	course.name AS course_name,  \n" +
				"	place_of_internship.name AS internship_name,  \n" +
				"	student_place_of_internship.time_reg,  \n" +
				"	student_place_of_internship.student_place_of_internship_id  \n" +
				"		\n" +
				"FROM student_place_of_internship  \n" +
				"INNER JOIN user ON user.user_id = student_place_of_internship.user_id  \n" +
				"INNER JOIN university ON university.university_id = user.university_id  \n" +
				"INNER JOIN faculty ON faculty.faculty_id = user.faculty_id  \n" +
				"INNER JOIN course ON course.course_id = user.course_id  \n" +
				"INNER JOIN place_of_internship ON place_of_internship.place_of_internship_id = student_place_of_internship.place_of_internship_id  \n" +
				"INNER JOIN assessment_internship ON assessment_internship.student_place_of_internship_id = student_place_of_internship.student_place_of_internship_id\n" +
				"WHERE student_place_of_internship.status = 1 AND assessment_internship.status = 0 AND place_of_internship.place_of_internship_id = ? AND place_of_internship.user_id = ?";
		String[] data = {internship_id, user_id};
		
		return db.queryListWithPrepare(sql, data);
	}
	
	public ArrayList<HashMap<String, Object>> queryStudentDataInternshipCompleteForReport(String internship_id, String user_id) {
		
		String sql = "SELECT	  \n" +
				"	user.profile_image,  \n" +
				"	user.firstname,  \n" +
				"	user.lastname,  \n" +
				"	university.name AS university_name,  \n" +
				"	faculty.name AS faculty_name,  \n" +
				"	course.name AS course_name,  \n" +
				"	place_of_internship.name AS internship_name,  \n" +
				"	student_place_of_internship.time_reg,  \n" +
				"	student_place_of_internship.student_place_of_internship_id,  \n" +
				"   assessment_internship.assessment_internship_id \n" +
				"		\n" +
				"FROM student_place_of_internship  \n" +
				"INNER JOIN user ON user.user_id = student_place_of_internship.user_id  \n" +
				"INNER JOIN university ON university.university_id = user.university_id  \n" +
				"INNER JOIN faculty ON faculty.faculty_id = user.faculty_id  \n" +
				"INNER JOIN course ON course.course_id = user.course_id  \n" +
				"INNER JOIN place_of_internship ON place_of_internship.place_of_internship_id = student_place_of_internship.place_of_internship_id  \n" +
				"INNER JOIN assessment_internship ON assessment_internship.student_place_of_internship_id = student_place_of_internship.student_place_of_internship_id\n" +
				"WHERE student_place_of_internship.status = 1 AND assessment_internship.status = 1 AND place_of_internship.place_of_internship_id = ? AND place_of_internship.user_id = ?";
		String[] data = {internship_id, user_id};
		
		return db.queryListWithPrepare(sql, data);
	}
	
	public ArrayList<HashMap<String, Object>> queryStudentCountInternshiping(String user_id) {
		
		String sql = "SELECT	\n" +
				"	place_of_internship.place_of_internship_id AS internship_id,\n" +
				"	place_of_internship.name AS internship_name,\n" +
				"	(SELECT COUNT(student_place_of_internship.student_place_of_internship_id)\n" +
				"	\n" +
				"	FROM student_place_of_internship \n" +
				"	\n" +
				"	INNER JOIN place_of_internship ON place_of_internship.place_of_internship_id = student_place_of_internship.place_of_internship_id \n" +
				"	\n" +
				"	WHERE student_place_of_internship.status = 1 \n" +
				"	AND place_of_internship.name = internship_name) AS role1_count\n" +
				"	\n" +
				"FROM place_of_internship\n" +
				"WHERE place_of_internship.status = 1 AND place_of_internship.user_id = ?";
		String[] data = {user_id};	
		
		return db.queryListWithPrepare(sql, data);
	}
	
	public ArrayList<HashMap<String, Object>> queryStudentDataInternshipForAssessment(String internship_id) {
		
		String sql = "SELECT \n" +
				"	user.profile_image,\n" +
				"	user.firstname,\n" +
				"	user.lastname,\n" +
				"	user.email,\n" +
				"	student_place_of_internship.time_reg\n" +
				"	\n" +
				"FROM student_place_of_internship\n" +
				"INNER JOIN user ON user.user_id = student_place_of_internship.user_id\n" +
				"WHERE student_place_of_internship.status = 1 AND student_place_of_internship.place_of_internship_id = ?";
		String[] data = {internship_id};
		
		return db.queryListWithPrepare(sql, data);
	}
	
	public ArrayList<HashMap<String, Object>> queryStudentDataInternshipForAssessmentFilterDate(String internship_id, String begin, String end) {
		
		String sql = "SELECT  \n" +
					"	user.profile_image, \n" +
					"	user.firstname, \n" +
					"	user.lastname, \n" +
					"	user.email, \n" +
					"	student_place_of_internship.time_reg \n" +
					"	 \n" +
					"FROM student_place_of_internship \n" +
					"INNER JOIN user ON user.user_id = student_place_of_internship.user_id \n" +
					"WHERE student_place_of_internship.status = 1 \n" +
					"AND student_place_of_internship.place_of_internship_id = ? \n" +
					"AND student_place_of_internship.time_reg BETWEEN ? AND ?";
		String[] data = {internship_id, begin, end};
		
		return db.queryListWithPrepare(sql, data);
	}
	
	public ArrayList<HashMap<String, Object>> queryStudentCountInternshipingFilter(String user_id, String begin, String end) {
		
		String sql = "SELECT	 \n" +
				"place_of_internship.place_of_internship_id AS internship_id, \n" +
				"place_of_internship.name AS internship_name, \n" +
				"(SELECT COUNT(student_place_of_internship.student_place_of_internship_id) \n" +
				" \n" +
				"FROM student_place_of_internship  \n" +
				" \n" +
				"INNER JOIN place_of_internship ON place_of_internship.place_of_internship_id = student_place_of_internship.place_of_internship_id  \n" +
				" \n" +
				"WHERE student_place_of_internship.status = 1  \n" +
				"AND place_of_internship.name = internship_name\n" +
				"AND student_place_of_internship.time_reg BETWEEN ? AND ?) AS role1_count \n" +
				" \n" +
				"FROM place_of_internship \n" +
				"WHERE place_of_internship.status = 1 AND place_of_internship.user_id = ?";
		String[] data = {begin, end, user_id};	
		
		return db.queryListWithPrepare(sql, data);
	}
	
	public HashMap<String, Object> queryInternshipRequestData(String user_id) {
		
		String sql = "SELECT \n" +
				"					 \n" +
				"(SELECT COUNT(student_place_of_internship_id) FROM student_place_of_internship  \n" +
				"INNER JOIN place_of_internship ON place_of_internship.place_of_internship_id = student_place_of_internship.place_of_internship_id  \n" +
				"WHERE student_place_of_internship.status = 2 AND student_place_of_internship.send_status = 2 AND student_place_of_internship.condition = 1 AND place_of_internship.user_id = ?) AS student_request, \n" +
				" \n" +
				"(SELECT COUNT(place_of_internship_id) FROM place_of_internship WHERE status = 2 AND request_status = 3) AS internship_request";
		String[] data = {user_id};
		
		return db.querySingleWithPrepare(sql, data);
		
	}
	
	
	public ArrayList<HashMap<String, Object>> queryStudentCountOverseasInternshiping(String user_id) {
		
		String sql = "SELECT	 \n" +
				"	place_of_internship.name, \n" +
				"	COUNT(student_place_of_internship.student_place_of_internship_id) AS count \n" +
				"	 \n" +
				"FROM student_place_of_internship \n" +
				"INNER JOIN place_of_internship ON place_of_internship.place_of_internship_id = student_place_of_internship.place_of_internship_id \n" +
				"WHERE student_place_of_internship.status = 1 AND send_status = 1 AND place_of_internship.user_id = ?\n" +
				"GROUP BY place_of_internship.place_of_internship_id";
		String[] data = {user_id};	
		
		return db.queryListWithPrepare(sql, data);
	}
	
	public int updateStatusSendAssessment(String internship_id) {
		
		String sql = "UPDATE student_place_of_internship SET send_assessment_status = 1 WHERE status = 1 AND send_status = 1 AND place_of_internship_id = ?";
		
		String[] data = {internship_id};
		
		return db.execute(sql, data);
	}
	

}
