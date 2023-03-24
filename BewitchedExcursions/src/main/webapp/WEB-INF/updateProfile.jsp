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
<title>Update User Form</title>
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
							<div class="col-md-12">
								<div class="card-body p-md-5 mx-md-4">
								<h1>Update User</h1>
								<form action="updateProfileForm.do" method="POST">
									<div class="form-outline mb-4">
										<input type="hidden" name="id" value="${userLogin.id}">
									</div>
									<div class="form-outline mb-4">
										<label class="form-label" for="firstName">First Name </label> <br>
										<input class="form-control" type="text" name="firstName" value="${userLogin.firstName}"> 
									</div>
										<br>
									<div class="form-outline mb-4">
										<label class="form-label" for="lastName">Last Name </label> <br>
										<input class="form-control" type="text" name="lastName" value="${userLogin.lastName}"> 
									</div>	
										<br>
									<div class="form-outline mb-4">
										<label class="form-label" for="emailAddress">Email </label> <br>
										<input class="form-control" type="text" name="emailAddress" value="${userLogin.emailAddress}"> 
									</div>	
										<br>
									<div class="form-outline mb-4">
										<label class="form-label" for="profileImageUrl">Profile Picture </label> <br>
										<input class="form-control" type="text" name="profileImageUrl" value="${userLogin.profileImageUrl}"> 
									</div>	
										<br>
									<div class="form-outline mb-4">
										<label class="form-label" for="password">Password</label><br>
										<input class="form-control" type="text" name="password" value="${userLogin.password}">
									</div>	
										<br>
									<div class="form-outline mb-4">
										<label class="form-label" for="biography">Biography </label> <br>
										<textarea class="form-control" rows="10" cols="40" name="biography">${userLogin.biography}</textarea> <br>
									</div>	
										<br>				
									<div class="form-outline mb-4">
										<button type="submit" class="btn btn-outline-danger">Update</button>
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