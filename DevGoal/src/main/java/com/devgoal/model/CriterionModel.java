package com.devgoal.model;

public class CriterionModel {
	
	private String criterion;
	private String detail;
	private String score;
	private UserModel user;
	private String time_reg;
	
	public CriterionModel(String criterion, String detail, String score, UserModel user, String time_reg) {
		super();
		this.criterion = criterion;
		this.detail = detail;
		this.score = score;
		this.user = user;
		this.time_reg = time_reg;
	}

	public String getCriterion() {
		return criterion;
	}

	public void setCriterion(String criterion) {
		this.criterion = criterion;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	public UserModel getUser() {
		return user;
	}

	public void setUser(UserModel user) {
		this.user = user;
	}

	public String getTime_reg() {
		return time_reg;
	}

	public void setTime_reg(String time_reg) {
		this.time_reg = time_reg;
	}

	@Override
	public String toString() {
		return "CriterionModel [criterion=" + criterion + ", detail=" + detail + ", score=" + score + ", user=" + user
				+ ", time_reg=" + time_reg + "]";
	}
	
	

}
