<%@ page import="java.sql.*" %>
<%!
    // Centralized DB connection.
    // Reads credentials from environment variables so nothing sensitive is hardcoded
    // or committed to source control. Falls back to local dev defaults if unset.
    public static Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver"); // matches the driver jar already bundled in WEB-INF/lib
        String host = System.getenv("DB_HOST") != null ? System.getenv("DB_HOST") : "localhost";
        String port = System.getenv("DB_PORT") != null ? System.getenv("DB_PORT") : "3306";
        String name = System.getenv("DB_NAME") != null ? System.getenv("DB_NAME") : "product_management_system";
        String user = System.getenv("DB_USER") != null ? System.getenv("DB_USER") : "root";
        String pass = System.getenv("DB_PASS") != null ? System.getenv("DB_PASS") : "";
        String url = "jdbc:mysql://" + host + ":" + port + "/" + name
                + "?useSSL=true&requireSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
        return DriverManager.getConnection(url, user, pass);
    }
%>
