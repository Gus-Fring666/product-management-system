<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order Product</title>
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
	var g = document.f1.txt7.value;
	if(a=="" || b=="" || c=="" || d=="" || e=="" || f=="" || g=="")
	{
		alert("Please fill the box!");
		return false;
	}
	else
		{
			return true;
		}
}
</script>

</head>
<body>
<div id = "container">
	<div id = "header">
		<div id = "logo"></div>
		<div id = "heading"><br><h1>Product Management System</h1></div>
	</div>
	<div id = "home"><h1>Order Product</h1></div>
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
		
		String a="";
		int b=0,c=0,offer=0,c1=0;
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
				a = rs.getString(2);
				b = rs.getInt(4);
				c = rs.getInt(5);
			}
			
			 offer = (c*15)/100;
			 c1 = c-offer;
		}
		catch(Exception ae)
		{
			out.println(ae);
		}

		%>
		
		<%
		Object uidObj = session.getAttribute("uid");
		String s = uidObj != null ? uidObj.toString() : "";
		
		%>
		<center>
		<form name = "f1" action = "order2.jsp" method = "post">
		<table>
		<tr><td>Enter Distributer ID</td><td><input type = "text" name = "txt1"></td></tr>
		<tr><td>Enter Distributer Name</td><td><input type = "text" name = "txt2" value="<%=s%>"></td></tr>
		<tr><td>Enter Distributer Address</td><td><input type = "text" name = "txt3"></td></tr>
		<tr><td>Enter Order Date</td><td><input type = "text" name = "txt4"></td></tr>
		<tr><td>Enter Product Name</td><td><input type = "text" name = "txt5" value="<%=a%>" readonly></td></tr>
		<tr><td>Enter Quantity</td><td><input type = "text" name = "txt6" value="<%=b%>"></td></tr>
		<tr><td>Enter Amount</td><td><input type = "text" name = "txt7" value="<%=c%>" readonly></td></tr>
		<tr><td>Offer Amount</td><td><input type = "text" name = "txt8" value="<%=offer%>" readonly></td></tr>
		<tr><td>Distributer Amount</td><td><input type = "text" name = "txt9" value="<%=c1%>"></td></tr>
		<tr><td><input type = "submit" name = "sub" value = "Order" onclick = "return abc()"></td></tr>
		</table>
		</form>
		</center>
		<br>
		<p><center><a href="home2.html">Back to Home Page</a></center><p>
		<p><center><a href="login3.jsp">Log out</a></center><p>
		</div>
	</div>
	<div id = "footer"></div>
</div>
</body>
</html>
