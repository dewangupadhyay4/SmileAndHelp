<%@page import="com.entity.user"%>
<%@page import="com.entity.patientdetails"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.patientDAOimp"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Project: Index</title>
<%@include file="allcomponent/allcss.jsp"%>
<style type="text/css">
.back-img {
	background: url("image/pic.jpg");
	height: 60vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.crd-ho:hover {
	background-color: #d1aef5;
}
</style>
</head>
<body style="background-color: #b173c9;">

	<%
	user u = (user) session.getAttribute("userobj");
	%>
	<%@include file="allcomponent/navbar.jsp"%>
	<div class="container-fluid back-img">
		<h2 class="text-center text-info">Your little help can Save Life</h2>
	</div>



	<!-- Start recent patient -->
	<div class="container">
		<h3 class="text-center">Recent Requests</h3>
		<div class="row">
			<%
			patientDAOimp dao2 = new patientDAOimp(DBconnect.getConn());
			List<patientdetails> listi = dao2.getrecentpatients();
			for (patientdetails p : listi)
			{%>
			
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="image/<%=p.getPhoto()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=p.getPatname()%></p>

						<%
						if (p.getCategory().equals("old")) {
						%>
						<p>Category:<%=p.getCategory()%></p>
						<div class="row">

							<a href="viewpatient.jsp?pid=<%=p.getPatientId()%>"
								class="btn btn-success btn-sm ml-5">Details</a> <a
								href="payment.jsp" class="btn btn-danger btn-sm ml-1">Help</a>
						</div>
						<%
						} else {
						%>
						<p>Category:<%=p.getCategory()%></p>
						<div class="row">


							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-1">Add
								List</a>
							<%
							} else {
							%>
							<a href="list?pid=<%=p.getPatientId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm">Add List</a>
							<%
							}
							%>

							<a href="viewpatient.jsp?pid=<%=p.getPatientId()%>"
								class="btn btn-success btn-sm ml-1">Details</a>

							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i>Help</a>
							<%
							} else {
							%>
							<a href="payment.jsp" class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i>Help</a>
							<%
							}
							%>
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
		<div class="text-center mt-1">
			<a href="recent.jsp" class="btn btn-danger btn-sm text-white">See
				all</a>
		</div>
	</div>

	<!-- end recent patient -->


	<hr>

	<!-- Start new patient -->

	<div class="container">
		<h3 class="text-center">New Requests</h3>
		<div class="row">

			<%
			patientDAOimp dao = new patientDAOimp(DBconnect.getConn());
			List<patientdetails> list = dao.getnewpatient();
			for (patientdetails p : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="image/<%=p.getPhoto()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=p.getPatname()%></p>
						Category:<%=p.getCategory()%></p>
						<div class="row">

							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-1">Add
								List</a>
							<%
							} else {
							%>
							<a href="list?pid=<%=p.getPatientId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm">Add List</a>
							<%
							}
							%>
							<a href="viewpatient.jsp?pid=<%=p.getPatientId()%>"
								class="btn btn-success btn-sm ml-1">Details</a> <a
								href="payment.jsp" class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i>Help</a>

						</div>

					</div>
				</div>
			</div>
			<%
			}
			%>



		</div>
		<div class="text-center mt-1">
			<a href="newpat.jsp" class="btn btn-danger btn-sm text-white">See
				all</a>
		</div>
	</div>

	<!-- end new patient -->





	<!-- Start old patient -->
	<hr>
	<div class="container">
		<h3 class="text-center">Old Requests</h3>
		<div class="row">
			<%
			patientDAOimp dao3 = new patientDAOimp(DBconnect.getConn());
			List<patientdetails> listin = dao3.getoldpatient();
			for (patientdetails p : listin) {
			%>

			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="image/<%=p.getPhoto()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=p.getPatname()%></p>
						Category:<%=p.getCategory()%></p>
						<div class="row">
							<a href="viewpatient.jsp?pid=<%=p.getPatientId()%>"
								class="btn btn-success btn-sm ml-5">Details</a> <a
								href="donation_succesful.jsp" class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i>Help</a>

						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="text-center mt-1">
			<a href="oldpatshow.jsp" class="btn btn-danger btn-sm text-white">See
				all</a>
		</div>

	</div>
	</hr>
	<!-- end old patient -->
	<%@include file="allcomponent/footer.jsp"%>

</body>
</html>