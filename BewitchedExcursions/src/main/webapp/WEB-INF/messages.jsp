<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
          crossorigin="anonymous">
    <link rel="stylesheet" href="../css/loginAndRegister.css">
    <title>Messages</title>
</head>
<body class="text-center">

<header>
    <%@include file="navbar.jsp"%>
</header>

<div class="container">
    <div class="row justify-content-center align-items-center">
        <div class="col-12 col-md-8 col-lg-6">
            <div class="card">
                <div class="card-header">
                    Messages
                </div>
                <ul class="list-group list-group-flush">
                    <c:forEach var="message" items="${messages}">
                        <li class="list-group-item text-break">
                            <div class="d-flex justify-content-between">
                                <div><strong>${message.sender.username}</strong></div>
                                <div>${message.createDate}</div>
                            </div>
                            <div class="mt-2">${message.message}</div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
</div>

</body>
</html>
