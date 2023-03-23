<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="../css/loginAndRegister.css">
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
		crossorigin="anonymous">
	<title>User Profile</title>

</head>
<body>

	<header>
		<%@include file="navbar.jsp"%>
	</header>
	<!-- Row 1 -->
	<div class="row">
		<!-- Column 1 -->
		<div class="col-md-1"></div>
		<!-- Column 2 -->
		<div class="col-md-10">
			<form action="search.do" method="GET">
				<div class="input-group mb-3 mt-3">
					<input type="text" class="form-control"
						placeholder="Search for users" name="keyword">
					<button class="btn btn-primary btn-block fa-lg gradient-custom-2" type="submit">Search</button>
				</div>
			</form>
		</div>
		<!-- Column 3 -->
		<div class="col-md-1"></div>
	</div>

	<!-- Row 2 -->
	<div class="row">
		<!-- Column 1 -->
		<div class="col-md-1"></div>
		<!-- Column 2 -->
		<div class="col-md-4">
			<h3>User Profile</h3>
			<div class="card mt-3 text-white">
				<div class="card-body gradient-custom-2">
					<h5 class="card-title">${user.username}</h5>
					<h5 class="card-title">${user.firstName}</h5>
					<h5 class="card-title">${user.lastName}</h5>
					<h5 class="card-title">${user.emailAddress}</h5>
					<h5 class="card-title">${user.biography}</h5>
					<br>
					<table border="4px">
						<tr>
						</tr>
						<tr>
							<td><img src="https://myspace.com/common/images/user.png"
								height=130 width=130></td>
						</tr>
					</table>
					<p class="card-text">Welcome to my page!</p>
				</div>
			</div>
		</div>
		<!-- Column 3 -->
		<div class="col-md-6">
			<h3> Trips</h3>
			${trips }
			<c:forEach var="trip" items="${trips}">
				
					<div class="card mt-3 gradient-custom-2 text-white">
						<div class="card-body">
							<table class="table">
								<thead>
									<tr>
										<th scope="col">Name</th>
										<th scope="col">Start Date</th>
										<th scope="col">End Date</th>
										<th scope="col">Organizer</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<c:url var="viewTripUrl" value="show.do">
											<c:param name="id" value="${trip.id}" />
										</c:url>
										<td><a href="${viewTripUrl}">${trip.name}</a></td>
										<td>${trip.startDate}</td>
										<td>${trip.endDate}</td>
										<td>${trip.organizer}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				
			</c:forEach>
		</div>
		<!-- Column 4 -->
		<div class="col-md-1"></div>
	</div>

	<!-- Row 3 -->

	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
		integrity="sha384-IBTw8fR6U+h2QYzZ9qM4J8EM0Wb7+O5g0f61G2h8aJHup+OVZ+yIlX9z/N5CV5Jo"
		crossorigin="anonymous"></script>
</body>
</html>


