<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
.container
{
	height:700px;
}
body
{	 background:linear-gradient(to bottom, #0033cc 0%, #ff6600 87%);
}

</style>
</head>
<body>
<div class="container">
<div class="signup">
<form action="ForgotPasswordAction.jsp" method="post">

<input type="email" name="email" placeholder="Enter Your Email" required><br><br>
<input type="number" name="mobilenumber" placeholder="Enter Your mobilenumber" required><br><br>
<select name="SecurityQuestions"><br><br>
<option value="Mention your favourite flower">Mention your favourite flower</option>
<option value="Mention your first petname">Mention your first petname</option>
<option value="Mention your favourite teacher in highschool">Mention your favourite teacher in highschool</option>
<option value="Mention your favourite colour">Mention your favourite colour
</select></option><br><br>
<input type="text" name="answer" placeholder="Enter Your Answer" required><br><br>
<input type="password" name="newpassword" placeholder="Enter Your New password" required><br><br>
<input type="submit" value="Save"><br><br>
</form>
<h2><a href="Login.jsp">Login</a></h2>
</div>
</div>
</body>
</html>