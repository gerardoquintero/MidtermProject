<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="navbar.jsp"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<title></title>
</head>
<body class="text-center">

	<div class="container">
		<div class="card centerered-card">
			<!-- style="width: 40vw;" -->

			<div class="card-body">
				<form class="form-signin" action="login.do" method="POST">
					<!-- <img class="mb-4"
						src="https://getbootstrap.com/docs/4.0/assets/brand/bootstrap-solid.svg"
						alt="" width="72" height="72"> -->
					<h2>Please Log In</h2>
					<label for="username">Username</label>
					<input
						type="text" id="username" class="form-control"
						placeholder="Username" name="username" required=""
						autofocus=""> 
						
					<label for="password">Password</label>
					<input type="password" id="password" class="form-control"
						placeholder="Password" name="password" required="">
						
					<div class="checkbox mb-3">
						<label> <input type="checkbox" value="remember-me">
							Remember me
						</label>
					</div>
					<button class="btn btn-lg btn-primary btn-block" type="submit">Log In</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
