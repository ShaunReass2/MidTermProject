<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

</head>
<body>


<form action="adminAccountCreation.do" method="POST">
  <div class="mb-3">
    <label for="inputUsername" class="form-label">Username</label>
    <input type="text" class="form-control" id="inputUsername" aria-describedby="usernameHelp" name="username" required>
    <div id="usernamelHelp" class="form-text">We'll never share your information with anyone else.</div>
  </div>
  <div class="mb-3">
    <label for="inputPassword" class="form-label">Password</label>
    <input type="password" class="form-control" id="inputPassword" name="password" required>
  </div>
  <div class="mb-3">
    <label for="inputFirstName" class="form-label">First Name</label>
    <input type="text" class="form-control" id="inputFirstName" name="firstName" required>
  </div>
  <div class="mb-3">
    <label for="inputLastName" class="form-label">Last Name</label>
    <input type="text" class="form-control" id="inputLastName" name="lastName" required>
  </div>
  
  
  
  <div class="mb-3 form-check">
    <input type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Check me out if you are cool!</label>
  </div>
  
  
  
  <button type="submit" class="btn btn-primary">Submit</button>
</form>

</body>
</html>