<%@page import="java.util.List"%>
<%@page import="com.entity.patientdetails"%>
<%@page import="com.dao.patientDAOimp"%>
<%@page import="com.DB.DBconnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All recent patients</title>
<%@include file="allcomponent/allcss.jsp"%>
<style type="text/css">

.crd-ho:hover {
	background-color: #d1aef5;
}
</style>
</head>
<body>
	<%@include file="allcomponent/navbar.jsp"%>
	<div class="container">
		<div class="row p-3">
				<%
				patientDAOimp dao2 = new patientDAOimp(DBconnect.getConn());
				List<patientdetails> listi = dao2.getallrecentpatients();
				for (patientdetails p : listi) {
				%>
				<div class="col-md-3">
					<div class="card crd-ho mt-2">
						<div class="card-body text-center">
							<img alt="" src="image/<%=p.getPhoto()%>"
								style="width: 130px; height: 190px" class="img-thumblin">
							<p><%=p.getPatname()%></p>
							<p>

							<%
							if (p.getCategory().equals("old")) {
							%>
							Category:<%=p.getCategory()%></p>
							<div class="row">

								<a href="" class="btn btn-success btn-sm ml-4">Details</a> <a
									href="" class="btn btn-danger btn-sm ml-1">Help</a>
							</div>
							<p>
							<%
							} else {
							%>
							Category:<%=p.getCategory()%></p>
							<div class="row">

								<a href="" class="btn btn-danger btn-sm">Add List</a> <a href=""
									class="btn btn-success btn-sm">Details</a> <a href=""
									class="btn btn-danger btn-sm"><i
									class="fa-solid fa-indian-rupee-sign"></i>Help</a>
							</div>
							<%
							}
							%>

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