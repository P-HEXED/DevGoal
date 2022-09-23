package com.devgoal.model;

public class OverseasWorkPlaceSkillModel {
	
	private String overseas_work_place_skill_id;
	private OverseasWorkPlaceModel oversesa_work_place_id;
	private SkillModel skill_id;
	private String time_reg;
	
	public OverseasWorkPlaceSkillModel() {
		
	}
	
 	public OverseasWorkPlaceSkillModel(String overseas_work_place_skill_id,
			OverseasWorkPlaceModel oversesa_work_place_id, SkillModel skill_id, String time_reg) {
		super();
		this.overseas_work_place_skill_id = overseas_work_place_skill_id;
		this.oversesa_work_place_id = oversesa_work_place_id;
		this.skill_id = skill_id;
		this.time_reg = time_reg;
	}

	public String getOverseas_work_place_skill_id() {
		return overseas_work_place_skill_id;
	}

	public void setOverseas_work_place_skill_id(String overseas_work_place_skill_id) {
		this.overseas_work_place_skill_id = overseas_work_place_skill_id;
	}

	public OverseasWorkPlaceModel getOversesa_work_place_id() {
		return oversesa_work_place_id;
	}

	public void setOversesa_work_place_id(OverseasWorkPlaceModel oversesa_work_place_id) {
		this.oversesa_work_place_id = oversesa_work_place_id;
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
		return "OverseasWorkPlaceSkillModel [overseas_work_place_skill_id=" + overseas_work_place_skill_id
				+ ", oversesa_work_place_id=" + oversesa_work_place_id + ", skill_id=" + skill_id + ", time_reg="
				+ time_reg + "]";
	}
	
	

}
