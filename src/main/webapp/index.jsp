<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
 <%@ page import="java.util.*" %>  
<%@ page import="com.webapp.beans.*" %>
<%@ page import="com.webapp.connection.*" %>
<%@ page import="com.webapp.dao.*" %>
<%
	//User Listes
	UserDao allusers = new UserDao(dbConnection.checkConnection());
	List<User> listOfUsers = allusers.showAllUser();
	 
	//Session
	User userSession = (User) request.getSession().getAttribute("auth-session");
	if(userSession != null){
		request.setAttribute("userSession", userSession);
	}
%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="Includes/header.jsp" %>
<style type="text/css"><%@include file="/Includes/styles.css"%></style>
</head>
<body>
<%@ include file="Includes/NavBar.jsp" %>
<div class="container-xl">
	<div class="table-responsive">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">
						<h2>Manage <b>Users</b></h2>
					</div>
					<div class="col-sm-6">
						<a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New User</span></a>
					</div>
				</div>
			</div>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>id</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Email</th>
						<th>Created At</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
				<%-- <c:forEach var="i-user" items="${listOfUsers}">
					<tr>
						<td><c:out value="${i-user.id}" /></td>
						<td><c:out value="${i-user.first_name}" /></td>
						<td><c:out value="${i-user.last_name}" /></td>
						<td><c:out value="${i-user.email}" /></td>
						<td><c:out value="${i-user.created_at}" /></td>
						<td>
							<a href="#editEmployeeModal" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
							<a href="#deleteEmployeeModal" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
						</td>
					</tr>
				</c:forEach> --%>
				<%if (!listOfUsers.isEmpty()){
					for(User user:listOfUsers){ %>
					<tr>
						<td><%=user.getId() %></td>
						<td><%=user.getFirst_name() %></td>
						<td><%=user.getLast_name() %></td>
						<td><%=user.getEmail() %></td>
						<td><%=user.getCraeted_at() %></td>
						<td>
							<a href="edit?id=<%=user.getId() %>" class="edit" ><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
							<a href="delete?id=<%=user.getId() %>" class="delete" ><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
						</td>
					</tr>
					<% }
				} %>
				</tbody>
			</table>
		</div>
	</div>        
</div>
<!-- Add Modal HTML -->
<div id="addEmployeeModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form method="post" action="insert">
				<div class="modal-header">						
					<h4 class="modal-title">Add User</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">					
					<div class="form-group">
						<label>First Name</label>
						<input type="text" name="fname" id="fname" class="form-control" required>
					</div>
					<div class="form-group">
						<label>Last Name</label>
						<input type="text" name="lname" id="lname" class="form-control" required>
					</div>
					<div class="form-group">
						<label>Email</label>
						<input type="email" name="email" id="email" class="form-control" required>
					</div>
					<div class="form-group">
						<label>Password</label>
						<input type="password" name="pswd"  id="pswd" class="form-control" required>
					</div>					
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
					<input type="submit" class="btn btn-success" value="Add">
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>