<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>application register</title>
<%@include file="allcomponent/allcss.jsp"%>
</head>
<body style="background-color: #62b9cc">
	<%@include file="allcomponent/navbar.jsp"%>
	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Register Here</h4>
						
						<c:if test="${not empty succMsg }">
						<p class="text-center text-success">${succMsg }</p>
						<c:remove var="succMsg" scope="session" />
						</c:if>
						
						<c:if test="${not empty failedMsg }">
						<p class="text-center text-success">${failedMsg }</p>
						<c:remove var="failedMsg" scope="session" />
						</c:if>
						
						<form action="register" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Full Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="fname">
							</div>


							<div class="form-group">
								<label for="exampleInputEmail1">E-mail</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="email">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Phone</label> <input
									type="number" class="form-control" id="exampleInputPassword1"
									required="required" name="phone">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Password</label> <input
									type="password" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required"
									name="password">
							</div>
							<div class="form-check">
								<input type="checkbox" class="form-check-input" name="check"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Terms and conditions</label>
							</div>
							<button type="submit" class="btn btn-primary">Submit</button>
						</form>


					</div>

				</div>

			</div>

		</div>

	</div>

	<%@include file="allcomponent/footer.jsp"%>
</body>
</html>