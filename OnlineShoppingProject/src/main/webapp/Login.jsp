<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/login-style.css">
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
<div id="container">

<div class="left-box">

<form action="LoginAction.jsp" method="post">
<input style=" height: 25px;border-radius: 10px;" type="email" name="email" placeholder="Enter your email"><br><br>
<input style=" height: 25px;border-radius: 10px;"  type="password" name="password" placeholder=" Enter your Password"><br><br>
<input style=" height: 25px;border-radius: 10px;"  type="submit" value="Login">
</form>
<h2><a href="signup.jsp">SignUp</a></h2>
<h2><a href="ForgotPassword.jsp">ForgotPassword</a></h2>
</div>

<div class="right-box">
<%
String msg=request.getParameter("msg");
if("notexist".equals("msg"))
{%>
<h1>Incorect Username or Password</h1>
<%} %>
<%
if("invalid".equals("msg"))
{%>
<h1>Something Went Wrong ,,,Try Again!!</h1>
<%}	
%>
<h2>Online shopping</h2>
<p>The Online Shopping System is the application that allows the users to
 shop online without going to the shops to buy them.</p>

</div>
</div>
</body>
</html>