<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>


</head>
<body>
<%@ include file="NavBar.jsp" %>


	<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#CreateJob">
  Create Job
</button>

<!-- Modal -->
<div class="modal fade" id="CreateJob" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Job Creation</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      
      <!-- JSP include's GO HERE -->
      <%@ include file="NEED-NAME.jsp" %>
      
      </div>
    </div>
  </div>
</div>

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


<%@ include file="Footer.jsp" %>
</body>
</html>