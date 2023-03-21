<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Where do you want to go</title>
	<link rel="stylesheet" href="../css/main.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
		crossorigin="anonymous">
</head>
<body>

	<header>
		<%@include file="navbar.jsp"%>
	</header>

	<section class="hero">
		<div class="container">
			<h1>Welcome Bewitched Travelers!</h1>
			<p>Plan your next adventure</p>
		</div>
	</section>

	<section class="featured-trips">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h2>Featured Trips</h2>
				</div>
			</div>
			<div class="row">
				<c:forEach var="trip" items="${trips}" varStatus="status">
					<c:if test="${status.count <= 3}">
						<div class="col-md-4">
							<div class="card">
								<img src="${trip.imageURL}" class="card-img-top" alt="${trip.name}">
								<div class="card-body">
									<h5 class="card-title">${trip.name}</h5>
									<p class="card-text">${trip.description}</p>
								</div>
								<ul class="list-group list-group-flush">
									<li class="list-group-item"><strong>Number of Travelers:</strong> ${trip.capacity}</li>
									<li class="list-group-item"><strong>Start Date:</strong> ${trip.startDate}</li>
									<li class="list-group-item"><strong>End Date:</strong> ${trip.endDate}</li>
								</ul>
								<div class="card-body">
									<a href="show.do?id=${trip.id}">View Trip</a>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</section>

	<footer>
		<p>&copy; 2023 Bewitched Travelers. All Rights Reserved.</p>
	</footer>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
		integrity="sha384-IBTw8fR6U+h2QYzZ9qM4J8EM0Wb7+O5g0f61G2h8aJHup+OVZ+yIlX9z/N5CV5Jo"
		crossorigin="anonymous"></script>
</body>
</html>
