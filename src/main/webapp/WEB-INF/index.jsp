<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Dojo</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body>
<div class='container'>
	<h1>New Dojo</h1>
	
	<form:form action="/dojos/create" method="POST" modelAttribute="newdojo">
	<p>
		<form:label path="name">Name: </form:label>
		<form:input path="name"/>
		<form:errors path="name"/>
	</p>
	
	<input type="submit" value="create" class="btn btn-success"/>
	
	</form:form>

</div>

</body>
</html>