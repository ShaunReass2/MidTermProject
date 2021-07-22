<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="css/error.css">

</head>
<body>
<%@ include file="NavBar.jsp" %>

<div class="error container-fluid p-0 d-flex flex-column justify-content-center">
<c:choose>
	<c:when test="${loginFailFlag}">
		<div class="card mx-auto w-50 justify-content-center no-background">
  			<div class="card-body errorPageCard">  
				<h4>Incorrect user name or password. </h4>
				<h4>Please return to the home page and try again.</h4>
				<a class="btn btn-primary w-40 mx-auto" style="vertical-align: middle" href="home.do" role="button">Return to Home Page</a>	
			</div>
		</div>
	</c:when>
	<c:when test="${accountCreationFlag}">
		<div class="card mx-auto w-50 justify-content-center no-background">
  			<div class="card-body errorPageCard">  
				<h4>This user name already exists.</h4>
				<h4>Please return to the home page and login.</h4>
				<a class="btn btn-primary w-40 mx-auto " style="vertical-align: middle" href="home.do" role="button">Return to Home Page</a> 
			</div>
		</div>
	</c:when>
	<c:otherwise>
		<div class="card mx-auto w-50 justify-content-center no-background">
  			<div class="card-body errorPageCard">  
			<h2>Please login or create an account.</h2>		
			<p>To create an account please go to the home page</p>
			<a class="btn btn-primary w-40 mx-auto" style="vertical-align: middle" href="home.do" role="button">Return to Home Page</a>		
		</div>
	</div>
	</c:otherwise>
</c:choose>
</div>

<%@ include file="LoginModal.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html> 


<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>


</head>
<body style="height: 50vh;">
<%@ include file="NavBar.jsp" %>

<div class="d-flex justify-content-center h-100 align-items-center">
<c:choose>
	<c:when test="${loginFailFlag}">Incorrect user name or password.</c:when>
	<c:when test="${accountCreationFlag}">This user name already exist please try again.</c:when>
	<c:otherwise>
	<div>
		<h2>Please login or create an account.</h2>
		<div class="text-center">
			<p>To create an account please go to the home page</p>
			<a href="home.do" class="btn btn-primary w-50">Return to Home Page</a>
		</div>
	</div>
	
	
	</c:otherwise>
</c:choose>
</div>
<%@ include file="LoginModal.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html> --%>