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


@WebServlet("/remove_patient")
public class removedServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try
		{
		int pid=Integer.parseInt(req.getParameter("pid"));
		int uid=Integer.parseInt(req.getParameter("uid"));
		listdaoimp dao=new listdaoimp(DBconnect.getConn());
		boolean f=dao.deletepatient(pid,uid);
		HttpSession session=req.getSession();
		
		if(f)
		{
			session.setAttribute("succmsg", "Patient removed from the list");
			resp.sendRedirect("list.jsp");
		}
		else
		{
			session.setAttribute("failmsg", "Something went wrong");
			resp.sendRedirect("list.jsp");
		}
	}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	
	
	
	}
}
