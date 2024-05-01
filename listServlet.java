package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBconnect;
import com.dao.listdaoimp;
import com.dao.patientDAOimp;
import com.entity.list;
import com.entity.patientdetails;

@WebServlet("/list")
public class listServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			int pid=Integer.parseInt(req.getParameter("pid"));
			int uid=Integer.parseInt(req.getParameter("uid"));
			
			patientDAOimp dao=new patientDAOimp(DBconnect.getConn());
			patientdetails p=dao.getPatientById(pid);
			
			list l=new list();
			l.setPid(pid);
			l.setUserid(uid);
			l.setPatientname(p.getPatname());
			l.setDonation(Double.parseDouble(p.getAge()));
			
			listdaoimp dao2=new listdaoimp(DBconnect.getConn());
			 boolean f=dao2.addlist(l);
			
			 HttpSession session=req.getSession();
			 
			 
			 if(f)
			 {
				 session.setAttribute("addlist", "Patient added to List");
				 resp.sendRedirect("newpat.jsp");
			 }
			 else
			 {
				 session.setAttribute("faillist", "Something went wrong");
				 resp.sendRedirect("");
			 }
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}
