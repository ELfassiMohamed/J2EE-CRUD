<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit user</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" 
crossorigin="anonymous" referrerpolicy="no-referrer" />
<script>
    function togglePassword() {
      var passwordInput = document.getElementById("password");
      if (passwordInput.type === "password") {
        passwordInput.type = "text";
      } else {
        passwordInput.type = "password";
      }
    }
  </script>
</head>
<body>
<div class="container">
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center"><h4>Update user</h4>
			<div class="col-sm-3">
						<a href="index.jsp" class="btn btn-success" ><span>Go Back</span></a>
					</div>
			</div>
			<div class="card-body">
				<form method="post" action="update">
				<div class="form-group">
					<label>Fisrt Name :</label> 
					<input type="text" class="form-control" name="fname" value="${user_selected.first_name}">
					</div>
					<div class="form-group">
						<label>Last Name :</label>
						<input type="text" class="form-control" name="lname" value="${user_selected.last_name}" >
					</div>
					<!-- <div class="form-group">
						<label>Is Admin :</label> 
						<input type="radio" class="form-control" name="isAdmin" >
					</div> -->
					<div class="form-group">
						<label>Email :</label> <input type="email" class="form-control"
							name="email" value="${user_selected.email}" >
					</div>
					<div class="form-group">
						<label>Password :</label> 
						<input type="password"
							class="form-control" name="password" id="password" value="${user_selected.password}">
							<span>show password <input type="checkbox" id="showPassword" onclick="togglePassword()" > </span>
					</div>
					<div class="text-center">
					<input type="hidden" name="id" value="${user_selected.id}">
						<button type="submit" class="btn btn-primary">Update</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>