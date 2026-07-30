<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order Process</title>
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
	String f = request.getParameter("txt6");
	String g = request.getParameter("txt9");
	int x = Integer.parseInt(f);
	int y = Integer.parseInt(g);
	
	String sql = "insert into order1 (dist_id, dname, address, odate, pname, quantity, amount) values (?, ?, ?, ?, ?, ?, ?)";
	PreparedStatement st = con.prepareStatement(sql);
	st.setString(1, a);
	st.setString(2, b);
	st.setString(3, c);
	st.setString(4, d);
	st.setString(5, e);
	st.setInt(6, x);
	st.setInt(7, y);
	
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
