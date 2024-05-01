<%@page import="com.entity.patientdetails"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.dao.patientDAOimp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="allcomponent/allcss.jsp"%>
</head>
<body style="background-color:#f0e0b6">
	<%@include file="allcomponent/navbar.jsp"%>
	<%
	int pid=Integer.parseInt(request.getParameter("pid"));
	patientDAOimp dao=new patientDAOimp(DBconnect.getConn());
	patientdetails p=dao.getPatientById(pid);
	
	%>
	
	
	<div class="container p-3">
		<div class="row p-5">
			<div class="col-md-6 text-center p-5 border bg-white">
			<img src="image/<%=p.getPhoto() %>" style="height:160px;width: 180px"><br>
			<h4 class="mt-3">Patient Name:<span class="text-success"> <%=p.getPatname() %></span></h4>
			<h4>Category:<span class="text-success"> <%=p.getCategory() %></span></h4>
			</div>
				<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%=p.getPatname() %></h2>
				
				<%
				if("old".equals(p.getCategory()))
				{%>
					<h5 class="text-success"><i class="fa-solid fa-address-book"></i>Contact</h5>
					<h5 class="text-success"><i class="fa-solid fa-envelope"></i>Email: <%=p.getEmail() %></h5>
				<%}
				%>
				
				
				<div class="row">
				<div class="col-md-4 text-danger text-center p-2">
				<i class="fa-solid fa-registered fa-2x"></i>
				<p>Assured Request</p>
				</div>
				<div class="col-md-4 text-danger text-center p-2">
				<i class="fa-solid fa-file fa-2x"></i>
				<p>Documents Available</p>
				</div>
				<div class="col-md-4 text-danger text-center p-2">
				<i class="fa-solid fa-handshake fa-2x"></i>
				<p>Meet Patient and family memeber</p>
				</div>
				</div>
				
				<%
				if("old".equals(p.getCategory()))
				{%>
					<div class="text-center p-3">
				<a href="index.jspg" class="btn btn-success"><i class="fa-solid fa-list"></i>Continue Donation</a>
				<a href="" class="btn btn-danger"><i class="fa-solid fa-indian-rupee-sign"></i>Donate</a>
				</div>
				<%}else
				{%>
					<div class="text-center p-3">
				<a href="" class="btn btn-primary"><i class="fa-solid fa-list"></i>Add List</a>
				<a href="" class="btn btn-danger"><i class="fa-solid fa-indian-rupee-sign"></i>Donate</a>
				</div>
					
				<%}
				%>
				
				
				
				</div>
		</div>
	</div>
</body>
</html>