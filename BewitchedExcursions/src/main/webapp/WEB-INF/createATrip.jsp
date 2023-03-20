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
<title>Trips</title>
</head>
<body>${trip }

<body>
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
</body>


</body>
</html>