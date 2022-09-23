package com.devgoal.model;

public class UniversityModel {
	
	private String university_id;
	private String name;
	private String sort_name;
	private String address;
	private String time_reg;
	
	public UniversityModel() {
	}
	
	public UniversityModel(String university_id, String name, String sort_name, String address, String time_reg) {
		super();
		this.university_id = university_id;
		this.name = name;
		this.sort_name = sort_name;
		this.address = address;
		this.time_reg = time_reg;
	}

	public String getUniversity_id() {
		return university_id;
	}

	public void setUniversity_id(String university_id) {
		this.university_id = university_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSort_name() {
		return sort_name;
	}

	public void setSort_name(String sort_name) {
		this.sort_name = sort_name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTime_reg() {
		return time_reg;
	}

	public void setTime_reg(String time_reg) {
		this.time_reg = time_reg;
	}

	@Override
	public String toString() {
		return "UniversityModel [university_id=" + university_id + ", name=" + name + ", sort_name=" + sort_name
				+ ", address=" + address + ", time_reg=" + time_reg + "]";
	}
	

}
