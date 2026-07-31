<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Product Processing</title>
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
    String pname = request.getParameter("txt2");
    String catagory = request.getParameter("txt3");
    String qtyStr = request.getParameter("txt4");
    String priceStr = request.getParameter("txt5");
    String status = "Available"; // Default status since form has 5 inputs

    int quantity = (qtyStr != null && !qtyStr.trim().isEmpty()) ? Integer.parseInt(qtyStr.trim()) : 0;
    int costprice = (priceStr != null && !priceStr.trim().isEmpty()) ? Integer.parseInt(priceStr.trim()) : 0;

    String sql = "INSERT INTO products (pid, pname, catagory, quantity, costprice, status) VALUES (?, ?, ?, ?, ?, ?)";
    st = con.prepareStatement(sql);
    st.setString(1, pid);
    st.setString(2, pname);
    st.setString(3, catagory);
    st.setInt(4, quantity);
    st.setInt(5, costprice);
    st.setString(6, status);

    int rows = st.executeUpdate();
    if (rows > 0) {
        out.println("<script>alert('Product Added Successfully!'); window.location='viewproduct.jsp';</script>");
    } else {
        out.println("<script>alert('Failed to add product!'); window.location='addproduct.jsp';</script>");
    }
} catch (Exception e) {
    out.println("Error adding product: " + e.getMessage());
} finally {
    if (st != null) try { st.close(); } catch(SQLException ex) {}
    if (con != null) try { con.close(); } catch(SQLException ex) {}
}
%>
</body>
</html>