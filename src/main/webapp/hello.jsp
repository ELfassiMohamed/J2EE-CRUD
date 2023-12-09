<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Crud</title>
</head>
<body>
<h1><c:out value="${requestScope.myMessage}" />: go back <a href="index.jsp">Index page</a></h1>
</body>
</html>