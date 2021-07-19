<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>


<form action="editJob.do" method="POST">
	<input type="hidden" name="id" value="${job.id}">
  <div class="mb-3">
  
    <label for="jobName" class="form-label">Job Name</label>
    <input type="text" class="form-control" id="jobName" value="${job.jobName}" name="jobName" required>
  </div>
  <div class="mb-3">
    <label for="location" class="form-label">Job Location</label>
    <input type="text" class="form-control" id="location" value="${job.location}" name="location" required>
  </div>
  <div class="mb-3">
    <label for="startDate" class="form-label">Start Date</label>
    <input type="date" class="form-control" id="startDate" name="startDate" value="${job.startDate}" required>
  </div>
  <div class="mb-3">
    <label for="endDate" class="form-label">End Date</label>
    <input type="date" class="form-control" id="endDate" name="endDate" value="${job.endDate}" required>
  </div>  
   <div class="mb-3">
    <label for="authorizedOvertime" class="form-label">Authorized Overtime</label>
    <select class="form-control"  name="authorizedOvertime">
    	<option value="true" <c:if test="${job.authorizedOvertime}">selected</c:if> >Yes</option>
    	<option value="false" <c:if test="${!job.authorizedOvertime}">selected</c:if> >No</option>
    </select>
  </div>
  <div class="mb-3">
    <label for="totalManHours" class="form-label">Total Man Hours</label>
    <input type="number" class="form-control" name="totalManHours" value="${job.totalManHours}">
  </div>
  
  <div class="mb-3">
    <label for="hoursOfOperation" class="form-label">Hours of Operation</label>
    <input type="text" class="form-control" name="hoursOfOperation" value="${job.hoursOfOperation}">
  </div>
   <div class="mb-3">
    <label for="jobDescription" class="form-label">Job Description</label>
    <textarea type="text" class="form-control" name="jobDescription">${fn:trim(job.jobDescription)}</textarea>
  </div>
   <div class="mb-3">
    <label for="miscellaneous" class="form-label">Miscellaneous</label>
    <input type="text" class="form-control" name="miscellaneous" value="${job.miscellaneous}">
  </div>
  
  <div class="d-flex justify-content-between m-2">
    <button type="button" class="btn btn-secondary w-25" data-bs-dismiss="modal">Close</button>
    <button type="submit" class="btn btn-primary w-25">Submit</button>
  </div>
</form>


</body>
</html>