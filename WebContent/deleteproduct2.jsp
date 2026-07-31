<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Product Processing</title>
</head>
<body>
<%
Connection con = null;
PreparedStatement st = null;
try {
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

    String pid = request.getParameter("txt1");
    if (pid == null) pid = request.getParameter("id");

    String sql = "DELETE FROM products WHERE pid = ?";
    st = con.prepareStatement(sql);
    st.setString(1, pid);

    int rows = st.executeUpdate();
    if (rows > 0) {
        out.println("<script>alert('Product Deleted Successfully!'); window.location='viewproduct.jsp';</script>");
    } else {
        out.println("<script>alert('Failed to delete product!'); window.location='viewproduct.jsp';</script>");
    }
} catch (Exception e) {
    out.println("Error deleting product: " + e.getMessage());
} finally {
    if (st != null) try { st.close(); } catch(SQLException ex) {}
    if (con != null) try { con.close(); } catch(SQLException ex) {}
}
%>
</body>
</html>