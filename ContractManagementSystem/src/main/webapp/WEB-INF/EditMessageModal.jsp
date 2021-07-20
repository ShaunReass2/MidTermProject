<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>

		<!-- Modal -->
		<div class="modal fade" id="edit${message.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">Job Creation</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
				<form action="editMessage.do?messageId=${message.id}" method="POST">
					<div class="m-2 col">
					<label for="messageBody" class="form-label">Edit Message:</label>
					<textarea class="form-control" name="messageBody">${message.messageBody}</textarea>
					</div>
					<input class="btn btn-primary" type="submit">
				</form>
		      </div>
		    </div>
		  </div>
		</div>
	
</body>
</html>