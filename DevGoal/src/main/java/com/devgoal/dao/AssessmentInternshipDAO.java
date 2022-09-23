package com.devgoal.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.devgoal.dao.impl.DAO;
import com.devgoal.database.Database;
import com.devgoal.model.AssessmentInternshipModel;

public class AssessmentInternshipDAO implements DAO<AssessmentInternshipModel>{
	
	Database db = new Database();
	
	public HashMap<String, Object> checkAssessmentInternshipExist(String std_internship_id, String result_internship_id) {
		
		String sql = "SELECT assessment_internship_id\n" +
					"FROM assessment_internship\n" +
					"WHERE student_place_of_internship_id = ? AND result_internship_id = ?";
		String[] data = {std_internship_id, result_internship_id};
		
		return db.querySingleWithPrepare(sql, data);
	}
	
	public int insertAssessmentInternship(String result_internship_id, String student_place_of_internship_id) {
		
		String sql = "INSERT INTO assessment_internship(result_internship_id, student_place_of_internship_id) VALUES(?, ?)";
		String[] data = {result_internship_id, student_place_of_internship_id};
		String[] lastId = {"assessment_internship_id"};
		
		return db.executeReturnLastId(sql, data, lastId);
	}
	
	public int updateStatusAssessmentInternship(String assessment_internship_id) {
		
		String sql = "UPDATE assessment_internship SET status = 1 WHERE assessment_internship_id = ?";
		String[] data = {assessment_internship_id};
		
		return db.execute(sql, data);
		
	}

	@Override
	public int Add(AssessmentInternshipModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int Delete(AssessmentInternshipModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int Update(AssessmentInternshipModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<AssessmentInternshipModel> FindAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public AssessmentInternshipModel FindByID(AssessmentInternshipModel bean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public AssessmentInternshipModel FindByID(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public AssessmentInternshipModel MappingBeans(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

}
