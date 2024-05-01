package com.dao;

import java.util.List;

import com.entity.patient_donation;

public interface patientdonationDAO {
	
	public int getdonationNo();
	
	public boolean savedonation(List<patient_donation> p);
	
	public List<patient_donation> getpatient(String email);
	
	public List<patient_donation> getalldonation();
	

}
