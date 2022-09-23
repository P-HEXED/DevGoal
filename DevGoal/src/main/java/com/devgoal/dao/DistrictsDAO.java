package com.devgoal.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.devgoal.dao.impl.DAO;
import com.devgoal.database.Database;
import com.devgoal.model.DistrictsModel;

public class DistrictsDAO implements DAO<DistrictsModel>{
	
	Database db = new Database();
	
	public ArrayList<HashMap<String, Object>> queryDistricts(String amphure_id) {
		
		String sql = "SELECT zip_code, name_th FROM districts WHERE amphure_id = ?";
		String[] data = {amphure_id};
		
		return db.queryListWithPrepare(sql, data);
	}

	@Override
	public int Add(DistrictsModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int Delete(DistrictsModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int Update(DistrictsModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<DistrictsModel> FindAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public DistrictsModel FindByID(DistrictsModel bean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public DistrictsModel FindByID(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public DistrictsModel MappingBeans(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

}
