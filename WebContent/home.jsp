<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="margin-top:50px">
<div style="position:absolute;
  width:100%;
  height:240px;
  border:1px solid black;
  padding:10px;
  float: right;">
<div style="background: blue; height:200px; width: 200px;">
<img alt="image here" src="#" >
</div>

<div  style=" padding:10px; width:10%; border:solid; border-color:black;">
<form action="request" method="post">
<input type="text" name="receiver" style="width:100%;" ><br>
<input type="submit" name="sendrequest" style="width:100%;" value="Send Request">
</form>
</div>
</div>
<div style="overflow:scroll;width:200px; height:500px;background-color: black;">
<ul>

</ul>
</div>


</body>
</html>