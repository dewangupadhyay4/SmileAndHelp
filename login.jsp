<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login-page</title>
<%@include file="allcomponent/allcss.jsp"%>
</head>
<body style="background-color:#62b9cc">
	<%@include file="allcomponent/navbar.jsp"%>
	<div class="container">
		<div class="row mt-5">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
					<h3 class="text-center">LogIn</h3>
					
					<c:if test="${not empty failedMsg}">
					<h5 class="text-center text-danger">${failedMsg }</h5>
					<c:remove var="failedMsg" scope="session"/>
					</c:if>
					
					<c:if test="${not empty succMsg}">
					<h5 class="text-center text-success">${succMsg }</h5>
					<c:remove var="failedMsg" scope="session"/>
					</c:if>
					
					
					
						<form action="login" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">E-mail</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="email">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1" required="required" name="password">
							</div>
							
							<div class="text-center">
								<button type="submit" class="btn btn-primary">Login</button><br>
								<a href="register.jsp">Register if New User</a>
							</div>
						</form>


					</div>


				</div>


			</div>

		</div>

	</div>





</body>
</html>