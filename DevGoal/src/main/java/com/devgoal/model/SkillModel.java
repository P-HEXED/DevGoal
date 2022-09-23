package com.devgoal.model;

public class SkillModel {
	
	private String skill_id;
	private String detail;
	private String level;
	private String time_reg;
	
	public SkillModel() {
	}
	
	public SkillModel(String skill_id, String detail, String level, String time_reg) {
		super();
		this.skill_id = skill_id;
		this.detail = detail;
		this.level = level;
		this.time_reg = time_reg;
	}

	public String getSkill_id() {
		return skill_id;
	}

	public void setSkill_id(String skill_id) {
		this.skill_id = skill_id;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getTime_reg() {
		return time_reg;
	}

	public void setTime_reg(String time_reg) {
		this.time_reg = time_reg;
	}

	@Override
	public String toString() {
		return "SkillModel [skill_id=" + skill_id + ", detail=" + detail + ", level=" + level + ", time_reg=" + time_reg
				+ "]";
	}
	
	

}
