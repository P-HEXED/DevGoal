package com.devgoal.model;

public class OverseasWorkPlaceModel {
	
	private String overseas_work_place_id;
	private String name;
	private String address;
	private String email;
	private String phone;
	private String receive_total;
	private String type;
	private UserModel user_id;
	private String status;
	private String time_reg;
	
	public OverseasWorkPlaceModel(String overseas_work_place_id, String name, String address, String email,
			String phone, String receive_total, String type, UserModel user_id, String status, String time_reg) {
		super();
		this.overseas_work_place_id = overseas_work_place_id;
		this.name = name;
		this.address = address;
		this.email = email;
		this.phone = phone;
		this.receive_total = receive_total;
		this.type = type;
		this.user_id = user_id;
		this.status = status;
		this.time_reg = time_reg;
	}

	public String getOverseas_work_place_id() {
		return overseas_work_place_id;
	}

	public void setOverseas_work_place_id(String overseas_work_place_id) {
		this.overseas_work_place_id = overseas_work_place_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getReceive_total() {
		return receive_total;
	}

	public void setReceive_total(String receive_total) {
		this.receive_total = receive_total;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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
		return "OverseasWorkPlaceModel [overseas_work_place_id=" + overseas_work_place_id + ", name=" + name
				+ ", address=" + address + ", email=" + email + ", phone=" + phone + ", receive_total=" + receive_total
				+ ", type=" + type + ", user_id=" + user_id + ", status=" + status + ", time_reg=" + time_reg + "]";
	}
	
	

}
