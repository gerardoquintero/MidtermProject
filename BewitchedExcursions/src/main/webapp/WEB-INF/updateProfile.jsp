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

		<c:if test="${userLogin.id == trip.organizer.id}">
			<h1>Update User</h1>
			<form action="updateProfileForm.do" method="POST">

				<input type="text" name="name" value="${user.username}"> <br>
				<label for="username">Username </label> <input type="text"
					name="password" value="${user.password}"><br> <label
					for="password">Password</label>
				<button type="submit" class="btn btn-outline-danger">Login</button>
			</form>
		</c:if>
</body>
</html>