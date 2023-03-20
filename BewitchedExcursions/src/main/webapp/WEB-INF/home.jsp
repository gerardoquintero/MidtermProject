<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/main.css">
<%@include file="navbar.jsp"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>Where do you want to go</title>
</head>
<body>

	<section class="hero">
		<div class="container">
			<h1>Welcome Bewitched Travelers!</h1>
			<p>Plan your next adventure</p>

		</div>
	</section>
	<c:forEach var="trip" items="${trip}">
		<div>


			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h1>${trip.name}</h1>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<img src="${trip.imageURL}" alt="${trip.name}" class="img-fluid">
					</div>
					<div class="col-md-8">
						<h2>Description</h2>
						<p>${trip.description}</p>
						<h2>Number of Travelers</h2>
						<p>${trip.capacity}</p>
						<h2>Start Date</h2>
						<p>${trip.startDate}</p>
						<h2>End Date</h2>
						<p>${trip.endDate}</p>
					</div>
				</div>
			</div>
		</div>

	</c:forEach>

	<%-- <section>
		<div class="container">
			<h2>Featured Trips</h2>
			<div class="row">
				<!-- Featured Trip  cards go here -->
				<div class="col-md-4">
					<div class="card">
						<img src="" alt="Trip 1">
						<div class="card-body">
							<h3>${trip.name }</h3>
							<p>trip trip trip</p>
							<a href="" class="btn btn-primary">View Trip</a>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card">
						<img src="" alt="Trip 2">
						<div class="card-body">
							<h3>${trip.name }</h3>
							<p>trip trip trip</p>
							<a href="" class="btn btn-primary">view trip</a>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card">
						<img src="" alt="Trip 3">
						<div class="card-body">
							<h3>${trip.name }</h3>
							<p>trip trip trip.</p>
							<a href="" class="btn btn-primary">view trip</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section> --%>

</body>
</html>