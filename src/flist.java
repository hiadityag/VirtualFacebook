

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

@WebServlet("/flist")
public class flist extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession hs= request.getSession();
			 Class.forName("com.mysql.jdbc.Driver");
			 Connection cn=  DriverManager.getConnection("jdbc:mysql://localhost/facebook?user=root&password=1234");
			 String str="insert into flist (sender,receiver,status) values (?,?,?)";
	         PreparedStatement st= cn.prepareStatement(str);
			 st.setString(1,hs.getAttribute("myid").toString());
			 st.setString(2,request.getParameter("rid"));
			 st.setInt(3,0);
			 st.executeUpdate();
				
			cn.close();
			response.sendRedirect("welcome.jsp");
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
			}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
