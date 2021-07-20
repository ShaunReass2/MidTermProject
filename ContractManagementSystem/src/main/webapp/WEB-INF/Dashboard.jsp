<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

<link href="css/main.css" rel="stylesheet" />


</head>
<body>
	<%@ include file="NavBar.jsp"%>

	<div class="dashboardMain">
		<h1>${sessionScope.user.username}</h1>

		<!-- Button trigger modal for create job-->
		<c:if test="${adminRole}">
			<button type="button" class="btn btn-primary" data-bs-toggle="modal"
				data-bs-target="#CreateJob">Create Job</button>
			<%@ include file="AdminCreateAJobModal.jsp"%>
		</c:if>

		<!-- Start of Contractor / Non-admin divs -->

		<div class="container-fluid p-2 m-2">

			<div class="row">
				<div class="col-4">
					<h4>Job Name</h4>
				</div>
				<div class="col-4">
					<h4>Start Date</h4>
				</div>
				<div class="col-4">
					<h4>View Job</h4>
				</div>
			</div>
			<c:choose>
				<c:when test="${not empty jobs }">
					<c:forEach var="job" items="${jobs}">
						<div class="row">
							<div class="col-4">
								<br>
								<h6>${job.jobName}</h6>
							</div>
							<div class="col-4">
								<br>
								<h6>${job.startDate}</h6>
							</div>
							<div class="col-4">
								<br> <a class="btn btn-primary"
									href="singleJobView.do?id=${job.id}" role="button">${job.jobName}</a>
							</div>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<h5>No jobs found.</h5>
				</c:otherwise>
			</c:choose>
		</div>
	</div>





	<%-- 		<div class = dashboardJobList>
		<table class="table">
		  <thead>
		    <tr>
		      <th scope="col">Job Name</th>
		      <th scope="col">Start Date</th>
		  </thead>
			<tbody>
			<c:forEach var="job" items="${jobs}">
			  <tr>
				${job.jobName} -> Start Date: ${job.startDate}
				<a class="btn btn-primary" href="singleJobView.do?id=${job.id}" role="button">Open Job</a>
			  </tr>
			</c:forEach>
			</tbody>
		</table>
	    </div> --%>


	<%@ include file="Footer.jsp"%>
</body>
</html>