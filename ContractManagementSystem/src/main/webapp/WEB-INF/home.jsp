<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CMS </title>

<%@ include file="NavBar.jsp" %>

</head>

<body>

<h1>CMS is Awesome!</h1>

<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#ContractorSignUp">
  Contractor Sign Up
</button>



<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#AdminSignUp">
  Admin Sign Up
</button>

<%@ include file="ContractorSignUpModal.jsp" %>
<%@ include file="AdminSignUpModal.jsp" %>
<%@ include file="LoginModal.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>