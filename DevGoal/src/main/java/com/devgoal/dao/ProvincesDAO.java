package com.devgoal.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.devgoal.dao.impl.DAO;
import com.devgoal.database.Database;
import com.devgoal.model.ProvincesModel;

public class ProvincesDAO implements DAO<ProvincesModel>{
	
	Database db = new Database();

	public ArrayList<HashMap<String, Object>> queryProvinces() {
		
		String sql = "SELECT province_id, name_th FROM provinces";
		
		return db.queryList(sql);
	}
	
	@Override
	public int Add(ProvincesModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int Delete(ProvincesModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int Update(ProvincesModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<ProvincesModel> FindAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ProvincesModel FindByID(ProvincesModel bean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ProvincesModel FindByID(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ProvincesModel MappingBeans(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

}
