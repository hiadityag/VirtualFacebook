

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.net.ConnectException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/save")
public class save extends HttpServlet {
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		PrintWriter pw = response.getWriter();
		try {
			if(request.getParameter("pass").equals(request.getParameter("repass")))
			{
			 Class.forName("com.mysql.jdbc.Driver");
			 Connection cn=  DriverManager.getConnection("jdbc:mysql://localhost/facebook?user=root&password=1234");
			 String str="insert into user values(?,?,?,?,?,?,?,?,?)";
             PreparedStatement st= cn.prepareStatement(str);
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
			 
			 
			 pw.print("welcome to my facebook");
			 }
			
		     }
		catch (Exception e) {
          pw.print(e.getMessage());
            }
		
	}

}
