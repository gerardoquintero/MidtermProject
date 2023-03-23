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
	<title>Update Trip</title>

</head>
<body>

	<header>
		<%@include file="navbar.jsp"%>
	</header>
<c:if test="${userLogin.id == 1}">
<h1>Update Trip</h1>
	<form action="updateTripForm.do" method="POST">
		<input type="hidden" name="id" value="${trip.id }"> <br>
		<label for="name">Name</label><br> 
		<input type="text" name="name" value="${trip.name}"> <br> 
		<label for="description">Description </label><br> 
		<textarea rows="10" cols="40" name="description"> ${trip.description}</textarea><br> 
		<label for="capacity">Number of travelers </label><br> 
		<input type="number" name="capacity"value="${trip.capacity}"><br> 
		<label for="start_date">Start Date </label> <br>
		<input type="date"name="startDate" value="${trip.startDate}"> <br>
		<label for="end_date">End Date </label><br> 
		<input type="date" name="endDate" value="${trip.endDate}"><br> 
		<label for="image">Image URL </label><br> 
		<input type="text" name="imageURL" value="${trip.imageURL}"><br> 
		 <input type="submit" value="Update Trip" />
	</form>
</c:if>


</body>
</html>
