<%@page import="java.util.List"%>
<%@page import="com.entity.patientdetails"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.dao.patientDAOimp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>all patient</title>
<%@include file="admindesign/allcss.jsp"%>
</head>
<body>
<%@include file="admindesign/navbar.jsp" %>

<c:if test="${empty userobj }">
	<c:redirect url="../login.jsp"></c:redirect>
	
	</c:if>

<c:if test="${not empty succcMsg }">
						<h5 class="text-center text-success">${succcMsg } </h5>
						<c:remove var="succcMsg" scope="session"/>
						
						</c:if>
						
						<c:if test="${not empty failMsg }">
						<h5 class="text-center text-danger">${failMsg } </h5>
						<c:remove var="failMsg" scope="session"/>
						</c:if>

<h3 class="text-center">Hello admin</h3>
<table class="table table-striped">

  <thead class="bg-primary text-white">
    <tr>
     <th scope="col">Id</th>
      <th scope="col">Image</th>
      <th scope="col">Patient Name</th>
      <th scope="col">Age</th>
      <th scope="col">Father</th>
       <th scope="col">occupation</th>
        <th scope="col">Hospital Name</th>
         <th scope="col">Edit</th>
    </tr>
  </thead>
  <tbody>
  
  <%
  patientDAOimp dao=new patientDAOimp(DBconnect.getConn());
  List<patientdetails> list=dao.getallpat();
  for(patientdetails p:list){
	  %>
	 <tr>
      <td><%=p.getPatientId() %></td>
      <td><img src="../image/<%=p.getPhoto() %>" style="width:50px; height:50px;"></td>
      <td><%=p.getPatname() %></td>
      <td><%=p.getAge() %></td>
      <td><%=p.getFathername() %></td>
      <td><%=p.getOccupation() %></td>
      <td><%=p.getHospital() %></td>
      <td>
      <a href="editpat.jsp?id=<%=p.getPatientId() %>" class="btn btn-sm btn-primary"><i class="fa-solid fa-pen-to-square"></i>Edit</a>
      <a href="../delete?id=<%=p.getPatientId()  %>" class="btn btn-sm btn-danger"><i class="fa-solid fa-trash"></i>Delete</a>
      </td>
    </tr>
	<%  
	
	
  }
  
  %>
  </tbody>
</table>
<div style="margin-top: 230px;">
<%@include file="admindesign/footer.jsp" %></div>

</body>
</html>