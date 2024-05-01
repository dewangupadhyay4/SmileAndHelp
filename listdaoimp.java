package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.list;
import com.entity.patientdetails;

public class listdaoimp implements listdao {

	private Connection conn;
	
	public listdaoimp(Connection conn)
	{
		this.conn=conn;
	}
	
	
	@Override
	public boolean addlist(list l) {
		boolean f=false;
		try {
			
			String sql="insert into list(lid,pid,uid,patname,donation) values(?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, l.getLid());
			ps.setInt(2, l.getPid());
			ps.setInt(3, l.getUserid());
			ps.setString(4, l.getPatientname());
			ps.setDouble(5, l.getDonation());
			
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
	public List<list> getpatientbyuser(int userid) {
		List<list> list=new ArrayList<list>();
		list l=null;
		
		try {
			
			String sql="select * from list where uid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, userid);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
				{
				l=new list();
				l.setLid(rs.getInt(1));
				l.setPid(rs.getInt(2));
				l.setUserid(rs.getInt(3));
				l.setPatientname(rs.getString(4));
				l.setDonation(rs.getDouble(5));
				
				list.add(l);
				}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	@Override
	public boolean deletepatient(int pid,int uid) {
		
		boolean f=false;
		try
		{
		String sql="delete from list where pid=? and uid=?";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setInt(1, pid);
		ps.setInt(2, uid);
		
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
	

}
