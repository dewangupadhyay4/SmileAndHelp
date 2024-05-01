package com.user.servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBconnect;
import com.dao.userDAOimp;
import com.entity.user;

@WebServlet("/login")
public class loginServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try
		{
			userDAOimp dao=new userDAOimp(DBconnect.getConn());
			
			HttpSession session=req.getSession();
			
			String email=req.getParameter("email");
			String password=req.getParameter("password");
			String check=req.getParameter("check");
			
			
			
			if("admin@gmail.com".equals(email) && "admin".equals(password))
			{
				user us=new user();
				us.setName("admin");
				session.setAttribute("userobj", us);
				resp.sendRedirect("adminfolder/homeforadmin.jsp");
			}
			else
			{
				
				
				user us=dao.login(email, password);
				if(us!=null)
				{
					session.setAttribute("userobj" , us);
					resp.sendRedirect("index.jsp");
				}
				else
				{
					session.setAttribute("failedMsg" ,"Email and password are incorrect");
					resp.sendRedirect("login.jsp");
				}
				
				resp.sendRedirect("index.jsp");
			
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	

}
