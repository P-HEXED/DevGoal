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
				"FROM term";
		
		return db.queryList(sql);
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
