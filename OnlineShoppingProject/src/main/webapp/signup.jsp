<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/sig-style.css">
<meta charset="ISO-8859-1">
<title>SignUp</title>
</head>
<body>
<div>
<div id="container">
<div class="signup">
<form action="SignupAction.jsp" method="post">
<input style=" height: 25px;border-radius: 10px;" type="text" name="name" placeholder="Enter Your Name" required><br><br>
<input style=" height: 25px;border-radius: 10px;" type="email" name="email" placeholder="Enter Your Email" required><br><br>
<input style=" height: 25px;border-radius: 10px;" type="number" name="mobilenumber" placeholder="Enter Your mobilenumber" required><br><br>
<select style=" height: 25px;border-radius: 10px;" name="SecurityQuestions"><br><br>
<option value="Mention your favourite flower">Mention your favourite flower</option>
<option value="Mention your first petname">Mention your first petname</option>
<option value="Mention your favourite teacher in highschool">Mention your favourite teacher in highschool</option>
<option value="Mention your favourite colour">Mention your favourite colour</option>
</select><br><br>
<input style=" height: 25px; border-radius: 10px;" type="text" name="answer" placeholder="Enter Your Answer" required><br><br>
<input style=" height: 25px;border-radius: 10px;" type="password" name="password" placeholder="Enter Your password" required><br><br>
<input style=" height: 25px;border-radius: 10px;" type="submit" value="SignUp">
<h2><a href="Login.jsp">Login</a></h2>
</form>

</div>
<div class="whysign">
<%
String msg=request.getParameter("msg");
if("valid".equals("msg"))
{%>
<h1 style="color: red;
			margin-left: 350px;
">Successfully Registered</h1>
<%}%>
<%
if("invalid".equals("msg"))
{%>
<h1>Something Went Wrong ,,,Try Again!!</h1>
<%}%>
<h2>Online shopping</h2>
<p>The Online Shopping System is the application that allows the users to
 shop online without going to the shops to buy them.</p>

</div>
</div>
</div>

</body>
</html>