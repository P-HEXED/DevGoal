package com.devgoal.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.swing.text.StyleContext.SmallAttributeSet;

import com.devgoal.controller.PathConfig;

public class Database {
	Connection conn = null;
	
	String db_path = new PathConfig().db_path;
	
	//Connection to database
	public Connection Connect() {
		
		Connection con = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://"+db_path+"/62011211024","62011211024","62011211024");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return con;
		
	}
	
	//Query single row
		public HashMap<String, Object> querySingle(String sql) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			try {
				conn = Connect();
				if (conn != null) {
					PreparedStatement stmt = conn.prepareStatement(sql);
					
					ResultSet rs = stmt.executeQuery();
					ResultSetMetaData rsMetaData = rs.getMetaData();
					if (rs.isBeforeFirst()) {
						while (rs.next()) {
							for (int i = 0; i < rsMetaData.getColumnCount(); i++) {
								map.put(rsMetaData.getColumnLabel(i + 1), rs.getString(i + 1));
							}
						}
					}
					rs.close();
					stmt.close();

					return map;
				}
			} catch (SQLException ex) {
				ex.printStackTrace();
			} finally {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return map;
		}
	
	//Query single row with prepare statement
	public HashMap<String, Object> querySingleWithPrepare(String sql, String[] data) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		try {
			conn = Connect();
			if (conn != null) {
				PreparedStatement stmt = conn.prepareStatement(sql);
				
				for(int i = 0; i < data.length; i++) {
					stmt.setString(i+1, data[i]);
				}
				
				ResultSet rs = stmt.executeQuery();
				ResultSetMetaData rsMetaData = rs.getMetaData();
				if (rs.isBeforeFirst()) {
					while (rs.next()) {
						for (int i = 0; i < rsMetaData.getColumnCount(); i++) {
							map.put(rsMetaData.getColumnLabel(i + 1), rs.getString(i + 1));
						}
					}
				}
				rs.close();
				stmt.close();

				return map;
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return map;
	}
	
	//Query multiple rows
		public ArrayList<HashMap<String, Object>> queryList(String sql) {
			ArrayList<HashMap<String, Object>> mapList = new ArrayList<HashMap<String, Object>>();
			try {
				conn = Connect();
				if (conn != null) {
					PreparedStatement stmt = conn.prepareStatement(sql);
					ResultSet rs = stmt.executeQuery();
					ResultSetMetaData rsMetaData = rs.getMetaData();
					if (rs.isBeforeFirst()) {
						while (rs.next()) {
							HashMap<String, Object> map = new HashMap<String, Object>();
							for (int i = 0; i < rsMetaData.getColumnCount(); i++) {
								map.put(rsMetaData.getColumnLabel(i + 1), rs.getString(i + 1));
							}
							mapList.add(map);
						}
					}
					rs.close();
					stmt.close();

					return mapList;
				}
			} catch (SQLException ex) {
				ex.printStackTrace();
			} finally {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return mapList;
		}

	//Query multiple rows with prepare statement
	public ArrayList<HashMap<String, Object>> queryListWithPrepare(String sql, String[] data) {
		ArrayList<HashMap<String, Object>> mapList = new ArrayList<HashMap<String, Object>>();
		try {
			conn = Connect();
			if (conn != null) {
				PreparedStatement stmt = conn.prepareStatement(sql);
		
				for(int i = 0; i < data.length; i++) {
					stmt.setString(i+1, data[i]);
				}
				ResultSet rs = stmt.executeQuery();
				ResultSetMetaData rsMetaData = rs.getMetaData();
				if (rs.isBeforeFirst()) {
					while (rs.next()) {
						HashMap<String, Object> map = new HashMap<String, Object>();
						for (int i = 0; i < rsMetaData.getColumnCount(); i++) {
							map.put(rsMetaData.getColumnLabel(i + 1), rs.getString(i + 1));
						}
						mapList.add(map);
					}
				}
				rs.close();
				stmt.close();

				return mapList;
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return mapList;
	}

	
	//Execute return status 1, -1
	public int execute(String sql, String[] data) {
		
		int lastId = -1;
		try {
			conn = Connect();
			conn.setAutoCommit(false);
			if (conn != null) {
				PreparedStatement stmt = conn.prepareStatement(sql);
				
				for(int i = 0; i < data.length; i++) {
					stmt.setString(i+1, data[i]);
				}
				
				lastId = stmt.executeUpdate();
				stmt.close();
			}
			return lastId;
		} catch (SQLException ex) {
			try {
				conn.rollback();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			ex.printStackTrace();
		} finally {
			try {
				conn.setAutoCommit(true);
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return lastId;
	}
	
	//Execute return last id
	public int executeReturnLastId(String sql, String[] data, String[] reqIdReturn) {
		
		int lastId = -1;
		try {
			conn = Connect();
			conn.setAutoCommit(false);
			if (conn != null) {
				PreparedStatement stmt = conn.prepareStatement(sql, reqIdReturn);
				
				for(int i = 0; i < data.length; i++) {
					stmt.setString(i+1, data[i]);
				}
				
				lastId = stmt.executeUpdate();
				
				if (lastId > 0) {
					ResultSet rs = null;
					   try {
						   rs = stmt.getGeneratedKeys();
						   
						   if (rs.next()) {
						         int id = rs.getInt(1);
						         lastId = id;
						       }
					   } catch (Exception e) {
						   e.printStackTrace();
					   }
					   
					}
				stmt.close();
			}
			return lastId;
		} catch (SQLException ex) {
			try {
				conn.rollback();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			ex.printStackTrace();
		} finally {
			try {
				conn.setAutoCommit(true);
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return lastId;
	}
}
