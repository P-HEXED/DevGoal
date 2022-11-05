package com.devgoal.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.devgoal.dao.impl.DAO;
import com.devgoal.database.Database;
import com.devgoal.model.TermModel;

public class TermDAO implements DAO<TermModel> {
	
	Database db = new Database();
	
	public ArrayList<HashMap<String, Object>> queryTerm() {
		
		String sql = "SELECT\n" +
				"	term_id,\n" +
				"	year,\n" +
				"	term_no,\n" +
				"	begin_date,\n" +
				"	end_date,\n" +
				"	\n" +
				"	CASE status\n" +
				"		WHEN 0 THEN 'ไม่ผ่านยืนยัน'\n" +
				"		WHEN 1 THEN 'ยืนยันแล้ว'\n" +
				"		WHEN 2 THEN 'รอการตรวจสอบ'\n" +
				"	END AS status\n" +
				"	\n" +
				"FROM term\n"+
				"ORDER BY year DESC, term_no DESC";
		
		return db.queryList(sql);
	}
	
	public ArrayList<HashMap<String, Object>> queryYearOfTerm() {
		
		String sql = "SELECT year FROM term WHERE status = 1 GROUP BY year";
		
		return db.queryList(sql);
	}
	
	public ArrayList<HashMap<String, Object>> queryTermByYear(String year) {
		
		String sql = "SELECT term_no FROM term WHERE year = ? AND status = 1";
		String[] data = {year};
		
		return db.queryListWithPrepare(sql, data);
	}
	
	public int updateStatusTerm(String status, String term_id) {
		
		String sql = "UPDATE term SET status = ? WHERE term_id = ?";
		String[] data = {status, term_id};
		
		return db.execute(sql, data);
	}
	
	public HashMap<String, Object> checkDuplicateterm(String year, String term) {
		
		String sql = "SELECT term_id FROM term WHERE year = ? AND term_no = ? LIMIT 1";
		String[] data = {year, term};
		
		return db.querySingleWithPrepare(sql, data);
	}
	
	public int insertTerm(String year, String term, String begin_date, String end_date) {
		
		String sql = "INSERT INTO term(year, term_no, begin_date, end_date) VALUES(?, ?, ?, ?)";
		String[] data = {year, term, begin_date, end_date};
		String[] lastId = {"term_id"};
		
		return db.executeReturnLastId(sql, data, lastId);
	}
	
	public int updateTerm(String year, String term, String begin_date, String end_date, String term_id) {
		
		String sql = "UPDATE term SET year = ?, term_no = ?, begin_date = ?, end_date = ? WHERE term_id = ?";
		String[] data = {year, term, begin_date, end_date, term_id};
		
		return db.execute(sql, data);
	}
	
	public HashMap<String, Object> queryTermId(String year, String term_no) {
		
		String sql = "SELECT term_id FROM term WHERE year = ? AND term_no = ? AND status = 1 LIMIT 1";
		String[] data = {year, term_no};
		
		return db.querySingleWithPrepare(sql, data);
	}

	@Override
	public int Add(TermModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int Delete(TermModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int Update(TermModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<TermModel> FindAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TermModel FindByID(TermModel bean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TermModel FindByID(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TermModel MappingBeans(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

}
