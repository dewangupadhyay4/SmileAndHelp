package com.admin.servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

//import org.apache.tomcat.jni.File;

import com.DB.DBconnect;
import com.dao.patientDAOimp;
import com.entity.patientdetails;

@WebServlet("/addpatient")
@MultipartConfig
public class patientadd extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try
		{
			String patname=req.getParameter("pname");
			//Double age=Double.parseDouble(req.getParameter("age"));
			String age=req.getParameter("age");
			String fathername=req.getParameter("father");
			String occupation=req.getParameter("occupation");
			String hospital=req.getParameter("hospital");
			String category=req.getParameter("btype");
			Part part=req.getPart("bimg");
			String filename=part.getSubmittedFileName();
			
			patientdetails p=new patientdetails(patname,age,fathername,occupation,hospital,category,filename,"admin");
			
			
			patientDAOimp dao=new patientDAOimp(DBconnect.getConn());
			
			
			
			
			boolean f=dao.addpatient(p);
			
			HttpSession session=req.getSession();
			
			if(f)
			{
				String path=getServletContext().getRealPath("")+"image";
				//System.out.println(path);
				
				
				java.io.File file=new java.io.File(path);
				
				part.write(path+java.io.File.separator+filename);
				
				session.setAttribute("succcMsg", "patient added sucessfully");
				resp.sendRedirect("adminfolder/addpatient.jsp");
			}
			else
			{
				session.setAttribute("failMsg", "Something went wrong");
				resp.sendRedirect("adminfolder/addpatient.jsp");
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	

}
