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
    <label for="location" class="form-label">Job Location</label>
    <input type="text" class="form-control" id="location" value="${job.location}" name="location" required>
  </div>
  <div class="mb-3">
    <label for="startDate" class="form-label">Start Date</label>
    <input type="date" class="form-control" id="startDate" name="startDate" required>
  </div>
  <div class="mb-3">
    <label for="endDate" class="form-label">End Date</label>
    <input type="date" class="form-control" id="endDate" name="endDate" required>
  </div>  
   <div class="mb-3">
    <label for="authorizedOvertime" class="form-label">Authorized Overtime</label>
    <select class="form-control"  name="authorizedOvertime">
    	<option value="true">Yes</option>
    	<option value="false">No</option>
    </select>
  </div>
  <div class="mb-3">
    <label for="totalManHours" class="form-label">Total Man Hours</label>
    <input type="number" class="form-control" name="totalManHours" value="80" required>
  </div>
  
  <div class="mb-3">
    <label for="hoursOfOperation" class="form-label">Hours of Operation</label>
    <input type="text" class="form-control" name="hoursOfOperation">
  </div>
   <div class="mb-3">
    <label for="jobDescription" class="form-label">Job Description</label>
    <textarea type="text" class="form-control" name="jobDescription"></textarea>
  </div>
   <div class="mb-3">
    <label for="miscellaneous" class="form-label">Miscellaneous</label>
    <input type="text" class="form-control" name="miscellaneous">
  </div>
  
  <div class="d-flex justify-content-between m-2">
    <button type="button" class="btn btn-secondary w-25" data-bs-dismiss="modal">Close</button>
    <button type="submit" class="btn btn-primary w-25">Submit</button>
  </div>
</form>

</body>
</html>