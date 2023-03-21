<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>User List</title>
</head>
<body>
	<div class="container">
		<h1>User List</h1>
		<ul>
			<c:forEach var="user" items="${users}">
				<li>
					<span>${user.username}</span>
					<form action="addFriend.do">
						<input type="hidden" name="otherUserId" value="${user.id}">
						<input type="submit" name="submit" value="Add Friend" />
					</form>
				</li>
			</c:forEach>
		</ul>
	</div>
</body>
</html>
