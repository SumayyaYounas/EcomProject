<%@page import="packag.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<% 
String email=request.getParameter("email");
String mobilenumber=request.getParameter("mobilenumber");
String SecurityQuestions=request.getParameter("SecurityQuestion");
String answer=request.getParameter("answer");
String newpassword=request.getParameter("newpassword");
int check=0;

try
{
	Connection con=ConnectionProvider.getCon();
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery
	("select * from users where email='"+email+"'and mobilenumber='"
	+mobilenumber+"'and SecurityQuestion='"+SecurityQuestions+"'and answer='"+answer+"'and password='"+newpassword+"'  ");
	while(rs.next())
	{
		check=1;
		stmt.executeQuery("update users set password='"+newpassword+"' where email='"+email+"'");
		response.sendRedirect("ForgotPassword.jsp?msg=done");
	}
	if(check==0)
	{
		response.sendRedirect("ForgotPassword.jsp?msg=invalid");
	}
}
catch(Exception e)
{
	System.out.println(e);
}



%>