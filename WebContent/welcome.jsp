<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<%@taglib prefix="j" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<head>
<title>User Profile</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Consultancy Profile Widget Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- js -->
<script src="js/jquery-2.1.3.min.js" type="text/javascript"></script><script type="text/javascript" src="js/sliding.form.js"></script>
<!-- //js -->
<link href="css/style1.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="css/font-awesome1.min.css" />
<link rel="stylesheet" href="css/smoothbox1.css" type='text/css' media="all" />
<link href="//fonts.googleapis.com/css?family=Pathway+Gothic+One" rel="stylesheet">
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
</head>
<body>
   
    
    <a href="#" style="background-color: #f44336;border: none; margin-top:10px; width:100px; right:20px; color: white; padding: 5px 2px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px;">Logout</a>
	<div class="main">
	    <h1>User Profile</h1>
		<div id="navigation" style="display:none;" class="w3_agile">
			<ul>
				<li class="selected">
					<a href="#"><i class="fa fa-home" aria-hidden="true"></i><span>Home</span></a>
				</li>
				<li>
					<a href="#"><i class="fa fa-folder" aria-hidden="true"></i><span>Requests</span></a>
				</li>
				<li>
					<a href="#"><i class="fa fa-envelope" aria-hidden="true"></i><span>Friends</span></a>
				</li>
		    </ul>
		</div>
		<div id="wrapper" class="w3ls_wrapper w3layouts_wrapper">
			<div id="steps" style="margin:0 auto;" class="agileits w3_steps">
				<form id="formElem" name="formElem" ENCTYPE="multipart/form-data" action="fileupload.jsp"  class="w3_form w3l_form_fancy">
					<fieldset class="step agileinfo w3ls_fancy_step">
						<legend>About</legend>
						<j:forEach var="u" items="${userdata}">

						<div class="abt-agile">
							<div class="abt-agile-left">
							<input type="file" name="f1">
        					<br>
        					<input type="submit" value="send">
						</div>
							<div class="abt-agile-right">
								<h3><j:out value="${u.name}"></j:out></h3>
								<h5>User</h5>
								<ul class="address">
									<li>
										<ul class="address-text">
											<li><b>D.O.B </b></li>
											<li>: <j:out value="${u.dob}"></j:out></li>
										</ul>
									</li>
									<li>
										<ul class="address-text">
											<li><b>PHONE </b></li>
											<li>:<j:out value="${u.phone}"></j:out></li>
										</ul>
									</li>
									
									<li>
										<ul class="address-text">
											<li><b>E-MAIL </b></li>
											<li><a href="<j:out value="${u.email}"></j:out>">: <j:out value="${u.email}"></j:out></a></li>
										</ul>
									</li>
									<li>
										<ul class="address-text">
											<li><b>GENDER </b></li>
											<li>:<j:out value="${u.gender}"></j:out></li>
										</ul>
									</li>
									<li>
										<ul>
											<li><a href="EditProfile" style="background-color: #f44336;border: none; margin-top:10px; width:90%; color: white; padding: 10px 10px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px;">Edit Profile</a></li>
											</ul>
									</li>
									
								</ul>
								
						</j:forEach>
							</div>
								<div class="clear"></div>
						</div>
				
					</fieldset>
				 </form>		
					<fieldset class="step wthree">
						<legend>Requests</legend>
						<div class="work-w3agile">
							<div class="work-w3agile-top">
								<div class="agileits_w3layouts_work_grid1 w3layouts_work_grid1 hover14 column">
									<div class="w3_agile_work_effect">
			
			                            <form action="SendRequest">
										<input placeholder="Username!" name="receiver" id="t1" onkeyup="list(this.value)" type="text"  style="border: none; margin-top:10px; width:45%; color: black; padding: 10px 10px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px;">
										<input type="submit" value="send request" style="background-color:#f44336;border: none; margin-top:10px; width:45%; color: black; padding: 10px 10px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px;"  >
				                        </form>
				                        <div id="listdiv" style="z-index: 999;"></div>
				                        
				                       
						   				<div id="requests"  style=" margin-top:10px; overflow: scroll; ">
							             
										<ul>
										<j:forEach var="f" items="${pfriends}">
 
											<li>
											
												<a href="#" style="background-color:white;border: none; margin-top:10px; width:90%; color: black; padding: 10px 10px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px;">
													<j:out value="${f.sender}"></j:out>
												</a><br>
												<a href="Accept?sender=<t:out value="${f.sender }"/>" style="background-color:white;border: none; margin-top:10px; width:90%; color: black; padding: 10px 10px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px;">
													Accept
												</a>
												<a href="Reject?sender=<t:out value="${f.sender }"/>" style="background-color:white;border: none; margin-top:10px; width:90%; color: black; padding: 10px 10px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px;">
													Reject
												</a>
												
											</li>
										</j:forEach>
											
								<div class="clear"></div>
									</ul> 
									</div>
									</div>
								</div>
							</div>
						</div>
					</fieldset>
					<fieldset class="step wthree">
						<legend style="border: none; margin-top:10px; width:100%;font:inherit; color:#008CBA ;text-transform:uppercase; padding: 10px 10px; text-align: center; text-decoration: none; display: inline-block; font-size: 32px;">Friends list</legend>
							<div id="friends" class="agilecontactw3ls-grid" style=" margin-top:10px; overflow: scroll;">
							   <ul>
							  <j:forEach var="k" items="${friends}">
										<li>
											
												<a href="#" style="background-color:white;border: none; margin-top:10px; width:90%; color: black; padding: 10px 10px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px;">
													<j:out value="${k}"></j:out>
												</a>
												
										</li>
							</j:forEach>

								<div class="clear"></div>
							   
							   </ul>
								
							</div>
					</fieldset>
			</div>
						
			
		</div>
		<div>
			<form action="SavePost" method="post">
					<textarea rows="5" cols="80" name="message" placeholder="Post something"></textarea>
					<input type="submit" style="width:100%;" value="Post on wall">
			</form>
		</div>
			<j:forEach var="w" items="${wposts}">
			<div style="overflow: scroll;">
			<form style="background-color: white; margin-top:5px;" action="#" method="post">
					<textarea disabled style="text" rows="5" cols="78"><j:out value="${w.message}"/> </textarea><br>
					<textarea disabled cols="78"><j:out value="${w.sender}"/> , <j:out value="${w.date}"/></textarea><br>
					<input type="submit" style="width:100%;" value="comment">
			</form>
		</j:forEach>
			</div>
	      
	</div>
	
	<script type="text/javascript" src="js/smoothbox.jquery2.js"></script>
</body>
</html>