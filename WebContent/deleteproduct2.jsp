<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Product Process</title>
</head>
<body>
<%@ page import = "java.sql.*" %>
<%@ include file="db.jsp" %>
<%
try
{
	Connection con = getConnection();
	String a = request.getParameter("txt1");
	
	String sql = "delete from products where id = ?";
	PreparedStatement st = con.prepareStatement(sql);
	st.setString(1, a);
	
	st.executeUpdate();
	response.sendRedirect("viewproduct.jsp");
}
catch(Exception ae)
{
	out.println(ae);
}

%>
</body>
</html>
