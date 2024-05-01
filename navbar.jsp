<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<div class="container-fluid"
	style="height: 10px; background-color: #e65100"></div>


<div class="contaier-fluid p-3">
	<div class="row">
		<div class="col-md-3">
			<h3>
				<i class="fa-solid fa-dharmachakra"></i>Smile and Help
			</h3>
		</div>
		<div class="col-md-6">
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-primary my-2 my-sm-0" type="submit">
					<i class="fa-solid fa-magnifying-glass"></i>Search
				</button>
			</form>
		</div>

		<c:if test="${not empty userobj }">
			<div class="col-md-3">
			<a href="list.jsp"><i class="fa-solid fa-list-check fa-2x"></i></a>
			
				<a href="login.jsp" class="btn btn-success"><i
					class="fa-solid fa-address-card"></i>${userobj.name}</a> <a href="logout"
					class="btn btn-primary"><i
					class="fa-solid fa-right-from-bracket"></i>Logout</a>
			</div>
		</c:if>

		<c:if test="${empty userobj}">
			<div class="col-md-3">
				<a href="login.jsp" class="btn btn-success"><i
					class="fa-solid fa-right-to-bracket"></i>Login</a> <a
					href="register.jsp" class="btn btn-primary"><i
					class="fa-solid fa-address-card"></i>Register</a>
			</div>

		</c:if>



	</div>
</div>



<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp"><i
					class="fa-solid fa-house"></i>Home <span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="recent.jsp"><i class="fa-solid fa-hospital"></i>Patients</a></li>

			<li class="nav-item active"><a class="nav-link disabled"
				href="newpat.jsp"><i class="fa-solid fa-bed-pulse"></i>All
					Patient</a>
			<li class="nav-item active"><a class="nav-link"
				href="oldpatshow.jsp"><i class="fa-solid fa-person-running"></i>Live-Campaign</a></li>
			</li>
		</ul>
		<form class="form-inline my-2 my-lg-0">
			<a href="setting.jsp" class="btn btn-light my-2 my-sm-0" type="submit">
				<i class="fa-solid fa-gear"></i>Setting
			</a>
			<button class="btn btn-lighty-2 my-sm-0 ml-1" type="submit">
				<i class="fa-solid fa-phone"></i>Contact
			</button>
		</form>
	</div>
</nav>