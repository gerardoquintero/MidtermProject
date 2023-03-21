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
<title>Admin</title>

</head>
<body>
	<div class="container">
		<h1>Admin Controls</h1>

		<h3>All Trips</h3>

		<table class="table">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Enabled</th>
					<th scope="col">Start Date</th>
					<th scope="col">End Date</th>
					<th scope="col">Organizer</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="trip" items="${trips}">
					<c:if test="${userLogin.id == 1}">
						<tr>
							<td><a href="${viewTripUrl}">${trip.name}</a></td>
							<td>${trip.enabled}</td>
							<td>${trip.startDate}</td>
							<td>${trip.endDate}</td>
							<td>${trip.organizer}</td>
						</tr>
						<tr>
							<td>Admin options:</a></td>
							<td><a href="show.do?id=${trip.id }">Display</a></td>
							<td><a href="updateThisTrip.do?id=${trip.id }">Update</a></td>
							<c:choose>
								<c:when test="${trip.enabled == true }">
									<td><a href="archiveTrip.do?id=${trip.id }">Archive</a></td>
								</c:when>
								<c:otherwise>
									<td><a href="unArchiveTrip.do?id=${trip.id }">Unarchive</a></td>
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
