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
<title>Admin User Display</title>
</head>
<body>
<header>
		<%@include file="navbar.jsp"%>
	</header>
	<h3>All Registered Users</h3>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">User Name</th>
				<th scope="col">First Name</th>
				<th scope="col">Last Name</th>
				<th scope="col">Email</th>
				<th scope="col">Profile Picture</th>
				<th scope="col">Bio</th>
				<th scope="col">Password</th>
				<th scope="col">Enabled</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="users" items="${users}">
				<c:if test="${userLogin.id == 1}">
					<tr>
						<td>${users.username}</td>
						<td>${users.firstName}</td>
						<td>${users.lastName}</td>
						<td>${users.emailAddress}</td>
						<c:choose>
						<c:when test="${users.profileImageUrl != null}">
						<td>Yes</td>
						</c:when>
						<c:otherwise>
						<td>No</td>
						</c:otherwise>
						</c:choose>
						<c:choose>
						<c:when test="${users.biography != null}">
						<td>Yes</td>
						</c:when>
						<c:otherwise>
						<td>No</td>
						</c:otherwise>
						</c:choose>
						<td>${users.password}</td>
						<td>${users.enabled}</td>
					</tr>
					<tr>
						<td colspan=7>	<a href="viewFriend.do?otherUserId=${users.id }">See Profile</a>   <a href="updateProfileByAdmin.do?id=${users.id }">Edit Profile</a></td>
						<c:choose>
							<c:when test="${users.enabled == true && users.id != 1}">
								<td><a href="archiveUser.do?id=${users.id }">Archive</a></td>
							</c:when>
							<c:when test="${users.id != 1}">
								<td><a href="unArchiveUser.do?id=${users.id }">Unarchive</a></td>
							</c:when>
						</c:choose>
					</tr>
				</c:if>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>