<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Product Process</title>
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
	int y = Integer.parseInt(d);
	
	String sql = "update products set pname = ?, quantity = ?, cost_price = ?, pstatus = ? where id = ?";
	PreparedStatement st = con.prepareStatement(sql);
	st.setString(1, b);
	st.setInt(2, x);
	st.setInt(3, y);
	st.setString(4, e);
	st.setString(5, a);
	
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
