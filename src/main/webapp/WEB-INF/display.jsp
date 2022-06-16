<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dojo Page</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body>
<div class='container'>
<h1> <c:out value="${dojo.name}"/></h1>

<table class="table table-dark table-striped">

	<thead>
		<tr>
		<th scope="col">First Name</th>
		<th scope="col">Last Name</th>
		<th scope="col">Age</th>
		</tr>
	</thead>

	<tbody>
	<c:forEach var="ninjas" items="${dojo.ninjas}"> 
	<tr>
	<td><c:out value="${ninjas.firstName}"/></td>
	<td><c:out value="${ninjas.lastName}"/></td>
	<td><c:out value="${ninjas.age}"/></td>
	
	</tr>
	
	
	</c:forEach>
	
	
	</tbody>



</table>


</div>

</body>
</html>