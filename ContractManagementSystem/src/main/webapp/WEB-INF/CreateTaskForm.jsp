<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<link href="css/createTask.css" rel="stylesheet"/>

</head>
<body>
<%@ include file="NavBar.jsp" %>
<div class="createTaskPage">
<div class="col d-flex justify-content-center vh-100 align-items-center">
<div class="card createFormCard p-4 bg-dark text-white" style="width: 42rem;">

<jsp:include page=""></jsp:include>
<form action="createTask.do" method="POST">
    <input type="hidden" name="jobId" value="${jobId}">
  <div class="mb-3">
    <label for="taskName" class="form-label"><b>Task Name</b></label>
    <input type="text" class="form-control" id="taskName" name="taskName" required>
  </div>
   <div class="mb-3">
    <label for="taskDetails" class="form-label"><b>Task Details</b></label>
    <textarea type="text" class="form-control" name="taskDetails"></textarea>
  </div>
  <div class="mb-3">
    <label for="taskPriorityNumber" class="form-label"><b>Priority Number</b></label>
    <select class="form-control" id="priorityNumber" name="priorityNumber" required> 
      <option value="1">1</option>
      <option value="2">2</option>
      <option value="3">3</option>
      <option value="4">4</option>
      <option value="5">5</option>
    </select>
  </div>
  <div class="mb-3">
    <label for="beginTime" class="form-label"><b>Start Time</b></label>
    <input type="datetime-local" class="form-control" id="beginTime" name="beginTime" required>
  </div>
  <div class="mb-3">
    <label for="endDate" class="form-label"><b>End Time</b></label>
    <input type="datetime-local" class="form-control" id="endTime" name="endTime" required>
  </div>  
  
  <div class="mb-3">
    <label for="contractorId" class="form-label"><b>Contractor(s)</b></label>
    <select class="form-control" id="contractorId" name="contractorId" required> 
    <c:forEach var="contractor" items="${contractors}">
      <option value="${contractor.id}"> ${contractor.companyName} </option>
    </c:forEach>
    </select>
  </div>  
  
  <div class="d-flex justify-content-between m-2">
    <button type="button" class="btn btn-secondary w-25" data-bs-dismiss="modal">Close</button>
    <button type="submit" class="btn btn-primary w-25">Submit</button>
  </div>
</form>

</div>
</div>
</div>

<%@ include file="Footer.jsp" %>
</body>
</html>