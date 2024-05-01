<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="allcomponent/allcss.jsp"%>
</head>
<body style="background-color: #b173c9;">
	<%@include file="allcomponent/navbar.jsp"%>

	<div class="container">
		<h3 class="text-center">Hello,Dewang</h3>
		<div class="row">
			<div class="col-md-6 mt-3">
				<a href="editprofile.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-gear fa-2x"></i>
							</div>
							<h4>Edit Profile</h4>
							<p>Edit your Details
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-6 mt-3">
				<a href="address.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-warning">
							
							<i class="fa-solid fa-location-dot fa-2x"></i>
							</div>
							<h4>Your Address</h4>
							<p>Edit your address
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-6 mt-3">
				<a href="Helpline.jsp">
					<div class="card">
						<div class="card-body text-center">
						<div class="text-success">
						<i class="fa-solid fa-comments fa-2x"></i>
						</div>
						<h4>Consumer Help</h4>
						<p>24*7 Consumer Service available
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-6 mt-3">
				<a href="mydonation.jsp">
					<div class="card">
						<div class="card-body text-center">
						<div class="text-danger">
						
						<i class="fa-solid fa-handshake-angle fa-2x"></i>
						</div>
						<h4>My Donations</h4>
						<p>Know about your Donations
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>




</body>
</html>