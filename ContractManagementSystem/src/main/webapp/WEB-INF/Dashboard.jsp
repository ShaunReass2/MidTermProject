<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>


</head>
<body>
<%@ include file="NavBar.jsp" %>

		<!-- Button trigger modal for create job-->
	<c:if test="${adminRole}">
		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#CreateJob">
		  Create Job
		</button>
	</c:if>


	IN DASHBOARD JOBS SHOULD BE HERE
	<h1>${user.username}</h1>
	
	<c:choose>
		<c:when test="${not empty jobs }">
			<c:forEach var="job" items="${jobs}">
				${job.jobName} -> Start Date: ${job.startDate}
			</c:forEach>
		</c:when>
		<c:otherwise>
			No jobs found.
		</c:otherwise>
	</c:choose>


<%@ include file="AdminCreateAJobModal.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>