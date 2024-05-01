<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin:home</title>
<%@include file="admindesign/allcss.jsp"%>
<style>
a {
	text-decoration: name;
	color: black;
	a: hover{ 
text-decoration: none;
	color: black;
}
}
</style>
</head>
<body>
	<%@include file="admindesign/navbar.jsp"%>
	<c:if test="${empty userobj }">
	<c:redirect url="../login.jsp"></c:redirect>
	
	</c:if>

	<div class="container">
		<div class="row p-5">
			<div class="col-md-3">
				<a href="addpatient.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class=" fas fa-solid fa-bed-pulse fa-3x text-primary"></i><br>
							<h4>Add Patient</h4>
							--------------
						</div>

					</div>
				</a>
			</div>

			<div class="col-md-3">
				<a href="allpat.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-clipboard-list fa-3x text-danger"></i><br>
							<h4>All Patient</h4>
							--------------
						</div>

					</div>
				</a>
			</div>

			<div class="col-md-3">
				<a href="donation.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-hand-holding-dollar fa-3x text-warning"></i><br>
							<h4>Donation</h4>
							--------------
						</div>

					</div>
				</a>
			</div>

			<div class="col-md-3">
					<a data-toggle="modal" data-target="#exampleModalCenter">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-right-from-bracket fa-3x text-primary"></i><br>
							<h4>Logout</h4>
							--------------
						</div>

					</div>
					</a>
				</a>
			</div>

		</div>


	</div>
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle"></h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="text-center">
						<h4>Do you really want Logout!</h4>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Cancel</button>
						<a href="../logout" type="button"
							class="btn btn-primary text-white">Logout</a>
					</div>

				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
</body>
</html>