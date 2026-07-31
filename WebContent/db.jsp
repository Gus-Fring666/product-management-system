<%@ page import="java.sql.*" %>
<%
    // Fetch variables set in Railway
    String dbHost = System.getenv("MYSQLHOST");
    String dbPort = System.getenv("MYSQLPORT");
    String dbName = System.getenv("MYSQLDATABASE");
    String dbUser = System.getenv("MYSQLUSER");
    String dbPass = System.getenv("MYSQLPASSWORD");

    // Fallbacks for local development
    if (dbHost == null) dbHost = "localhost";
    if (dbPort == null) dbPort = "3306";
    if (dbName == null) dbName = "product_management_system";
    if (dbUser == null) dbUser = "root";
    if (dbPass == null) dbPass = "root";

    String dbUrl = "jdbc:mysql://" + dbHost + ":" + dbPort + "/" + dbName;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
        request.setAttribute("dbConnection", con);
    } catch (Exception e) {
        out.println("Database Connection Error: " + e.getMessage());
    }
%>
