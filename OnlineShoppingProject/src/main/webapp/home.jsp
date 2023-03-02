<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="packag.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@include file="footer.jsp" %>
<%@include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<style type="text/css">
h3
{
color:yellow;
text-align: center;
}
.alert
{
color:yellow;
text-align: center;
}
body
{
background: linear-gradient(0deg, rgba(34,193,195,1) 19%, rgba(34,191,82,1) 52%);
}
.container
{
	height: 500px;
}
table, th, td 
{
 color:white;
  border: 1px solid;
  margin-left: 300px;
  margin-top: 300px;
 border-collapse: collapse;
 width: 800px;;

 }
</style>
</head>
<body>
<div class="container">
<div style="color: black; text-align: center;font-size: 30px;">Home<i class=""></i></div>
<%
String msg=request.getParameter("msg");

if("added".equals(msg))
{
%>
<h3 class="alert">Product Added Sucessfully</h3>	
<%} %>
<%
if("exit".equals(msg))
{
%>
<h3 class="alert">Product Already Exist in your cart!  Quantity Increased!</h3>	
<%} %>
<%
if("invalid".equals(msg))
{
%>
<h3 class="alert">Something Went Wrong! Try again</h3>	
<%} %>

<table>
<thead>
<tr>
<th scope="col">ID</th>
<th scope="col">Name</th>
<th scope="col">Catagory</th>
<th scope="col">Price</th>
<th scope="col">Add to Cart</th> 
</tr>
</thead>

<tbody>
<%
try
{
	Connection con=ConnectionProvider.getCon();
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery("select * from product where active='yes'");
	while(rs.next())
	{%>
		<tr>
		<td><%=rs.getString(1)%></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4)%></td>
		<td><a href="addToCartAction.jsp?id=<%rs.getString(1);%>">Add to cart</a></td>
		</tr>
		
<%

}
	}
catch(Exception e)
{
	System.out.println(e);
}
%>	

</tbody>

</table>
</div>
</body>
</html>