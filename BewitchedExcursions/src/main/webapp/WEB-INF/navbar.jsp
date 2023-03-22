<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav class="navbar navbar-expand-lg gradient-custom-2" style="background-color: #eee;">
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
          <li class="nav-item">
            <a class="nav-link" href="message.do">send message</a>
          </li>
          <c:choose>
          <c:when test="${userLogin.id == 1}">
          <li class="nav-item">
            <a class="nav-link" href="admin.do">Admin</a>
          </li>
          </c:when>
          <c:otherwise>
           <li class="nav-item">
            <a class="nav-link" href="profile.do?id=${userLogin.id}">${userLogin.username}</a>
          </li>
          </c:otherwise>
          </c:choose>
        </c:if>
      </ul>
    </div>
  </div>
</nav>
	
