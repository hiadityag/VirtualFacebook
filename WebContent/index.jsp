<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
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
	<div class="center-container">
		<!--header-->
		<div class="header-w3l">
			<h1><span>T</span>ouble<span>S</span>hooter <span>S</span>ignup <span>F</span>orm</h1>
		</div>
		<!--//header-->
		<!--main-->
		<div class="main-content-agile">
			<div class="wthree-pro">
				<h2>welcome!<br>Sign Up to Troubleshooter</h2>
			</div>
			<div class="sub-main-w3">
			    <div> <h4><%=request.getAttribute("error") %></h4></div>	
				<form action="SignUp" method="get">
					<input placeholder="Name" name="name" type="text" id="name" required="">
					<input placeholder="E-mail" name="email" type="email" id="email" required="">
					<input  placeholder="Phone Number" name="phone" type="tel" id="phone" required="">
					<input placeholder="Password" name="pass" type="password" id="pass" required="">
					<input placeholder="Re-Enter Password" name="repass" id="repass" type="password" required="">
					<input  placeholder="Date of birth" name="dob" type="date" id="dob"  required=""><br>
					<br>
					<input type="radio" value="male" name="gender" id="gender">Male
					<input type="radio" value="female" name="gender" id="gender">Female<br><hr>
					<input type="submit" value="SignUp Now" ><br>
					<a href="login.jsp" type="text"  >Already a member? login</a><br><br>
					<a href="forgot.jsp" type="text"  >forgot password?</a>
				 </form>
				 
			</div>
		</div>
		<!--//main-->
		<!--footer-->
		<div class="footer">
			<p>&copy; 2018 Business Subscription Form. All rights reserved | Design by <a href="https://www.facebook.com/hiadityag">Aditya Gupta</a></p>
		</div>
		<!--//footer-->
	</div>
</body>
</html>