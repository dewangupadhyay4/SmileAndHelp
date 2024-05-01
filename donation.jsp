<%@page import="com.entity.patient_donation"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.dao.patientdonationimpDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>all donations</title>
<%@include file="admindesign/allcss.jsp"%>
</head>
<body>
<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
<%@include file="admindesign/navbar.jsp" %>
<h3 class="text-center">Hello admin</h3>
<table class="table table-striped">

  <thead class="bg-primary text-white">
    <tr>
      <th scope="col">Id</th>
      <th scope="col">Donator Name</th>
      <th scope="col">Email</th>
       <th scope="col">Phone</th>
      <th scope="col">Patient Name</th>
      <th scope="col">Address of Donator</th>
       <th scope="col">Payment</th>

         
        
         
    </tr>
  </thead>
  <tbody>
  <%
  patientdonationimpDAO dao=new patientdonationimpDAO(DBconnect.getConn());
 List<patient_donation> plist=dao.getalldonation();
  for(patient_donation p:plist)
  {%>
  
    <tr>
      <th scope="row"><%=p.getDonationid() %></th>
      <td><%=p.getUsername() %></td>
      <td><%=p.getEmail() %></td>
      <td><%=p.getPhone() %></td>
      <td><%=p.getPatientname() %></td>
      <td><%=p.getAlladd() %></td>
       <td><%=p.getPayment() %></td>
      
    </tr>
  
  
  <%}  
  %>
  
  
  
  </tbody>
</table>
<div style="margin-top: 230px;">
<%@include file="admindesign/footer.jsp" %></div>
</body>
</html>