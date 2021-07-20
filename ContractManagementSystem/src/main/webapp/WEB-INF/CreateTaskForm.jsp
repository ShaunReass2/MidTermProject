<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
<%@ include file="NavBar.jsp" %>

<jsp:include page=""></jsp:include>
<form action="createTask.do" method="POST">
    <input type="hidden" name="jobId" value="${jobId}">
  <div class="mb-3">
    <label for="taskName" class="form-label">Task Name</label>
    <input type="text" class="form-control" id="taskName" name="taskName" required>
  </div>
   <div class="mb-3">
    <label for="taskDetails" class="form-label">Task Details</label>
    <textarea type="text" class="form-control" name="taskDetails"></textarea>
  </div>
  <div class="mb-3">
    <label for="taskPriorityNumber" class="form-label">Priority Number</label>
    <select class="form-control" id="priorityNumber" name="priorityNumber" required> 
      <option value="1">1</option>
      <option value="2">2</option>
      <option value="3">3</option>
      <option value="4">4</option>
      <option value="5">5</option>
    </select>
  </div>
  <div class="mb-3">
    <label for="beginTime" class="form-label">Start Time</label>
    <input type="datetime-local" class="form-control" id="beginTime" name="beginTime" required>
  </div>
  <div class="mb-3">
    <label for="endDate" class="form-label">End Time</label>
    <input type="datetime-local" class="form-control" id="endTime" name="endTime" required>
  </div>  
  
  <div class="mb-3">
    <label for="contractorId" class="form-label">Contractor(s)</label>
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

<%@ include file="Footer.jsp" %>
</body>
</html>