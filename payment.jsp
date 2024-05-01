<%@page import="com.entity.user"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Payment Options</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #c3cf69;
	margin: 0;
	padding: 0;
	display: flex;
	align-items: center;
	justify-content: center;
	height: 100vh;
}

h1 {
	text-align: center;
	color: #333;
}

.payment-option {
	background-color: #9a9e7d;
	color:#fff;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	padding: 20px;
	margin: 20px;
	text-align: center;
}

.payment-button {
	padding: 10px;
	font-size: 16px;
	background-color: #007bff;
	color: #fff;
	border: none;
	cursor: pointer;
	border-radius: 5px;
}

.payment-button:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>
<%
user u=(user)session.getAttribute("userobj");

%>

	<h1>Choose Payment Option</h1>

	<div class="payment-option">
		<h2>UPI Payment</h2>
		<p style="color: #fff;">Make UPI payment to: example@upi</p>
		<button class="payment-button">Proceed with UPI</button>
	</div>

	<div class="payment-option">
		<h2>Card Payment</h2>
		<form action="processCardPayment" method="post">
			<button class="payment-button" type="submit">Proceed with
				Card</button>
		</form>
	</div>

	<div class="payment-option">
		<h2>Mobile App Payment</h2>
		<p style="color: #fff;">Make payment using our mobile app.
			Download the app from the app store.</p>
		<button class="payment-button">Open Mobile App</button>
	</div>

</body>
</html>
