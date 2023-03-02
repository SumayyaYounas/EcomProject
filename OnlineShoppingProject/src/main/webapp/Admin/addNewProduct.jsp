
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="packag.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add New Product</title>
<style>
.input-style
{
height: 25px;
width: 150px;
}
.button
{
width: 400px;
margin-left: 380px;
margin-top: 40px;
height: 40px;
}
.id1
{
 margin-top: 100px;
 margin-left: 150px;
}
</style>
<link rel="stylesheet" href="../css/newpoduct.css" >
</head>
<body>
<%
String msg=request.getParameter("msg");
if("done".equals(msg))
{%>
	<h3 class="alert">Product Added Sucessfully</h3>
<%} %>
<% 
if("wrong".equals(msg))
{%>
	<h3 class="alert">Something Went Wrong!!Try Again</h3>
<%} %>

<%
int id=1;
try
{
	Connection con=ConnectionProvider.getCon();
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery("select max(id)from product");
	 while(rs.next())
	 {
		 id=rs.getInt(1);
		 id=id+1;
		 
	 }
}

catch(Exception e)
{
	System.out.println(e);
}
%>
<div id="container">
<h3 style="color: yellow;">Product Id:<%out.println(id); %></h3>
<form action="addNewProductAction.jsp" method="post">
<br>
<input class="id1" type="hidden"  name="id" value="<% out.println(id);%>">

<div class="left" style="margin-left: 250px;
margin-top: 150px;">
<h3>Enter Name :</h3>
<input class="input-style" type="text" name="name" placeholder="Enter your product name" required="required">
<br>
</div>

<div class="right" style="margin-left: 730px;margin-top: -80px;">
<h3>Enter Category :</h3>
<input class="input-style"  type="text" name="cat" placeholder="Enter your category" required="required">
<br>
</div>

<div class="left" style="margin-left: 250px;">
<h3>Enter Price :</h3>
<input class="input-style" type="text" name="price" placeholder="Enter your price" required="required">
<br>
</div>

<div class="right"style="margin-left: 730px;margin-top: -90px;" >
<h3>Active</h3>
<select class="input-style" name="active">
<option value="yes">yes</option>
<option value="no">no</option><br>
</select>

</div><br>
<button class="button" >Save<i class=""></i></button>
</form>
</div>
</body>
</html>