package com.devgoal.model;

public class DistrictsModel {
	
	private String districts_id;
	private String zip_code;
	private String name_th;
	private String name_en;
	private AmphuresModel amphures;
	
	public DistrictsModel(String districts_id, String zip_code, String name_th, String name_en,
			AmphuresModel amphures) {
		super();
		this.districts_id = districts_id;
		this.zip_code = zip_code;
		this.name_th = name_th;
		this.name_en = name_en;
		this.amphures = amphures;
	}

	public String getDistricts_id() {
		return districts_id;
	}

	public void setDistricts_id(String districts_id) {
		this.districts_id = districts_id;
	}

	public String getZip_code() {
		return zip_code;
	}

	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
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

	public AmphuresModel getAmphures() {
		return amphures;
	}

	public void setAmphures(AmphuresModel amphures) {
		this.amphures = amphures;
	}

	@Override
	public String toString() {
		return "DistrictsModel [districts_id=" + districts_id + ", zip_code=" + zip_code + ", name_th=" + name_th
				+ ", name_en=" + name_en + ", amphures=" + amphures + "]";
	}
	
	

}
