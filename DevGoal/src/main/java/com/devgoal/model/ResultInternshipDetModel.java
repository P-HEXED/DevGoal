package com.devgoal.model;

public class ResultInternshipDetModel {
	
	private String result_internship_det_id;
	private ResultInternshipModel result_internship;
	private CriterionModel criterion;
	private String score;
	private String user_type;
	private String input_type;
	
	public ResultInternshipDetModel(String result_internship_det_id, ResultInternshipModel result_internship,
			CriterionModel criterion, String score, String user_type, String input_type) {
		super();
		this.result_internship_det_id = result_internship_det_id;
		this.result_internship = result_internship;
		this.criterion = criterion;
		this.score = score;
		this.user_type = user_type;
		this.input_type = input_type;
	}

	public String getResult_internship_det_id() {
		return result_internship_det_id;
	}

	public void setResult_internship_det_id(String result_internship_det_id) {
		this.result_internship_det_id = result_internship_det_id;
	}

	public ResultInternshipModel getResult_internship() {
		return result_internship;
	}

	public void setResult_internship(ResultInternshipModel result_internship) {
		this.result_internship = result_internship;
	}

	public CriterionModel getCriterion() {
		return criterion;
	}

	public void setCriterion(CriterionModel criterion) {
		this.criterion = criterion;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	public String getUser_type() {
		return user_type;
	}

	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}

	public String getInput_type() {
		return input_type;
	}

	public void setInput_type(String input_type) {
		this.input_type = input_type;
	}

	@Override
	public String toString() {
		return "ResultInternshipDetModel [result_internship_det_id=" + result_internship_det_id + ", result_internship="
				+ result_internship + ", criterion=" + criterion + ", score=" + score + ", user_type=" + user_type
				+ ", input_type=" + input_type + "]";
	}
	
	

}
