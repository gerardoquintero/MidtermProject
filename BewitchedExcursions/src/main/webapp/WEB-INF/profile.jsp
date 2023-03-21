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
<title>User Profile</title>

</head>
<body>
    <div class="container">
        <h1>User Profile</h1>
        
        <form action="search.do" method="GET">
            <div class="input-group mb-3">
                <input type="text" class="form-control" placeholder="Search for users" name="keyword">
                <button class="btn btn-outline-secondary" type="submit">Search</button>
            </div>
        </form>
        
        <h3>My Trips</h3>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Name</th>
                    <th scope="col">Start Date</th>
                    <th scope="col">End Date</th>
                    <th scope="col">Organizer</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="trip" items="${trips}">
                    <c:if test="${trip.organizer.id == userLogin.id}">
                        <tr>
                            <c:url var="viewTripUrl" value="show.do">
                                <c:param name="id" value="${trip.id}" />
                            </c:url>
                            <td><a href="${viewTripUrl}">${trip.name}</a></td>
                            <td>${trip.startDate}</td>
                            <td>${trip.endDate}</td>
                            <td>${trip.organizer}</td>
                        </tr>
                    </c:if>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <div>
      <c:if test="${userLogin.id == 1}">
        <!--todo  -->
        <h1>Admin Control</h1>
          </c:if> 
          </div>
</body>
</html>


