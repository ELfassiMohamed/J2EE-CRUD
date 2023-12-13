<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Message</title>
<style type="text/css">
.input {
	
	// needs to be relative so the :focus span is positioned correctly
	position:relative;
	
	// bigger font size for demo purposes
	font-size: 1.5em;
	
	// the border gradient
	background: linear-gradient(21deg, #10abff, #1beabd);
	
	// the width of the input border
	padding: 3px;
	
	// we want inline fields by default
	display: inline-block;
	
	// we want rounded corners no matter the size of the field
	border-radius: 9999em;
	
	// style of the actual input field
	*:not(span) {
		position: relative;
		display: inherit;
		border-radius: inherit;
		margin: 0;
		border: none;
		outline: none;
		padding: 0 .325em;
		z-index: 1; // needs to be above the :focus span
		
		// summon fancy shadow styles when focussed
		&:focus + span {
			opacity: 1;
			transform: scale(1);
		}
	}
	
	// we don't animate box-shadow directly as that can't be done on the GPU, only animate opacity and transform for high performance animations.
	span {
		
		transform: scale(.993, .94); // scale it down just a little bit
		transition: transform .5s, opacity .25s;
		opacity: 0; // is hidden by default
		
		position:absolute;
		z-index: 0; // needs to be below the field (would block input otherwise)
		margin:4px; // a bit bigger than .input padding, this prevents background color pixels shining through
		left:0;
		top:0;
		right:0;
		bottom:0;
		border-radius: inherit;
		pointer-events: none; // this allows the user to click through this element, as the shadow is rather wide it might overlap with other fields and we don't want to block those.
		
		// fancy shadow styles
		box-shadow: inset 0 0 0 3px #fff,
			0 0 0 4px #fff,
			3px -3px 30px #1beabd, 
			-3px 3px 30px #10abff;
	}
	
}

html {
	font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
	line-height:1.5;
	font-size:1em;
}

body {
	text-align: center;
	display:flex;
	align-items: center;
	justify-content: center;
}

html, body {
	height:100%;
}

input {
	font-family: inherit;
	line-height:inherit;
	color:#2e3750;
	min-width:12em;
}

::placeholder {
	color:#cbd0d5;
}

html::after {
	content:'';
	background: linear-gradient(21deg, #10abff, #1beabd);
	height:3px;
	width:100%;
	position:absolute;
	left:0;
	top:0;
}
</style>
</head>
<body>
<p>
	<span class="input">
		<c:out value="${requestScope.myMessage}" />=> go back :<a href="index.jsp">Index Page</a>
		<span></span>	
	</span>
</p>

</body>
</html>