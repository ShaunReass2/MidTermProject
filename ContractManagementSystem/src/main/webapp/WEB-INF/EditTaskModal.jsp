<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>

	
	<!-- Modal -->
		<div class="modal fade" id="updateTask${task.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">Update Task</h5>
		        <!-- <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
		      	<a class="btn btn-danger" href="deleteTask.do?id=${task.id}" role="button" method="POST">Delete Task</a>
		      </div>
		      <div class="modal-body">
		      
		      <!-- JSP include's GO HERE -->
		      <%@ include file="EditTaskForm.jsp" %>
		      
		      </div>
		    </div>
		  </div>
		</div>

</body>
</html>