

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/update")
public class update extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	   
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	     
		 PrintWriter pw = response.getWriter();
			
			try {
				
				if(request.getParameter("pass").equals(request.getParameter("repass")))
				{
					HttpSession hs= request.getSession();
					Class.forName("com.mysql.jdbc.Driver");
				 Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/facebook?user=root&password=1234");
				 String str="update user set id=?,fname=?,lname=?,email=?,phone=?,address=?,pass=?,dob=?,gender=? where id='"+hs.getAttribute("myid")+"'";
				PreparedStatement st=cn.prepareStatement(str);
				 st.setString(1,request.getParameter("id"));
				 st.setString(2,request.getParameter("fname"));
				 st.setString(3,request.getParameter("lname"));
				 st.setString(4,request.getParameter("email"));
				 st.setString(5,request.getParameter("phone"));
				 st.setString(6,request.getParameter("address"));
				 st.setString(7,request.getParameter("pass"));
				 st.setString(8,request.getParameter("dob"));
				 st.setString(9,request.getParameter("gender"));
				 st.executeUpdate();
				 cn.close();
              response.sendRedirect("welcome.jsp");				
			
	
				}
				else
				{
					response.sendRedirect("editprofile.jsp");				
						
				}
				
			} catch (Exception e) {
				// TODO: handle exception
			}
	}

}
