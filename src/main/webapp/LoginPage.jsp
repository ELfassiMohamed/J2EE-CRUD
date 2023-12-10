<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome</title>
<style type="text/css"><%@ include file="/Includes/LoginStyles.css"%></style>
</head>
<body>
<h2>Welcome Again</h2>
<div class="container" id="container">
	<div class="form-container sign-in-container">
		<form method="post" action="SignIn.auth">
			<h1>Sign in</h1>
			<input type="email" name="email" placeholder="Email" required/>
			<input type="password" name="pswd" placeholder="Password"  required/>
			<a href="#">Forgot your password?</a>
			<button type="submit">Sign In</button>
		</form>
	</div>
	<div class="overlay-container">
		<div class="overlay">
			<div class="overlay-panel overlay-right">
				<h1>Don't Have Account!</h1>
				<h4>Register Now</h4>
				<a href="RegisterPage.jsp"class="ghost" id="signUp"><h3>Sign up HERE</h3></a>
				<!-- <button class="ghost" id="signUp">Sign Up</button> -->
			</div>
		</div>
	</div>
</div>
</body>
</html>