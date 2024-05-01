package com.entity;

public class patient_donation {
	
	private int id;
	private String donationid;
	private String username;
	private String email;
	private String phone;
	private String alladdress;
	private String patientname;
	private String payment;
	public patient_donation() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDonationid() {
		return donationid;
	}
	public void setDonationid(String donationid) {
		this.donationid = donationid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAlladd() {
		return alladdress;
	}
	public void setAlladdress(String alladdress) {
		this.alladdress = alladdress;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getPatientname() {
		return patientname;
	}
	public void setPatientname(String patientname) {
		this.patientname = patientname;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	@Override
	public String toString() {
		return "patient_donation [id=" + id + ", username=" + username + ", email=" + email + ", alladdress=" + alladdress
				+ ", patientname=" + patientname +", phone=" + phone + ", payment=" + payment + "]";
	}
	
	

}
