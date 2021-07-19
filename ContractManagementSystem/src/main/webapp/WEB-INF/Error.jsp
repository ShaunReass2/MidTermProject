<%@ page language="java" contentType="text/html; charset=UTF-8"
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
			<a href="home.do" class="btn btn-primary w-50">Go Home</a>
		</div>
	</div>
	
	
	</c:otherwise>
</c:choose>
</div>
<%@ include file="LoginModal.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>