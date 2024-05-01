<%@page import="com.entity.patientdetails"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.dao.patientDAOimp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:add_patient</title>
<%@include file="admindesign/allcss.jsp"%>
</head>
<body style="background-color: #62b9cc">
	<%@include file="admindesign/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit Patient Details</h4>
						
						<%
						int id=Integer.parseInt(request.getParameter("id"));
						patientDAOimp dao=new patientDAOimp(DBconnect.getConn());
						patientdetails p=dao.getPatientById(id);
						
						%>
						
						
						
						<form action="../editpat" method="post">
						<input type="hidden" name="id" value="<%=p.getPatientId() %>">
							<div class="form-group">
								<label for="exampleInputEmail1">Patient Name</label> <input
									name="pname" type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" value="<%=p.getPatname() %>" >
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Age</label> <input
									name="age" type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" value="<%=p.getAge() %>">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Father's Name</label> <input
									name="father" type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" value="<%=p.getFathername()%>">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Occupation</label> <input
									name="occupation" type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" value="<%=p.getOccupation()%>">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Hospital Name</label> <input
									name="hospital" type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" value="<%=p.getHospital()%>">
							</div>
							
							<div class="form-check">
								<input type="checkbox" class="form-check-input"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Agree terms and conditions</label>
							</div>
							<button type="submit" class="btn btn-primary">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 230px;">
<%@include file="admindesign/footer.jsp" %></div>
</body>
</html>