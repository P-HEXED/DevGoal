package com.devgoal.model;

public class StudentOverseasWorkPlaceModel {
	
	private String student_overseas_work_place_id;
	private String user_id;
	private String overseas_work_place_id;
	private String status;
	private String time_reg;
	
	public StudentOverseasWorkPlaceModel(String student_overseas_work_place_id, String user_id,
			String overseas_work_place_id, String status, String time_reg) {
		super();
		this.student_overseas_work_place_id = student_overseas_work_place_id;
		this.user_id = user_id;
		this.overseas_work_place_id = overseas_work_place_id;
		this.status = status;
		this.time_reg = time_reg;
	}

	public String getStudent_overseas_work_place_id() {
		return student_overseas_work_place_id;
	}

	public void setStudent_overseas_work_place_id(String student_overseas_work_place_id) {
		this.student_overseas_work_place_id = student_overseas_work_place_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getOverseas_work_place_id() {
		return overseas_work_place_id;
	}

	public void setOverseas_work_place_id(String overseas_work_place_id) {
		this.overseas_work_place_id = overseas_work_place_id;
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
		return "StudentOverseasWorkPlaceModel [student_overseas_work_place_id=" + student_overseas_work_place_id
				+ ", user_id=" + user_id + ", overseas_work_place_id=" + overseas_work_place_id + ", status=" + status
				+ ", time_reg=" + time_reg + "]";
	}
	
	

}
