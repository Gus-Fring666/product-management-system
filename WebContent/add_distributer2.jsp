<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<%@ include file="db.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Distributor Registration Process</title>
</head>
<body>
<%
Connection con = null;
PreparedStatement st = null;
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

	String dname = request.getParameter("txt1");     // Name
	String upassword = request.getParameter("txt2"); // Password
	String dcontact = request.getParameter("txt3");  // Phone Number
	String uname = request.getParameter("txt4");     // Username/Email
	String daddress = request.getParameter("txt5");  // Address
	
	long x = Long.parseLong(dcontact.trim());
	
	String sql = "insert into distributer2 (dname, uname, dcontact, daddress, upassword) values (?, ?, ?, ?, ?)";
	st = con.prepareStatement(sql);
	st.setString(1, dname);
	st.setString(2, uname);
	st.setLong(3, x);
	st.setString(4, daddress);
	st.setString(5, upassword);
	
	int rows = st.executeUpdate();
	if(rows > 0) {
		out.println("<script>alert('Distributor Registered Successfully!'); window.location='login3.jsp';</script>");
	} else {
		out.println("<script>alert('Registration Failed!'); window.location='add_distrubuter.jsp';</script>");
	}
}
catch(Exception ae)
{
	out.println("Registration Error: " + ae.getMessage());
}
finally
{
	if(st != null) try { st.close(); } catch(SQLException ex) {}
	if(con != null) try { con.close(); } catch(SQLException ex) {}
}
%>
</body>
</html>

	out.println("Registration Error: " + ae.getMessage());
}	
%>
</body>
</html> -->
