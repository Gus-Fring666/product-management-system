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
#edit
{
	margin-top: -16px;
	text-decoration:none;
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
</style>
</head>
<body>
<div id = "container">
	<div id = "header">
		<div id = "logo"></div>
		<div id = "heading"><br><h1>Product Management System</h1></div>
	</div>
	<div id = "home"><h1>Edit Product</h1></div>
	<div id = "contain">
		<div id = "side1">
			<ul>
				<li><a href="addproduct.jsp">Add Product</a></li>
				<li><a href="viewproduct.jsp">View Product</a></li>
				<li><a href="editproduct.jsp">Edit Product</a></li>
				<li><a href="searchproduct.jsp">Search Product</a></li>
			</ul>
		</div>
		<div id = "side2">
			<div id = "edit">
				<center>
				<p><a href="updateproduct.jsp">Update Product</a></p>
				<p><a href="deleteproduct.jsp">Delete Product</a></p>
				<p><a href="home.html">Back to Home Page</a></p>
				<p><a href="login1.jsp">Log out</a><p>
				</center>
			</div>
		</div>
	</div>
	<div id = "footer"></div>
</div>
</body>
</html>