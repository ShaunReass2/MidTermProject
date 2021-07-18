<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>

	<form action="login.do" method="POST">
		<div class="mb-3">
			<label for="inputUsername" class="form-label">Username</label> <input
				type="text" class="form-control" id="inputUsername"
				aria-describedby="usernameHelp" name="username" required>
			<div id="usernamelHelp" class="form-text">We'll never share
				your information with anyone else.</div>
		</div>
		<div class="mb-3">
			<label for="inputPassword" class="form-label">Password</label> <input
				type="password" class="form-control" id="inputPassword"
				name="password" required>
		</div>
		<div class="d-flex justify-content-between m-2">
			<button type="button" class="btn btn-secondary w-25"
				data-bs-dismiss="modal">Close</button>
			<button type="submit" class="btn btn-primary w-25">Submit</button>
		</div>
	</form>

</body>
</html>