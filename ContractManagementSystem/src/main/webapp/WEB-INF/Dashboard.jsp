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

		<!-- Button trigger modal for create job-->
		<c:if test="${adminRole}">
			<div class="container-fluid">
				<div class="row align-items-center jobHeader mx-auto">
					<div class="col-4"></div>
					<div class="col-4">
						<button type="button" class="mx-auto btn btn-dark mt-3" data-bs-toggle="modal"
							data-bs-target="#CreateJob">Create Job</button>						
						<%@ include file="AdminCreateAJobModal.jsp"%>
					</div>
					<div class="col-4"></div>
				</div>
			</div>
		</c:if>

		<!-- Start of Contractor / Non-admin divs -->

		<div class="container-fluid p-5">

			<div class="row jobHeader mx-auto">
				<div class="col-3">
					<h2>Job Name</h2>
				</div>
				<div class="col-3">
					<h2>Start Date</h2>
				</div>
				<div class="col-3">
					<h2>End Date</h2>
				</div>
				<div class="col-3">
					<h2>View Job</h2>
				</div>
			</div>
			<c:choose>
				<c:when test="${not empty jobs }">
						<div class="card jobsContainerCard">
							<div class="card-body">				
					<c:forEach var="job" items="${jobs}">
								<div class="card dashboardJobCard mx-auto mt-3">
		  							<div class="card-body">  							
										<div class="row align-items-center">
											<div class="col-3">
												<h6>${job.jobName}</h6>
											</div>
											<div class="col-3">
												<h6>${job.startDate}</h6>
											</div>
											<div class="col-3">
												<h6>${job.endDate}</h6>												
											</div>
											<div class="col-3">
												<a class="btn btn-outline-light" href="singleJobView.do?id=${job.id}" role="button">View Job</a>
											</div>
										</div>
		  							</div>
								</div>
					</c:forEach>
							</div>
						</div>
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