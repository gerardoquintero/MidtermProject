<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
		crossorigin="anonymous">
		<link rel="stylesheet" href="css/loginAndRegister.css">
	<title>Registration Form</title>
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
							<div class="col-lg-6 d-flex align-items-center gradient-custom-2">
								<div class="text-white px-3 py-4 p-md-5 mx-md-4">
									<h4 class="mb-4">The intersection of trip planning and social</h4>
									<p class="small mb-0">Welcome to our vacation trip planner website! 
														  <strong>Let's get to know you!
														  		  
														  		 What's our new buddy's First Name?
														  		 
														  		 What's our new buddy's Last Name?
														  		 
														  		  What's our new buddy's Username? 
														  		  
														  		  What's our new buddy's Email?
														  		  
														  		  Give us a secret password, we wont tell anyone..
														  		  </strong></p>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="card-body p-md-5 mx-md-4">

									<div class="text-center">
										<img
											src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/lotus.webp"
											style="width: 185px;" alt="logo">
										<h4 class="mt-1 mb-5 pb-1">Become a buddy...</h4>
									</div>
									<form class="form-signin" action="register.do" method="POST">
										  <div class="form-outline mb-4">
											<label class="form-label" for="firstName">First Name</label>
											<input type="text" id="firstName" 
												class="form-control" name="firstName"/> 
										</div> 

										 <div class="form-outline mb-4">
											<label class="form-label" for="lastName">Last Name</label>
											<input type="text" id="lastName"
												class="form-control" name="lastName"/> 
										</div> 
 
										<div class="form-outline mb-4">
											<label class="form-label" for="username">Username:</label>
											<input type="text" id="username"
												class="form-control" name="username" required/> 
										</div>

										<div class="form-outline mb-4">
											<label class="form-label" for="email">Email:</label>
											<input type="text" id="email"
												class="form-control" name="email" required/> 
										</div>
			
										<div class="form-outline mb-4">
											<label class="form-label" for="password">Password:</label>
											<input type="password" id="password"
												class="form-control" name="password" required/> 
										</div>
										
										<div class="text-center pt-1 mb-5 pb-1">
											<button
												class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3"
												type="submit">Create Account</button>
										</div>
									</form>
									<form action="userLogin.do" method="GET">
										<div
											class="d-flex align-items-center justify-content-center pb-4">
											<p class="mb-0 me-2">Already have an account?</p>
											<button type="submit" class="btn btn-outline-danger">Login</button>
										</div>	
									</form>
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
