<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link href="css/main.css" rel="stylesheet"/>

</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="home.do">CMS</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="home.do">Home</a>
        </li>
          <c:if test="${not empty sessionScope.user}">
            <li class="nav-item">
            	<a class="nav-link" href="showCompletedJobs.do">View Completed Jobs</a>
          	</li>
    	</c:if>
      </ul>
    </div>
    <div class="d-flex">
    	<c:if test="${not empty sessionScope.user}">
    	      <form class="d-flex">
	      		<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
	      		<button class="btn btn-outline-primary" type="submit">Search</button>
      		</form>
    	</c:if>
    	<c:choose>
	      	<c:when test="${empty sessionScope.user}">
	      		<a href="" class="btn btn-outline-light mx-2" data-bs-toggle="modal" data-bs-target="#loginForm">Login</a>
	      	</c:when>
	      	<c:when test="${not empty sessionScope.user}">
	      		<a href="logout.do" class="btn btn-outline-light mx-2">Logout</a>
	      	</c:when>
      </c:choose>

      

  </div>
  </div>
</nav>
</body>
</html>