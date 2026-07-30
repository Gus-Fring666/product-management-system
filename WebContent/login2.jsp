<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Process</title>
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
			String sql = "select * from admin where username = ? and userpassword = ?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, a);
			st.setString(2, b);
			ResultSet rs = st.executeQuery();
			
			if(rs.next())
			{
				response.sendRedirect("home.html");
			}
			else
			{
				response.sendRedirect("login1.jsp");
			}
		}
		catch(Exception ae)
		{
			out.println(ae);
		}

		%>
	
</body>
</html>
