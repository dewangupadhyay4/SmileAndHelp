package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBconnect;
import com.dao.patientDAOimp;
import com.entity.patientdetails;

@WebServlet("/editpat")

public class editpatServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			String patname=req.getParameter("pname");
			//Double age=Double.parseDouble(req.getParameter("age"));
			String age=req.getParameter("age");
			String fathername=req.getParameter("father");
			String occupation=req.getParameter("occupation");
			String hospital=req.getParameter("hospital");
			
			patientdetails p=new patientdetails();
			p.setPatientId(id);
			p.setPatname(patname);
			p.setAge(age);
			p.setFathername(fathername);
			p.setOccupation(occupation);
			p.setHospital(hospital);
			
			patientDAOimp dao=new patientDAOimp(DBconnect.getConn());
			boolean f=dao.updateeditpat(p);
			HttpSession session=req.getSession();
			
			if(f)
			{
				session.setAttribute("succcMsg", "Patient details updated successfully");
				resp.sendRedirect("adminfolder/allpat.jsp");
			}
			else
			{
				session.setAttribute("failMsg", "Fail to update patient details");
				resp.sendRedirect("adminfolder/allpat.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}
