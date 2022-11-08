package com.devgoal.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.devgoal.dao.impl.DAO;
import com.devgoal.database.Database;
import com.devgoal.model.ResultInternshipDetModel;

public class ResultInternshipDetDAO implements DAO<ResultInternshipDetModel> {
	
	Database db = new Database();

	@Override
	public int Add(ResultInternshipDetModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public int insertResultInternshipDet(String result_internship_id, String criterion_id, String input_type) {
		
		String sql = "INSERT INTO result_internship_det(result_internship_id, criterion_id, input_type) VALUES(?, ?, ?)";
		String [] data = {result_internship_id, criterion_id, input_type};
		
		return db.execute(sql, data);
	}
	
	public ArrayList<HashMap<String, Object>> queryResultInternshipDetForm(String result_internship_id) {
		
		String sql = "SELECT\n" +
					"	criterion.detail,\n" +
					"	result_internship_det.input_type\n" +
					"FROM result_internship_det\n" +
					"INNER JOIN result_internship ON result_internship.result_internship_id = result_internship_det.result_internship_id\n" +
					"INNER JOIN criterion ON criterion.criterion_id = result_internship_det.criterion_id\n" +
					"WHERE result_internship.result_internship_id = ?";
		String[] data = {result_internship_id};
		
		return db.queryListWithPrepare(sql, data);
		
	}

	@Override
	public int Delete(ResultInternshipDetModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int Update(ResultInternshipDetModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<ResultInternshipDetModel> FindAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultInternshipDetModel FindByID(ResultInternshipDetModel bean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultInternshipDetModel FindByID(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultInternshipDetModel MappingBeans(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public ArrayList<HashMap<String, Object>> queryCriterionForm(String criterion_form_id, String secret_code) {
		
		String sql = "SELECT \n" +
				"	criterion.criterion_id, \n" +
				"	criterion.detail, \n" +
				"	result_internship_det.input_type \n" +
				"FROM result_internship_det \n" +
				"INNER JOIN result_internship ON result_internship.result_internship_id = result_internship_det.result_internship_id \n" +
				"INNER JOIN criterion ON criterion.criterion_id = result_internship_det.criterion_id \n" +
				"WHERE result_internship.result_internship_id = ? AND result_internship.type = 2 AND result_internship.status = 1 AND result_internship.user_id = (SELECT user_id FROM user WHERE secret_code = ? LIMIT 1)";
		String[] data = {criterion_form_id, secret_code};
		
		return db.queryListWithPrepare(sql, data);
	}
	
	public ArrayList<HashMap<String, Object>> queryCriterionFormRole2(String std_internship_id, String user_id) {
		
		String sql = "SELECT \n" +
				"	result_internship.result_internship_id, \n" +
				"	result_internship.result_internship_name, \n" +
				"	criterion.criterion_id,    \n" +
				"	criterion.detail,    \n" +
				"	result_internship_det.input_type   \n" +
				"		\n" +
				"FROM result_internship_det  \n" +
				"  \n" +
				"INNER JOIN result_internship ON result_internship.result_internship_id = result_internship_det.result_internship_id    \n" +
				"INNER JOIN criterion ON criterion.criterion_id = result_internship_det.criterion_id    \n" +
				"WHERE result_internship.result_internship_id = (SELECT assessment_internship.result_internship_id \n" +
				"FROM assessment_internship \n" +
				"INNER JOIN result_internship ON result_internship.result_internship_id = assessment_internship.result_internship_id\n" +
				"WHERE assessment_internship.student_place_of_internship_id = ? AND result_internship.type = 1) \n" +
				"AND result_internship.status = 1 AND result_internship.user_id = ? AND result_internship.type = 1";
		String[] data = {std_internship_id, user_id};
		
		return db.queryListWithPrepare(sql, data);
	}

}
