package com.devgoal.model;

public class LoginHistoryModel {
	
	private String login_history_id;
	private UserModel user_id;
	private String ip_address;
	private String time_reg;
	
	public LoginHistoryModel() {
		
	}
	
	public LoginHistoryModel(String login_history_id, UserModel user_id, String ip_address, String time_reg) {
		super();
		this.login_history_id = login_history_id;
		this.user_id = user_id;
		this.ip_address = ip_address;
		this.time_reg = time_reg;
	}

	public String getLogin_history_id() {
		return login_history_id;
	}

	public void setLogin_history_id(String login_history_id) {
		this.login_history_id = login_history_id;
	}

	public UserModel getUser_id() {
		return user_id;
	}

	public void setUser_id(UserModel user_id) {
		this.user_id = user_id;
	}

	public String getIp_address() {
		return ip_address;
	}

	public void setIp_address(String ip_address) {
		this.ip_address = ip_address;
	}

	public String getTime_reg() {
		return time_reg;
	}

	public void setTime_reg(String time_reg) {
		this.time_reg = time_reg;
	}

	@Override
	public String toString() {
		return "LoginHistoryModel [login_history_id=" + login_history_id + ", user_id=" + user_id + ", ip_address="
				+ ip_address + ", time_reg=" + time_reg + "]";
	}
	
	

}
