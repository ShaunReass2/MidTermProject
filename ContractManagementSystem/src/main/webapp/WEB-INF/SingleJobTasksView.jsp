<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>


</head>
<body>
<%@ include file="NavBar.jsp" %>



	<div class="container">
  	<div class="row">
   		
   		<!-- Left Column -->
   		<div class="col align-self-start">
     		<strong>LEFT COLUMN PLEAE MAKE ME NARROWER</strong>
    	</div>
    	
    	<!-- Center Column -->
    	<br>
    	<br>
    	<br>
    	<div class="col align-self-center">
   
		   	<div class="card" style="width: auto;">
				<div class="card-body">
			  		<h5>ADMIN BUTTONS HERE</h5>
			  	</div>
			</div>	
						
				<br>
				
		   	<div class="card" style="width: auto;">
				<div class="card-body">
			   		<h5 class="card-title">This is the job for contractor: </h5>
			    		<p class="card-text">${job.jobName} -> ${job.startDate} -> ${job.endDate}</p>
					<table class="table">
					  <thead>
					    <tr>
					      <th scope="col">Messages</th>
					      <th scope="col">Tasks</th>
					    </tr>
					  </thead>
					  <tbody>
					    <tr>
					      <td>
					      	<strong>*** Messages Go Here ***</strong>
					      </td>
					      <td>
					      	*** Tasks Go Here ***
					      </td>
					    </tr>
					  </tbody>
					</table>    	
			  	</div>
			</div>
			
				<br>
			
		   	<div class="card" style="width: auto;">
				<div class="card-body">
			  		<h5>JOB DETAILS HERE</h5>
			  	</div>
			</div>

    	</div>
    	
    	<!-- Right Column -->
    	<div class="col align-self-end">
      		<strong>RIGHT PLEASE MAKE ME NARROWER</strong>
    	</div>
    	
  	</div>
	</div>


<%@ include file="Footer.jsp" %>
</body>
</html>