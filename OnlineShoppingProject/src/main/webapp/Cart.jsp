<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import ="packag.ConnectionProvider"%>
<%@include file="footer.jsp" %>
<%@include file="header.jsp"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
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
<%

String email_id=session.getAttribute("email").toString();

String msg=request.getParameter("msg");
if("done".equals(msg))
{%>
<h3 class="alert">Product Sucessfully Deleted</h3>
<%} %>
<%if("invalid".equals(msg))
{%>
<h3 class="alert">Something Went Wrong! Try Again</h3>
<%} %>
<table>
<thead>
<tr>
<th scope="col">EMAIL_ID</th>
<th scope="col">PRODUCT_ID</th>
<th scope="col">QUANTITY</th>
<th scope="col">PRICE</th>
<th scope="col">TOTAL</th> 
<th scope="col">REMOVE</th>
</tr>
</thead>

<tbody>
<%
try
{
	Connection con=ConnectionProvider.getCon();
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery("select * from cart inner join product on  id=cart.product_id and cart.email='"+email_id+"' and cart.address is NULL");
	while(rs.next()) 
	{%>
		<tr>
		<td><%=rs.getString(1)%></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4)%></td>
		<td><a href="Remove.jsp?id=<%rs.getString(1);%>">Remove</a></td>
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