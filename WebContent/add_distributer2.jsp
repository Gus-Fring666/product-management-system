<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Distributor Registration Process</title>
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
	String d = request.getParameter("txt4");
	String e = request.getParameter("txt5");
	int x = Integer.parseInt(c);
	
	String sql = "insert into distributer2 (dname, uname, dcontact, daddress, upassword) values (?, ?, ?, ?, ?)";
	PreparedStatement st = con.prepareStatement(sql);
	st.setString(1, a);
	st.setString(2, b);
	st.setInt(3, x);
	st.setString(4, d);
	st.setString(5, e);
	
	st.executeUpdate();
	response.sendRedirect("login3.jsp");
}
catch(Exception ae)
{
	out.println(ae);
}

%>
</body>
</html>
