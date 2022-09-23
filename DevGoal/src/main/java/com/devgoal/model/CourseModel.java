package com.devgoal.model;

public class CourseModel {
	
	private String course_id;
	private String name;
	private FacultyModel faculty;
	private String time_reg;
	
	public CourseModel() {
		
	}
	
	public CourseModel(String course_id, String name, FacultyModel faculty, String time_reg) {
		super();
		this.course_id = course_id;
		this.name = name;
		this.faculty = faculty;
		this.time_reg = time_reg;
	}

	public String getCourse_id() {
		return course_id;
	}

	public void setCourse_id(String course_id) {
		this.course_id = course_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public FacultyModel getFaculty() {
		return faculty;
	}

	public void setFaculty(FacultyModel faculty) {
		this.faculty = faculty;
	}

	public String getTime_reg() {
		return time_reg;
	}

	public void setTime_reg(String time_reg) {
		this.time_reg = time_reg;
	}

	@Override
	public String toString() {
		return "CourseModel [course_id=" + course_id + ", name=" + name + ", faculty=" + faculty + ", time_reg="
				+ time_reg + "]";
	}
	

}
