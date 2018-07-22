package com.aditya;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.serivces.MyData;
import com.serivces.User;

@WebServlet("/SignUp")
public class SignUp extends HttpServlet {
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	String pass = request.getParameter("pass").toString();
	String repass = request.getParameter("repass").toString();
	
	if(pass.equals(repass))
	{
		 HttpSession hs=request.getSession();
		 hs.setAttribute("email",request.getParameter("email"));
	User u=new User(request.getParameter("name"),request.getParameter("email"),request.getParameter("pass"),request.getParameter("phone"),request.getParameter("dob"),request.getParameter("gender"));
	MyData d=new MyData();
	d.saveUser(u);
	RequestDispatcher rd=request.getRequestDispatcher("Welcome");
	rd.forward(request, response);
	}
	else
	{
		request.setAttribute("error","Invalid password mismatch");
		RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
		rd.forward(request, response);
	}

	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
	
	}

}
