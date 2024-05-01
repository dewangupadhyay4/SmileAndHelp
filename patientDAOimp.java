package com.dao;

import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.patientdetails;
import com.mysql.cj.x.protobuf.MysqlxPrepare.Prepare;;


public class patientDAOimp implements patientDAO{

	private Connection conn;
	
	
	public patientDAOimp(Connection conn) {
		super();
		this.conn = conn;
	}


	@Override
	public boolean addpatient(patientdetails p) {
		boolean f=false;
		
		try
		{
			String sql="insert into patient_details(patname,age,fathername,occupation,hospital,category,photo,useremail) values(?,?,?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, p.getPatname());
			ps.setString(2, p.getAge());
			ps.setString(3, p.getFathername());
			ps.setString(4, p.getOccupation());
			ps.setString(5, p.getHospital());
			ps.setString(6, p.getCategory());
			ps.setString(7, p.getPhoto());
			ps.setString(8, p.getEmail());
			
			int i=ps.executeUpdate();
			
			if(i==1)
			{
				f=true;
			}
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		
		return f;
	}


	@Override
	public List<patientdetails> getallpat() {
		
		List<patientdetails> list=new ArrayList<patientdetails>();
		patientdetails p=null;
		
		try
		{
			String sql="select * from patient_details";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				p = new patientdetails();
				p.setPatientId(rs.getInt(1));
				p.setPatname(rs.getString(2));
				p.setAge(rs.getString(3));
				p.setFathername(rs.getString(4));
				p.setOccupation(rs.getString(5));
				p.setHospital(rs.getString(6));
				p.setCategory(rs.getString(7));
				p.setPhoto(rs.getString(8));
				p.setEmail(rs.getString(9));
				
				list.add(p);
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		
		
		return list;
	}


	@Override
	public patientdetails getPatientById(int id) {
		
		patientdetails p=null;
		
		try
		{
			String sql="select * from patient_details where patientId=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				p=new patientdetails();
				p.setPatientId(rs.getInt(1));
				p.setPatname(rs.getString(2));
				p.setAge(rs.getString(3));
				p.setFathername(rs.getString(4));
				p.setOccupation(rs.getString(5));
				p.setHospital(rs.getString(6));
				p.setCategory(rs.getString(7));
				p.setPhoto(rs.getString(8));
				p.setEmail(rs.getString(9));
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return p;
	}


	@Override
	public boolean updateeditpat(patientdetails p) {
		boolean f=false;
		try {
			
			String sql="update patient_details set patname=?,age=?,fathername=?,occupation=?,hospital=?,category=? where patientId=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, p.getPatname());
			ps.setString(2, p.getAge());
			ps.setString(3, p.getFathername());
			ps.setString(4, p.getOccupation());
			ps.setString(5, p.getHospital());
			ps.setString(6, p.getCategory());
			ps.setInt(7, p.getPatientId());
			
			int i=ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}


	@Override
	public boolean deletepat(int id) {
		boolean f=false;
		try {
			String sql="delete from patient_details where patientId=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i=ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}


	@Override
	public List<patientdetails> getnewpatient() {
		
		List<patientdetails> list=new ArrayList<patientdetails>();
		patientdetails p=null;
		
		try {
			String sql="select * from patient_details where category=?  order by patientId DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "New");
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4)
			{
				p=new patientdetails();
				p.setPatientId(rs.getInt(1));
				p.setPatname(rs.getString(2));
				p.setAge(rs.getString(3));
				p.setFathername(rs.getString(4));
				p.setOccupation(rs.getString(5));
				p.setHospital(rs.getString(6));
				p.setCategory(rs.getString(7));
				p.setPhoto(rs.getString(8));
				p.setEmail(rs.getString(9));
				
				list.add(p);
				i++;
				
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}


	@Override
	public List<patientdetails> getrecentpatients() {
		List<patientdetails> list=new ArrayList<patientdetails>();
		patientdetails p=null;
		
		try {
			String sql="select * from patient_details order by patientId DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4)
			{
				p=new patientdetails();
				p.setPatientId(rs.getInt(1));
				p.setPatname(rs.getString(2));
				p.setAge(rs.getString(3));
				p.setFathername(rs.getString(4));
				p.setOccupation(rs.getString(5));
				p.setHospital(rs.getString(6));
				p.setCategory(rs.getString(7));
				p.setPhoto(rs.getString(8));
				p.setEmail(rs.getString(9));
				
				list.add(p);
				i++;
				
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}


	@Override
	public List<patientdetails> getoldpatient() {
			List<patientdetails> list=new ArrayList<patientdetails>();
			patientdetails p=null;
			
			try {
				String sql="select * from patient_details where category=? order by patientId DESC";
				PreparedStatement ps=conn.prepareStatement(sql);
				ps.setString(1, "old");
				ResultSet rs=ps.executeQuery();
				int i=1;
				while(rs.next() && i<=4)
				{
					p=new patientdetails();
					p.setPatientId(rs.getInt(1));
					p.setPatname(rs.getString(2));
					p.setAge(rs.getString(3));
					p.setFathername(rs.getString(4));
					p.setOccupation(rs.getString(5));
					p.setHospital(rs.getString(6));
					p.setCategory(rs.getString(7));
					p.setPhoto(rs.getString(8));
					p.setEmail(rs.getString(9));
					
					list.add(p);
					i++;
					
				}
				
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		return list;
	
	
	}


	@Override
	public List<patientdetails> getallrecentpatients() {
		List<patientdetails> list=new ArrayList<patientdetails>();
		patientdetails p=null;
		
		try {
			String sql="select * from patient_details order by patientId DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				p=new patientdetails();
				p.setPatientId(rs.getInt(1));
				p.setPatname(rs.getString(2));
				p.setAge(rs.getString(3));
				p.setFathername(rs.getString(4));
				p.setOccupation(rs.getString(5));
				p.setHospital(rs.getString(6));
				p.setCategory(rs.getString(7));
				p.setPhoto(rs.getString(8));
				p.setEmail(rs.getString(9));
				
				list.add(p);
				
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}


	@Override
	public List<patientdetails> getallnewpatients() {
		List<patientdetails> list=new ArrayList<patientdetails>();
		patientdetails p=null;
		
		try {
			String sql="select * from patient_details where category=?  order by patientId DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "New");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				p=new patientdetails();
				p.setPatientId(rs.getInt(1));
				p.setPatname(rs.getString(2));
				p.setAge(rs.getString(3));
				p.setFathername(rs.getString(4));
				p.setOccupation(rs.getString(5));
				p.setHospital(rs.getString(6));
				p.setCategory(rs.getString(7));
				p.setPhoto(rs.getString(8));
				p.setEmail(rs.getString(9));
				
				list.add(p);
				
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}


	@Override
	public List<patientdetails> getalloldpatients() {
		List<patientdetails> list=new ArrayList<patientdetails>();
		patientdetails p=null;
		
		try {
			String sql="select * from patient_details where category=? order by patientId DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "old");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				p=new patientdetails();
				p.setPatientId(rs.getInt(1));
				p.setPatname(rs.getString(2));
				p.setAge(rs.getString(3));
				p.setFathername(rs.getString(4));
				p.setOccupation(rs.getString(5));
				p.setHospital(rs.getString(6));
				p.setCategory(rs.getString(7));
				p.setPhoto(rs.getString(8));
				p.setEmail(rs.getString(9));
				
				list.add(p);
				
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	return list;


}

	
	
	
	
	
}

