<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Product</title>
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
	height:200px;
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
			</ul>
		</div>
		<div id = "side2">
		
		<%@ page import = "java.sql.*" %>
<%@ include file="db.jsp" %>
		<%
		
		String a="",b="",c="",f="";
		int d=0,e=0;
		try
		{
			Connection con = getConnection();
			
			String s = request.getParameter("txt1");
			
			String sql = "select * from products where id=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, s);
			ResultSet rs = st.executeQuery();
			
			while(rs.next())
			{
				a = rs.getString(1);
				b = rs.getString(2);
				c = rs.getString(3);
				d = rs.getInt(4);
				e = rs.getInt(5);
				f = rs.getString(6);
			}
		}
		catch(Exception ae)
		{
			out.println(ae);
		}

		%>
		<center>
		<form name = "f1" action = "updateproduct2.jsp" method = "post">
		<table>
		<tr><td>Product ID</td><td><input type="text" name="txt1" value="<%=a%>" readonly></td></tr>
		<tr><td>Enter Name</td><td><input type = "text" name = "txt2" value="<%=b%>"></td></tr>
		<tr><td>Enter Quantity</td><td><input type = "text" name = "txt3" value="<%=d%>"></td></tr>
		<tr><td>Enter Cost Price</td><td><input type = "text" name = "txt4" value="<%=e%>"></td></tr>
		<tr><td>Enter Status</td><td><input type = "text" name = "txt5" value="<%=f%>"></td></tr>
		<tr><td><input type = "submit" name = "sub" value = "Edit" onclick = "return abc()"></td></tr>
		</table>
		</form>
		</center>
		<br>
		<p><center><a href="home.html">Back to Home Page</a></center><p>
		<p><center><a href="login1.jsp">Log out</a></center><p>
		</div>
	</div>
	<div id = "footer"></div>
</div>
</body>
</html>
