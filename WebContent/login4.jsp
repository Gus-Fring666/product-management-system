<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<%@ include file="db.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Distributor Login Process</title>
</head>
<body>
<%
Connection con = null;
PreparedStatement st = null;
ResultSet rs = null;
try
{
	con = (Connection) request.getAttribute("dbConnection");
	if (con == null || con.isClosed()) {
		String dbHost = System.getenv("MYSQLHOST") != null ? System.getenv("MYSQLHOST") : "localhost";
		String dbPort = System.getenv("MYSQLPORT") != null ? System.getenv("MYSQLPORT") : "3306";
		String dbName = System.getenv("MYSQLDATABASE") != null ? System.getenv("MYSQLDATABASE") : "product_management_system";
		String dbUser = System.getenv("MYSQLUSER") != null ? System.getenv("MYSQLUSER") : "root";
		String dbPass = System.getenv("MYSQLPASSWORD") != null ? System.getenv("MYSQLPASSWORD") : "root";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://" + dbHost + ":" + dbPort + "/" + dbName, dbUser, dbPass);
	}

	String uname = request.getParameter("txt1");
	String upassword = request.getParameter("txt2");
	
	String sql = "select * from distributer2 where uname = ? and upassword = ?";
	st = con.prepareStatement(sql);
	st.setString(1, uname);
	st.setString(2, upassword);
	rs = st.executeQuery();
	
	if(rs.next())
	{
		session.setAttribute("uid", uname);
		response.sendRedirect("home2.html");
	}
	else
	{
		out.println("<script>alert('Invalid Username or Password!'); window.location='login3.jsp';</script>");
	}
}
catch(Exception ae)
{
	out.println("Login Error: " + ae.getMessage());
}
finally
{
	if(rs != null) try { rs.close(); } catch(SQLException ex) {}
	if(st != null) try { st.close(); } catch(SQLException ex) {}
	if(con != null) try { con.close(); } catch(SQLException ex) {}
}
%>
</body>
</html>





<!-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Distributor Login Process</title>
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
			String sql = "select * from distributer2 where uname = ? and upassword = ?";
			
			//set session
			session.setAttribute("uid", a);
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, a);
			st.setString(2, b);
			ResultSet rs = st.executeQuery();
			
			if(rs.next())
			{
				response.sendRedirect("home2.html");
			}
			else
			{
				response.sendRedirect("login3.jsp");
			}
		}
		catch(Exception ae)
		{
			out.println(ae);
		}

		%>

</body>
</html> -->
