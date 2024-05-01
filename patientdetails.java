package com.entity;

public class patientdetails {
	
	private int patientId;
	private String patname;
	private String age;
	private String fathername;
	private String occupation;
	private String hospital;
	private String category;
	private String photo;
	private String email;
	public patientdetails() {
		super();
		// TODO Auto-generated constructor stub
	}
	public patientdetails(String patname, String age, String fathername, String occupation, String hospital,
			String category,String photo, String email) {
		super();
		this.patname = patname;
		this.age = age;
		this.fathername = fathername;
		this.occupation = occupation;
		this.hospital = hospital;
		this.category=category;
		this.photo = photo;
		this.email = email;
	}
	public int getPatientId() {
		return patientId;
	}
	public void setPatientId(int patientId) {
		this.patientId = patientId;
	}
	public String getPatname() {
		return patname;
	}
	public void setPatname(String patname) {
		this.patname = patname;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getFathername() {
		return fathername;
	}
	public void setFathername(String fathername) {
		this.fathername = fathername;
	}
	public String getOccupation() {
		return occupation;
	}
	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}
	public String getHospital() {
		return hospital;
	}
	public void setHospital(String hospital) {
		this.hospital = hospital;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category=category;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "patientdetails [patientId=" + patientId + ", patname=" + patname + ", age=" + age + ", fathername="
				+ fathername + ", occupation=" + occupation + ", hospital=" + hospital + ", category=" + category + ",photo=" + photo + ", email="
				+ email + "]";
	}
	
	
	
	
	

}
