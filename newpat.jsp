<%@page import="com.entity.user"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.patientdetails"%>
<%@page import="com.dao.patientDAOimp"%>
<%@page import="com.DB.DBconnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
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

#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}

</style>
</head>
<body>

<%
user u=(user)session.getAttribute("userobj");

%>
	<c:if test="${not empty addlist }">

		<div id="toast">${addlist }</div>

		<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>

<c:remove var="addlist" scope="session"/>

	</c:if>

	<%@include file="allcomponent/navbar.jsp"%>
	<div class="container">
		<div class="row p-3">
			<%
			patientDAOimp dao = new patientDAOimp(DBconnect.getConn());
			List<patientdetails> list = dao.getallnewpatients();
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
							<% if(u==null)
							{%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-1">Add List</a>
							<%}else
							{%>
								<a href="list?pid=<%=p.getPatientId() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm">Add List</a> 
							<%}
							
							%>
							
							<a href=""
								class="btn btn-success btn-sm ml">Details</a> 
								
								<a href=""
								class="btn btn-danger btn-sm ml"><i
								class="fa-solid fa-indian-rupee-sign"></i>Help</a>

						</div>

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