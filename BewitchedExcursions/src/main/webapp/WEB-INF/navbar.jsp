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
      <ul class="navbar-nav ms-auto">
        <c:if test="${userLogin == null}">
          <li class="nav-item">
            <a class="nav-link" href="createUserForm.do">Create Account</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="userLogin.do">Login</a>
          </li>
        </c:if>
        <c:if test="${userLogin != null}">
          <li class="nav-item">
            <a class="nav-link" href="createTripForm.do">Create a Trip</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="logout.do">Logout</a>
          </li>
        </c:if>
        <li class="nav-item">
          <span class="nav-link">${userLogin.username}</span>
        </li>
      </ul>
    </div>
  </div>
</nav>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/js/bootstrap.min.js"></script>
		
