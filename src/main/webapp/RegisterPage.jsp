<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Page</title>
<style type="text/css"><%@ include file="/Includes/LoginStyles.css"%></style>
</head>
<body>
<h2>Hi! You can Register Here</h2>
<div class="container" id="container">
	<div class="form-container sign-in-container">
		<form method="post" action="Register.auth">
			<h1>Create Account</h1>
			<input type="text" name="fname" placeholder="First name" required/>
			<input type="text" name="lname" placeholder="Last Name" required/>
			<input type="email" name="email" placeholder="Email" required/>
			<input type="password" name="pswd" placeholder="Password" required/>
			<button type="submit">Sign Up</button>
		</form>
	</div>
	<div class="overlay-container">
		<div class="overlay">
			<div class="overlay-panel overlay-right">
				<h1>Already have an account!</h1>
				<a href="LoginPage.jsp"><h3>Go back</h3></a>
			</div>
		</div>
	</div>
</div>
</body>
</html>