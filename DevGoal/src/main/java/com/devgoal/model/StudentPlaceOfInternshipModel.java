package com.devgoal.model;

public class StudentPlaceOfInternshipModel {
	
	private String student_place_of_internship_id;
	private String user_id;
	private String place_of_internship_id;
	private String condition;
	private String status;
	private String time_reg;
	
	public StudentPlaceOfInternshipModel(String student_place_of_internship_id, String user_id,
			String place_of_internship_id, String condition, String status, String time_reg) {
		super();
		this.student_place_of_internship_id = student_place_of_internship_id;
		this.user_id = user_id;
		this.place_of_internship_id = place_of_internship_id;
		this.condition = condition;
		this.status = status;
		this.time_reg = time_reg;
	}

	public String getStudent_place_of_internship_id() {
		return student_place_of_internship_id;
	}

	public void setStudent_place_of_internship_id(String student_place_of_internship_id) {
		this.student_place_of_internship_id = student_place_of_internship_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getPlace_of_internship_id() {
		return place_of_internship_id;
	}

	public void setPlace_of_internship_id(String place_of_internship_id) {
		this.place_of_internship_id = place_of_internship_id;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
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
		return "StudentPlaceOfInternshipModel [student_place_of_internship_id=" + student_place_of_internship_id
				+ ", user_id=" + user_id + ", place_of_internship_id=" + place_of_internship_id + ", condition="
				+ condition + ", status=" + status + ", time_reg=" + time_reg + "]";
	}
	
	
}
