<html>
<head>
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
</style>
<script>
function abc()
{
	var a = document.f1.txt1.value;
	var b = document.f1.txt2.value;
	
	if(a=="" || b=="")
	{
		alert("Please fill the box!");
		return false;
	}
	else if(b.length<8)
	{
		alert("Password must be 8 characters!");
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
	<div id = "home"><h1>Login Page(User: Distributer)</h1></div>
	<div id = "contain">
		<div id = "side1"></div>
		<div id = "side2">
		<center>
			<form name = "f1" action = "login4.jsp" method = "post">
			<table>
			<tr><td>Enter Name</td><td><input type = "text" name = "txt1"></td></tr>
			<tr><td>Enter Password</td><td><input type = "password" name = "txt2"></td></tr>
			<tr><td><input type = "submit" name = "sub" value = "Login" onclick = "return abc()"></td></tr>
			</table>
			</form>
			
			<p>New Distributer?<a href="add_distrubuter.jsp">Sign in</a></p>
			</center>
			<br>
			<center>
			<p><a href="Main.html">Back to Main Menu</a></p>
			</center>
		</div>
	</div>
	<div id = "footer"></div>
</div>
</body>
</html>