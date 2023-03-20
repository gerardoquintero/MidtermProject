<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">


<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container-fluid">
		<a class="navbar-brand" href="home.do">Bewitched Traveler</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				
				<li class="nav-item"><a class="nav-link" href="createUserForm.do">Create Account</a></li>
				<li class="nav-item"><a class="nav-link" href="userLogin.do">Login</a></li>
				<li class="nav-item"><a class="nav-link" href="logout.do">Logout</a></li>
				<form class="d-flex" method="GET" action="keyword.do">
					<input class="form-control me-2" type="text" name="keyword"
						placeholder="Search by keyword">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>


			</ul>
		</div>
	</div>
</nav>
