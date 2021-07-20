<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>


</head>
<body>
<%@ include file="NavBar.jsp" %>
	
	
	<div>
	<!-- change inline style to css -->
		<div class="card mx-auto mt-3" style="width:95%;">
			<c:if test="${sessionScope.user.role}">
				<div class="d-flex justify-content-around w-50 mx-auto mt-3">
						<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#EditJob">Edit Job</button>
						<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#CreateTask">Create Task</button>
				  		<a class="btn btn-success" href="markJobComplete.do?id=${job.id}" role="button">
				  		<c:choose>
				  			<c:when test="${job.isComplete}">
				  				Mark as Incomplete
				  			</c:when>
				  			<c:otherwise>
				  				Mark Job Complete
				  			</c:otherwise>
				  		</c:choose>
				  		
				  		</a>
				  		<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#DeleteJob">Delete Job</button>
				</div>		
			</c:if>
			<div class="container-fluid p-2 m-2">
			    <div class="row">
			    	<div class="col-6">
			    		<h2>${job.jobName}</h2>
			    	</div>
			    	<div class="col-3">
			    		<h4>Start Date</h4>
			    		<p>${job.startDate}</p>
			    	</div>
			    	<div class="col-3">
			    		<h4>Completion Date</h4>
			    		<p>${job.endDate}</p>
			    	</div>
			    </div>
			    <div class="row">
			    	<div class="col-5">
			    		<div class="container-fluid">
			    			<c:choose>
			    				<c:when test="${not empty messages}">
			    					<c:forEach var="message" items="${messages}">
										  <div class="card-body row border mt-1 mb-1 p-0">
    											<div class="border col-2">
    												<h5>${message.user.username}</h5>
    												<p>Created:</p>
    												<p>${message.creationTime}</p>
    											</div>
    											<div class="container col">
    												<div class="col-8">
    													<p>${message.messageBody}</p>
    												</div>
    												<c:if test="${sessionScope.user.id == message.user.id }">
    													 <div class="col">
    														<button class="btn btn-link btn-sm" data-bs-toggle="modal" data-bs-target="#edit${message.id}">Edit</button>
    													</div>	
    												</c:if>

    											</div>
	   										</div>
	   										<%@ include file="EditMessageModal.jsp" %>
			    					</c:forEach>
			    				</c:when>
			    					<c:otherwise>
			    						 <div class="card-body row border mt-1 mb-1 p-0">
    											<div class="border col-2">
    											</div>
    											<div class="container col">
    												<div class="col-8">
    													<p>No messages recorded yet.</p>
    												</div>
    												<div class="col">
    												</div>
    											</div>
	   										</div>
			    					</c:otherwise>
			    			</c:choose>
			    		</div>
			    		<form action="message.do?jobId=${job.id }" method="POST">
			    		   <div class="m-2 col" >
    							<label for="messageBody" class="form-label">Reply:</label>
   								 <textarea class="form-control" name="messageBody"></textarea>
  							</div>
			    			<input class="btn btn-primary" type="submit">
			    		</form>
			    	</div>
			    	<div class="col-7">
			    		<c:choose>
					      		<c:when test="${not empty tasks}">
					      		<table class="table">
					      		 	<thead>
										    <tr>
										      <th scope="col">Task Name <br><em>Contractor</em></th>
										      <th scope="col">Task Details</th>
										      <th scope="col">Priority Number</th>
										      <th scope="col">Begin Date</th>
										      <th scope="col">End Date</th>
										      <th scope="col">Completion Status</th>
										      <th scope="col">Edit Task</th>
										    </tr>
									</thead>
					      			<c:forEach var="task" items="${tasks}">
					      			
										 
										  <tbody>
										    <tr>
										<!--        <th scope="row">1</th>     -->
										      <td>${task.taskName} <br><em>${task.contractor.companyName}</em></td>
										      <td><button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#taskDetails${task.id}">View</button></td>
										      <td>${task.priorityNumber}</td>
										      <td>${task.beginTime}</td>
										      <td>${task.endTime}</td>
										      <td>
										      	<c:if test="${task.isComplete}">Completed</c:if>
										      	<c:if test="${!task.isComplete}">
										      		<a class="btn btn-primary btn-sm" href="setTaskComplete.do?id=${task.id}" role="button">Mark Complete</a>
										      	</c:if>
										      </td>
										      <td>
									  <!-- UPDATE THIS BUTTON FOR UPDATING / EDITING TASK -->
										      		<%-- <a class="btn btn-primary" href="editTask.do?id=${task.id}" role="button">Update Task</a> --%>
										      		<button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#updateTask${task.id}">Update</button>
										      </td>
										    </tr>
										  </tbody>
										
									<%@ include file="ViewTaskDetailsModal.jsp" %>
									<%@ include file="EditTaskModal.jsp" %>
					    		  	</c:forEach>
					    		  	</table>
					      		</c:when>
					      		<c:otherwise>No tasks associated with this job.</c:otherwise>
					      		</c:choose>
			    	</div>
			    </div>
			    <div class="row">
			    	<div class="col">
			    		${job.jobDescription}
			    	</div>
			    </div>
			</div>
		</div>
	</div>


<%@ include file="CreateTaskModal.jsp" %>
<%@ include file="DeleteJobModal.jsp" %>
<%@ include file="EditJobModal.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>