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
	// Connection object comes from db.jsp
	Connection con = (Connection) request.getAttribute("dbConnection");
	
	if (con == null || con.isClosed()) {
		// Fallback connection if attribute isn't set
		String dbHost = System.getenv("MYSQLHOST") != null ? System.getenv("MYSQLHOST") : "localhost";
		String dbPort = System.getenv("MYSQLPORT") != null ? System.getenv("MYSQLPORT") : "3306";
		String dbName = System.getenv("MYSQLDATABASE") != null ? System.getenv("MYSQLDATABASE") : "product_management_system";
		String dbUser = System.getenv("MYSQLUSER") != null ? System.getenv("MYSQLUSER") : "root";
		String dbPass = System.getenv("MYSQLPASSWORD") != null ? System.getenv("MYSQLPASSWORD") : "root";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://" + dbHost + ":" + dbPort + "/" + dbName, dbUser, dbPass);
	}

	String a = request.getParameter("txt1"); // dname
	String b = request.getParameter("txt2"); // uname
	String c = request.getParameter("txt3"); // dcontact
	String d = request.getParameter("txt4"); // daddress
	String e = request.getParameter("txt5"); // upassword
	
	long x = Long.parseLong(c); // using long for phone numbers to prevent integer overflow
	
	String sql = "insert into distributer2 (dname, uname, dcontact, daddress, upassword) values (?, ?, ?, ?, ?)";
	PreparedStatement st = con.prepareStatement(sql);
	st.setString(1, a);
	st.setString(2, b);
	st.setLong(3, x);
	st.setString(4, d);
	st.setString(5, e);
	
	st.executeUpdate();
	response.sendRedirect("login3.jsp");
}
catch(Exception ae)
{
	out.println("Registration Error: " + ae.getMessage());
}	
%>
</body>
</html>