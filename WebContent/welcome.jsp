<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<%@page import="javax.print.attribute.standard.Severity"%>
<%@page import="org.apache.catalina.Session"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sun.javafx.collections.ArrayListenerHelper"%>
<%@page import="jdk.internal.org.objectweb.asm.tree.TryCatchBlockNode"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
<script >
var x,s,q,ss;
function deletereqst(rid)
{
	document.getElementById("requests").innerHTML="";
	document.getElementById("friends").innerHTML="";
	q= new XMLHttpRequest();
	q.open("GET","deletereqst?rid="+rid, true);
	q.send(null);
	q.onreadystatechange=lmn;	
}
function list(str)
{
	x= new XMLHttpRequest();
	x.open("GET","showlist.jsp?rid="+str , true)
	x.send(null);
	x.onreadystatechange=xyz;
	
	}
	
function acceptreqst(rid)
{
	document.getElementById("requests").innerHTML="";
	document.getElementById("friends").innerHTML="";
	
	s= new XMLHttpRequest();
	s.open("GET","acceptreqst?rid="+rid, true);
	s.send(null);
	s.onreadystatechange=pqr;
	
	}
	
function pqr()
{ 
	ss=s.responseText.split("$$");

	if(s.readyState==4)
		{
		document.getElementById("requests").innerHTML=ss[0];
		document.getElementById("friends").innerHTML=ss[1];
		
		}
	
	}
	
function lmn()
	{
         ss=s.responseText.split("$$");
		if(q.readyState==4)
			{
			document.getElementById("requests").innerHTML=ss[0];
			document.getElementById("friends").innerHTML=ss[1];
			}
		
		}
function xyz()
{
	if(x.readyState==4)
		{
		document.getElementById("listdiv").innerHTML=x.responseText;
		}
	
	
	}
function disp(str)
{
	document.getElementById("t1").value=str;
	document.getElementById("listdiv").innerHTML="";
	
	}
	
	function sendrequest(str)
	{
		x= new XMLHttpRequest();
		x.open("GET","flist?rid="+str , true)
		x.send(null);
		
	}
</script>


</head>
<body>
   
    
    <a href="editprofile.jsp" style="background-color: #f44336;border: none; margin-top:10px; width:100px; right:20px; color: white; padding: 5px 2px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px;">Logout</a>
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
				<form id="formElem" name="formElem" ENCTYPE="multipart/form-data" action="fileupload.jsp" method="post" class="w3_form w3l_form_fancy">
					<fieldset class="step agileinfo w3ls_fancy_step">
						<legend>About</legend>
						<%
						Class.forName("com.mysql.jdbc.Driver");
		 				Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/facebook?user=root&password=1234");
		 				String str="select * from user where id=?";
						PreparedStatement st=cn.prepareStatement(str);
						 st.setString(1,session.getAttribute("myid").toString());
		 				ResultSet rs=st.executeQuery();
						 while(rs.next())
		 				{
		               %>
		
						<div class="abt-agile">
							<div class="abt-agile-left">
							<input type="file" name="f1">
        					<br>
        					<input type="submit" value="send">
						</div>
							<div class="abt-agile-right">
								<h3><%=rs.getString("fname")+" "+rs.getString("lname") %></h3>
								<h5>User</h5>
								<ul class="address">
									<li>
										<ul class="address-text">
											<li><b>D.O.B </b></li>
											<li>: <%=rs.getString("dob") %></li>
										</ul>
									</li>
									<li>
										<ul class="address-text">
											<li><b>PHONE </b></li>
											<li>: <%= rs.getString("phone") %></li>
										</ul>
									</li>
									<li>
										<ul class="address-text">
											<li><b>ADDRESS </b></li>
											<li>: <%=rs.getString("address") %></li>
										</ul>
									</li>
									<li>
										<ul class="address-text">
											<li><b>E-MAIL </b></li>
											<li><a href="<%= rs.getString("email") %>">: <%= rs.getString("email") %></a></li>
										</ul>
									</li>
									<li>
										<ul class="address-text">
											<li><b>GENDER </b></li>
											<li>: <%= rs.getString("gender") %></li>
										</ul>
									</li>
									<li>
										<ul>
											<li><a href="editprofile.jsp" style="background-color: #f44336;border: none; margin-top:10px; width:90%; color: white; padding: 10px 10px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px;">Edit Profile</a></li>
											</ul>
									</li>
									
								</ul>
							</div>
								<div class="clear"></div>
						</div>
						<%
		 				}
					    cn.close();
						%>
					</fieldset>
					
					<fieldset class="step wthree">
						<legend>Requests</legend>
						<div class="work-w3agile">
							<div class="work-w3agile-top">
								<div class="agileits_w3layouts_work_grid1 w3layouts_work_grid1 hover14 column">
									<div class="w3_agile_work_effect">
			
			                           
										<input placeholder="Username!" name="rid" id="t1" onkeyup="list(this.value)" type="text"  style="border: none; margin-top:10px; width:45%; color: black; padding: 10px 10px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px;">
										<input type="button" value="send request" onclick="sendrequest(document.getElementById(t1).getAttribute(rid))"  style="background-color:#f44336;border: none; margin-top:10px; width:45%; color: black; padding: 10px 10px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px;"  >
				                        <div id="listdiv" style="z-index: 999;"></div>
				                        
				                       
						   				<div id="requests"  style=" margin-top:10px; overflow: scroll; ">
							             
										<ul>
										<%
										Class.forName("com.mysql.jdbc.Driver");
						 				Connection cn1=DriverManager.getConnection("jdbc:mysql://localhost/facebook?user=root&password=1234");			
										String str2="select * from flist where receiver=? and status=0 order by rid desc ";
										PreparedStatement st1=cn1.prepareStatement(str2);
										 st1.setString(1,session.getAttribute("myid").toString());
						 				ResultSet rs1=st1.executeQuery();
										 while(rs1.next())
						 				{
										
										%>
											<li>
											
												<a href="#" style="background-color:white;border: none; margin-top:10px; width:90%; color: black; padding: 10px 10px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px;">
													<%=rs1.getString(2)%>
												</a><br>
												<button onclick="acceptreqst(<%=rs1.getInt(1) %>)" style="background-color: #f44336;border: none; margin-top:10px; width:90%; color: white; padding: 10px 10px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px;">
													accept
												</button>
												<button onclick="deletereqst(<%=rs1.getInt(1) %>)" style="background-color: #f44336;border: none; margin-top:10px; width:90%; color: white; padding: 10px 10px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px;">
													delete
												</button>
												
											</li>
										<%
						 				}
										 cn1.close();
										%>
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
							   <%
							            ArrayList al= new ArrayList();
							            
										Class.forName("com.mysql.jdbc.Driver");
						 				Connection cn2=DriverManager.getConnection("jdbc:mysql://localhost/facebook?user=root&password=1234");			
										String str3="select * from flist where (receiver=? or sender=?) and status=1 order by rid desc ";
										PreparedStatement st2=cn2.prepareStatement(str3);
										 st2.setString(1,session.getAttribute("myid").toString());
										 st2.setString(2,session.getAttribute("myid").toString());
							 				ResultSet rs2=st2.executeQuery();
										 while(rs2.next())
						 				{
										  if(rs2.getString("sender").equals(session.getAttribute("myid").toString()))
										  {
											  al.add(rs2.getString("receiver"));
								%>
										<li>
											
												<a href="#" style="background-color:white;border: none; margin-top:10px; width:90%; color: black; padding: 10px 10px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px;">
													<%=rs2.getString("receiver") %>
												</a>
												
										</li>
                                   <%
						 				 }
										  else
										  {
											  al.add(rs2.getString("sender"));
								   %>
								        <li>
											
												<a href="#" style="background-color:white;border: none; margin-top:10px; width:90%; color: black; padding: 10px 10px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px;">
													<%=rs2.getString("sender") %>
												</a>
												
										</li>
										
								<%
										  }
						 				}
										 al.add(session.getAttribute("myid"));
										 cn2.close();
								%>
								<div class="clear"></div>
							   
							   </ul>
								
							</div>
					</fieldset>
				</form>
			</div>
						
			
		</div>
		<div>
			<form action="wallpost" method="post">
					<textarea rows="5" cols="80" name="message" placeholder="Post something"></textarea>
					<input type="submit" style="width:100%;" value="Post on wall">
			</form>
		</div>
			
			<div style="overflow: scroll;">
			<%
			Class.forName("com.mysql.jdbc.Driver");
			Connection cn3=DriverManager.getConnection("jdbc:mysql://localhost/facebook?user=root&password=1234");			
			String str4="select * from posts order by pid desc";
			PreparedStatement st3=cn3.prepareStatement(str4);
			ResultSet rs3=st3.executeQuery();
		    while(rs3.next())
		    {
			if(al.contains(rs3.getString("sender")))
			{
			%>
			<form style="background-color: white; margin-top:5px;" action="commentpost" method="post">
					<textarea disabled style="text" rows="5" cols="78"><%=rs3.getString("message")%> </textarea><br>
					<textarea disabled cols="78"><%=rs3.getString("sender")+" "+rs3.getString("date")%></textarea><br>
					<input type="submit" style="width:100%;" value="comment">
			</form>
			<%
			}
		    }
			cn.close();
			%>  
			</div>
	      
	</div>
	
	<script type="text/javascript" src="js/smoothbox.jquery2.js"></script>
</body>
</html>