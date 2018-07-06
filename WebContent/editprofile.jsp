<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html lang="en">
<head>
<title>TroubleShooter</title>
<!-- Meta tag Keywords -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Business Subscription Form Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Meta tag Keywords -->
<!-- css files -->
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" /> <!-- Style-CSS --> 
<link rel="stylesheet" href="css/font-awesome.css"> <!-- Font-Awesome-Icons-CSS -->
<!-- //css files -->
<!-- web-fonts -->
<link href="//fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&amp;subset=latin-ext" rel="stylesheet">
<!-- //web-fonts -->
</head>
<body>
    <%
    String str2=session.getAttribute("myid").toString();
     Class.forName("com.mysql.jdbc.Driver");
	 Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/facebook?user=root&password=1234");
	 String str="select * from user where id=?";
	 PreparedStatement st=cn.prepareStatement(str);
	 st.setString(1,session.getAttribute("myid").toString());
	 ResultSet rs=st.executeQuery();
	 while(rs.next())
	 {
		 String str1=rs.getString("fname")+" "+rs.getString("lname") ;
	 %>
	<div class="center-container" >
		<!--header-->
		<div class="header-w3l">
			<h1><span>W</span>elcome <span><%=str1 %></span> </h1>
		</div>
		<!--//header-->
		<!--main-->
		<div class="main-content-agile" >
			<div class="sub-main-w3" style="position:relative;right:50%;">	
				<form action="update" method="post">
					<input placeholder="Username!" name="id" type="text" value="<%=rs.getString("id") %>" required="">
					<input placeholder="First Name" name="fname" value="<%=rs.getString("fname") %>" type="text" required="">
					<input placeholder="Last Name" name="lname" value="<%=rs.getString("lname") %>" type="text" required="">
					<input placeholder="E-mail" name="email" value="<%=rs.getString("email") %>" type="email" required="">
					<input  placeholder="Phone Number" name="phone" value="<%=rs.getString("phone") %>" type="tel" required="">
					<input  placeholder="Address" name="address" value="<%=rs.getString("address") %>" type="text" required="">
					<input placeholder="Password" name="pass" type="text" value="<%=rs.getString("pass") %>" required="">
					<input placeholder="Re-Enter Password" name="repass" type="password" required="">
					
					<input  placeholder="Date of birth" name="dob" value="<%=rs.getString("dob") %>" type="text" required="">
					<%
					if(rs.getString("gender").equals("male"))
					{
					%>
					<input type="radio" value="male" name="gender" checked>Male
					<input type="radio" value="female" name="gender">Female<br>
					<%
					}
					else
					{
					%>
					<input type="radio" value="male" name="gender" >Male
					<input type="radio" value="female" name="gender" checked>Female<br>
					<%
					}
					%>
					<input type="submit" value="Update">
				</form>
			</div>
		</div>
		<!--//main-->
		<!--footer-->
		<div class="footer">
			<p>&copy; 2018 Business Subscription Form. All rights reserved | Design by <a href="http://w3layouts.com">W3layouts</a></p>
		</div>
		<!--//footer-->
	</div>
    <%
	 }
    %>
</body>
</html>