<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

</head>
<body>

<form action="ContractorForm.dp" method="post">

<label for="username">Username: </label>
<input name="username">

<label for="password">Password: </label>
<input name="password" type="password">

<label for="firstName">First Name: </label>
<input name="firstName">

<label for="lastName">Last Name: </label>
<input name="lastName">

<label for="companyName">Company Name: </label>
<input name="companyName">

<label for="trade">Trade: </label>
<select name="trade">
<option value="temp">Temporary</option>
</select>

<input type="submit">

</form>

</body>
</html>