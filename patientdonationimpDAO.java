package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.list;
import com.entity.patient_donation;

public class patientdonationimpDAO implements patientdonationDAO{
	
	private Connection conn;

	public patientdonationimpDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public int getdonationNo() {
		int i=1;
		try {
			
			String sql="select * from patient_donation ";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				i++;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 1;
	}

	public boolean savedonation(List<patient_donation> plist) {
		boolean f=false;
		try {
			
			String sql="insert into patient_donation(donation_id,user_name,email,address,phone,patient_name,payment_method) values(?,?,?,?,?,?,?)";
			
			conn.setAutoCommit(false);
			PreparedStatement ps=conn.prepareStatement(sql);
			
			for(patient_donation p:plist) 
			{
				ps.setString(1, p.getDonationid());
				ps.setString(2, p.getUsername());
				ps.setString(3, p.getEmail());
				ps.setString(4, p.getAlladd());
				ps.setString(5, p.getPhone());
				ps.setString(6, p.getPatientname());
				ps.setString(7, p.getPayment());
				
				ps.addBatch();
				
			}
			
			int[] count=ps.executeBatch();
			conn.commit();
			f=true;
			conn.setAutoCommit(true);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
	}


	public List<patient_donation> getpatient(String email) {
		
		List<patient_donation> list=new ArrayList<patient_donation>();
		patient_donation d=null;
		
		try {
			
			String sql="select * from patient_donation where email=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				d=new patient_donation();
				d.setId(rs.getInt(1));
				d.setDonationid(rs.getString(2));
				d.setUsername(rs.getString(3));
				d.setEmail(rs.getString(4));
				d.setAlladdress(rs.getString(5));
				d.setPhone(rs.getString(6));
				d.setPatientname(rs.getString(7));
				d.setPayment(rs.getString(8));
				list.add(d);
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}

	@Override
	public List<patient_donation> getalldonation() {
		List<patient_donation> list=new ArrayList<patient_donation>();
		patient_donation d=null;
		
		try {
			
			String sql="select * from patient_donation";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				d=new patient_donation();
				d.setId(rs.getInt(1));
				d.setDonationid(rs.getString(2));
				d.setUsername(rs.getString(3));
				d.setEmail(rs.getString(4));
				d.setAlladdress(rs.getString(5));
				d.setPhone(rs.getString(6));
				d.setPatientname(rs.getString(7));
				d.setPayment(rs.getString(8));
				list.add(d);
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	
	

}
