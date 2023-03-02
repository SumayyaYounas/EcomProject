<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="packag.ConnectionProvider" %>
<%@include file="adminHeader.jsp" %>
<%@ include file="../footer.jsp" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HOME</title>
<style>
body
{	 background:linear-gradient(to bottom, #0033cc 0%, #ff6600 87%);

}
.container
{
	height: 500px;
	}
h3
{
color:yellow;
text-align: center;
}
table, th, td 
{
 color:white;
  border: 1px solid;
  margin-left: 300px;
  margin-top: 150px;
 border-collapse: collapse;
 width: 800px;;
 text-align: center;
 }
</style>
</head>
<body>
<div class="container">
<%
String msg=request.getParameter("msg");
if("done".equals(msg))
{%>
<h3 class="alert">Product Sucessfully Updated</h3>
<%} %>
<%if("invalid".equals(msg))
{%>
<h3 class="alert">Something Went Wrong! Try Again</h3>
<%} %>
<table>
<thead>
<tr>
<th scope="col">ID</th>
<th scope="col">NAME</th>
<th scope="col">CATEGORY</th>
<th scope="col">PRICE</th>
<th scope="col">STATUS</th>
<th scope="col">EDIT</th>
</tr>
</thead>

<tbody>
<tr>
<%
try
{
	Connection con=ConnectionProvider.getCon();
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery("select * from product");
	while(rs.next())
	{%>

		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><i></i><%=rs.getString(4) %></td>
		<td><%=rs.getString(5) %></td>
		<td><a href="editProduct.jsp?id=<%=rs.getString(1) %>">EDIT<i></i></a></td>
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