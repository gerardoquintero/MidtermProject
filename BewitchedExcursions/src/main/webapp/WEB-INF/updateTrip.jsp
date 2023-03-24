<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="css/loginAndRegister.css">
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
		crossorigin="anonymous">
	<title>Update Trip</title>

</head>
<body>

	<header>
		<%@include file="navbar.jsp"%>
	</header>
	
	<section class="h-100 gradient-form" style="background-color: #eee;">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-xl-10">
					<div class="card rounded-3 text-black">
						<div class="row g-0">
							<div class="col-lg-6 d-flex align-items-center gradient-custom-2">
								<div class="text-white px-3 py-4 p-md-5 mx-md-4">
									<img
											src="${trip.imageURL}"
											style="width: 100%;" alt="logo">
								</div>
							</div>
							<div class="col-lg-6">
								<div class="card-body p-md-5 mx-md-4">
									<c:if test="${userLogin.id == 1}">
										<h1>Update Trip</h1>
										<form action="updateTripForm.do" method="POST">
											 <div class="form-outline mb-3">
												<input class="form-control" type="hidden" name="id" value="${trip.id }"> <br>
											</div>
											 <div class="form-outline mb-3">	
												<label class="form-label" for="name">Name</label>
											</div>
											 <div class="form-outline mb-3">	 
												<input class="form-control" type="text" name="name" value="${trip.name}"> <br>
											</div>
											 <div class="form-outline mb-3">	 
												<label class="form-label" for="description">Description </label>
											</div>
											 <div class="form-outline mb-3">	 
												<input class="form-control" type="text" name="description" placeholder="${trip.description}" value="${trip.description}"><br>
											</div>
											 <div class="form-outline mb-3">	 
												<label class="form-label" for="capacity">Number of travelers </label>
											</div>
											 <div class="form-outline mb-3">	 
												<input class="form-control" type="number" name="capacity"value="${trip.capacity}"><br>
											</div>
											 <div class="form-outline mb-3">	 
												<label class="form-label" for="start_date">Start Date </label>
											</div>
											 <div class="form-outline mb-3">	 
												<input class="form-control" type="date"name="startDate" value="${trip.startDate}"> <br>
											</div>
											 <div class="form-outline mb-3">	
												<label class="form-label" for="end_date">End Date </label>
											</div>
											 <div class="form-outline mb-3">	 
												<input class="form-control" type="date" name="endDate" value="${trip.endDate}"><br>
											</div>
											 <div class="form-outline mb-3">	 
												<label class="form-label" for="image">Image URL </label>
											</div>
											 <div class="form-outline mb-3">	 
												<input class="form-control" type="text" name="imageURL" value="${trip.imageURL}"><br>
											</div> 
											<div class="text-center pt-1 mb-4 pb-1">
												<input type="submit" value="Update Trip" />
											</div>
										</form>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>
