<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order Product</title>
<style>
#container { width:100%; height:auto; }
#header { width:100%; height:150px; background-color:cyan; }
#logo { width:100px; height:100px; border:1px solid blue; margin-top:20px; position:absolute; margin-left:50px; background-image:url("product.jpg"); background-size:cover; }
#heading { width:100%; height:150px; margin-left:200px; }
#home { width:100%; height:50px; background-color:yellow; margin-top:-20px; }
#contain { width:100%; height:450px; }
#side1 { width:10%; height:450px; background-color:rgb(22,255,228); float:left; }
#side2 { width:90%; height:450px; background-color:white; margin-left:10%; }
#footer { width:100%; height:80px; background-color:orange; }
ul li { list-style-type:none; padding-top:20px; }
ul li a { text-decoration:none; font-size:14px; }
ul li a:hover { border-bottom:3px solid rgb(66,64,255); cursor: pointer; }
</style>

<script>
function calcAmount() {
	var price = parseFloat(document.f1.unitPrice.value) || 0;
	var qty = parseInt(document.f1.txt6.value) || 0;
	var total = price * qty;
	var offer = total * 0.15; // 15% discount
	var finalAmt = total - offer;
	
	document.f1.txt7.value = Math.round(total);
	document.f1.txt8.value = Math.round(offer);
	document.f1.txt9.value = Math.round(finalAmt > 0 ? finalAmt : 0);
}

function abc() {
	var a = document.f1.txt1.value;
	var b = document.f1.txt2.value;
	var c = document.f1.txt3.value;
	var d = document.f1.txt4.value;
	var e = document.f1.txt5.value;
	var f = document.f1.txt6.value;
	var g = document.f1.txt9.value;
	
	if(a.trim()=="" || b.trim()=="" || c.trim()=="" || d.trim()=="" || e.trim()=="" || f.trim()=="" || g.trim()=="") {
		alert("Please fill all the boxes!");
		return false;
	}
	if(isNaN(f.trim()) || parseInt(f.trim()) <= 0) {
		alert("Please enter a valid quantity!");
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
		Connection con = null;
		PreparedStatement stP = null, stD = null;
		ResultSet rsP = null, rsD = null;
		
		String pname = "";
		int price = 0;
		String dName = "";
		String dAddr = "";
		
		String pid = request.getParameter("txt1");
		if (pid == null) pid = request.getParameter("id");
		
		Object uidObj = session.getAttribute("uid");
		String sessionUid = uidObj != null ? uidObj.toString() : "";

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

			// Fetch product info using pid
			if (pid != null && !pid.trim().isEmpty()) {
				String sqlP = "select pname, costprice from products where pid = ?";
				stP = con.prepareStatement(sqlP);
				stP.setString(1, pid);
				rsP = stP.executeQuery();
				if (rsP.next()) {
					pname = rsP.getString("pname");
					price = rsP.getInt("costprice");
				}
			}

			// Fetch distributor info using session username/email
			if (!sessionUid.isEmpty()) {
				String sqlD = "select dname, daddress from distributer2 where uname = ?";
				stD = con.prepareStatement(sqlD);
				stD.setString(1, sessionUid);
				rsD = stD.executeQuery();
				if (rsD.next()) {
					dName = rsD.getString("dname");
					dAddr = rsD.getString("daddress");
				}
			}
		}
		catch(Exception ae)
		{
			out.println("<p style='color:red;'>Error: " + ae.getMessage() + "</p>");
		}
		finally
		{
			if(rsP != null) try { rsP.close(); } catch(SQLException ex) {}
			if(stP != null) try { stP.close(); } catch(SQLException ex) {}
			if(rsD != null) try { rsD.close(); } catch(SQLException ex) {}
			if(stD != null) try { stD.close(); } catch(SQLException ex) {}
			if(con != null) try { con.close(); } catch(SQLException ex) {}
		}
		
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
		String currentDate = sdf.format(new java.util.Date());
		
		int initialOffer = (int)(price * 0.15);
		int initialFinal = price - initialOffer;
		%>
		
		<center>
		<form name = "f1" action = "order2.jsp" method = "post">
		<input type="hidden" name="unitPrice" value="<%= price %>">
		<table>
		<tr><td>Enter Distributer ID / Username</td><td><input type = "text" name = "txt1" value="<%= sessionUid %>"></td></tr>
		<tr><td>Enter Distributer Name</td><td><input type = "text" name = "txt2" value="<%= dName %>"></td></tr>
		<tr><td>Enter Distributer Address</td><td><input type = "text" name = "txt3" value="<%= dAddr %>"></td></tr>
		<tr><td>Enter Order Date</td><td><input type = "text" name = "txt4" value="<%= currentDate %>"></td></tr>
		<tr><td>Enter Product Name</td><td><input type = "text" name = "txt5" value="<%= pname %>" readonly></td></tr>
		<tr><td>Enter Quantity</td><td><input type = "text" name = "txt6" value="1" onkeyup="calcAmount()" onchange="calcAmount()"></td></tr>
		<tr><td>Enter Amount</td><td><input type = "text" name = "txt7" value="<%= price %>" readonly></td></tr>
		<tr><td>Offer Amount (15%)</td><td><input type = "text" name = "txt8" value="<%= initialOffer %>" readonly></td></tr>
		<tr><td>Distributer Amount</td><td><input type = "text" name = "txt9" value="<%= initialFinal %>" readonly></td></tr>
		<tr><td colspan="2" align="center"><input type = "submit" name = "sub" value = "Order" onclick = "return abc()"></td></tr>
		</table>
		</form>
		</center>
		<br>
		<p><center><a href="home2.html">Back to Home Page</a></center></p>
		<p><center><a href="login3.jsp">Log out</a></center></p>
		</div>
	</div>
	<div id = "footer"></div>
</div>
</body>
</html>