<%@page import="com.entity.patient_donation"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.dao.patientdonationimpDAO"%>
<%@page import="com.entity.user"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="allcomponent/allcss.jsp"%>
</head>
<body style="background-color: #b173c9;">
<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<%@include file="allcomponent/navbar.jsp"%>

	<div class="container">
	<h3 class="text-center"><b>Your Donations</b></h3>
		<table class="table table-striped mt-3">
			<thead class="bg-warning text-white">
				<tr>
					<th scope="col">Donation ID</th>
					<th scope="col">Name</th>
					<th scope="col">Patient</th>
					<th scope="col">Email</th>
					<th scope="col">Payment</th>
				</tr>
			</thead>
			<tbody>
			<%
			user u=(user)session.getAttribute("userobj");
			patientdonationimpDAO dao=new patientdonationimpDAO(DBconnect.getConn());
			List<patient_donation> plist=dao.getpatient(u.getEmail());
			for(patient_donation p:plist)
			{%>
			<tr>
					<th scope="row"><%=p.getDonationid() %></th>
					<td><%=p.getUsername() %></td>
					<td><%=p.getPatientname() %></td>
					<td><%=p.getEmail() %></td>
					<td><%=p.getPayment() %></td>
				</tr>
			<%}
			
			
			%>
			
			
				
			</tbody>
		</table>
	</div>



</body>
</html>