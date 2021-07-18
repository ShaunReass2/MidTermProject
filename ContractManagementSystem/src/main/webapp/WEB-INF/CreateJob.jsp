<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

</head>
<body>


<form action="createJob.do" method="POST">
  <div class="mb-3">
    <label for="jobName" class="form-label">Job Name</label>
    <input type="text" class="form-control" id="jobName" name="jobName" required>
  </div>
  <div class="mb-3">
    <label for="startDate" class="form-label">Start Date</label>
    <input type="datetime-local" class="form-control" id="startDate" name="startDate" required>
  </div>
  <div class="mb-3">
    <label for="endDate" class="form-label">End Date</label>
    <input type="datetime-local" class="form-control" id="endDate" name="endDate" required>
  </div>  
  
  <div class="d-flex justify-content-between m-2">
    <button type="button" class="btn btn-secondary w-25" data-bs-dismiss="modal">Close</button>
    <button type="submit" class="btn btn-primary w-25">Submit</button>
  </div>
</form>

</body>
</html>