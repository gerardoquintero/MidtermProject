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
<title>Insert title here</title>
</head>
<body>
	<div class="container my-5">
		<form action="createTripForm.do" method="POST">
			<div class="form-group">
				<label for="name">Name:</label>
				<input type="text" id="name" name="name" class="form-control" required="required">
			</div>

			<div class="form-group">
				<label for="imageURL">Image URL:</label>
				<input type="text" id="imageURL" name="imageURL" class="form-control">
			</div>

			<div class="form-group">
				<label for="description">Description:</label>
				<input type="text" id="description" name="description" class="form-control"></input>
			</div>

			<div class="form-group">
				<label for="capacity">How many travelers?:</label>
				<input type="number" id="capacity" name="capacity" class="form-control"></input>
			</div>

			<div class="form-group">
				<label for="startDate">Start Date:</label>
				<input type="date" id="startDate" name="startDate" class="form-control"></input>
			</div>

			<div class="form-group">
				<label for="endDate">End Date:</label>
				<input type="date" id="endDate" name="endDate" class="form-control">
			</div>

	

			<button type="submit" class="btn btn-primary">Create Trip</button>
		</form>
	</div>
</body>
</body>
</html>