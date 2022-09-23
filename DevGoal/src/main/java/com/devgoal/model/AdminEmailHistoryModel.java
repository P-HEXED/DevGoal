package com.devgoal.model;

public class AdminEmailHistoryModel {
	
	private String admin_email_history_id;
	private String user_id;
	private String email_send;
	private String email_recive;
	private String detail;
	private String time_reg;
	
	public AdminEmailHistoryModel(String admin_email_history_id, String user_id, String email_send, String email_recive,
			String detail, String time_reg) {
		super();
		this.admin_email_history_id = admin_email_history_id;
		this.user_id = user_id;
		this.email_send = email_send;
		this.email_recive = email_recive;
		this.detail = detail;
		this.time_reg = time_reg;
	}

	public String getAdmin_email_history_id() {
		return admin_email_history_id;
	}

	public void setAdmin_email_history_id(String admin_email_history_id) {
		this.admin_email_history_id = admin_email_history_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getEmail_send() {
		return email_send;
	}

	public void setEmail_send(String email_send) {
		this.email_send = email_send;
	}

	public String getEmail_recive() {
		return email_recive;
	}

	public void setEmail_recive(String email_recive) {
		this.email_recive = email_recive;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getTime_reg() {
		return time_reg;
	}

	public void setTime_reg(String time_reg) {
		this.time_reg = time_reg;
	}

	@Override
	public String toString() {
		return "AdminEmailHistoryModel [admin_email_history_id=" + admin_email_history_id + ", user_id=" + user_id
				+ ", email_send=" + email_send + ", email_recive=" + email_recive + ", detail=" + detail + ", time_reg="
				+ time_reg + "]";
	}
	
	

}
