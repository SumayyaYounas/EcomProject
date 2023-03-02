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
</head>
<body>
<% 
Connection con=ConnectionProvider.getCon();
String email_id=session.getAttribute("email").toString(); 
String id=request.getParameter("product_id");
int quantity=1;
int product_price=0;
int product_total=0;
int cart_total=0;

 int z=0;
 try{
	 
	  PreparedStatement pr=con.prepareStatement("select * from product where id='"+id+"'");
	  ResultSet st=pr.executeQuery();
	  while (st.next()){
		  
		  product_price=st.getInt(4);
		  product_total=product_price;
		  name=st.getString(1);
	
	  }
	  ResultSet r1=pr.executeQuery("select * from cart where product_id='"+id+"'and email='"+email_id+"'");
	  while(r1.next()){
		  cart_total=r1.getInt(5);
		  cart_total=cart_total+product_total;
		  quantity=quantity+1;
		  z=1;
				  
	  }
	  if(z==1){
		  pr.executeUpdate("update cart set total='"+cart_total+"',quantity='"+quantity+"' where product_id='"+id+"' and email='"+email_id+"' and address is null");
	      response.sendRedirect("home.jsp?msg=exists");	  }
	  if(z==0){
		  
		  PreparedStatement pre=con.prepareStatement("insert into cart(email,product_id,name,quantity,price,total)values(?,?,?,?,?,?)");
		  pre.setString(1, email_id);
		  pre.setString(2, id);
		  pre.setString(3, name);
		  pre.setInt(4,quantity);
		  pre.setInt(5, product_price);
		  pre.setInt(6, product_total);
	  pre.executeUpdate();
	  response.sendRedirect("home.jsp?msg=added");	  
	  
	  }
 }
	  catch(Exception e){
		  System.out.println(e);
		  response.sendRedirect("home.jsp?msg=invalid");
		  }
 
 
 %>
</body>
</html>