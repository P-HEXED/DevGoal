package com.devgoal.model;

public class AssessmentInternshipModel {
	
	private String assessment_internship_id;
	private String result_internship_id;
	private String student_place_of_internship_id;
	private String time_reg;
	
	public AssessmentInternshipModel(String assessment_internship_id, String result_internship_id,
			String student_place_of_internship_id, String time_reg) {
		super();
		this.assessment_internship_id = assessment_internship_id;
		this.result_internship_id = result_internship_id;
		this.student_place_of_internship_id = student_place_of_internship_id;
		this.time_reg = time_reg;
	}

	public String getAssessment_internship_id() {
		return assessment_internship_id;
	}

	public void setAssessment_internship_id(String assessment_internship_id) {
		this.assessment_internship_id = assessment_internship_id;
	}

	public String getResult_internship_id() {
		return result_internship_id;
	}

	public void setResult_internship_id(String result_internship_id) {
		this.result_internship_id = result_internship_id;
	}

	public String getStudent_place_of_internship_id() {
		return student_place_of_internship_id;
	}

	public void setStudent_place_of_internship_id(String student_place_of_internship_id) {
		this.student_place_of_internship_id = student_place_of_internship_id;
	}

	public String getTime_reg() {
		return time_reg;
	}

	public void setTime_reg(String time_reg) {
		this.time_reg = time_reg;
	}

	@Override
	public String toString() {
		return "AssessmentInternshipModel [assessment_internship_id=" + assessment_internship_id
				+ ", result_internship_id=" + result_internship_id + ", student_place_of_internship_id="
				+ student_place_of_internship_id + ", time_reg=" + time_reg + "]";
	}
	
	

}
