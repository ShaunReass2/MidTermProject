<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
<form action="editTask.do" method="POST">

    <input type="hidden" name="id" value="${task.id}">
  <div class="mb-3">
    <label for="taskName" class="form-label">Task Name</label>
    <input type="text" class="form-control" id="taskName" name="taskName" value="${task.taskName}" required>
  </div>
   <div class="mb-3">
    <label for="taskDetails" class="form-label">Task Details</label>
    <textarea class="form-control" name="taskDetails">${task.taskDetails}</textarea>
  </div>
  <div class="mb-3">
    <label for="taskPriorityNumber" class="form-label">Priority Number</label>
    <select class="form-control" id="priorityNumber" name="priorityNumber" required> 
      <option <c:if test="${task.priorityNumber == 1}"> selected </c:if> value="1">1</option>
      <option <c:if test="${task.priorityNumber == 2}"> selected </c:if> value="2">2</option>
      <option <c:if test="${task.priorityNumber == 3}"> selected </c:if> value="3">3</option>
      <option <c:if test="${task.priorityNumber == 4}"> selected </c:if> value="4">4</option>
      <option <c:if test="${task.priorityNumber == 5}"> selected </c:if> value="5">5</option>
    </select>
  </div>
  <div class="mb-3">
    <label for="beginTime" class="form-label">Start Time</label>
    <input type="datetime-local" class="form-control" id="beginTime" name="beginTime" value="${task.beginTime}" required>
  </div>
  <div class="mb-3">
    <label for="endDate" class="form-label">End Time</label>
    <input type="datetime-local" class="form-control" id="endTime" name="endTime" value="${task.endTime}" required>
  </div>  
  <div class="mb-3">
    <label for="isComplete" class="form-check-label">Completion Status</label>
    <input type="checkbox" id="isComplete" <c:if test="${task.isComplete}">checked</c:if> class="form-check-input" id="isComplete" name="isComplete">
  </div>  
  
  <div class="d-flex justify-content-between m-2">
    <button type="button" class="btn btn-secondary w-25" data-bs-dismiss="modal">Close</button>
    <button type="submit" class="btn btn-primary w-25">Submit</button>
  </div>
</form>

</body>
</html>