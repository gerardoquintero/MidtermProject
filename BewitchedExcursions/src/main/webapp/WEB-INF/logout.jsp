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
<title>Do you want to logout?</title>
</head>
<h1></h1>

<h2>${userLogin}</h2>
<!-- debug -->

<h3>
	<a href="createUserForm.do">Create User</a>
</h3>
<h3>
	<a href="userLogin.do">User Login</a>
</h3>
<body>

</body>
</html>