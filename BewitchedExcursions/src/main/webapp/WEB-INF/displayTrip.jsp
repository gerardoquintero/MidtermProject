<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/main.css">
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
				<br>
				<c:if test="${trip.id == 1 }">
				<div>
					<iframe
						src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d380056.51344122086!2d12.255816734577367!3d41.91024161323053!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x132f6196f9928ebb%3A0xb90f770693656e38!2sRome%2C%20Metropolitan%20City%20of%20Rome%20Capital%2C%20Italy!5e0!3m2!1sen!2sus!4v1679609902036!5m2!1sen!2sus"
						width="300" height="300" style="border: 0;" allowfullscreen=""
						loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
				</div>
			</c:if>
				<c:if test="${trip.id == 2 }">
				<div>
				
			<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2624.991440608209!2d2.292292615782932!3d48.858373608661694!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47e66e2964e34e2d%3A0x8ddca9ee380ef7e0!2sEiffel%20Tower!5e0!3m2!1sen!2sus!4v1679610514667!5m2!1sen!2sus" width="300" height="300" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
				</div>
			</c:if>
				<c:if test="${trip.id == 3 }">
				<div>
<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3326421.0385235352!2d137.526523965223!3d35.4929506063318!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x605d1b87f02e57e7%3A0x2e01618b22571b89!2sTokyo%2C%20Japan!5e0!3m2!1sen!2sus!4v1679610622310!5m2!1sen!2sus" width="300" height="300" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
				</div>
			</c:if>
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
						<li>${review.user.username}:&nbsp${review.comment}(Rating:&nbsp
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
				<input type="hidden" name="id.userId" value="${ userLogin.id}" /> <input
					type="hidden" name="id.tripId" value="${ trip.id}" /> <input
					type="hidden" name="user.id" value="${ userLogin.id}" /> <input
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