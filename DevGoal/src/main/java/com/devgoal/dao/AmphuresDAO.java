package com.devgoal.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.devgoal.dao.impl.DAO;
import com.devgoal.database.Database;
import com.devgoal.model.AmphuresModel;

public class AmphuresDAO implements DAO<AmphuresModel>{
	
	Database db = new Database();
	
	public ArrayList<HashMap<String, Object>> queryAmphures(String province_id) {
		
		String sql = "SELECT amphure_id, name_th FROM amphures WHERE province_id = ?";
		String[] data = {province_id};
		
		return db.queryListWithPrepare(sql, data);
	}

	@Override
	public int Add(AmphuresModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int Delete(AmphuresModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int Update(AmphuresModel bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<AmphuresModel> FindAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public AmphuresModel FindByID(AmphuresModel bean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public AmphuresModel FindByID(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public AmphuresModel MappingBeans(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

}
