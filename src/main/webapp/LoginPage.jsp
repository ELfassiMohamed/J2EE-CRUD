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
		<form action="#">
			<h1>Sign in</h1>
			<span>or use your account</span>
			<input type="email" placeholder="Email" />
			<input type="password" placeholder="Password" />
			<a href="#">Forgot your password?</a>
			<button>Sign In</button>
		</form>
	</div>
	<div class="overlay-container">
		<div class="overlay">
			<div class="overlay-panel overlay-right">
				<h1>Don't Have Account!</h1>
				<p>Register Now</p>
				<a href="RegisterPage.jsp"class="ghost" id="signUp">Sign up now</a>
				<!-- <button class="ghost" id="signUp">Sign Up</button> -->
			</div>
		</div>
	</div>
</div>
</body>
</html>