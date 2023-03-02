<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<%@include file="../footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/Header.css">

<title>Header</title>
<style>
button
{
	width: 53px;
	height: 25px;
}
</style>
</head>
<br>
<div style="width: 100%;
background-color:gray;
font-size: 20px;
text-align: center;
position: fixed;">

<%String name=session.getAttribute("email").toString(); %>
<center><h2>Online Shopping</h2></center>
<h2><a href=""><%out.println(name); %></a></h2>
<a href="home.jsp">Home<i></i></a>&emsp;
<a href="Cart.jsp">My Cart<i></i></a>&emsp;
<a href="">My Orders<i></i></a>&emsp;
<a href="">Change Details<i></i></a>&emsp;
<a href="">Message Us<i></i></a>&emsp;
<a href="">About<i></i></a>&emsp;
<a href="Logout.jsp">logout<i></i></a>&emsp;
<div class="search-container"style="margin-left: 1000px;">
<form action="searchHome.jsp" method="post">
<input type="text" name="search" placeholder="Search Here...">
<button type="submitt">Search<i></i></button>
</form>
</div>
</div>



<body>

</body>
</html>