package com.devgoal.model;

public class PlaceOfInternshipSkillModel {
	
	private String place_of_internship_skill_id;
	private OverseasWorkPlaceModel place_of_internship_id;
	private SkillModel skill_id;
	private String time_reg;
	
	public PlaceOfInternshipSkillModel() {
		
	}
	
	public PlaceOfInternshipSkillModel(String place_of_internship_skill_id,
			OverseasWorkPlaceModel place_of_internship_id, SkillModel skill_id, String time_reg) {
		super();
		this.place_of_internship_skill_id = place_of_internship_skill_id;
		this.place_of_internship_id = place_of_internship_id;
		this.skill_id = skill_id;
		this.time_reg = time_reg;
	}

	public String getPlace_of_internship_skill_id() {
		return place_of_internship_skill_id;
	}

	public void setPlace_of_internship_skill_id(String place_of_internship_skill_id) {
		this.place_of_internship_skill_id = place_of_internship_skill_id;
	}

	public OverseasWorkPlaceModel getPlace_of_internship_id() {
		return place_of_internship_id;
	}

	public void setPlace_of_internship_id(OverseasWorkPlaceModel place_of_internship_id) {
		this.place_of_internship_id = place_of_internship_id;
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
		return "PlaceOfInternshipSkillModel [place_of_internship_skill_id=" + place_of_internship_skill_id
				+ ", place_of_internship_id=" + place_of_internship_id + ", skill_id=" + skill_id + ", time_reg="
				+ time_reg + "]";
	}
	
	
}
