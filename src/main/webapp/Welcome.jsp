<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
 <%@ page import="java.util.*" %>  
<%@ page import="com.webapp.beans.*" %>
<%@ page import="com.webapp.connection.*" %>
<%@ page import="com.webapp.dao.*" %>
<% User userSession = (User) request.getSession().getAttribute("auth-session");
	if(userSession != null){
		request.setAttribute("userSession", userSession);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome</title>
<%@ include file="/Includes/header.jsp"%>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light ">
    <a class="navbar-brand" href="#">Welcome</a>
    <ul class="navbar-nav ml-auto">
			<li class="nav-item active"><a class="nav-link" href="#">Home</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="#">Page</a></li>
		</ul>
    <div class="dropdown pmd-dropdown pmd-user-info ml-auto">
        <a href="javascript:void(0);" class="btn-user dropdown-toggle media align-items-center" data-toggle="dropdown" data-sidebar="true" aria-expanded="false">
            <div class="media-body">
                User
            </div>
            <i class="material-icons md-light ml-2 pmd-sm">more_vert</i>
        </a>
        <ul class="dropdown-menu dropdown-menu-right" role="menu">
            <!-- <a class="dropdown-item" href="#">Edit Profile</a> -->
            <a class="dropdown-item" href="Logout.auth">Logout</a>
        </ul>
    </div>
</nav>
<h3>Hello There</h3>
</body>
</html>