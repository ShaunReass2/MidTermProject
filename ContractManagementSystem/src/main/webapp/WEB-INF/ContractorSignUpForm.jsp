<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

</head>
<body>

<form action="ContractorForm.do" method="POST">

<label for="username" class="form-label">Username: </label>
<input id="username" class="form-control" name="username" aria-describedby="usernameHelp" required>
    <div id="usernamelHelp" class="form-text">We'll never share your information with anyone else.</div>

<label for="password" class="form-label">Password: </label>
<input id="password" class="form-control" name="password" type="password" required>

<label for="firstName" class="form-label">First Name: </label>
<input id="firstName" class="form-control" name="firstName" type="text" required>

<label for="lastName" class="form-label">Last Name: </label>
<input id="lastName" class="form-control" name="lastName" type="text" required>

<label for="companyName" class="form-label">Company Name: </label>
<input id="companyName" class="form-control" name="companyName" type="text" required>

<label for="trade" class="form-label">Trade: </label>
<select id="trade" class="form-control mb-2" name="trade" type="text" required>
<option value="temp">Temporary</option>
</select>
<div class="d-flex justify-content-between m-2">
<button type="button" class="btn btn-secondary w-25" data-bs-dismiss="modal">Close</button>
<button type="button" class="btn btn-primary w-25">Submit</button>
</div>


</form>

</body>
</html>