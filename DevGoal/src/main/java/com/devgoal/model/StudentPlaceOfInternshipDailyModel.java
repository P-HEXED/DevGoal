package com.devgoal.model;

public class StudentPlaceOfInternshipDailyModel {
	
	private String student_place_of_internship_daily_id;
	private String student_place_of_internship_id;
	private String detail;
	private String time_reg;
	
	public StudentPlaceOfInternshipDailyModel(String student_place_of_internship_daily_id,
			String student_place_of_internship_id, String detail, String time_reg) {
		super();
		this.student_place_of_internship_daily_id = student_place_of_internship_daily_id;
		this.student_place_of_internship_id = student_place_of_internship_id;
		this.detail = detail;
		this.time_reg = time_reg;
	}

	public String getStudent_place_of_internship_daily_id() {
		return student_place_of_internship_daily_id;
	}

	public void setStudent_place_of_internship_daily_id(String student_place_of_internship_daily_id) {
		this.student_place_of_internship_daily_id = student_place_of_internship_daily_id;
	}

	public String getStudent_place_of_internship_id() {
		return student_place_of_internship_id;
	}

	public void setStudent_place_of_internship_id(String student_place_of_internship_id) {
		this.student_place_of_internship_id = student_place_of_internship_id;
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
		return "StudentPlaceOfInternshipDailyModel [student_place_of_internship_daily_id="
				+ student_place_of_internship_daily_id + ", student_place_of_internship_id="
				+ student_place_of_internship_id + ", detail=" + detail + ", time_reg=" + time_reg + "]";
	}
	
	

}
