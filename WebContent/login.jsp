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
<script >
var s;
function login()
{
	s=new XMLHttpRequest();
	var a=document.getElementById("id").value;
	var b=document.getElementById("pass").value;
	s.open("POST", "enter?id="+a+"&pass="+b, true);
	s.onreadystatechange=abc;
	s.send(null);
  	
}

function abc()
{
	if(s.readyState==4)
		{
		if(s.responseText=="valid")
			{
			location="welcome.jsp";
			}
		else
			{
			document.getElementById("error1").innerHTML="Invalid id or password";
			}
		}
	else
		{
		document.getElementById("error1").innerHTML="please wait...";
		}
}



</script>
</head>
<body>
    <%
    Cookie ck[]= request.getCookies();
    if(ck!=null && ck.length !=0)
    {
    	for(Cookie c:ck)
    	{
    		if(c.getName().equals("newck"))
    		{   
    			Class.forName("com.mysql.jdbc.Driver");
   			 Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/facebook?user=root&password=1234");
   			 String str="select * from user where id=?";
   			PreparedStatement st=cn.prepareStatement(str);
   			 st.setString(1,c.getValue());
   			 ResultSet rs=st.executeQuery();
   			 if(rs.next())
   			 {
   			
   				session.setAttribute("id", c.getValue());
   				session.setAttribute("myname",rs.getString(2)+" "+rs.getString(3));
    			response.sendRedirect("welcome.jsp");
   			 }
   		  }
    	}
    }
    
    
    %>
	<div class="center-container">
		<!--header-->
		<div class="header-w3l">
			<h1><span>T</span>ouble<span>S</span>ooter <span>L</span>ogin </h1>
		</div>
		<!--//header-->
		<!--main-->
		<div class="main-content-agile">
			<div class="wthree-pro">
				<h2>welcome,Login to Troubleshooter</h2>
			</div>
			<div class="sub-main-w3">	
				<form action="enter" method="post">
					<input placeholder="Username!" name="id" id="id" type="text" required="">
					<input placeholder="Password" name="pass" id="pass" type="password" required="">
					<input type="button" value="Login" onclick="login()">
				</form>
			</div>
			<div id="error1"></div>
		</div>
		<!--//main-->
		<!--footer-->
		<div class="footer">
			<p>&copy; 2018 Business Subscription Form. All rights reserved | Design by <a href="http://w3layouts.com">W3layouts</a></p>
		</div>
		<!--//footer-->
	</div>
</body>
</html>