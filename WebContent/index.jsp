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
<script>
var x;
function save()
{
x= new XMLHttpRequest();
var a= document.getElementById("id").value;
var b= document.getElementById("fname").value;
var c= document.getElementById("lname").value;
var d= document.getElementById("email").value;
var e= document.getElementById("phone").value;
var f= document.getElementById("address").value;
var g= document.getElementById("pass").value;
var h= document.getElementById("repass").value;
var i= document.getElementById("dob").value;
var j= document.getElementById("gender").value;
	x.open("POST","save?id="+a+"&fname="+b+"&lname="+c+"&email="+d+"&phone="+e+"&address="+f+"&pass="+g+"&repass="+h+"&dob="+i+"&gender="+j,true);
	x.onreadystatechange=abc;
	x.send(null);
}

function abc()
{
	if(x.readyState==4)
		{
		if(x.responseText=="welcome to my facebook")
			{
			location="login.jsp";
			}
		
		}
	
	
	
}







</script>





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
				<form  method="post">
					<input placeholder="Username!" name="id" type="text" required="" id="id">
					<input placeholder="First Name" name="fname" type="text" id="fname" required="">
					<input placeholder="Last Name" name="lname" type="text" id="lname" required="">
					<input placeholder="E-mail" name="email" type="email" id="email" required="">
					<input  placeholder="Phone Number" name="phone" type="tel" id="phone" required="">
					<input  placeholder="Address" name="address" type="text" id="address" required="">
					<input placeholder="Password" name="pass" type="password" id="pass" required="">
					<input placeholder="Re-Enter Password" name="repass" id="repass" type="password" required="">
					
					<input  placeholder="Date of birth" name="dob" type="date" id="dob"  required=""><br>
					<input type="radio" value="male" name="gender" id="gender">Male
					<input type="radio" value="female" name="gender" id="gender">Female<br>
					
					<input type="button" value="SignUp Now" onclick="save()" ><br>
					<a href="login.jsp" type="text"  >Already a member? login</a>
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
</body>
</html>