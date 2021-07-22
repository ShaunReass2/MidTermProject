<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CMS</title>

<%@ include file="NavBar.jsp"%>

</head>

<body>
	<div class="homebackground">
		<h1><strong style="color: #292826">C</strong>ontract <strong style="color: #292826">M</strong>anagement <strong style="color: #292826">S</strong>ystem</h1>
		<p>
		<h3>
			<em>Paving the future of communications in the workplace</em>
		</h3>
		<br>
		<p>
		<div class="row">
			<div class="col-3"></div>
			<div class="col-3">
				<button type="button" class="btn btn-outline-dark"
					data-bs-toggle="modal" data-bs-target="#AdminSignUp">
					Administrator Sign Up</button>
			</div>
			<div class="col-3">
				<button type="button" class="btn btn-outline-dark"
					data-bs-toggle="modal" data-bs-target="#ContractorSignUp">
					Contractor Sign Up</button>
			</div>
			<div class="col-3"></div>
		</div>

		<%@ include file="ContractorSignUpModal.jsp"%>
		<%@ include file="AdminSignUpModal.jsp"%>
		<%@ include file="LoginModal.jsp"%>
		<%@ include file="Footer.jsp"%>
	</div>
</body>
</html> 



<%-- <div class="container-fluid p-0">
			    <div class="row mt-3">
			    	</div>
			    	<div class="homePageSignUp col-4 text-center">
			    		<h4>Admin Sign Up</h4>
			    		<p>Description Goes Here</p>
			    	</div>
			    	<div class="homePageSignUp col-4 text-center">
			    		<h4>Contractor Sign Up</h4>
			    		<p>Description Goes Here</p>
			    	</div>
			    </div> --%>




<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CMS</title>

<%@ include file="NavBar.jsp"%>

</head>

<body>
	<div class="homebackground">
		<h1><strong style="color: #292826">C</strong>ontract <strong style="color: #292826">M</strong>anagement <strong style="color: #292826">S</strong>ystem</h1>
		<p>
		<h3>
			<em>Paving the future of communications in the workplace</em>
		</h3>
		<br>
		<p>
		<div class="row">
			<div class="col-3"></div>
			<div class="col-3">
				<button type="button" class="btn btn-outline-dark"
					data-bs-toggle="modal" data-bs-target="#AdminSignUp">
					Administrator Sign Up</button>
			</div>
			<div class="col-3">
				<button type="button" class="btn btn-outline-dark"
					data-bs-toggle="modal" data-bs-target="#ContractorSignUp">
					Contractor Sign Up</button>
			</div>
			<div class="col-3"></div>
		</div>

		<%@ include file="ContractorSignUpModal.jsp"%>
		<%@ include file="AdminSignUpModal.jsp"%>
		<%@ include file="LoginModal.jsp"%>
		<%@ include file="Footer.jsp"%>
	</div>
</body>
</html> --%>