package com.devgoal.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.devgoal.dao.impl.DAO;
import com.devgoal.database.Database;
import com.devgoal.model.AssessmentInternshipDetModel;

public class AssessmentInternshipDetDAO implements DAO<AssessmentInternshipDetModel>{

	Database db = new Database();
	
	public int insertAssessmentInternshipDet(String assessment_internship_id, String condition, String criterion_id, String score) {
		
		String sql = "INSERT INTO assessment_internship_det(assessment_internship_id, assessment_internship_det.condition, criterion_id, score) VALUES(?, ?, ?, ?)";
		String[] data = {assessment_internship_id, condition, criterion_id, score};
		
		return db.execute(sql, data);
		
	}
	
	public ArrayList<HashMap<String, Object>> queryAssessmentScore(String assessment_internship_id) {
		
		String sql = "SELECT\n" +
					"	result_internship.result_internship_name,\n" +
					"	criterion.detail,\n" +
					"	assessment_internship_det.score,\n" +
					"	assessment_internship_det.condition\n" +
					"	\n" +
					"	\n" +
					"FROM assessment_internship_det\n" +
					"INNER JOIN criterion ON criterion.criterion_id = assessment_internship_det.criterion_id\n" +
					"INNER JOIN assessment_internship ON assessment_internship.assessment_internship_id = assessment_internship_det.assessment_internship_id\n" +
					"INNER JOIN result_internship ON result_internship.result_internship_id = assessment_internship.result_internship_id\n" +
					"WHERE assessment_internship.status = 1 AND assessment_internship_det.assessment_internship_id = ?";
		String[] data = {assessment_internship_id};
		
		return db.queryListWithPrepare(sql, data);
	}
	
	public HashMap<String, Object> queryStudentInternshipComplete(String user_id) {
		
		String sql = "SELECT	 \n" +
				"	COUNT(assessment_internship.assessment_internship_id) role1_complete \n" +
				"	 \n" +
				"FROM assessment_internship \n" +
				"INNER JOIN result_internship ON result_internship.result_internship_id = assessment_internship.result_internship_id \n" +
				"INNER JOIN user ON user.user_id = result_internship.user_id \n" +
				"INNER JOIN student_place_of_internship ON student_place_of_internship.student_place_of_internship_id = assessment_internship.student_place_of_internship_id\n" +
				"WHERE assessment_internship.status = 1 AND student_place_of_internship.send_status = 1 AND result_internship.user_id = ?";
		String[] data = {user_id};
		
		return db.querySingleWithPrepare(sql, data);
	}
	
	public HashMap<String, Object> queryStudentInternshiping(String user_id) {
		
		String sql = "SELECT  \n" +
				"	COUNT(student_place_of_internship.student_place_of_internship_id) AS role1_internshiping \n" +
				"	 \n" +
				"FROM student_place_of_internship \n" +
				"INNER JOIN place_of_internship ON place_of_internship.place_of_internship_id = student_place_of_internship.place_of_internship_id \n" +
				"WHERE student_place_of_internship.status = 1 AND student_place_of_internship.send_status = 1 AND place_of_internship.user_id = ? AND student_place_of_internship.student_place_of_internship_id NOT IN (SELECT student_place_of_internship_id FROM assessment_internship)";
		String[] data = {user_id};
		
		return db.querySingleWithPrepare(sql, data);
	}
	
	public HashMap<String, Object> queryStudentInternshipCompleteFilter(String user_id, String term_id) {
		
		String sql = "SELECT	  \n" +
				"	COUNT(assessment_internship.assessment_internship_id) role1_complete  \n" +
				"		\n" +
				"FROM assessment_internship  \n" +
				"INNER JOIN result_internship ON result_internship.result_internship_id = assessment_internship.result_internship_id  \n" +
				"INNER JOIN user ON user.user_id = result_internship.user_id  \n" +
				"INNER JOIN student_place_of_internship ON student_place_of_internship.student_place_of_internship_id = assessment_internship.student_place_of_internship_id\n" +
				"WHERE assessment_internship.status = 1 AND result_internship.user_id = ? AND student_place_of_internship.send_status = 1  AND student_place_of_internship.term_id = ?";
		String[] data = {user_id, term_id};
		
		return db.querySingleWithPrepare(sql, data);
	}
	
	public HashMap<String, Object> queryStudentInternshipingFilter(String user_id, String term_id) {
		
		String sql = "SELECT   \n" +
				"	COUNT(student_place_of_internship.student_place_of_internship_id) AS role1_internshiping  \n" +
				"		\n" +
				"FROM student_place_of_internship  \n" +
				"INNER JOIN place_of_internship ON place_of_internship.place_of_internship_id = student_place_of_internship.place_of_internship_id  \n" +
				"WHERE student_place_of_internship.status = 1 AND place_of_internship.user_id = ? AND student_place_of_internship.send_status = 1 AND student_place_of_internship.student_place_of_internship_id NOT IN (SELECT student_place_of_internship_id FROM assessment_internship) AND student_place_of_internship.term_id = ?";
		String[] data = {user_id, term_id};

		return db.querySingleWithPrepare(sql, data);
	}
	
	
	
	
	@Override
	public int Add(AssessmentInternshipDetModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int Delete(AssessmentInternshipDetModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int Update(AssessmentInternshipDetModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<AssessmentInternshipDetModel> FindAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public AssessmentInternshipDetModel FindByID(AssessmentInternshipDetModel bean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public AssessmentInternshipDetModel FindByID(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public AssessmentInternshipDetModel MappingBeans(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

}
