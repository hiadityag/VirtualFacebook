

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/enter")
public class enter extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		    
		PrintWriter pw= response.getWriter();
		try {

			Class.forName("com.mysql.jdbc.Driver");
			 Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/facebook?user=root&password=1234");
			 String str="select * from user where id=? and pass=?";
			PreparedStatement st=cn.prepareStatement(str);
			 st.setString(1,request.getParameter("id"));
			 st.setString(2,request.getParameter("pass"));
			 ResultSet rs=st.executeQuery();
			 if(rs.next())
			 {
			 HttpSession hs=request.getSession();
			 hs.setAttribute("myid",request.getParameter("id"));
			 hs.setAttribute("myname",rs.getString(2)+" "+rs.getString(3));
			 Cookie ck= new Cookie("newck", request.getParameter("id"));
			 ck.setMaxAge(120);
			 response.addCookie(ck);
			 cn.close();
			 pw.print("valid");
			 
			 }
			 else
			 {
				 cn.close();
				 pw.print("invalid");
				 
					  
			 }

		} catch (Exception e) {
			pw.print(e.getMessage());
		}
	    

	}

}
