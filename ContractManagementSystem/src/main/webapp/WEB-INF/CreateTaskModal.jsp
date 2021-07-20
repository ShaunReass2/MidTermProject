<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
</head>
<body>

	
	<!-- Modal -->
		<div class="modal fade" id="CreateTask" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">Task Creation</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		      
		      <p> Choose a Trade for your Task
		      </p>
		      <form action="chooseTrade.do" method="POST">
		        <select name="id">
		          <c:forEach var="trade" items="${trades}"> 
		             <option value="${trade.id}"> ${trade.name} </option>
		          </c:forEach>
		        </select>
		     <div class="d-flex justify-content-between m-2">
  				  <button type="button" class="btn" data-bs-dismiss="modal">Close</button>
  				  <button type="submit" class="btn btn-primary w-25">Submit</button>
 			 </div> 
		      </form>
		      </div>
		    </div>
		  </div>
		</div>

</body>
</html>