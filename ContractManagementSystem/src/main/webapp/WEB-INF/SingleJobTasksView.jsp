<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>

<link href="css/singleJob.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
</head>
<body>
<div class="singleViewBg">
<%@ include file="NavBar.jsp" %>
	
	
	
	<!-- change inline style to css -->
		<div class="card mx-auto mt-3 cardBG singleViewCard" style="">
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
			    		<div class="container-fluid scroll-message p-0">
			    			<c:choose>
			    				<c:when test="${not empty messages}">
			    					<c:forEach var="message" items="${messages}">
										  <div class="card-body row border mt-1 mb-1 p-0 mx-0 w-100 messageBackground">
										  	  
										  	  <div class="d-flex p-0">
    											<div class="border col-3 p-1 d-flex flex-column justify-content-around">
    												<h5>${message.user.username}</h5>
    												<div>
    												   	<p class="m-0">Created:</p>
    													<p>${message.creationTime}</p>
    												</div>
    												 <c:if test="${sessionScope.user.id == message.user.id }">
    													 <div>
    														<button class="btn btn-sm btn-light data-bs-toggle="modal" data-bs-target="#edit${message.id}">Edit</button>
    													</div>	
    												</c:if>
    											</div>
    											<div class="container col">
    												<div class="col-9 m-0 w-100">
    													<p class="m-2">${message.messageBody}</p>
    												</div>

    											</div>
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
    												<div class="col-10">
    													<p class="m-2">No messages recorded yet.</p>
    												</div>
    												<div class="col">
    												</div>
    											</div>
	   										</div>
			    					</c:otherwise>
			    			</c:choose>
			    		</div>
			    		
			    		<form action="message.do?jobId=${job.id }" class="messageReply" method="POST">
			    		<div class="input-group">
			    		   		<div class="col" >
   									 <input class="form-control form-control-lg" name="messageBody" minlength="5" maxlength="500" placeholder="Send a reply here...." required>
			    				</div>
			    				<input class="btn btn-primary" type="submit">
			    		 </div>
			    		</form>

			    	</div>
			    	<div class="col-7 scroll-task">
			    		<c:choose>
					      		<c:when test="${not empty tasks}">
					      		<table class="table">
					      		 	<thead>
										    <tr>
										      <th scope="col" class="col-2 text-center">Task Name <br><em>Contractor</em></th>
										      <th scope="col" class="col-1 text-center">Task Details</th>
										      <th scope="col" class="col-1 text-center">Priority Number</th>
										      <th scope="col" class="col-1 text-center">Begin Date</th>
										      <th scope="col" class="col-1 text-center">End Date</th>
										      <th scope="col" class="col-1 text-center">Completion Status</th>
										      <c:if test="${sessionScope.user.role }">
										      	<th scope="col" class="col-1 text-center">Edit Task</th>
										      </c:if>
										    </tr>
									</thead>

									
									
									<tbody>
					      			<c:forEach var="task" items="${tasks}">
					      			
										 
										  
										    <tr>
										<!--        <th scope="row">1</th>     -->
										      <td class="col">
										      	<div>
										      		${task.taskName}
										      	</div>
										      	<div>
										      		<em class="companyName">
										      			${task.contractor.companyName}
										      		</em>
										      	</div>
										      </td>
										      <td class="align-middle text-center"><button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#taskDetails${task.id}">View</button></td>
										      <td class="col-1 text-center align-middle">${task.priorityNumber}</td>
										      <td class="col-2 text-center p-0 align-middle">${task.beginTime}</td>
										      <td class="col-2 text-center p-0 align-middle">${task.endTime}</td>
										      <td class="col-1 text-center align-middle">
										      	<c:if test="${task.isComplete}">Completed</c:if>
										      	<c:if test="${!task.isComplete}">
										      		<a class="btn btn-primary btn-sm" href="setTaskComplete.do?id=${task.id}" role="button">Mark Complete</a>
										      	</c:if>
										      </td>
										      <c:if test="${sessionScope.user.role }">
										      	<td class="align-middle text-center">
										      		<button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#updateTask${task.id}">Update</button>
										      	</td>
										      </c:if>
										    </tr>
										  
										
									<%@ include file="ViewTaskDetailsModal.jsp" %>
									<%@ include file="EditTaskModal.jsp" %>
					    		  	</c:forEach>
					    		  	</tbody>
	
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
	


	<%@ include file="CreateTaskModal.jsp" %>
	<%@ include file="DeleteJobModal.jsp" %>
	<%@ include file="EditJobModal.jsp" %>
	<%@ include file="Footer.jsp" %>
</div>
</body>
</html>