<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="packag.ConnectionProvider" %>

<% 
String email=request.getParameter("email");
String Password=request.getParameter("password");
if("admin@inmakes.com".equals(email)&&"admin".equals(Password))
{
	session.setAttribute("email",email);
	response.sendRedirect("Admin/adminHome.jsp");
}
else
{
	int z=0;
	try
	{
		Connection con=ConnectionProvider.getCon();
		Statement smt=con.createStatement();
		ResultSet res=smt.executeQuery("select * from users where email='"+email+"'&& password='"+Password+"'");
		while(res.next())
		{
			z=1;
			session.setAttribute("email",email);
			response.sendRedirect("home.jsp");
		}
		if(z==0)
			response.sendRedirect("Login.jsp?msg=notexist");
	
	}
	catch(Exception e)
	{
		System.out.println(e);
		response.sendRedirect("login.jsp?msg=notexist");
	}
}
%>
