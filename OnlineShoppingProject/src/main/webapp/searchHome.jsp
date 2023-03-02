<%@page import="java.sql.ResultSet"%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="packag.ConnectionProvider" %>
<%@ include file="header.jsp" %>
<%@ include file="footer.jsp" %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SearchHome</title>
<style type="text/css">
table, th, td 
{
 color:white;
  border: 1px solid;
  margin-left: 300px;
  margin-top: 300px;
 border-collapse: collapse;
 width: 800px;;

 }
 body
{
background: linear-gradient(0deg, rgba(34,193,195,1) 19%, rgba(34,191,82,1) 52%);
}
.container
{
	height: 500px;
}
</style>
</head>
<body>
<div class="container">
<table>
	<thead>
	<tr>
	<th scope="col">ID</th>
	<th scope="col">NAME</th>
	<th scope="col">CATEGORY</th>
	<th scope="col">PRICE</th>
	<th scope="col">ADD TO CART<i></i></th>
	</tr>
	</thead>
<tbody>
 <%
int z=0;
try
{
	String search=request.getParameter("search");
	Connection con=ConnectionProvider.getCon();
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery("select * from product where name like '%"+search+"%'or category like'%"+search+"%'");
	
while(rs.next())
{
	z=1;
	%>	
<tr>
		<td><%=rs.getString(1)%></td>
		<td><%=rs.getString(2)%></td>
		<td><%=rs.getString(3)%></td>
		<td><%=rs.getString(4)%></td>
		<td><a href="addToCartAction.jsp?id=<%=rs.getString(1)%>">Add To Cart</a></td>
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
<%
if(z==0)
{%>
	<h1 style="coolor:white;text-align: center;">Nothing to show</h1>
<% }%>
<br>
<br>
</div>
</body>
</html>