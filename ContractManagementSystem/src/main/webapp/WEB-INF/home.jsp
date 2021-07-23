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
		<h1><strong style="color: #292826">C</strong>ontractor <strong style="color: #292826">M</strong>anagement <strong style="color: #292826">S</strong>ystem</h1>
		<p>
		<h3>
			<em>Paving the future of communications in the workplace</em>
		</h3>
		<br>
		<p>
		<div class="row homeInfoBlock flex-column justify-content-center align-items-center">
			<div class="col-3"></div>
			<div class="col-6  bgInnerHome d-flex flex-column-reverse p-2">

				<div class="container ">
					<div class="row innerHomeInfoBlock">
						<div class="col-6 border-top p-2">
							<button type="button" class="btn btn-outline-light"
							data-bs-toggle="modal" data-bs-target="#AdminSignUp">
							Administrator Sign Up</button>
						</div>
						<div class="col-6 border-top p-2">
							<button type="button" class="btn btn-outline-light"
							data-bs-toggle="modal" data-bs-target="#ContractorSignUp">
							Contractor Sign Up</button>
						</div>
					</div>
				</div>
				<div class="container infoContainer p-0">
					<div class="row informationHome m-0 mt-1">
						<div class="col p-0 d-flex flex-column justify-content-between">
							<h4>Need to manage work?</h4>
							<p>As an administrator you can:</p>
							<ul class="text-start">
								<li>Create A Job</li>
								<li>Organize Jobs</li>
								<li>Assign tasks to specific contractor</li>
								<li>Communicate using message board</li>
								<li>Update jobs on the fly</li>
								<li>Mark Complete and view later</li>
							</ul>
							<h5>Full control of the job life-cycle</h5>
						</div>
						<div class="cliente"> 
						          
        				</div>
						<div class="col p-0 d-flex flex-column justify-content-between">
							<h4>Need to track jobs?</h4>
							<p>As a contractor you can:</p>
							<ul class="text-start">
								<li>View assigned Jobs</li>
								<li>View Job Task</li>
								<li>Mark task as complete</li>
								<li>Communicate using message board</li>
								<li>View previously completed jobs</li>
							</ul>
							<h5 class="mt-4">Stay informed through every step!</h5>
						</div>
					</div>
				</div>

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