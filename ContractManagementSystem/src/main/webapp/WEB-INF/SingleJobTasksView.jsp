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
			  		<h5>
			  		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#EditJob">Edit Job</button>
			  		<a class="btn btn-success" href="?id=${job.id}" role="button">Mark Job as Complete</a>
			  		<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#DeleteJob">Delete Job</button>
			  		</h5>
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
					      <c:choose>
					    
					      		<c:when test="${not empty tasks}">
					      		 <thead>
										    <tr>
										      <th scope="col">Task Name</th>
										      <th scope="col">Task Details</th>
										      <th scope="col">Priority Number</th>
										      <th scope="col">Begin Date</th>
										      <th scope="col">End Date</th>
										      <th scope="col">Completion Status</th>
										    </tr>
										  </thead>
					      			<c:forEach var="task" items="${tasks}">
					      			<table class="table">
										 
										  <tbody>
										    <tr>
										<!--        <th scope="row">1</th>     -->
										      <td>${task.taskName}</td>
										      <td>${task.taskDetails}</td>
										      <td>${task.priorityNumber}</td>
										      <td>${task.beginTime}</td>
										      <td>${task.endTime}</td>
										      <td>
										      	<c:if test="${task.isComplete}">Completed</c:if>
										      	<c:if test="${!task.isComplete}">
										      		<a class="btn btn-primary" href="setTaskComplete.do?id=${task.id}" role="button">Mark Complete</a>
										      	</c:if>
										      
										      </td>
										    </tr>
										  </tbody>
										</table>
					    		  	</c:forEach>
					      		</c:when>
					      		<c:otherwise>No tasks associated with this job.</c:otherwise>
					      		</c:choose>
					      </td>
					    </tr>
					  </tbody>
					</table>    	
			  	</div>
			</div>
			
				<br>
			
		   	<div class="card" style="width: auto;">
				<div class="card-body">
			  		<h5>Job Details: ${job.jobDescription}</h5>
			  	</div>
			</div>

    	</div>
    	
    	<!-- Right Column -->
    	<div class="col align-self-end">
      		<strong>RIGHT PLEASE MAKE ME NARROWER</strong>
    	</div>
    	
  	</div>
	</div>
	



<%@ include file="DeleteJobModal.jsp" %>
<%@ include file="EditJobModal.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>