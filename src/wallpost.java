

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/wallpost")
public class wallpost extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw= response.getWriter();
		try {
			
			 Date d= new Date();
			 String strFormat ="hh:mm:ss a dd-MMM-yyyy";
			 SimpleDateFormat spo= new SimpleDateFormat(strFormat);
			 String date= spo.format(d);
			HttpSession hs= request.getSession();
		     Class.forName("com.mysql.jdbc.Driver");
			 Connection cn=  DriverManager.getConnection("jdbc:mysql://localhost/facebook?user=root&password=1234");
			 String str="insert into posts (message,sender,date) values (?,?,?)";
	         PreparedStatement st= cn.prepareStatement(str);
	         st.setString(1,request.getParameter("message"));
			 st.setString(2,hs.getAttribute("myid").toString());
			 st.setString(3,date);
			 st.executeUpdate();
				
			cn.close();
			response.sendRedirect("welcome.jsp");
			
		} catch (Exception e) {
			
			}
		}

}
