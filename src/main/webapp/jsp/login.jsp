<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
<title>Login</title>
<link rel="stylesheet" href="style.css" />
</head>
<body>
	<%@ include file="../html/login-nav.html"%>
	<div class="login container flex-container">
		<div class="card">
			<h1 class="title">Admin Login</h1>
			<div class="underline"></div>
			<form method="post" action="../login" class="login-form">
				<input type="text" name="email" id="email" placeholder="Email" /> <input
					type="password" name="password" id="password"
					placeholder="Password" />
				<button name="submit" type="submit" class="btn btn-thin">
					Log in</button>
			</form>
			<%
			
				try {
				if (Boolean.parseBoolean(request.getParameter("loginError"))) {
					out.print("<div class=\"login-error\">Wrong username or password</div>");
				}
			} catch (Exception e) {

			}
			%>
		</div>
	</div>



	<script src="add-candidate.js"></script>
</body>
</html>
