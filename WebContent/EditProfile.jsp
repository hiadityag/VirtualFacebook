<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@taglib prefix="t" uri="http://java.sun.com/jsp/jstl/core" %>
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
  <t:forEach var="u" items="${EditData}">
	<div class="center-container" >
		<!--header-->
		<div class="header-w3l">
			<h1><span>W</span>elcome <span></span> </h1>
		</div>
		<!--//header-->
		<!--main-->
		<div class="main-content-agile" >
			<div class="sub-main-w3" style="position:relative;right:50%;">	
				<form action="Update" method="post">
					<input placeholder="Username!" name="rname" id="rname" type="text" value="<t:out value="${u.name}"/>" required="">
					<input placeholder="E-mail" name="remail" id="remail" value="<t:out value="${u.email}"/>" type="email" required="">
					<input  placeholder="Phone Number" name="rphone" id="rphone" value="<t:out value="${u.phone}"/>" type="tel" required="">
					<input placeholder="Password" name="rpass" id="rpass"type="text" value="<t:out value="${u.pass}"/>" required="">
					
					<input  name="rdob" id="rdob" value="<t:out value="${u.dob}"/>" type="date" required=""><br><hr>
					<t:choose>
					<t:when test = "${u.gender == 'male'}">
       
      
					<input type="radio" value="male" name="rgender" id="rgender" checked>Male
					<input type="radio" value="female" name="rgender" id="rgender">Female<br><hr>
					</t:when>
					<t:otherwise>
					<input type="radio" value="male" name="rgender" id="rgender">Male
					<input type="radio" value="female" name="rgender" id="rgender" checked>Female<br><hr>
					</t:otherwise>
					</t:choose>
					<input type="submit" value="Update">
				</form>
			</div>
			</t:forEach>
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