<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
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
												<h6>${job.jobName} <c:if test="${job.isComplete}">  <i class="bi bi-check2-circle"></i></c:if></h6>
											</div>
											<div class="col-3">
												<fmt:parseDate value="${job.startDate}" pattern="yyyy-MM-dd" var="jobStart" type="date"/>
												<h6><fmt:formatDate pattern="MM-dd-yyyy" value="${jobStart}"/> </h6>
											</div>
											<div class="col-3">
												<fmt:parseDate value="${job.endDate}" pattern="yyyy-MM-dd" var="jobEnd" type="date"/>
												<h6><fmt:formatDate pattern="MM-dd-yyyy" value="${jobEnd}"/> </h6>											
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

	<%@ include file="Footer.jsp"%>
</body>
</html>