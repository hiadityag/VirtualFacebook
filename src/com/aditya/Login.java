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

@WebServlet("/Login")
public class Login extends HttpServlet {
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MyData d=new MyData();
		if(d.isUser(request.getParameter("email1"),request.getParameter("pass1")))
		{
		HttpSession hs=request.getSession();
		hs.setAttribute("email",request.getParameter("email1"));
		RequestDispatcher rd=request.getRequestDispatcher("Welcome");
		rd.forward(request, response);
		
		}
		else
		{
			request.setAttribute("error","Invalid email or password");
			RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
				
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	

		
	}

}
