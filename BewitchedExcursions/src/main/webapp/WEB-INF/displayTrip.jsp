<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
<title>Trips</title>
</head>

<body>

	<header>
		<%@include file="navbar.jsp"%>
	</header>


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
				<h2>Reviews</h2>
				
				

				<ul>
					<c:forEach items="${trip.tripReviews}" var="review">
						<li>${review.user.username}:${review.comment}(Rating:
							${review.rating})</li>
					</c:forEach>
				</ul>
				<!--  -->
				<!--  -->

				<c:if test="${userLogin.id == trip.organizer.id}">
					<h2>
						<a href="userUpdatesTrip.do?id=${trip.id }">Update this Trip</a>
					</h2>
				</c:if>

			</div>
		</div>


		<%--  <c:if test="${userLogin.reviews.id == review.user.id}"> --%>
		<div>
			<h3>Review Trip</h3>
			<form action="review.do" method="POST">
				<div class="form-group">
					<label for="comment">Review:</label> <input type="text"
						id="comment" name="comment" class="form-control"></input>
				</div>
				<input type="hidden" name="id.userId" value="${ userLogin.id}"/> <input
					type="hidden" name="id.tripId" value="${ trip.id}" /> <input
					type="hidden" name="user.id" value="${ userLogin.id}"/> <input
					type="hidden" name="trip.id" value="${ trip.id}" />
				<h3>Rate Trip</h3>
				<div class="form-group">
					<label for="rating">Rate 1 - 5:</label> <input type="number"
						id="rating" name="rating" class="form-control"></input>
				</div>

				<button type="submit" class="btn btn-primary">Submit</button>
			</form>
		</div>
		<%-- </c:if> --%>
</body>
</html>