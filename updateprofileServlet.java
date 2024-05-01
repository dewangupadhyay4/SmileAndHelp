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

@WebServlet("/updateprofile")
public class updateprofileServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			int id=Integer.parseInt(req.getParameter("id"));
			String name=req.getParameter("fname");
			String email=req.getParameter("email");
			String phone=req.getParameter("phone");
			String password=req.getParameter("password");
			
			user us=new user();
			us.setId(id);
			us.setName(name);
			us.setEmail(email);
			us.setPhone(phone);
			
			HttpSession session=req.getSession();
			
			userDAOimp dao=new userDAOimp(DBconnect.getConn());
			
			boolean f=dao.checkpassword(id, password);
			if(f)
			{
				boolean f2=dao.upadteprofile(us);
				if(f2)
				{
					session.setAttribute("succMsg", "Profile updated successfully....");
					resp.sendRedirect("register.jsp");
				}else
				{
					session.setAttribute("failedMsg", "Something went wrong....");
					resp.sendRedirect("register.jsp");
				}
			}else
			{
				session.setAttribute("failedMsg", "password is wrong....");
				resp.sendRedirect("editprofile.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	//return f;
	
	}
	

}
