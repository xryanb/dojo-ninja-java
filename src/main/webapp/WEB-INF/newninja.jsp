<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Ninja</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body>
<div class="container">
<h1>New Ninja</h1>
<form:form action="/ninjas/create" method="POST" modelAttribute="ninja">

	<p> 
	<form:label path="dojo">Dojo: </form:label>
	 <form:select path="dojo">
        <c:forEach var="dojo" items="${dojos}">
            <!--- Each option VALUE is the id of the person --->
            <form:option value="${dojo.id}" path="dojo">
            <!--- This is what shows to the user as the option --->
                <c:out value="${dojo.name}"/>
            </form:option>
        </c:forEach>
    </form:select>
	</p>

	<p>
		<form:label path="firstName">First Name: </form:label>
		<form:input path="firstName"/>
		<form:errors path="firstName"/>
	</p>

	<p>
		<form:label path="lastName">Last Name: </form:label>
		<form:input path="lastName"/>
		<form:errors path="lastName"/>
	</p>
	
	<p>
		<form:label path="age">Age: </form:label>
		<form:input path="age" type="number"/>
		<form:errors path="age"/>
	</p>
	
	<input type="submit" value="create" class="btn btn-success"/>

</form:form>


</div>

</body>
</html>