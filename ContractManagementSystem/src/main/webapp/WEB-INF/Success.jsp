<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="css/success.css">

</head>
<body>
<%@ include file="NavBar.jsp" %>

	<div class="success container-fluid p-0 d-flex flex-column justify-content-center">		
		<div class="card mx-auto w-50 justify-content-center no-background">
  			<div class="card-body successPageCard">  					
			    <div>
			    	<h4>You have successfully created an account as: </h4>
			    	<p>${accountName}</p>
			    </div>
			   <a class="btn btn-primary" style="vertical-align: middle" href="home.do" role="button"><span>Return to Home Page</span></a>
		 	</div>
		</div>
	</div>
		  
<%@ include file="LoginModal.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>


