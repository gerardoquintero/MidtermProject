<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/loginAndRegister.css">
<title>Update User Form</title>
</head>
<body class="text-center">

	<header>
		<%@include file="navbar.jsp"%>
	</header>
	
		
			<h1>Update User</h1>
			<form action="updateProfileForm.do" method="POST">

				<input type="hidden" name="id" value="${userLogin.id}">
				<input type="text" name="firstName" value="${userLogin.firstName}"> 
				<label for="firstName">First Name </label> 
				<br>
				<input type="text" name="lastName" value="${userLogin.lastName}"> 
				<label for="lastName">Last Name </label> 
				<br>
				<input type="text" name="emailAddress" value="${userLogin.emailAddress}"> 
				<label for="emailAddress">Email </label> 
				<br>
				<input type="text" name="profileImageUrl" value="${userLogin.profileImageUrl}"> 
				<label for="profileImageUrl">Profile Picture </label> 
				<br>
				<textarea type="text" name="biography">${userLogin.biography}</textarea> 
				<label for="biography">Biography </label> 
				<br>
				<input type="text" name="password" value="${userLogin.password}">
				<label for="password">Password</label>
				<br>				
				<button type="submit" class="btn btn-outline-danger">Update</button>
			</form>
		
</body>
</html>