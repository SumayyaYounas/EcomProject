<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

</head>
<br>
<div style="	width: 100%;
background-color:gray;
font-size: 20px;
text-align: center;
position: fixed;">
<%
String email=session.getAttribute("email").toString();
%>
<center style="font-size: 35px;color:yellow;">
ONLINE SHOPPING</center><br>
<a href="addNewProduct.jsp">Add New product<i></i></a>&emsp;
<a href="allproducteditproduct.jsp">All Products and Edit Products<i></i></a>&emsp;
<a href="">Messages Recieved<i></i></a>&emsp;
<a href="">orders Recieved<i></i></a>&emsp;
<a href="">Cancel Orders<i></i></a>&emsp;
<a href="">Delivered Orders<i></i></a>&emsp;
<a href="../Logout.jsp">logout<i></i></a>&emsp;
</div>
<body>
<br>

</body>
</html>