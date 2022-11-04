package com.devgoal.model;

public class TermModel {
	
	private String term_id;
	private String year;
	private String term_no;
	private String begin_date;
	private String end_date;
	private String status;
	
	public TermModel(String term_id, String year, String term_no, String begin_date, String end_date, String status) {
		super();
		this.term_id = term_id;
		this.year = year;
		this.term_no = term_no;
		this.begin_date = begin_date;
		this.end_date = end_date;
		this.status = status;
	}

	public String getTerm_id() {
		return term_id;
	}

	public void setTerm_id(String term_id) {
		this.term_id = term_id;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getTerm_no() {
		return term_no;
	}

	public void setTerm_no(String term_no) {
		this.term_no = term_no;
	}

	public String getBegin_date() {
		return begin_date;
	}

	public void setBegin_date(String begin_date) {
		this.begin_date = begin_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "TermModel [term_id=" + term_id + ", year=" + year + ", term_no=" + term_no + ", begin_date="
				+ begin_date + ", end_date=" + end_date + ", status=" + status + "]";
	}
	
	
	
	
}
