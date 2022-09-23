package com.devgoal.model;

public class EventHistoryModel {
	
	private String event_history_id;
	private String user_id;
	private String detail;
	private String ip_address;
	private String time_reg;
	
	public EventHistoryModel(String event_history_id, String user_id, String detail, String ip_address, String time_reg) {
		super();
		this.event_history_id = event_history_id;
		this.user_id = user_id;
		this.detail = detail;
		this.ip_address = ip_address;
		this.time_reg = time_reg;
	}

	public String getEvent_history_id() {
		return event_history_id;
	}

	public void setEvent_history_id(String event_history_id) {
		this.event_history_id = event_history_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
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
		return "EventHistory [event_history_id=" + event_history_id + ", user_id=" + user_id + ", detail=" + detail
				+ ", ip_address=" + ip_address + ", time_reg=" + time_reg + "]";
	}
	
	

}
