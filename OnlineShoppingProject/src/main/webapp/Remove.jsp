<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="packag.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@include file="footer.jsp" %>
<%@include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String email_id=request.getParameter("email");
String id=request.getParameter("product_id");
String category=request.getParameter("category");
String price=request.getParameter("price");
String total=request.getParameter("total");
try
{
	Connection con=ConnectionProvider.getCon();
	Statement stmt=con.createStatement();

		stmt.executeUpdate("delete from cart where product_id='"+id+"'");
	response.sendRedirect("Cart.jsp?msg=done");
}
catch(Exception e)
{
	response.sendRedirect("Cart.jsp?msg=invalid");
	System.out.println(e);
}

%>