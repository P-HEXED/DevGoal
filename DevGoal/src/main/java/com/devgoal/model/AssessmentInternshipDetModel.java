package com.devgoal.model;

public class AssessmentInternshipDetModel {
	
	private String assessment_internship_det_id;
	private String assessment_internship_id;
	private String criterion_id;
	private String condition;
	private String score;
	
	public AssessmentInternshipDetModel(String assessment_internship_det_id, String assessment_internship_id,
			String criterion_id, String condition, String score) {
		super();
		this.assessment_internship_det_id = assessment_internship_det_id;
		this.assessment_internship_id = assessment_internship_id;
		this.criterion_id = criterion_id;
		this.condition = condition;
		this.score = score;
	}

	public String getAssessment_internship_det_id() {
		return assessment_internship_det_id;
	}

	public void setAssessment_internship_det_id(String assessment_internship_det_id) {
		this.assessment_internship_det_id = assessment_internship_det_id;
	}

	public String getAssessment_internship_id() {
		return assessment_internship_id;
	}

	public void setAssessment_internship_id(String assessment_internship_id) {
		this.assessment_internship_id = assessment_internship_id;
	}

	public String getCriterion_id() {
		return criterion_id;
	}

	public void setCriterion_id(String criterion_id) {
		this.criterion_id = criterion_id;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	@Override
	public String toString() {
		return "AssessmentInternshipDetModel [assessment_internship_det_id=" + assessment_internship_det_id
				+ ", assessment_internship_id=" + assessment_internship_id + ", criterion_id=" + criterion_id
				+ ", condition=" + condition + ", score=" + score + "]";
	}
	
	

}
