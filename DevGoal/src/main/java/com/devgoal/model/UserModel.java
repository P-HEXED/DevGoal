package com.devgoal.model;

public class UserModel {
	
	private String user_id;
	private String gender;
	private String firstname;
	private String lastname;
	private String address;
	private String email;
	private String password;
	private String salt;
	private String student_code;
	private String phone;
	private String identified_number;
	private String advisor;
	private UniversityModel university;
	private FacultyModel faculty;
	private CourseModel course;
	private String secret_code;
	private String status;
	private String profile_image;
	private String user_type;
	private String time_reg;
	
	public UserModel() {
		
	}

	public UserModel(String user_id, String gender, String firstname, String lastname, String address, String email,
			String password, String salt, String student_code, String phone, String identified_number, String advisor,
			UniversityModel university, FacultyModel faculty, CourseModel course, String secret_code, String status,
			String profile_image, String user_type, String time_reg) {
		super();
		this.user_id = user_id;
		this.gender = gender;
		this.firstname = firstname;
		this.lastname = lastname;
		this.address = address;
		this.email = email;
		this.password = password;
		this.salt = salt;
		this.student_code = student_code;
		this.phone = phone;
		this.identified_number = identified_number;
		this.advisor = advisor;
		this.university = university;
		this.faculty = faculty;
		this.course = course;
		this.secret_code = secret_code;
		this.status = status;
		this.profile_image = profile_image;
		this.user_type = user_type;
		this.time_reg = time_reg;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public String getStudent_code() {
		return student_code;
	}

	public void setStudent_code(String student_code) {
		this.student_code = student_code;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getIdentified_number() {
		return identified_number;
	}

	public void setIdentified_number(String identified_number) {
		this.identified_number = identified_number;
	}

	public String getAdvisor() {
		return advisor;
	}

	public void setAdvisor(String advisor) {
		this.advisor = advisor;
	}

	public UniversityModel getUniversity() {
		return university;
	}

	public void setUniversity(UniversityModel university) {
		this.university = university;
	}

	public FacultyModel getFaculty() {
		return faculty;
	}

	public void setFaculty(FacultyModel faculty) {
		this.faculty = faculty;
	}

	public CourseModel getCourse() {
		return course;
	}

	public void setCourse(CourseModel course) {
		this.course = course;
	}

	public String getSecret_code() {
		return secret_code;
	}

	public void setSecret_code(String secret_code) {
		this.secret_code = secret_code;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getProfile_image() {
		return profile_image;
	}

	public void setProfile_image(String profile_image) {
		this.profile_image = profile_image;
	}

	public String getUser_type() {
		return user_type;
	}

	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}

	public String getTime_reg() {
		return time_reg;
	}

	public void setTime_reg(String time_reg) {
		this.time_reg = time_reg;
	}

	@Override
	public String toString() {
		return "UserModel [user_id=" + user_id + ", gender=" + gender + ", firstname=" + firstname + ", lastname="
				+ lastname + ", address=" + address + ", email=" + email + ", password=" + password + ", salt=" + salt
				+ ", student_code=" + student_code + ", phone=" + phone + ", identified_number=" + identified_number
				+ ", advisor=" + advisor + ", university=" + university + ", faculty=" + faculty + ", course=" + course
				+ ", secret_code=" + secret_code + ", status=" + status + ", profile_image=" + profile_image
				+ ", user_type=" + user_type + ", time_reg=" + time_reg + "]";
	}


	
}
