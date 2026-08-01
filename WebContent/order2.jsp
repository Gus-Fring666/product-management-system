<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<%@ include file="db.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order Process</title>
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

	String dist_id = request.getParameter("txt1"); // Distributer ID
	String dname = request.getParameter("txt2");   // Distributer Name
	String address = request.getParameter("txt3"); // Address
	String odate = request.getParameter("txt4");   // Order Date
	String pname = request.getParameter("txt5");   // Product Name
	String qtyStr = request.getParameter("txt6");  // Quantity
	String amtStr = request.getParameter("txt9");  // Final Amount
	
	int quantity = Integer.parseInt(qtyStr.trim());
	int amount = Integer.parseInt(amtStr.trim());
	
	String sql = "insert into order1 (dist_id, dname, address, odate, pname, quantity, amount) values (?, ?, ?, ?, ?, ?, ?)";
	st = con.prepareStatement(sql);
	st.setString(1, dist_id);
	st.setString(2, dname);
	st.setString(3, address);
	st.setString(4, odate);
	st.setString(5, pname);
	st.setInt(6, quantity);
	st.setInt(7, amount);
	
	int rows = st.executeUpdate();
	if (rows > 0) {
		out.println("<script>alert('Order Placed Successfully!'); window.location='home2.html';</script>");
	} else {
		out.println("<script>alert('Failed to place order!'); window.location='searchproduct3.jsp';</script>");
	}
}
catch(Exception ae)
{
	out.println("<p style='color:red;'>Order Error: " + ae.getMessage() + "</p>");
}
finally
{
	if(st != null) try { st.close(); } catch(SQLException ex) {}
	if(con != null) try { con.close(); } catch(SQLException ex) {}
}
%>
</body>
</html>