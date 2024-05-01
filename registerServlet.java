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

@WebServlet("/register")
public class registerServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");
			String password = req.getParameter("password");
			String check = req.getParameter("check");

			//System.out.println(name+" "+email+" "+phone+" "+password+" "+check);
			user us = new user();
			us.setName(name);
			us.setEmail(email);
			us.setPhone(phone);
			us.setPassword(password);

			HttpSession session = req.getSession();

			if (check != null) {
				userDAOimp dao = new userDAOimp(DBconnect.getConn());
				boolean f=dao.userRegister(us);
				if (f) {
					// System.out.println("Registration successful");

					session.setAttribute("succMsg", "Registration succesful....");
					resp.sendRedirect("register.jsp");

				} else {
					// System.out.println("Server error");

					session.setAttribute("failedMsg", "Server error....");
					resp.sendRedirect("register.jsp");

				}
			} else {
				// System.out.println("please check the condition");

				session.setAttribute("failedMsg", "Please check the condition....");
				resp.sendRedirect("register.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
