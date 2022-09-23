package com.devgoal.model;

public class ResultInternshipModel {
	
	private String result_internship_id;
	private UserModel user_id;
	private String status;
	private String time_reg;
	
	public ResultInternshipModel(String result_internship_id, UserModel user_id, String status, String time_reg) {
		super();
		this.result_internship_id = result_internship_id;
		this.user_id = user_id;
		this.status = status;
		this.time_reg = time_reg;
	}

	public String getResult_internship_id() {
		return result_internship_id;
	}

	public void setResult_internship_id(String result_internship_id) {
		this.result_internship_id = result_internship_id;
	}

	public UserModel getUser_id() {
		return user_id;
	}

	public void setUser_id(UserModel user_id) {
		this.user_id = user_id;
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
		return "ResultInternshipModel [result_internship_id=" + result_internship_id + ", user_id=" + user_id
				+ ", status=" + status + ", time_reg=" + time_reg + "]";
	}
	
	

}
