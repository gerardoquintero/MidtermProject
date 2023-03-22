<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
		crossorigin="anonymous">
	<link rel="stylesheet" href="../css/loginAndRegister.css">
	<title>Insert title here</title>
</head>
<body class="text-center">

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
							<div class="col-lg-6">
								<div class="card-body p-md-5 mx-md-4">

									<div class="text-center">
										<h4 class="mt-1 mb-5 pb-1">Create a Trip</h4>
									</div>

									<form action="createTripForm.do" method="POST">
										<div class="form-outline mb-4">
											<label for="name">Name:</label> <input type="text" id="name"
												name="name" class="form-control" required="required">
										</div>

										<div class="form-outline mb-4">
											<label for="imageURL">Image URL:</label> <input type="text"
												id="imageURL" name="imageURL" class="form-control">
										</div>

										<div class="form-outline mb-4">
											<label for="description">Description:</label> <input
												type="text" id="description" name="description"
												class="form-control"></input>
										</div>

										<div class="form-outline mb-4">
											<label for="capacity">How many travelers?:</label> <input
												type="number" id="capacity" name="capacity"
												class="form-control"></input>
										</div>

										<div class="form-outline mb-4">
											<label for="startDate">Start Date:</label> <input type="date"
												id="startDate" name="startDate" class="form-control"></input>
										</div>

										<div class="form-outline mb-4">
											<label for="endDate">End Date:</label> <input type="date"
												id="endDate" name="endDate" class="form-control">
										</div>



										<button type="submit"
											class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3">Create
											Trip</button>
									</form>

								</div>
							</div>
							<div class="col-lg-6 d-flex align-items-center gradient-custom-2">
								<div class="text-white px-3 py-4 p-md-5 mx-md-4">
									<h4 class="mb-4">Where would you like to go?</h4>
									<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d47139330.24912588!2d-12.8611109417314!3d43.85258716626324!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x46ed8886cfadda85%3A0x72ef99e6b3fcf079!2sEurope!5e0!3m2!1sen!2sus!4v1679507576255!5m2!1sen!2sus" width="400" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
									<p class="small mb-0">Welcome to our vacation trip planner
										website! We are a team of travel enthusiasts who are
										passionate about helping you plan your dream vacation. Our
										company offers a wide range of services, from finding the
										perfect accommodation to booking activities and
										transportation, ensuring that your trip is as enjoyable and
										stress-free as possible. Our website is designed to make the
										vacation planning process easy and convenient for you. We
										provide you with a comprehensive list of destinations,
										complete with detailed information on each location, including
										top attractions, local culture, and dining options. Our
										user-friendly search feature allows you to filter your search.
										ensuring that you find the perfect vacation package that suits
										your needs and preferences.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</body>
</html>