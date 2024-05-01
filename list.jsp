<%@page import="java.util.List"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.entity.list"%>
<%@page import="com.entity.user"%>
<%@page import="com.dao.listdaoimp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List</title>
<%@include file="allcomponent/allcss.jsp"%>
</head>
<body style="background-color: #c7d7f2;">
	<%@include file="allcomponent/navbar.jsp"%>

	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<c:if test="${not empty succmsg }">
		<div class="alert alert-success" role="alert">${succmsg }</div>
		<c:remove var="succmsg" scope="session" />
	</c:if>

	<c:if test="${not empty failmsg }">
		<div class="alert alert-danger text-center" role="alert">${failmsg }</div>
		<c:remove var="failmsg" scope="session" />
	</c:if>

	<div class="container">
		<div class="row p-2">
			<div class="col-md-6">

				<div class="card bg-white mt-2">
					<div class="card-body">
						<h3 class="text-center text-danger">Selected Patients</h3>
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Patient ID</th>
									<th scope="col">Patient Name</th>
									<th scope="col">UserID</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>

								<%
								user u = (user) session.getAttribute("userobj");

								listdaoimp dao = new listdaoimp(DBconnect.getConn());
								List<list> list = dao.getpatientbyuser(u.getId());
								for (list l : list) {
								%>
								<tr>
									<th scope="row"><%=l.getPid() %></th>
									<td><%=l.getPatientname()%></td>
									<td><%=l.getUserid()%></td>
									<td><a href="remove_patient?pid=<%=l.getPid()%>&&uid=<%=l.getUserid()%>"
										class="btn btnsm btn-danger">Delete</a></td>
								</tr>
								<%
								}
								%>


							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-danger">Your Details</h3>
						<form action="donation" method="post">
						<input type="hidden" value="${userobj.id }" name="id">
						
						
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Name</label> <input type="text" name="username"
										class="form-control" id="inputEmail4" value="${userobj.name }" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Email</label> <input type="email" name="email"
										class="form-control" id="inputPassword4" value="${userobj.email }" required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Phone</label> <input type="number" name="phone"
										class="form-control" id="inputEmail4" value="${userobj.phone }" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input type="text" name="address"
										class="form-control" id="inputPassword4" required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Landmark</label> <input type="text" name="landmark"
										class="form-control" id="inputEmail4" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">city</label> <input type="text" name="city"
										class="form-control" id="inputPassword4" required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">State</label> <input type="text" name="state"
										class="form-control" id="inputEmail4" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">PIN Code</label> <input type="text" name="pincode"
										class="form-control" id="inputPassword4" required>
								</div>
							</div>
							<div class="form-group">
								<label>Payment Method</label> <select class="form-control" name="payment">
									<option value="noselect">--Select--</option>
									<option>Cash(You have to visit the Hospital and give
										amount)</option>
									<option value="payment">UPI</option>
								</select>
							</div>

							<div>
								<a href="payment.jsp" class="btn btn-warning">Donate Now</a> <a
									href="index.jsp" class="btn btn-success">Continue Donation</a>
							</div>
						</form>
					</div>
				</div>
			</div>



		</div>
	</div>
</body>
</html>