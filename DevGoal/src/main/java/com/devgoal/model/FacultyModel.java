package com.devgoal.model;

public class FacultyModel {
	
	private String faculty_id;
	private String name;
	private UniversityModel university;
	private String time_reg;
	
	public FacultyModel() {
		
	}
	
	public FacultyModel(String faculty_id, String name, UniversityModel university, String time_reg) {
		super();
		this.faculty_id = faculty_id;
		this.name = name;
		this.university = university;
		this.time_reg = time_reg;
	}

	public String getFaculty_id() {
		return faculty_id;
	}

	public void setFaculty_id(String faculty_id) {
		this.faculty_id = faculty_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public UniversityModel getUniversity() {
		return university;
	}

	public void setUniversity(UniversityModel university) {
		this.university = university;
	}

	public String getTime_reg() {
		return time_reg;
	}

	public void setTime_reg(String time_reg) {
		this.time_reg = time_reg;
	}

	@Override
	public String toString() {
		return "FacultyModel [faculty_id=" + faculty_id + ", name=" + name + ", university=" + university
				+ ", time_reg=" + time_reg + "]";
	}
	
	
	

}
