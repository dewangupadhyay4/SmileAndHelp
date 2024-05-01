<%@page import="java.util.List"%>
<%@page import="com.entity.patientdetails"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.dao.patientDAOimp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>all old patient</title>
<%@include file="allcomponent/allcss.jsp"%>
</head>
<body>
<%@include file="allcomponent/navbar.jsp"%>
<div class="container">
		<div class="row p-3">
<%
			patientDAOimp dao3 = new patientDAOimp(DBconnect.getConn());
			List<patientdetails> listin = dao3.getalloldpatients();
			for (patientdetails p : listin) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="image/<%=p.getPhoto() %>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=p.getPatname() %></p>
						Category:<%=p.getCategory() %></p>
						<div class="row">
							<a href="" class="btn btn-success btn-sm ml-5">Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i>Help</a>

						</div>
						</div>
						</div>
					</div>
					<%
			}
			%>
			</div>
			</div>
</body>
</html>