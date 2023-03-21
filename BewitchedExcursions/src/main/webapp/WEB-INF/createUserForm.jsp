<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<%@include file="navbar.jsp"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<title>Registration Form</title>
</head>
<body class="text-center">
	<div class="container">
		<!-- ROW1 -->
		<div class="row"></div>

		<!-- ROW2 -->
		<div class="row">
			<!-- COLUMN1 -->
			<div class="col"></div>
			<!-- COLUMN2 -->
			<div class="col">
				<div class="card centerered-card">
					<div class="card-body">
						<h2>Registration Form</h2>
						<form action="register.do" method="POST">
							<label for="firstName">First Name:</label> <input class="form-control" type="text"
								id="firstName" name="firstName" required> 
							<label for="lastName">Last Name:</label> <input class="form-control" type="text"
								id="lastName" name="lastName" required>
							<label for="username">User Name:</label> <input class="form-control" type="text"
								id="username" name="username" required>
							<label for="email">Email:</label> <input class="form-control" type="email" id="email"
								name="email" required><label
								for="password">Password:</label> <input class="form-control" type="password"
								id="password" name="password" required>
							<!-- 	<label for="address">Address ID:</label>
		<textarea id="address" name="userAddress"></textarea><br><br> -->
							<button class="btn btn-lg btn-primary btn-block" type="submit">Register</button>

						</form>
					</div>
				</div>
			</div>
			<!-- COLUMN3 -->
			<div class="col"></div>
		</div>

		<!-- ROW3 -->
		<div class="row"></div>
	</div>
</body>
</html>
