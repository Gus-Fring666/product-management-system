<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Product Process</title>
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
	int x = Integer.parseInt(d);
	int y = Integer.parseInt(e);
	
	String sql = "insert into products (id, pname, catagory, quantity, cost_price, pstatus) values (?, ?, ?, ?, ?, ?)";
	PreparedStatement st = con.prepareStatement(sql);
	st.setString(1, a);
	st.setString(2, b);
	st.setString(3, c);
	st.setInt(4, x);
	st.setInt(5, y);
	st.setString(6, f);
	
	st.executeUpdate();
	response.sendRedirect("home.html");
}
catch(Exception ae)
{
	out.println(ae);
}

%>
</body>
</html>
