package com.devgoal.model;

public class RequestUserDataChangeModel {
	
	private String request_user_data_change_id;
	private String user_data;
	private String email;
	private String status;
	private String time_reg;
	
	public RequestUserDataChangeModel(String request_user_data_change_id, String user_data, String email, String status,
			String time_reg) {
		super();
		this.request_user_data_change_id = request_user_data_change_id;
		this.user_data = user_data;
		this.email = email;
		this.status = status;
		this.time_reg = time_reg;
	}

	public String getRequest_user_data_change_id() {
		return request_user_data_change_id;
	}

	public void setRequest_user_data_change_id(String request_user_data_change_id) {
		this.request_user_data_change_id = request_user_data_change_id;
	}

	public String getUser_data() {
		return user_data;
	}

	public void setUser_data(String user_data) {
		this.user_data = user_data;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getTime_reg() {
		return time_reg;
	}

	public void setTime_reg(String time_reg) {
		this.time_reg = time_reg;
	}

	@Override
	public String toString() {
		return "RequestUserDataChangeModel [request_user_data_change_id=" + request_user_data_change_id + ", user_data="
				+ user_data + ", email=" + email + ", status=" + status + ", time_reg=" + time_reg + "]";
	}
	
	

}
