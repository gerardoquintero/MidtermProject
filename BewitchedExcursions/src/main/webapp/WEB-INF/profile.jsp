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
	<!-- Row 1 -->
	<div class="row">
		<!-- Column 1 -->
		<div class="col-md-1"></div>
		<!-- Column 2 -->
		<div class="col-md-10">
			<form action="search.do" method="GET">
            <div class="input-group mb-3 mt-3">
                <input type="text" class="form-control" placeholder="Search for users" name="keyword">
                <button class="btn btn-outline-secondary" type="submit">Search</button>
            </div>
        </form>	
		</div>
		<!-- Column 3 -->
		<div class="col-md-1"></div>
	</div>
	
	<!-- Row 2 -->
	<div class="row">
		<!-- Column 1 -->
		<div class="col-md-1"></div>
		<!-- Column 2 -->
		<div class="col-md-4">
			<h3>User Profile</h3>
			<div class="card mt-3">
			  <div class="card-body">
			    <h5 class="card-title">Card title</h5>
			    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
			    <button type="button" class="btn btn-primary">Button</button>
			  </div>
			</div>
		</div>
		<!-- Column 3 -->
		<div class="col-md-6">
			<h3>My Trips</h3>
			<c:forEach var="trip" items="${trips}">
            	<c:if test="${trip.organizer.id == userLogin.id}">
            		<div class="card mt-3">
					  <div class="card-body">
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
				                <tr>
			                    <c:url var="viewTripUrl" value="show.do">
			                        <c:param name="id" value="${trip.id}" />
			                    </c:url>
			                    <td><a href="${viewTripUrl}">${trip.name}</a></td>
			                    <td>${trip.startDate}</td>
			                    <td>${trip.endDate}</td>
			                    <td>${trip.organizer}</td>
			                </tr>
				            </tbody>
			       		 </table>
					  </div>
					</div>
                </c:if>
			</c:forEach>
		</div>
		<!-- Column 4 -->
		<div class="col-md-1"></div>
	</div>
	
	<!-- Row 3 -->	
	<div class="row">
		<div>
	      <c:if test="${userLogin.id == 1}">
	        <!--todo  -->
	        <h1>Admin Control</h1>
	       </c:if> 
        </div>
	</div>



    
        
        
        
        
        
       
  
    
</body>
</html>


