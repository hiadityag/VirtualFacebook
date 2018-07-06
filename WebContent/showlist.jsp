<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
String str = request.getParameter("rid");
Class.forName("com.mysql.jdbc.Driver");
Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/facebook?user=root&password=1234");
String str1="select * from user where id like '"+str+"%'";
PreparedStatement st=cn.prepareStatement(str);
ResultSet rs=st.executeQuery();
str="<select size='10' onchange='disp(this.value)'>";
while(rs.next())
{
	str=str+"<option>"+rs.getString(1)+"</option>";
}
str= str+"</select>";

out.print(str);
cn.close();






%>