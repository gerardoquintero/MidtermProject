<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<link rel="stylesheet" href="../css/loginAndRegister.css">
<title>Insert title here</title>
</head>
<body class="text-center">

	<header>
		<%@include file="navbar.jsp"%>
	</header>
	<form action="sendMessage.do" method="POST">
		<div class="form-outline mb-4">
			<label for="message">Message:</label> <input type="text"
				name="message" class="form-control">
		</div>
		<div class="form-outline mb-4">
			<label for="receiver">To:</label> <input type="text" name="receiver"
				class="form-control">
		</div>
		<button type="submit"
			class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3">Submit
			Message</button>
	</form>

</body>
</html>