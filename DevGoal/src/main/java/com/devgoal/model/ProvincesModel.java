package com.devgoal.model;

public class ProvincesModel {
	
	private String province_id;
	private String code;
	private String name_th;
	private String name_en;
	
	public ProvincesModel(String province_id, String code, String name_th, String name_en) {
		super();
		this.province_id = province_id;
		this.code = code;
		this.name_th = name_th;
		this.name_en = name_en;
	}

	public String getProvince_id() {
		return province_id;
	}

	public void setProvince_id(String province_id) {
		this.province_id = province_id;
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

	@Override
	public String toString() {
		return "ProvincesModel [province_id=" + province_id + ", code=" + code + ", name_th=" + name_th + ", name_en="
				+ name_en + "]";
	}
	
	
	
}
