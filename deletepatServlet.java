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

@WebServlet("/delete")
public class deletepatServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			int id=Integer.parseInt(req.getParameter("id"));
			
			patientDAOimp dao=new patientDAOimp(DBconnect.getConn());
			boolean f=dao.deletepat(id);
HttpSession session=req.getSession();
			
			if(f)
			{
				session.setAttribute("succcMsg", "Patient details deleted successfully");
				resp.sendRedirect("adminfolder/allpat.jsp");
			}
			else
			{
				session.setAttribute("failMsg", "Fail to delete patient details");
				resp.sendRedirect("adminfolder/allpat.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}
