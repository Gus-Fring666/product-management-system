<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Product Processing</title>
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
    String status = request.getParameter("txt6");

    int quantity = Integer.parseInt(qtyStr.trim());
    int costprice = Integer.parseInt(priceStr.trim());

    String sql = "UPDATE products SET pname = ?, catagory = ?, quantity = ?, costprice = ?, status = ? WHERE pid = ?";
    st = con.prepareStatement(sql);
    st.setString(1, pname);
    st.setString(2, catagory);
    st.setInt(3, quantity);
    st.setInt(4, costprice);
    st.setString(5, status);
    st.setString(6, pid);

    int rows = st.executeUpdate();
    if (rows > 0) {
        out.println("<script>alert('Product Updated Successfully!'); window.location='viewproduct.jsp';</script>");
    } else {
        out.println("<script>alert('Failed to update product!'); window.location='viewproduct.jsp';</script>");
    }
} catch (Exception e) {
    out.println("Error updating product: " + e.getMessage());
} finally {
    if (st != null) try { st.close(); } catch(SQLException ex) {}
    if (con != null) try { con.close(); } catch(SQLException ex) {}
}
%>
</body>
</html>