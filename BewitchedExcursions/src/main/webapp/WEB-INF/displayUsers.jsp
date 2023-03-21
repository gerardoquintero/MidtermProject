<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="../css/main.css">
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
		crossorigin="anonymous">
	<title>User List</title>
</head>
<body style="text-align: center;">

	<header>
		<%@include file="navbar.jsp"%>
	</header>
	<!-- Row 1 -->
	<div class="row">
		<!-- Column 1 -->
		<div class="col-md-1"></div>
		<!-- Column 2 -->
		<div class="col-md-10"></div>
		<!-- Column 3 -->
		<div class="col-md-1"></div>
	</div>

	<!-- Row 2 -->
	<div class="row">
		<!-- Column 1 -->
		<div class="col-md-2"></div>
		<!-- Column 2 -->
		<div class="col-md-8">
			<h3>User List</h3>
			<c:forEach var="user" items="${users}">
				<div class="card mt-3" style="display: flex;">
					<div class="card-body" style="justify-content: space-evenly;">
						<p>${user.username}</p>
						<div>
							<form action="addFriend.do">
							<input type="hidden" name="otherUserId" value="${user.id}">
							<input type="submit" name="submit" value="Add Friend" />
						</form>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- Column 3 -->
		<div class="col-md-2"></div>
	</div>

	<!-- Row 3 -->
	<div class="row"></div>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
		integrity="sha384-IBTw8fR6U+h2QYzZ9qM4J8EM0Wb7+O5g0f61G2h8aJHup+OVZ+yIlX9z/N5CV5Jo"
		crossorigin="anonymous"></script>
</body>
</html>
