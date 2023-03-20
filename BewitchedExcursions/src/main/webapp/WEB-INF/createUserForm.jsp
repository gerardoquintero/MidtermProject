<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="navbar.jsp"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<title>Registration Form</title>
</head>
<body>
	<h2>Registration Form</h2>
	<form action="register.do" method="POST">
		<label for="firstName">First Name:</label> <input type="text"
			id="firstName" name="firstName" required><br>
		<br> <label for="lastName">Last Name:</label> <input type="text"
			id="lastName" name="lastName" required><br>
		<br> <label for="username">User Name:</label> <input type="text"
			id="username" name="username" required><br>
		<br> <label for="email">Email:</label> <input type="email"
			id="email" name="email" required><br>
		<br> <label for="password">Password:</label> <input
			type="password" id="password" name="password" required><br>
		<br>
		<!-- 	<label for="address">Address ID:</label>
		<textarea id="address" name="userAddress"></textarea><br><br> -->
		<input type="submit" value="Register">

	</form>
</body>
</html>
