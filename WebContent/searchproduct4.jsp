<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Product Result</title>
<style>
#container { width:100%; height:auto; }
#header { width:100%; height:150px; background-color:cyan; }
#logo { width:100px; height:100px; border:1px solid blue; margin-top:20px; position:absolute; margin-left:50px; background-image:url("product.jpg"); background-size:cover; }
#heading { width:100%; height:150px; margin-left:200px; }
#home { width:100%; height:50px; background-color:yellow; margin-top:-20px; }
#contain { width:100%; height:400px; }
#side1 { width:10%; height:400px; background-color:rgb(22,255,228); float:left; }
#side2 { width:90%; height:400px; background-color:white; margin-left:10%; }
#footer { width:100%; height:80px; background-color:orange; }
ul li { list-style-type:none; padding-top:20px; }
ul li a { text-decoration:none; font-size:14px; }
ul li a:hover { border-bottom:3px solid rgb(66,64,255); cursor: pointer; }
table { height:auto; width:80%; margin-left:10%; margin-top:20px; }
</style>
</head>
<body>
<div id = "container">
	<div id = "header">
		<div id = "logo"></div>
		<div id = "heading"><br><h1>Product Management System</h1></div>
	</div>
	<div id = "home"><h1>Search Product</h1></div>
	<div id = "contain">
		<div id = "side1">
			<ul>
				<li><a href="searchproduct3.jsp">Search Product</a></li>
				<li><a href="Distributor_status.jsp">Order Status</a></li>
				<li><a href="contact2.jsp">Contact us</a></li>
			</ul>
		</div>
		<div id = "side2">
		
		<%@ page import = "java.sql.*" %>
		<%@ include file="db.jsp" %>
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

			String cat = request.getParameter("txt1");
			String sql = "select * from products where catagory = ?";
			st = con.prepareStatement(sql);
			st.setString(1, cat);
			rs = st.executeQuery();

			boolean found = false;
			out.println("<table border = '1'>");
			out.println("<tr bgcolor='lime'>");
			out.println("<td>Product ID</td>");
			out.println("<td>Product Name</td>");
			out.println("<td>Product Catagory</td>");
			out.println("<td>Product Quantity</td>");
			out.println("<td>Product Cost Price</td>");
			out.println("<td>Product Status</td>");
			out.println("<td>Order Product</td>");
			out.println("</tr>");

			while(rs.next())
			{
				found = true;
				out.println("<tr>");
				out.println("<td>"+rs.getString("pid")+"</td>");
				out.println("<td>"+rs.getString("pname")+"</td>");
				out.println("<td>"+rs.getString("catagory")+"</td>");
				out.println("<td>"+rs.getInt("quantity")+"</td>");
				out.println("<td>"+rs.getInt("costprice")+"</td>");
				out.println("<td>"+rs.getString("status")+"</td>");
				out.println("<td><a href='order1.jsp?txt1="+rs.getString("pid")+"'>Order</a></td>");
				out.println("</tr>");
			}
			out.println("</table>");

			if(!found)
			{
				out.println("<center><h3>No Products found in category: " + cat + "</h3></center>");
			}
		}
		catch(Exception ae)
		{
			out.println("Search Error: " + ae.getMessage());
		}
		finally
		{
			if(rs != null) try { rs.close(); } catch(SQLException ex) {}
			if(st != null) try { st.close(); } catch(SQLException ex) {}
			if(con != null) try { con.close(); } catch(SQLException ex) {}
		}
		%>
		
		<br>
		<p><center><a href="home2.html">Back to Home Page</a></center></p>
		<p><center><a href="Main.html">Log out</a></center></p>
		</div>
	</div>
	<div id = "footer"></div>
</div>
</body>
</html>