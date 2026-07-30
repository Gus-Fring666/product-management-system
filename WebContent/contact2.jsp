<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Contact Process</title>
</head>
<body>
<%@ page import = "java.sql.*" %>
<%@ include file="db.jsp" %>
<%
try
{
	Connection con = getConnection();
	String a = request.getParameter("txt1");
	String b = request.getParameter("txt2");
	String c = request.getParameter("txt3");
	
	String sql = "insert into feedback (name, email, message) values (?, ?, ?)";
	PreparedStatement st = con.prepareStatement(sql);
	st.setString(1, a);
	st.setString(2, b);
	st.setString(3, c);
	
	st.executeUpdate();
	response.sendRedirect("home2.html");
}
catch(Exception ae)
{
	out.println(ae);
}

%>
</body>
</html>
