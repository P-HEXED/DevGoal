package com.devgoal.model;

public class AmphuresModel {
	
	private String amphure_id;
	private String code;
	private String name_th;
	private String name_en;
	private ProvincesModel provinces;
	
	public AmphuresModel(String amphure_id, String code, String name_th, String name_en, ProvincesModel provinces) {
		super();
		this.amphure_id = amphure_id;
		this.code = code;
		this.name_th = name_th;
		this.name_en = name_en;
		this.provinces = provinces;
	}

	public String getAmphure_id() {
		return amphure_id;
	}

	public void setAmphure_id(String amphure_id) {
		this.amphure_id = amphure_id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName_th() {
		return name_th;
	}

	public void setName_th(String name_th) {
		this.name_th = name_th;
	}

	public String getName_en() {
		return name_en;
	}

	public void setName_en(String name_en) {
		this.name_en = name_en;
	}

	public ProvincesModel getProvinces() {
		return provinces;
	}

	public void setProvinces(ProvincesModel provinces) {
		this.provinces = provinces;
	}

	@Override
	public String toString() {
		return "AmphuresModel [amphure_id=" + amphure_id + ", code=" + code + ", name_th=" + name_th + ", name_en="
				+ name_en + ", provinces=" + provinces + "]";
	}
	
	

}
