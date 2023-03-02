<%@page import="packag.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<% 
String name=request.getParameter("name");
String email=request.getParameter("email");
String mobilenumber=request.getParameter("mobilenumber");
String SecurityQuestions=request.getParameter("SecurityQuestions");
String answer=request.getParameter("answer");
String password=request.getParameter("password");
String address="";
String city="";
String state="";
String country="";
try
{
	Connection con=ConnectionProvider.getCon();
	PreparedStatement smt=con.prepareStatement("insert into users values(?,?,?,?,?,?,?,?,?,?)");
	smt.setString(1,name);
	smt.setString(2,email);
	smt.setString(3,mobilenumber);
	smt.setString(4,SecurityQuestions);
	smt.setString(5,answer);
	smt.setString(6,password);
	smt.setString(7,address);
	smt.setString(8,city);
	smt.setString(9,state);
	smt.setString(10,country);
	smt.executeUpdate();
	response.sendRedirect("signup.jsp?msg=valid");
}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("signup.jsp?msg=invalid");
}
%>