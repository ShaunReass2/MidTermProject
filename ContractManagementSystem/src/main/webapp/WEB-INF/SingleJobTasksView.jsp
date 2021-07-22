<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
   
<!DOCTYPE html>
<html>
<head>

<link href="css/singleJob.css" rel="stylesheet">
</head>
<body>
<div class="singleViewBg">
<%@ include file="NavBar.jsp" %>
	
	
	
	<!-- change inline style to css -->
		<div class="card mx-auto mt-3 cardBG singleViewCard p-2" style="">
			<c:if test="${sessionScope.user.role}">
				<div class="d-flex justify-content-around w-50 mx-auto mt-3">
						<button type="button" class="btn btn-outline-light" data-bs-toggle="modal" data-bs-target="#EditJob">Edit Job</button>
				  		<a class="btn btn-outline-success" href="markJobComplete.do?id=${job.id}" role="button">
				  		<c:choose>
				  			<c:when test="${job.isComplete}">
				  				Mark as Incomplete
				  			</c:when>
				  			<c:otherwise>
				  				Mark Job Complete
				  			</c:otherwise>
				  		</c:choose>
				  		</a>
				  		<button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#DeleteJob">Delete Job</button>
						<button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#CreateTask">Create Task</button>
				</div>		
			</c:if>
			<div class="container-fluid p-0">
			    <div class="row mt-3">
			    	<div class="singleViewJobHeader col-6 pe-5 ps-0">
			    		<h2>${job.jobName}</h2>
			    	</div>
			    	<div class="jobStartDateHeader col-3 text-center">
			    		<h4>Start Date</h4>
			    		<fmt:parseDate value="${job.startDate}" pattern="yyyy-MM-dd" var="jobStartDate" type="date"/>
    					<p class="m-0"><fmt:formatDate pattern="MM-dd-yyyy" value="${jobStartDate}"/> </p>
			    	</div>
			    	<div class="jobEndDateHeader col-3 text-center">
			    		<h4>Completion Date</h4>
			    		<fmt:parseDate value="${job.endDate}" pattern="yyyy-MM-dd" var="jobEndDate" type="date"/>
    					<p class="m-0"><fmt:formatDate pattern="MM-dd-yyyy" value="${jobEndDate}"/> </p>
			    	</div>
			    </div>
			    
			    <!-- START OF MESSAGES TABLE -->
			    
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
    												   	<c:set var = "string1" value = "${message.creationTime}"/>
      													<c:set var = "string2" value = "${fn:substring(string1, 0, 10)}" />
      													<c:set var = "string3" value = "${fn:substring(string1, 11, 16)}" />
    													<fmt:parseDate value="${string2}" pattern="yyyy-MM-dd" var="messageDate" type="date"/>
    													<p class="m-0"><fmt:formatDate pattern="MM-dd-yyyy" value="${messageDate}"/> </p>
    													<p class="m-0">${string3}</p>
    												</div>
    												 <c:if test="${sessionScope.user.id == message.user.id }">
    													 <div>
    														<button class="btn btn-sm btn-light" data-bs-toggle="modal" data-bs-target="#edit${message.id}">Edit</button>
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
			    	
			    	<!-- START OF TASK TABLE -->
			    	
			    	<div class="col-7 scroll-task">
			    		<c:choose>
					      		<c:when test="${not empty tasks}">
					      		<table class="table">
					      		 	<thead>
										    <tr>
										      <th scope="col" class="col-2 text-center">Individual Tasks<br><div class="contractorHeader"><em>Contractor</em></div></th>
										      <th scope="col" class="col-1 text-center">Priority Number
										      	<div class ="d-flex justify-content-between w-25 mx-auto">
													<div><a href="singleJobView.do?taskPriorityIsDescending=true&id=${job.id}"><i class="bi bi-arrow-down"></i></a></div>
													<div><a href="singleJobView.do?taskPriorityIsAscending=true&id=${job.id}"><i class="bi bi-arrow-up"></i></a></div>		
												</div>
										      </th>
										      <th scope="col" class="col-1 text-center">Begin Date
										      		<div class ="d-flex justify-content-between w-25 mx-auto">
													<div><a href="singleJobView.do?taskBeginDateIsDescending=true&id=${job.id}"><i class="bi bi-arrow-down"></i></a></div>
													<div><a href="singleJobView.do?taskBeginDateIsAscending=true&id=${job.id}"><i class="bi bi-arrow-up"></i></a></div>		
												</div>
										      </th>
										      <th scope="col" class="col-1 text-center">End Date
										      		<div class ="d-flex justify-content-between w-25 mx-auto">
													<div><a href="singleJobView.do?taskEndDateIsDescending=true&id=${job.id}"><i class="bi bi-arrow-down"></i></a></div>
													<div><a href="singleJobView.do?taskEndDateIsAscending=true&id=${job.id}"><i class="bi bi-arrow-up"></i></a></div>		
												</div>
										      </th>
										      <c:if test="${sessionScope.user.role }">
										      	<th scope="col" class="col-1 text-center">Edit Task</th>
										      </c:if>
										      <th scope="col" class="col-1 text-center">Status
										      		<div class ="d-flex justify-content-between w-25 mx-auto">
													<div><a href="singleJobView.do?taskIsCompleteIsDescending=true&id=${job.id}"><i class="bi bi-arrow-down"></i></a></div>
													<div><a href="singleJobView.do?taskIsCompleteIsAscending=true&id=${job.id}"><i class="bi bi-arrow-up"></i></a></div>		
												</div>
										      </th>
										      <th scope="col" class="col-1 text-center">Task Details</th>
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
										      <td class="col-1 text-center align-middle">${task.priorityNumber}</td>
										      <td class="col-2 text-center p-0 align-middle">
      											<fmt:parseDate value="${task.beginTime}" pattern="yyyy-MM-dd'T'HH:mm" var="startDateTime" type="both" />
												<fmt:formatDate pattern="MM-dd-yyyy HH:mm" value="${ startDateTime }" />
										      </td>
										      <td class="col-2 text-center p-0 align-middle">
      											<fmt:parseDate value="${task.endTime}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
												<fmt:formatDate pattern="MM-dd-yyyy HH:mm" value="${ parsedDateTime }" />
										      </td>
										      <c:if test="${sessionScope.user.role }">
										      	<td class="align-middle text-center">
										      		<button type="button" class="btn btn-outline-light btn-sm" data-bs-toggle="modal" data-bs-target="#updateTask${task.id}">Update</button>
										      	</td>
										      </c:if>
										      <td class="col-1 text-center align-middle">
										      	<c:if test="${task.isComplete}">Completed</c:if>
										      	<c:if test="${!task.isComplete}">
										      		<a class="btn btn-outline-success btn-sm" href="setTaskComplete.do?id=${task.id}" role="button">Mark Complete</a>
										      	</c:if>
										      </td>
										      <td class="align-middle text-center"><button type="button" class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#taskDetails${task.id}">View</button></td>
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
			    
		 <!-- START OF JOB DETAILS TABLE  -->
			    
		<div class="container-fluid m-3 p-4">

			<div class="row jobDetailsTableHeader mx-auto border-bottom border-white">
				<div class="col-3 text-center">
					<h5>Job Description</h5>
				</div>
				<div class="col-3 text-center">
					<h5>Total Man Hours</h5>
				</div>
				<div class="col-3 text-center">
					<h5>Authorized Overtime</h5>
				</div>
				<div class="col-3 text-center">
					<h5>Miscellaneous</h5>
				</div>
			</div>
			<div class="row jobDetailsTableData mx-auto">
				<div class="col-3 text-center">
			    	${job.jobDescription}
				</div>
				<div class="col-3 text-center">
					${job.totalManHours}
				</div>
				<div class="col-3 text-center">
				 	${job.authorizedOvertime}
				</div>
				<div class="col-3 text-center">
					${job.miscellaneous}
				</div>
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