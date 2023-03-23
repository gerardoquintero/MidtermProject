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
<title>Admin Trip Display</title>

</head>
<body>

	<header>
		<%@include file="navbar.jsp"%>
	</header>

	<div class="container">
		<h1 class="gradient-text2">Admin</h1>

		<h3><a href="userAdmin.do">See Users</a></h3>
		
		<h3 class="gradient-text2">All Trips</h3>

		<table class="table">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Start Date</th>
					<th scope="col">End Date</th>
					<th scope="col">${trip.organizer.username}</th>
					<th scope="col">Enabled</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="trip" items="${trips}">
					<c:if test="${userLogin.id == 1}">
						<tr>
							<td><a href="show.do?id=${trip.id }">${trip.name}</td>
							<td>${trip.startDate}</td>
							<td>${trip.endDate}</td>
							<td>${trip.organizer}</td>
							<td>${trip.enabled}</td>
						</tr>
						<tr>
							<td colspan=3><a href="updateThisTrip.do?id=${trip.id }">Edit ${trip.name}</a></td>
							<td></td>
							<c:choose>
								<c:when test="${trip.enabled == true }">
									<td><a href="archiveTrip.do?id=${trip.id }">Archive Trip</a></td>
								</c:when>
								<c:otherwise>
									<td><a href="unArchiveTrip.do?id=${trip.id }">Unarchive Trip</a></td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:if>
				</c:forEach>

			</tbody>
		</table>
	</div>

</body>
</html>
