<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User List</title>
</head>
<body>
	<h1>User List</h1>
	<ul>
		<c:forEach var="user" items="${users}">
				<form action="addFriend.do">
			
					 <input type="hidden" name="otherUserId" value="${user.id}">
					<p>${user.username}</p><input type="submit" name="submit"
					value="Add Friend" />
			</form>
			
		</c:forEach>
	</ul>


</body>
</html>
