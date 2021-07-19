<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>


</head>
<body>
<%@ include file="NavBar.jsp" %>

		<br/>
		<br/>
		<br/>
		<div class="card" style="width: 25rem;">
  			<div class="card-body">
   				 <h5 class="card-title">This is the job for contractor: </h5>
    		<p class="card-text">${job.jobName} -> ${job.startDate} -> ${job.endDate}</p>
  			</div>
		</div>


<%@ include file="Footer.jsp" %>
</body>
</html>