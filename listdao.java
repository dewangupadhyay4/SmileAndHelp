package com.dao;

import java.util.List;

import com.entity.list;
import com.entity.patientdetails;

public interface listdao {
	
	public boolean addlist(list l);
	
	public List<list> getpatientbyuser(int userid);
	
	public boolean deletepatient(int pid,int uid);
	
	

}
