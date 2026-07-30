<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Distributor Order Status</title>
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
				<li><a href="searchproduct3.jsp">Search Product</a></li>
				<li><a href="Distributor_status.jsp">Order Status</a></li>
				<li><a href="contact1.jsp">Contact us</a></li>
			</ul>
		</div>
		<div id = "side2">
		
		<%@ page import = "java.sql.*" %>
<%@ include file="db.jsp" %>
		<%
		try
		{
			Connection con = getConnection();
			
			Object uidObj = session.getAttribute("uid");
			String s = uidObj != null ? uidObj.toString() : "";
			
			String sql = "select * from order1 where dname=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, s);
			ResultSet rs = st.executeQuery();
			out.println("<table border = '1'>");
			out.println("<tr bgcolor='lime'>");
			out.println("<td>Distributer ID</td>");
			out.println("<td>Distributer Name</td>");
			out.println("<td>Address</td>");
			out.println("<td>Order date</td>");
			out.println("<td>Product Name</td>");
			out.println("<td>Product Quantity</td>");
			out.println("<td>Distributer Amount</td>");
			out.println("</tr>");
			while(rs.next())
			{
				String a = rs.getString(1);
				String b = rs.getString(2);
				String c = rs.getString(3);
				String d = rs.getString(4);				
				String e = rs.getString(5);
				int f = rs.getInt(6);
				int g = rs.getInt(7);
				
				out.println("<tr>");
				out.println("<td>"+a+"</td>");
				out.println("<td>"+b+"</td>");
				out.println("<td>"+c+"</td>");
				out.println("<td>"+d+"</td>");
				out.println("<td>"+e+"</td>");
				out.println("<td>"+f+"</td>");
				out.println("<td>"+g+"</td>");
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
		<p><center><a href="home2.html">Back to Home Page</a></center><p>
		<p><center><a href="login3.jsp">Log out</a></center><p>
		</div>
	</div>
	<div id = "footer"></div>
</div>
</body>
</html>
