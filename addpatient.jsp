<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:add_patient</title>
<%@include file="admindesign/allcss.jsp"%>
</head>
<body style="background-color: #62b9cc">
	<%@include file="admindesign/navbar.jsp"%>

	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp"></c:redirect>

	</c:if>

	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Add Patient</h4>

						<c:if test="${not empty succcMsg }">
							<p class="text-center text-success">${succcMsg }</p>
							<c:remove var="succcMsg" scope="session" />

						</c:if>

						<c:if test="${not empty failMsg }">
							<p class="text-center text-danger">${failMsg }</p>
							<c:remove var="failMsg" scope="session" />

						</c:if>

						<form action="../addpatient" method="post"
							enctype="multipart/form-data">

							<div class="form-group">
								<label for="exampleInputEmail1">Patient Name</label> <input
									name="pname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Age</label> <input name="age"
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Father's Name</label> <input
									name="father" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Occupation</label> <input
									name="occupation" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Hospital Name</label> <input
									name="hospital" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">

								<div class="form-group">
									<label for="inputState">Request Categorie</label> <select
										id="inputState" name="btype" class="form-control">
										<option selected>---select---</option>
										<option value="New">New Patient</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="exampleFormControlFile1">Upload Hospital's
									certificate here</label> <input name="bimg" type="file"
									class="form-control-file" id="exampleFormControlFile1">
							</div>
							<div class="form-check">
								<input type="checkbox" class="form-check-input"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Agree terms and conditions</label>
							</div>
							<button type="submit" class="btn btn-primary">Add</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 230px;">
		<%@include file="admindesign/footer.jsp"%></div>
</body>
</html>