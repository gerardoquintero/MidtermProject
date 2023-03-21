<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
${users }
	<c:forEach var="user" items="${users}">
		<div class="card">
			<a href="show.do?id=${user.id}"> <img src="${user.imageURL}"
				alt="${user.name}">
				<h5>${user.name}</h5> Cook Time: ${user} minutes
			</a>
		</div>
	</c:forEach>
</body>
</html>