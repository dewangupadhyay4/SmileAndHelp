<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit profile</title>
<%@include file="allcomponent/allcss.jsp"%>
</head>
<body style="background-color: #b173c9;">
	<%@include file="allcomponent/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
					
					<h4 class="text-center mt-2">Edit Profile Details</h4>
					
					<c:if test="${not empty failedMsg}">
					<h5 class="text-center text-danger">${failedMsg }</h5>
					<c:remove var="failedMsg" scope="session"/>
					</c:if>
					
					<c:if test="${not empty succMsg}">
					<h5 class="text-center text-success">${succMsg }</h5>
					<c:remove var="failedMsg" scope="session"/>
					</c:if>

						<form action="updateprofile" method="post">
						<input type="hidden" value="${userobj.id }" name="id">
							<div class="form-group">
								<label for="exampleInputEmail1">Full Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="fname" value="${userobj.name }">
							</div>


							<div class="form-group">
								<label for="exampleInputEmail1">E-mail</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="email" value="${userobj.email }">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Phone</label> <input
									type="number" class="form-control" id="exampleInputPassword1"
									required="required" name="phone" value="${userobj.phone }">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">password</label> <input
									type="password" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required"
									name="password" value="${userobj.password }">
							</div>
							<button type="submit" class="btn btn-primary">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>



</body>
</html>