package com.dao;

import java.util.List;

import com.entity.patientdetails;

public interface patientDAO {

	public boolean addpatient(patientdetails p);
	
	
	public List<patientdetails> getallpat();
	
	public patientdetails getPatientById(int id);
	
	public boolean updateeditpat(patientdetails p);
	
	public boolean deletepat(int id);
	
	public List<patientdetails> getnewpatient();
	
	public List<patientdetails> getrecentpatients();
	
	public List<patientdetails> getoldpatient();
	
	public List<patientdetails> getallrecentpatients();
	
	public List<patientdetails> getallnewpatients();
	
	public List<patientdetails> getalloldpatients();
	
	
}
