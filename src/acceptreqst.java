

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/acceptreqst")
public class acceptreqst extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String stk="<ul>";
		HttpSession hs= request.getSession();
		PrintWriter pw= response.getWriter();
		
		try {
			 Class.forName("com.mysql.jdbc.Driver");
			 Connection cn=  DriverManager.getConnection("jdbc:mysql://localhost/facebook?user=root&password=1234");
			 String str="update flist set status=1 where rid=?";
	         PreparedStatement st= cn.prepareStatement(str);
			 st.setString(1,request.getParameter("rid"));
			 st.executeUpdate();
				
			cn.close();
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		try {
			
			
			Class.forName("com.mysql.jdbc.Driver");
				Connection cn1=DriverManager.getConnection("jdbc:mysql://localhost/facebook?user=root&password=1234");			
			String str2="select * from flist where receiver=? and status=0 order by rid desc ";
			PreparedStatement st1=cn1.prepareStatement(str2);
			 st1.setString(1,hs.getAttribute("myid").toString());
				ResultSet rs1=st1.executeQuery();
			 while(rs1.next())
				{
			
			
				stk=stk+"<li>";
				 stk=stk+"<a href='#' style='background-color:white;border: none; margin-top:10px; width:90%; color: black; padding: 10px 10px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px;'>";
				 stk=stk+rs1.getString(2);
				 stk=stk+"</a><br>";
				 stk=stk+"<button onclick='acceptreqst("+rs1.getInt(1)+")' style='background-color: #f44336;border: none; margin-top:10px; width:90%; color: white; padding: 10px 10px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px;'>";
				 stk=stk+"accept";
				 stk=stk+"</button>";
				 stk=stk+"<button onclick='deletereqst("+rs1.getInt(1)+")' style='background-color: #f44336;border: none; margin-top:10px; width:90%; color: white; padding: 10px 10px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px;'>";
				 stk=stk+"delete";
				 stk=stk+"</button>";			
				 stk=stk+"</li>";
                 
					
			
				}
			 cn1.close();
			
				stk=stk+"<div class='clear'></div>";
			stk=stk+"</ul>"; 
			 stk=stk+"$$";
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		try {
			           stk=stk+"<ul>";
			           Class.forName("com.mysql.jdbc.Driver");
		 				Connection cn2=DriverManager.getConnection("jdbc:mysql://localhost/facebook?user=root&password=1234");			
						String str3="select * from flist where (receiver=? or sender=?) and status=1 order by rid desc ";
						PreparedStatement st2=cn2.prepareStatement(str3);
						 st2.setString(1,hs.getAttribute("myid").toString());
						 st2.setString(2,hs.getAttribute("myid").toString());
			 				ResultSet rs2=st2.executeQuery();
						 while(rs2.next())
		 				{
						  if(rs2.getString("sender").equals(hs.getAttribute("myid").toString()))
						  {
							stk=stk+"<li>";
							
							stk=stk+"<a href='#' style='background-color:white;border: none; margin-top:10px; width:90%; color: black; padding: 10px 10px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px;'>";
							stk=stk+rs2.getString("receiver");
							stk=stk+"</a>";
							stk=stk+"</li>";
		 				 }
						  else
						  {
							  stk=stk+"<li>";
								
								stk=stk+"<a href='#' style='background-color:white;border: none; margin-top:10px; width:90%; color: black; padding: 10px 10px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px;'>";
								stk=stk+rs2.getString("sender");
								stk=stk+"</a>";
								stk=stk+"</li>";
						  }
		 				}
						 cn2.close();
				stk=stk+"<div class='clear'></div>";
			   stk=stk+"</ul>";
			   pw.print(stk);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
