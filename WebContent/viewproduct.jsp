<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
#container
{
	width:100%;
	height:auto;
}
#header
{
	width:100%;
	height:150px;
	background-color:cyan;
}
#logo
{
	width:100px;
	height:100px;
	border:1px solid blue;
	margin-top:20px;
	position:absolute;
	margin-left:50px;
	background-image:url("product.jpg");
	background-size:cover;
}
#heading
{
	width:100%;
	height:150px;
	margin-left:200px;
}
#home
{
	width:100%;
	height:50px;
	background-color:yellow;
	margin-top:-20px;
}
#contain
{
	width:100%;
	height:400px;
	
}
#side1
{
	width:10%;
	height:400px;
	background-color:rgb(22,255,228);
	float:left;
}
#side2
{
	width:90%;
	height:400px;
	background-color:white;
	margin-left:10%;
}
#footer
{
	width:100%;
	height:80px;
	background-color:orange;
}
ul li
{
	list-style-type:none;
	padding-top:20px;
}
ul li a
{
	text-decoration:none;
	font-size:14px;
}
ul li a:hover
{
	border-bottom:3px solid rgb(66,64,255);
	cursor pointer;
}

table
{
	height:250px;
	width:80%;
	margin-left:10%;
}
</style>
</head>
<body>
<div id = "container">
	<div id = "header">
		<div id = "logo"></div>
		<div id = "heading"><br><h1>Product Management System</h1></div>
	</div>
	<div id = "home"><h1>View Product</h1></div>
	<div id = "contain">
		<div id = "side1">
			<ul>
				<li><a href="addproduct.jsp">Add Product</a></li>
				<li><a href="viewproduct.jsp">View Product</a></li>
				<li><a href="searchproduct.jsp">Search Product</a></li>
				<li><a href="view.jsp">View Order</a></li>
			</ul>
		</div>
		<div id = "side2">
		
		<%@ page import = "java.sql.*" %>
<%@ include file="db.jsp" %>
		<%
		try
		{
	Connection con = getConnection();
			String sql = "select * from products";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			out.println("<table border = '1'>");
			out.println("<tr bgcolor='lime'>");
			out.println("<td>Product ID</td>");
			out.println("<td>Product Name</td>");
			out.println("<td>Product Catagory</td>");
			out.println("<td>Product Quantity</td>");
			out.println("<td>Product Cost Price</td>");
			out.println("<td>Product Status</td>");
			out.println("<td colspan = '2'>Product Edit</td>");
			out.println("</tr>");
			while(rs.next())
			{
				String a = rs.getString(1);
				String b = rs.getString(2);
				String c = rs.getString(3);
				int d = rs.getInt(4);
				int e = rs.getInt(5);
				String f = rs.getString(6);
				
				out.println("<tr>");
				out.println("<td>"+a+"</td>");
				out.println("<td>"+b+"</td>");
				out.println("<td>"+c+"</td>");
				out.println("<td>"+d+"</td>");
				out.println("<td>"+e+"</td>");
				out.println("<td>"+f+"</td>");
				out.println("<td><a href='edit.jsp?txt1="+a+"'>Update</a></td>");
				out.println("<td><a href='deleteproduct2.jsp?txt1="+a+"'>Delete</a></td>");
				out.println("</tr>");
			}
			
			out.println("</table>");
		}
		catch(Exception ae)
		{
			out.println(ae);
		}

		%>
		
		<br>
		<p><center><a href="home.html">Back to Home Page</a></center><p>
		<p><center><a href="login1.jsp">Log out</a></center><p>
		</div>
	</div>
	<div id = "footer"></div>
</div>
</body>
</html>