package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBconnect;
import com.dao.listdao;
import com.dao.listdaoimp;
import com.dao.patientdonationimpDAO;
import com.entity.list;
import com.entity.patient_donation;
import com.entity.patientdetails;
import com.mysql.cj.x.protobuf.MysqlxDatatypes.Array;


@WebServlet("/donation")
public class donationServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			HttpSession session=req.getSession();
			
			int id=Integer.parseInt(req.getParameter("id"));
			
			String name=req.getParameter("username");
			String email=req.getParameter("email");
			String phone=req.getParameter("phone");
			String address=req.getParameter("address");
			String landmark=req.getParameter("landmark");
			String city=req.getParameter("city");
			String state=req.getParameter("state");
			String pincode=req.getParameter("pincode");
			String payment=req.getParameter("payment");
			
			String alladdress=address+","+landmark+","+city+","+state+","+pincode;
			
			
			
			listdaoimp dao=new listdaoimp(DBconnect.getConn());
			
			List<list> plist=dao.getpatientbyuser(id);
			
			if(plist.isEmpty())
			{
				session.setAttribute("failmsg", "Add patient to proceed");
				resp.sendRedirect("list.jsp");
			}
			else
				{
				patientdonationimpDAO dao2=new patientdonationimpDAO(DBconnect.getConn());
				patient_donation d=null;
				int i=dao2.getdonationNo();
				
				ArrayList<patient_donation> donationlist=new ArrayList<patient_donation>();
				
				for(list c:plist)
				{
					d=new patient_donation();
					d.setDonationid("PATIENT-DON-00"+i);
					d.setUsername(name);
					d.setEmail(email);
					d.setPhone(phone);
					d.setAlladdress(alladdress);
					d.setPatientname(c.getPatientname());
					d.setPayment(payment);
					donationlist.add(d);
					i++;
				}
				
				
				if("noselect".equals(payment))
				{
					session.setAttribute("failmsg", "Plsease choose payment method");
					resp.sendRedirect("list.jsp");
				}
				else
				{
					boolean f=dao2.savedonation(donationlist);
					
					if(f)
					{
						resp.sendRedirect("donation_succesful.jsp");
					}
					else
					{
						session.setAttribute("failmsg", "Donation failed");
						resp.sendRedirect("list.jsp");
					}
				}
				}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
