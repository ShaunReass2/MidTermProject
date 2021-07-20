<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>

<div class="modal fade" id="taskDetails${task.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Task Details</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      ${task.taskDetails}
      </div>
      <div class="modal-footer">
  <!--    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>     -->
      </div>
    </div>
  </div>
</div>
</body>
</html>