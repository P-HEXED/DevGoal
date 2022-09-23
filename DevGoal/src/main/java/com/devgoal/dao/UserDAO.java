package com.devgoal.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import com.devgoal.dao.impl.DAO;
import com.devgoal.database.Database;
import com.devgoal.model.CourseModel;
import com.devgoal.model.FacultyModel;
import com.devgoal.model.UniversityModel;
import com.devgoal.model.UserModel;

public class UserDAO implements DAO<UserModel>{
	
	Database db = new Database();
	Connection conn = null;

	@Override
	public int Add(UserModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public int insertUser(String birthday, String gender, String firstname, String lastname, String address, String email, String password, String salt, String phone, String identified_number, String profile_image, String student_code, String advisor, String university, String faculty, String course, String user_type, String secret_code) {
		
		if(findUserByEmail(email).size() == 0) {
			
			String sql = "INSERT INTO user(birthday, gender, firstname, lastname, address, email, password, salt, student_code, phone, identified_number, advisor, university_id, faculty_id, course_id, profile_image, user_type, secret_code) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			String[] data = {birthday, gender, firstname, lastname, address, email, password, salt, student_code, phone, identified_number, advisor, university, faculty, course, profile_image, user_type, secret_code};
			
			return db.executeReturnLastId(sql, data, new String[] {"user_id"});
		}
		
		return -2;
	}
	
	public HashMap<String, Object> queryIdentifiedIDByUserId(String user_id) {
		
		String sql = "SELECT identified_number FROM user WHERE user_id = ?";
		String[] data = {user_id};
		
		return db.querySingleWithPrepare(sql, data);
	}
	
	public HashMap<String, Object> checkIdentifiedID(String identified_number) {
		
		String sql = "SELECT user_id FROM user WHERE identified_number = ?";
		String[] data = {identified_number};
		
		return db.querySingleWithPrepare(sql, data);
	}
	
	public int updateUserAndNewImageProfileForAdmin(String gender, String firstname, String lastname, String birthday, String address, String email, String student_code, String phone, String identified_number, String advisor, String university_id, String faculty_id, String course_id, String user_type, String profile_image, String user_id) {
		
		String sql = "UPDATE user SET \n" +
					"	gender = ?, \n" +
					"	firstname = ?, \n" +
					"	lastname = ?, \n" +
					"	birthday = ?, \n" +
					"	address = ?, \n" +
					"	email = ?, \n" +
					"	student_code = ?, \n" +
					"	phone = ?, \n" +
					"	identified_number = ?, \n" +
					"	advisor = ?, \n" +
					"	university_id = ?, \n" +
					"	faculty_id = ?, \n" +
					"	course_id = ?, \n" +
					"	user_type = ?, \n" +
					"	profile_image = ?\n" +
					"WHERE user_id = ?";
		String[] data = {gender, firstname, lastname, birthday, address, email, student_code, phone, identified_number, advisor, university_id, faculty_id, course_id, user_type, profile_image, user_id};
		
		return db.execute(sql, data);
	}
	
//	public int updateUserAndOldImageProfileForAdmin(String gender, String firstname, String lastname, String age, String address, String email, String student_code, String phone, String identified_number, String advisor, String university_id, String faculty_id, String course_id, String user_type, String user_id) {
//		
//		String sql = "UPDATE user SET \n" +
//					"	gender = ?, \n" +
//					"	firstname = ?, \n" +
//					"	lastname = ?, \n" +
//					"	age = ?, \n" +
//					"	address = ?, \n" +
//					"	email = ?, \n" +
//					"	student_code = ?, \n" +
//					"	phone = ?, \n" +
//					"	identified_number = ?, \n" +
//					"	advisor = ?, \n" +
//					"	university_id = ?, \n" +
//					"	faculty_id = ?, \n" +
//					"	course_id = ?, \n" +
//					"	user_type = ? \n" +
//					"WHERE user_id = ?";
//		String[] data = {gender, firstname, lastname, age, address, email, student_code, phone, identified_number, advisor, university_id, faculty_id, course_id, user_type, user_id};
//		
//		return db.execute(sql, data);
//	}
	
	public int updateUserAndNewImageProfile(String user_id, String address, String phone, String profile_image) {
		
		String sql = "UPDATE user SET address = ?, phone = ?, profile_image = ? WHERE user_id = ?";
		String[] data = {address, phone, profile_image, user_id};
		
		return db.execute(sql, data);
	}
	
	
	public int updateUserAndOldImageProfile(String user_id, String address, String phone) {
		
		String sql = "UPDATE user SET address = ?, phone = ? WHERE user_id = ?";
		String[] data = {address, phone, user_id};
		
		return db.execute(sql, data);
	}
	
	public int managementStatusUser(String user_id, String status) {
		
		String sql = "UPDATE user SET status = ? WHERE user_id = ?";
		String[] data = {status, user_id};
		
		return db.execute(sql, data);
	}
	
	public ArrayList<HashMap<String, Object>> queryUserData() {
		
		String sql = "SELECT \n" +
					"	user.user_id AS user_id, \n" +
					"	user.firstname AS firstname, \n" +
					"	user.lastname AS lastname, \n" +
					"	user.address AS address, \n" +
					"	user.email AS email, \n" +
					"	user.student_code AS student_code, \n" +
					"	user.phone AS phone, \n" +
					"	user.identified_number AS identified_number, \n" +
					"	user.advisor AS advisor, \n" +
					"	university.name AS university_name, \n" +
					"	faculty.name AS faculty_name, \n" +
					"	course.name AS course_name, \n" +
					"	university.university_id AS university_id, \n" +
					"	faculty.faculty_id AS faculty_id, \n" +
					"	course.course_id AS course_id, \n" +
					"	user.profile_image AS profile_image, \n" +
					"	user.time_reg AS time_reg, \n" +
					"	user.birthday AS birthday, \n" +
					"	user.user_type AS user_type, \n" +
					" \n" +
					"CASE user.gender \n" +
					"	WHEN 1 THEN 'ชาย' \n" +
					"	WHEN 2 THEN 'หญิง' \n" +
					"END gender, \n" +
					"CASE user.status \n" +
					"	WHEN 0 THEN 'ไม่ผ่านการยืนยันตัวตน' \n" +
					"	WHEN 1 THEN 'ยืนยันตัวตนแล้ว' \n" +
					"	WHEN 2 THEN 'รอการยืนยันตัวตน' \n" +
					"END status \n" +
					" \n" +
					"FROM user  \n" +
					"LEFT JOIN university ON university.university_id = user.university_id \n" +
					"LEFT JOIN faculty ON faculty.faculty_id = user.faculty_id \n" +
					"LEFT JOIN course ON course.course_id = user.course_id";
		
		return db.queryList(sql);
	}
	
	public ArrayList<HashMap<String, Object>> queryUserDataForVerify() {
		
		String sql = "SELECT \n" +
					"	user.user_id AS user_id, \n" +
					"	user.firstname AS firstname, \n" +
					"	user.lastname AS lastname, \n" +
					"	user.address AS address, \n" +
					"	user.email AS email, \n" +
					"	user.student_code AS student_code, \n" +
					"	user.phone AS phone, \n" +
					"	user.identified_number AS identified_number, \n" +
					"	user.advisor AS advisor, \n" +
					"	university.name AS university_name, \n" +
					"	faculty.name AS faculty_name, \n" +
					"	course.name AS course_name, \n" +
					"	university.university_id AS university_id, \n" +
					"	faculty.faculty_id AS faculty_id, \n" +
					"	course.course_id AS course_id, \n" +
					"	user.profile_image AS profile_image, \n" +
					"	user.time_reg AS time_reg, \n" +
					"	user.birthday AS birthday, \n" +
					"	user.user_type AS user_type, \n" +
					" \n" +
					"CASE user.gender \n" +
					"	WHEN 1 THEN 'ชาย' \n" +
					"	WHEN 2 THEN 'หญิง' \n" +
					"END gender, \n" +
					"CASE user.status \n" +
					"	WHEN 0 THEN 'ไม่ผ่านการยืนยันตัวตน' \n" +
					"	WHEN 1 THEN 'ยืนยันตัวตนแล้ว' \n" +
					"	WHEN 2 THEN 'รอการยืนยันตัวตน' \n" +
					"END status \n" +
					" \n" +
					"FROM user  \n" +
					"LEFT JOIN university ON university.university_id = user.university_id \n" +
					"LEFT JOIN faculty ON faculty.faculty_id = user.faculty_id \n" +
					"LEFT JOIN course ON course.course_id = user.course_id \n" +
					"ORDER BY user.status DESC";
		
		return db.queryList(sql);
	}
	
	public ArrayList<HashMap<String, Object>> queryAdminData(String admin_id) {
		
		String sql = "SELECT \n" +
					"	user.user_id AS user_id, \n" +
					"	user.firstname AS firstname, \n" +
					"	user.lastname AS lastname, \n" +
					"	user.address AS address, \n" +
					"	user.email AS email, \n" +
					"	user.student_code AS student_code, \n" +
					"	user.phone AS phone, \n" +
					"	user.identified_number AS identified_number, \n" +
					"	user.advisor AS advisor, \n" +
					"	university.name AS university_name, \n" +
					"	faculty.name AS faculty_name, \n" +
					"	course.name AS course_name, \n" +
					"	university.university_id AS university_id, \n" +
					"	faculty.faculty_id AS faculty_id, \n" +
					"	course.course_id AS course_id, \n" +
					"	user.profile_image AS profile_image, \n" +
					"	user.time_reg AS time_reg, \n" +
					"	user.birthday AS birthday, \n" +
					"	user.user_type AS user_type, \n" +
					" \n" +
					"CASE user.gender \n" +
					"	WHEN 1 THEN 'ชาย' \n" +
					"	WHEN 2 THEN 'หญิง' \n" +
					"END gender, \n" +
					"CASE user.status \n" +
					"	WHEN 0 THEN 'ไม่ผ่านการยืนยันตัวตน' \n" +
					"	WHEN 1 THEN 'ยืนยันตัวตนแล้ว' \n" +
					"	WHEN 2 THEN 'รอการยืนยันตัวตน' \n" +
					"END status \n" +
					" \n" +
					"FROM user  \n" +
					"LEFT JOIN university ON university.university_id = user.university_id \n" +
					"LEFT JOIN faculty ON faculty.faculty_id = user.faculty_id \n" +
					"LEFT JOIN course ON course.course_id = user.course_id \n" +
					"WHERE user.user_id = ? \n" +
					"LIMIT 1";
		String[] data = {admin_id};
		
		return db.queryListWithPrepare(sql, data);
	}
	
	public ArrayList<HashMap<String, Object>> queryUserDataSort() {
		
		String sql = "SELECT \n" +
					"	user.user_id AS user_id, \n" +
					"	user.firstname AS firstname, \n" +
					"	user.lastname AS lastname, \n" +
					"	user.address AS address, \n" +
					"	user.email AS email, \n" +
					"	user.student_code AS student_code, \n" +
					"	user.phone AS phone, \n" +
					"	user.identified_number AS identified_number, \n" +
					"	user.advisor AS advisor, \n" +
					"	university.name AS university, \n" +
					"	faculty.name AS faculty, \n" +
					"	course.name AS course, \n" +
					"	user.profile_image AS profile_image, \n" +
					"	user.time_reg AS time_reg, \n" +
					"	user.birthday AS birthday, \n" +
					" \n" +
					"CASE user.gender \n" +
					"	WHEN 1 THEN 'ชาย' \n" +
					"	WHEN 2 THEN 'หญิง' \n" +
					"END gender, \n" +
					"CASE user.user_type \n" +
					"	WHEN 1 THEN 'นิสิต/นักศึกษา' \n" +
					"	WHEN 2 THEN 'อาจารย์' \n" +
					"	WHEN 3 THEN 'นายจ้าง' \n" +
					"	WHEN 4 THEN 'ผู้ดูแลระบบ' \n" +
					"END user_type, \n" +
					"CASE user.status \n" +
					"	WHEN 0 THEN 'ไม่ผ่านการยืนยันตัวตน' \n" +
					"	WHEN 1 THEN 'ยืนยันตัวตนแล้ว' \n" +
					"	WHEN 2 THEN 'รอการยืนยันตัวตน' \n" +
					"END status \n" +
					" \n" +
					"FROM user  \n" +
					"LEFT JOIN university ON university.university_id = user.university_id \n" +
					"LEFT JOIN faculty ON faculty.faculty_id = user.faculty_id \n" +
					"LEFT JOIN course ON course.course_id = user.course_id";
		
		return db.queryList(sql);
	}
	
	public ArrayList<HashMap<String, Object>> queryUserDataSortUserType(String user_type) {
		
		String sql = "SELECT \n" +
					"	user.user_id AS user_id, \n" +
					"	user.firstname AS firstname, \n" +
					"	user.lastname AS lastname, \n" +
					"	user.address AS address, \n" +
					"	user.email AS email, \n" +
					"	user.student_code AS student_code, \n" +
					"	user.phone AS phone, \n" +
					"	user.identified_number AS identified_number, \n" +
					"	user.advisor AS advisor, \n" +
					"	university.name AS university, \n" +
					"	faculty.name AS faculty, \n" +
					"	course.name AS course, \n" +
					"	user.profile_image AS profile_image, \n" +
					"	user.time_reg AS time_reg, \n" +
					"	user.birthday AS birthday, \n" +
					" \n" +
					"CASE user.gender \n" +
					"	WHEN 1 THEN 'ชาย' \n" +
					"	WHEN 2 THEN 'หญิง' \n" +
					"END gender, \n" +
					"CASE user.user_type \n" +
					"	WHEN 1 THEN 'นิสิต/นักศึกษา' \n" +
					"	WHEN 2 THEN 'อาจารย์' \n" +
					"	WHEN 3 THEN 'นายจ้าง' \n" +
					"	WHEN 4 THEN 'ผู้ดูแลระบบ' \n" +
					"END user_type, \n" +
					"CASE user.status \n" +
					"	WHEN 0 THEN 'ไม่ผ่านการยืนยันตัวตน' \n" +
					"	WHEN 1 THEN 'ยืนยันตัวตนแล้ว' \n" +
					"	WHEN 2 THEN 'รอการยืนยันตัวตน' \n" +
					"END status \n" +
					" \n" +
					"FROM user  \n" +
					"LEFT JOIN university ON university.university_id = user.university_id \n" +
					"LEFT JOIN faculty ON faculty.faculty_id = user.faculty_id \n" +
					"LEFT JOIN course ON course.course_id = user.course_id\n" +
					"WHERE user.user_type = ?";
		
		String[] data = {user_type};
		return db.queryListWithPrepare(sql, data);
	}
	
	public ArrayList<HashMap<String, Object>> queryUserDataSortUserStatus(String status) {
		
		String sql = "SELECT \n" +
					"	user.user_id AS user_id, \n" +
					"	user.firstname AS firstname, \n" +
					"	user.lastname AS lastname, \n" +
					"	user.address AS address, \n" +
					"	user.email AS email, \n" +
					"	user.student_code AS student_code, \n" +
					"	user.phone AS phone, \n" +
					"	user.identified_number AS identified_number, \n" +
					"	user.advisor AS advisor, \n" +
					"	university.name AS university, \n" +
					"	faculty.name AS faculty, \n" +
					"	course.name AS course, \n" +
					"	user.profile_image AS profile_image, \n" +
					"	user.time_reg AS time_reg, \n" +
					"	user.birthday AS birthday, \n" +
					" \n" +
					"CASE user.gender \n" +
					"	WHEN 1 THEN 'ชาย' \n" +
					"	WHEN 2 THEN 'หญิง' \n" +
					"END gender, \n" +
					"CASE user.user_type \n" +
					"	WHEN 1 THEN 'นิสิต/นักศึกษา' \n" +
					"	WHEN 2 THEN 'อาจารย์' \n" +
					"	WHEN 3 THEN 'นายจ้าง' \n" +
					"	WHEN 4 THEN 'ผู้ดูแลระบบ' \n" +
					"END user_type, \n" +
					"CASE user.status \n" +
					"	WHEN 0 THEN 'ไม่ผ่านการยืนยันตัวตน' \n" +
					"	WHEN 1 THEN 'ยืนยันตัวตนแล้ว' \n" +
					"	WHEN 2 THEN 'รอการยืนยันตัวตน' \n" +
					"END status \n" +
					" \n" +
					"FROM user  \n" +
					"LEFT JOIN university ON university.university_id = user.university_id \n" +
					"LEFT JOIN faculty ON faculty.faculty_id = user.faculty_id \n" +
					"LEFT JOIN course ON course.course_id = user.course_id\n" +
					"WHERE user.status = ?";
		
		String[] data = {status};
		return db.queryListWithPrepare(sql, data);
	}
	
	public HashMap<String, Object> queryUserStatusForDashboard() {
		
		String sql = "SELECT \n" +
					" (SELECT COUNT(user_id) FROM user WHERE status = 0) AS status0, \n" +
					" (SELECT COUNT(user_id) FROM user WHERE status = 1) AS status1, \n" +
					" (SELECT COUNT(user_id) FROM user WHERE status = 2) AS status2 \n" +
					"\n" +
					"FROM user \n" +
					"LIMIT 1";
		return db.querySingle(sql);
	}
	
//	public ArrayList<HashMap<String, Object>> queryUserStatusForDashboard() {
//		
//		String sql = "SELECT status, COUNT(user_id) AS amount FROM user GROUP BY status";
//		
//		return db.queryList(sql);
//	}
	
	public HashMap<String, Object> queryUserTypeForDashboard() {
		
		String sql = "SELECT\n" +
					"\n" +
					" (SELECT COUNT(user_id) FROM user WHERE user_type = 1) AS role1,\n" +
					" (SELECT COUNT(user_id) FROM user WHERE user_type = 2) AS role2,\n" +
					" (SELECT COUNT(user_id) FROM user WHERE user_type = 3) AS role3,\n" +
					" (SELECT COUNT(user_id) FROM user WHERE user_type = 4) AS role4\n" +
					"\n" +
					"FROM user\n" +
					"LIMIT 1";
		return db.querySingle(sql);
	}
	
//	public ArrayList<HashMap<String, Object>> queryUserTypeForDashboard() {
//		
//		String sql = "SELECT user_type, COUNT(user_id) AS amount FROM user GROUP BY user_type";
//		
//		return db.queryList(sql);
//	}
	
	public HashMap<String, Object> queryUserDaysForDashboard() {
		
		String sql = "SELECT  \n" +
					"	(SELECT COUNT(user_id) FROM login_history WHERE DATE(time_reg) = CURDATE()) AS day7,  \n" +
					"	(SELECT COUNT(user_id) FROM login_history WHERE DATE(time_reg) = CURDATE() - 1) AS day6,  \n" +
					"	(SELECT COUNT(user_id) FROM login_history WHERE DATE(time_reg) = CURDATE() - 2) AS day5,  \n" +
					"	(SELECT COUNT(user_id) FROM login_history WHERE DATE(time_reg) = CURDATE() - 3) AS day4,  \n" +
					"	(SELECT COUNT(user_id) FROM login_history WHERE DATE(time_reg) = CURDATE() -4) AS day3,  \n" +
					"	(SELECT COUNT(user_id) FROM login_history WHERE DATE(time_reg) = CURDATE() - 5) AS day2,  \n" +
					"	(SELECT COUNT(user_id) FROM login_history WHERE DATE(time_reg) = CURDATE() - 6) AS day1  \n" +
					"FROM login_history  \n" +
					"WHERE MONTH(time_reg) = (SELECT MONTH(NOW())) \n" +
					"					\n" +
					"LIMIT 1";
		return db.querySingle(sql);
	}
	
	
	public HashMap<String, Object> queryUserMonthsForDashboard() {
		
		String sql = "SELECT \n" +
					"		(SELECT COUNT(user_id) FROM user WHERE MONTH(time_reg) = 1) AS month1, \n" +
					"		(SELECT COUNT(user_id) FROM user WHERE MONTH(time_reg) = 2) AS month2, \n" +
					"		(SELECT COUNT(user_id) FROM user WHERE MONTH(time_reg) = 3) AS month3, \n" +
					"		(SELECT COUNT(user_id) FROM user WHERE MONTH(time_reg) = 4) AS month4, \n" +
					"		(SELECT COUNT(user_id) FROM user WHERE MONTH(time_reg) = 5) AS month5, \n" +
					"		(SELECT COUNT(user_id) FROM user WHERE MONTH(time_reg) = 6) AS month6, \n" +
					"		(SELECT COUNT(user_id) FROM user WHERE MONTH(time_reg) = 7) AS month7, \n" +
					"		(SELECT COUNT(user_id) FROM user WHERE MONTH(time_reg) = 8) AS month8, \n" +
					"		(SELECT COUNT(user_id) FROM user WHERE MONTH(time_reg) = 9) AS month9, \n" +
					"		(SELECT COUNT(user_id) FROM user WHERE MONTH(time_reg) = 10) AS month10, \n" +
					"		(SELECT COUNT(user_id) FROM user WHERE MONTH(time_reg) = 11) AS month11, \n" +
					"		(SELECT COUNT(user_id) FROM user WHERE MONTH(time_reg) = 12) AS month12 \n" +
					"					 \n" +
					"FROM user \n" +
					"WHERE YEAR(time_reg) = (SELECT YEAR(NOW()))\n" +
					"LIMIT 1";
		return db.querySingle(sql);
	}
	
	public HashMap<String, Object> queryUserStatusForDashboardByDate(String begin, String end) {
		
		String sql = "SELECT \n" +
					"	(SELECT COUNT(user_id) FROM user WHERE status = 0 AND DATE(time_reg) BETWEEN ? AND ?) AS status0,\n" +
					"  (SELECT COUNT(user_id) FROM user WHERE status = 1 AND DATE(time_reg) BETWEEN ? AND ?) AS status1, \n" +
					"	(SELECT COUNT(user_id) FROM user WHERE status = 2 AND DATE(time_reg) BETWEEN ? AND ?) AS status2  \n" +
					"FROM \n" +
					"	user \n" +
					"	\n" +
					"LIMIT 1";
		String[] data = {begin, end, begin, end, begin, end};
		
		return db.querySingleWithPrepare(sql, data);
	}
	
	public HashMap<String, Object> queryUserTypeForDashboardByDate(String begin, String end) {
		
		String sql = "SELECT \n" +
					"	(SELECT COUNT(user_id) FROM user WHERE user_type = 1 AND DATE(time_reg) BETWEEN ? AND ?) AS role1, \n" +
					"	(SELECT COUNT(user_id) FROM user WHERE user_type = 2 AND DATE(time_reg) BETWEEN ? AND ?) AS role2, \n" +
					"	(SELECT COUNT(user_id) FROM user WHERE user_type = 3 AND DATE(time_reg) BETWEEN ? AND ?) AS role3, \n" +
					"	(SELECT COUNT(user_id) FROM user WHERE user_type = 4 AND DATE(time_reg) BETWEEN ? AND ?) AS role4 \n" +
					"					 \n" +
					"FROM user \n" +
					"LIMIT 1";
		String[] data = {begin, end, begin, end, begin, end, begin, end};
		
		return db.querySingleWithPrepare(sql, data);
	}

	@Override
	public int Delete(UserModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int Update(UserModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<UserModel> FindAll() {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM user";

		ArrayList<HashMap<String, Object>> queryList = db.queryList(sql);
		ArrayList<UserModel> List = new ArrayList<UserModel>();
		for (Iterator<HashMap<String, Object>> iterator = queryList.iterator(); iterator.hasNext();) {
			HashMap<String, Object> next = iterator.next();
			UserModel model = MappingBeans(next);
			List.add(model);
		}
		return List;
	}
	
	@Override
	public UserModel FindByID(UserModel bean) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM user WHERE user_id = ?";
		String[] data = {bean.getUser_id()};

		HashMap<String, Object> map = db.querySingleWithPrepare(sql, data);
		UserModel model = MappingBeans(map);
		return model;
	}

	@Override
	public UserModel FindByID(String id) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM user WHERE user_id = ?";
		String[] data = {id};

		HashMap<String, Object> map = db.querySingleWithPrepare(sql, data);
		UserModel model = MappingBeans(map);
		return model;
	}
	
	public int confirmUserEmailBySalt(String hex) {
		String sql = "UPDATE user SET status = 2 WHERE secret_code = ?";
		String[] data = {hex};
		
		return db.execute(sql, data);
	}
	
	public int updateSecretCode(String hex, String secret_code) {
		
		String sql = "UPDATE user SET secret_code = ? WHERE secret_code = ?";
		String[] data = {hex, secret_code};
		
		return db.execute(sql, data);
	}
	
	public HashMap<String, Object> querySaltByEmail(String email) {
		
		String sql = "SELECT salt FROM user WHERE email = ? LIMIT 1";
		String[] data = {email};
		
		return db.querySingleWithPrepare(sql, data);
	}
	
	public HashMap<String, Object> querySaltBySecretCode(String secret_code) {
		
		String sql = "SELECT salt FROM user WHERE secret_code = ? LIMIT 1";
		String[] data = {secret_code};
		
		return db.querySingleWithPrepare(sql, data);
	}
	
	public HashMap<String, Object> querySaltByUserId(String user_id) {
		
		String sql = "SELECT salt FROM user WHERE user_id = ? LIMIT 1";
		String[] data = {user_id};
		
		return db.querySingleWithPrepare(sql, data);
	}
	
	public HashMap<String, Object> querySecretCode(String email) {
		
		String sql = "SELECT secret_code FROM user WHERE email = ? LIMIT 1";
		String[] data = {email};
		
		return db.querySingleWithPrepare(sql, data);
	}
	
	public HashMap<String, Object> querySecretCodeByUserId(String user_id) {
		
		String sql = "SELECT secret_code FROM user WHERE user_id = ? LIMIT 1";
		String[] data = {user_id};
		
		return db.querySingleWithPrepare(sql, data);
	}
	
	public HashMap<String, Object> queryUser(String email, String password) {
		
		String sql = "SELECT * FROM user WHERE email = ? AND password = ? LIMIT 1";
		String[] data = {email, password};
		
		return db.querySingleWithPrepare(sql, data);
	}
	
	public HashMap<String, Object> findUserByEmail(String email) {
		
		String sql = "SELECT * FROM user WHERE email = ? LIMIT 1";
		String[] data = {email};
		
		return db.querySingleWithPrepare(sql, data);
	}
	
	public HashMap<String, Object> findEmailByUserId(String user_id) {
		
		String sql = "SELECT email FROM user WHERE user_id = ? LIMIT 1";
		String[] data = {user_id};
		
		return db.querySingleWithPrepare(sql, data);
	}
	
	public HashMap<String, Object> findEmailAndPhoneByUserId(String user_id) {
		
		String sql = "SELECT email, phone FROM user WHERE user_id = ? LIMIT 1";
		String[] data = {user_id};
		
		return db.querySingleWithPrepare(sql, data);
	}
	
	public int updatePasswordBySecretCode(String password, String secret_code) {
		
		String sql = "UPDATE user SET password = ? WHERE secret_code = ?";
		String[] data = {password, secret_code};
		
		return db.execute(sql, data);
	}
	
	public int updatePasswordByUserId(String password, String user_id) {
		
		String sql = "UPDATE user SET password = ? WHERE user_id = ?";
		String[] data = {password, user_id};
		
		return db.execute(sql, data);
	}

	
	public HashMap<String, Object> queryUserProfile(String user_id) {
		
		String sql = "SELECT \n" +
					"	user.user_id AS user_id, \n" +
					"	user.firstname AS firstname, \n" +
					"	user.lastname AS lastname, \n" +
					"	user.address AS address, \n" +
					"	user.email AS email, \n" +
					"	user.student_code AS student_code, \n" +
					"	user.phone AS phone, \n" +
					"	user.identified_number AS identified_number, \n" +
					"	user.advisor AS advisor, \n" +
					"	university.name AS university, \n" +
					"	faculty.name AS faculty, \n" +
					"	course.name AS course, \n" +
					"	user.profile_image AS profile_image, \n" +
					"	user.time_reg AS time_reg, \n" +
					"	user.birthday AS birthday, \n" +
					" \n" +
					"CASE user.gender \n" +
					"	WHEN 1 THEN 'ชาย' \n" +
					"	WHEN 2 THEN 'หญิง' \n" +
					"END gender, \n" +
					"CASE user.user_type \n" +
					"	WHEN 1 THEN 'นิสิต/นักศึกษา' \n" +
					"	WHEN 2 THEN 'อาจารย์' \n" +
					"	WHEN 3 THEN 'นายจ้าง' \n" +
					"	WHEN 4 THEN 'ผู้ดูแลระบบ' \n" +
					"END user_type, \n" +
					"CASE user.status \n" +
					"	WHEN 0 THEN 'ไม่ผ่านการยืนยันตัวตน' \n" +
					"	WHEN 1 THEN 'ยืนยันตัวตนแล้ว' \n" +
					"	WHEN 2 THEN 'รอการยืนยันตัวตน' \n" +
					"END status \n" +
					" \n" +
					"FROM user  \n" +
					"LEFT JOIN university ON university.university_id = user.university_id \n" +
					"LEFT JOIN faculty ON faculty.faculty_id = user.faculty_id \n" +
					"LEFT JOIN course ON course.course_id = user.course_id\n" +
					"WHERE user.status = 1\n" +
					"AND user.user_id = ?\n" +
					"LIMIT 1";
		
		String data[] = {user_id};
		return db.querySingleWithPrepare(sql, data);
	}
	
	public ArrayList<HashMap<String, Object>> studentData() {
		
		String sql = "SELECT  \n" +
					"	user.user_id AS user_id,  \n" +
					"	user.firstname AS firstname,  \n" +
					"	user.lastname AS lastname,       \n" +
					"	university.name AS university_name,  \n" +
					"	faculty.name AS faculty_name,\n" +
					"	course.name AS course_name,\n" +
					"	user.profile_image AS profile_image,  \n" +
					"	user.birthday AS birthday,  \n" +
					"	user.address AS address,\n" +
					"	\n" +
					"CASE user.gender  \n" +
					"	WHEN 1 THEN 'ชาย'  \n" +
					"	WHEN 2 THEN 'หญิง'  \n" +
					"END gender\n" +
					"	\n" +
					"FROM user   \n" +
					"INNER JOIN university ON university.university_id = user.university_id  \n" +
					"INNER JOIN faculty ON faculty.faculty_id = user.faculty_id\n" +
					"INNER JOIN course ON course.course_id = user.course_id\n" +
					"WHERE user.user_type = 1 AND user.status = 1";
		
		return db.queryList(sql);
	}
	
	public ArrayList<HashMap<String, Object>> studentDataByZone(String[] zone_data) {
		
		String sub_sql = "";
		
		if(zone_data.length != 0) {
			
			sub_sql = " AND user.address REGEXP '";
			
			for(int i = 0; i <zone_data.length; i++) {
				
				sub_sql += zone_data[i]+"|";
				
			}
			
			sub_sql = sub_sql.substring(0, sub_sql.length()-1);
			sub_sql += "'";
		}
		
		String sql = "SELECT  \n" +
					"	user.user_id AS user_id,  \n" +
					"	user.firstname AS firstname,  \n" +
					"	user.lastname AS lastname,       \n" +
					"	university.name AS university_name,  \n" +
					"	faculty.name AS faculty_name,\n" +
					"	course.name AS course_name,\n" +
					"	user.profile_image AS profile_image,  \n" +
					"	user.birthday AS birthday,  \n" +
					"	user.address AS address,\n" +
					"	\n" +
					"CASE user.gender  \n" +
					"	WHEN 1 THEN 'ชาย'  \n" +
					"	WHEN 2 THEN 'หญิง'  \n" +
					"END gender\n" +
					"	\n" +
					"FROM user   \n" +
					"INNER JOIN university ON university.university_id = user.university_id  \n" +
					"INNER JOIN faculty ON faculty.faculty_id = user.faculty_id\n" +
					"INNER JOIN course ON course.course_id = user.course_id\n" +
					"WHERE user.status = 1 AND user.user_type = 1"+sub_sql;
		return db.queryList(sql);
	}
	
	public ArrayList<HashMap<String, Object>> studentDataRole3() {
		
		String sql = "SELECT   \n" +
					"	user.user_id AS user_id,   \n" +
					"	user.firstname AS firstname,   \n" +
					"	user.lastname AS lastname,        \n" +
					"	university.name AS university_name,   \n" +
					"	faculty.name AS faculty_name, \n" +
					"	course.name AS course_name, \n" +
					"	user.profile_image AS profile_image,   \n" +
					"	user.birthday AS birthday,   \n" +
					"	user.address AS address, \n" +
					"	user.email,\n" +
					"	user.phone,\n" +
					"	 \n" +
					"CASE user.gender   \n" +
					"	WHEN 1 THEN 'ชาย'   \n" +
					"	WHEN 2 THEN 'หญิง'   \n" +
					"END gender \n" +
					"	 \n" +
					"FROM user    \n" +
					"INNER JOIN university ON university.university_id = user.university_id   \n" +
					"INNER JOIN faculty ON faculty.faculty_id = user.faculty_id \n" +
					"INNER JOIN course ON course.course_id = user.course_id \n" +
					"WHERE user.user_type = 1 AND user.status = 1";
		
		return db.queryList(sql);
	}
	
	public ArrayList<HashMap<String, Object>> studentDataByZoneRole3(String[] zone_data) {
		
		String sub_sql = "";
		
		if(zone_data.length != 0) {
			
			sub_sql = " AND user.address REGEXP '";
			
			for(int i = 0; i <zone_data.length; i++) {
				
				sub_sql += zone_data[i]+"|";
				
			}
			
			sub_sql = sub_sql.substring(0, sub_sql.length()-1);
			sub_sql += "'";
		}
		
		String sql = "SELECT  \n" +
					"	user.user_id AS user_id,  \n" +
					"	user.firstname AS firstname,  \n" +
					"	user.lastname AS lastname,       \n" +
					"	university.name AS university_name,  \n" +
					"	faculty.name AS faculty_name,\n" +
					"	course.name AS course_name,\n" +
					"	user.profile_image AS profile_image,  \n" +
					"	user.birthday AS birthday,  \n" +
					"	user.address AS address,\n" +
					"	user.email,\n" +
					"	user.phone,\n" +
					"	\n" +
					"CASE user.gender  \n" +
					"	WHEN 1 THEN 'ชาย'  \n" +
					"	WHEN 2 THEN 'หญิง'  \n" +
					"END gender\n" +
					"	\n" +
					"FROM user   \n" +
					"INNER JOIN university ON university.university_id = user.university_id  \n" +
					"INNER JOIN faculty ON faculty.faculty_id = user.faculty_id\n" +
					"INNER JOIN course ON course.course_id = user.course_id\n" +
					"WHERE user.status = 1 AND user.user_type = 1"+sub_sql;
		return db.queryList(sql);
	}
	
	public HashMap<String, Object> quesryUserData(String user_id) {
		
		String sql = "SELECT\n" +
					"	user.profile_image,\n" +
					"	user.firstname,\n" +
					"	user.lastname,\n" +
					"	user.email,\n" +
					"	user.phone,\n" +
					"	user.birthday,\n" +
					"	university.name AS university_name,\n" +
					"	faculty.name AS faculty_name,\n" +
					"	course.name AS course_name,\n" +
					"CASE user.gender\n" +
					"	WHEN 1 THEN 'ชาย'\n" +
					"	WHEN 2 THEN 'หญิง'\n" +
					"END gender\n" +
					"FROM user\n" +
					"INNER JOIN university ON university.university_id = user.university_id\n" +
					"INNER JOIN faculty ON faculty.faculty_id = user.faculty_id\n" +
					"INNER JOIN course ON course.course_id = user.course_id \n" +
					"WHERE user.user_id = ?";
		
		String[] data = {user_id};
		return db.querySingleWithPrepare(sql, data);
	}

	@Override
	public UserModel MappingBeans(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		
		UserModel model = new UserModel();
		UniversityModel university = new UniversityDAO().FindByID(map.get("university_id").toString());
		FacultyModel faculty = new FacultyDAO().FindByID(map.get("faculty_id").toString());
		CourseModel course = new CourseDAO().FindByID(map.get("course_id").toString());
		
		model.setGender(map.get("gender").toString());
		model.setUser_id(map.get("user_id").toString());
		model.setFirstname(map.get("firstname").toString());
		model.setLastname(map.get("lastname").toString());
		model.setAddress(map.get("address").toString());
		model.setEmail(map.get("email").toString());
		model.setPassword(map.get("password").toString());
		model.setSalt(map.get("salt").toString());
		model.setStudent_code(map.get("student_code").toString());
		model.setPhone(map.get("phone").toString());
		model.setIdentified_number(map.get("identified_number").toString());
		model.setAdvisor(map.get("advisor").toString());
		model.setUniversity(university);
		model.setFaculty(faculty);
		model.setCourse(course);
		model.setSecret_code(map.get("secret_code").toString());
		model.setStatus(map.get("status").toString());
		model.setProfile_image(map.get("profile_image").toString());
		model.setUser_type(map.get("user_type").toString());
		model.setTime_reg(map.get("time_reg").toString());
		
		return model;
	}
	
	
	public HashMap<String, Object> queryUserDataRole1(String user_id) {
		
		String sql = "SELECT \n" +
				"	user.profile_image, \n" +
				"	user.firstname, \n" +
				"	user.lastname,\n" +
				"	university.name AS university_name,\n" +
				"	faculty.name AS faculty_name,\n" +
				"	course.name AS course_name\n" +
				"	\n" +
				"FROM user \n" +
				"INNER JOIN university ON university.university_id = user.university_id \n" +
				"INNER JOIN faculty ON faculty.faculty_id = user.faculty_id \n" +
				"INNER JOIN course ON course.course_id = user.course_id  \n" +
				"WHERE user.user_id = ?";
		String[] data = {user_id};
		
		return db.querySingleWithPrepare(sql, data);
	}
	
	public HashMap<String, Object> queryPlacesDataRole1(String user_id) {
		
		String sql = "SELECT \n" +
				"	\n" +
				"	(SELECT \n" +
				"	COUNT(student_place_of_internship_id) \n" +
				"	\n" +
				"FROM student_place_of_internship \n" +
				"WHERE status = 2 AND student_place_of_internship.condition = 2 AND send_status = 2 AND user_id = ?) AS internship_request_student,\n" +
				"	(SELECT \n" +
				"	COUNT(student_overseas_work_place_id) \n" +
				"	\n" +
				"FROM student_overseas_work_place \n" +
				"WHERE status = 2 AND student_overseas_work_place.condition = 2 AND send_status = 2 AND user_id = ?) AS overseas_request_student,\n" +
				"	(SELECT \n" +
				"	place_of_internship.name AS internship_name\n" +
				"FROM student_place_of_internship\n" +
				"INNER JOIN place_of_internship ON place_of_internship.place_of_internship_id = student_place_of_internship.place_of_internship_id\n" +
				"WHERE student_place_of_internship.status = 1 AND student_place_of_internship.send_status = 1 AND student_place_of_internship.user_id = ?) AS internship_now,\n" +
				"	(SELECT \n" +
				"	overseas_work_place.name AS overseas_name\n" +
				"FROM student_overseas_work_place\n" +
				"INNER JOIN overseas_work_place ON overseas_work_place.overseas_work_place_id = student_overseas_work_place.overseas_work_place_id\n" +
				"WHERE student_overseas_work_place.status = 1 AND student_overseas_work_place.send_status = 1 AND student_overseas_work_place.user_id = ?) AS overseas_now";
		
		String[] data = {user_id, user_id, user_id, user_id};
		
		return db.querySingleWithPrepare(sql, data);
	}
	
	public HashMap<String, Object> queryUserDataRole3(String user_id) {
		
		String sql = "SELECT  \n" +
				"	profile_image,  \n" +
				"	firstname,  \n" +
				"	lastname\n" +
				"	 \n" +
				"FROM user  \n" +
				" \n" +
				"WHERE user_id = ?";
		String[] data = {user_id};
		
		return db.querySingleWithPrepare(sql, data);
	}

}
