package com.devgoal.model;

public class UserSkillModel {
	
	private String user_skill_id;
	private UserModel user_id;
	private SkillModel skill_id;
	private String time_reg;
	
	public UserSkillModel() {
		
	}

	public UserSkillModel(String user_skill_id, UserModel user_id, SkillModel skill_id, String time_reg) {
		super();
		this.user_skill_id = user_skill_id;
		this.user_id = user_id;
		this.skill_id = skill_id;
		this.time_reg = time_reg;
	}

	public String getUser_skill_id() {
		return user_skill_id;
	}

	public void setUser_skill_id(String user_skill_id) {
		this.user_skill_id = user_skill_id;
	}

	public UserModel getUser_id() {
		return user_id;
	}

	public void setUser_id(UserModel user_id) {
		this.user_id = user_id;
	}

	public SkillModel getSkill_id() {
		return skill_id;
	}

	public void setSkill_id(SkillModel skill_id) {
		this.skill_id = skill_id;
	}

	public String getTime_reg() {
		return time_reg;
	}

	public void setTime_reg(String time_reg) {
		this.time_reg = time_reg;
	}

	@Override
	public String toString() {
		return "UserSkillModel [user_skill_id=" + user_skill_id + ", user_id=" + user_id + ", skill_id=" + skill_id
				+ ", time_reg=" + time_reg + "]";
	}
	
	
	

}
