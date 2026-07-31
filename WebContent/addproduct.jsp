<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Product</title>
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
	cursor: pointer;
}
</style>

<script>
function abc()
{
	var a = document.f1.txt1.value;
	var b = document.f1.txt2.value;
	var c = document.f1.txt3.value;
	var d = document.f1.txt4.value;
	var e = document.f1.txt5.value;
	var f = document.f1.txt6.value;
	
	if(a.trim()=="" || b.trim()=="" || c.trim()=="" || d.trim()=="" || e.trim()=="" || f.trim()=="")
	{
		alert("Please fill all the boxes!");
		return false;
	}
	if(isNaN(d.trim()))
	{
		alert("Quantity must be a valid number!");
		return false;
	}
	if(isNaN(e.trim()))
	{
		alert("Cost Price must be a valid number!");
		return false;
	}
	return true;
}
</script>

</head>
<body>
<div id = "container">
	<div id = "header">
		<div id = "logo"></div>
		<div id = "heading"><br><h1>Product Management System</h1></div>
	</div>
	<div id = "home"><h1>Add Product</h1></div>
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
		<center>
		<form name = "f1" action = "addproduct2.jsp" method = "post">
		<table>
		<tr><td>Enter ID</td><td><input type = "text" name = "txt1"></td></tr>
		<tr><td>Enter Name</td><td><input type = "text" name = "txt2"></td></tr>
		<tr><td>Enter Catagory</td><td><input type = "text" name = "txt3"></td></tr>
		<tr><td>Enter Quantity</td><td><input type = "text" name = "txt4"></td></tr>
		<tr><td>Enter Cost Price</td><td><input type = "text" name = "txt5"></td></tr>
		<tr><td>Enter Status</td><td><input type = "text" name = "txt6"></td></tr>
		<tr><td colspan="2" align="center"><input type = "submit" name = "sub" value = "Add" onclick = "return abc()"></td></tr>
		</table>
		</form>
		</center>
		<br>
		<p><center><a href="home.html">Back to Home Page</a></center></p>
		<p><center><a href="login1.jsp">Log out</a></center></p>
		</div>
	</div>
	<div id = "footer"></div>
</div>
</body>
</html>