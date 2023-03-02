<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="packag.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="../footer.jsp" %>
    <%@include file="adminHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="../css/edit.css">
<title>Add New Product</title>
<style >
.back
{
color:white;
margin-left: 200px;
}
body
{	 background:linear-gradient(to bottom, #0033cc 0%, #ff6600 87%);

}
.container
{
	height: 500px;
}
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
</style>
</head>
<body>
<div class="container">
<h2><a class="back" href="allproducteditproduct.jsp">Back</a></h2>
<%
try
{
	String id=request.getParameter("id");
	Connection con=ConnectionProvider.getCon();
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery("select * from product where id='"+id+"'");
	while(rs.next())
	{
		
%>
<form action="editProductAction.jsp" method="post">
<input type="hidden" name="id" value="<% out.print(id);%>">
<div class="left" style="margin-left: 250px;
margin-top: 150px;">
<h3>Enter Name :</h3>
<input class="input-style" type="text" name="name"value="<%=rs.getString(2)%>" placeholder="Enter your product name" required="required">
<br>
</div>

<div class="right" style="margin-left: 730px;margin-top: -80px;">
<h3>Enter Category :</h3>
<input class="input-style"  type="text" name="category"value="<%=rs.getString(3)%>" placeholder="Enter your category" required="required">
<br>
</div>

<div class="left" style="margin-left: 250px;">
<h3>Enter Price :</h3>
<input class="input-style" type="text" name="price"value="<%=rs.getString(4)%>" placeholder="Enter your price" required="required">
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
<%
	}
}

catch(Exception e)
{
	System.out.println(e);
}
%>
</div>
</body>
<br><br><br>
</html>