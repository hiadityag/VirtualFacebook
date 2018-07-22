package com.aditya;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.serivces.MyData;
import com.serivces.User;

@WebServlet("/EditProfile")
public class EditProfile extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User u = new User();
		ArrayList<User> ul = new ArrayList<User>();
		HttpSession hs=request.getSession();
		MyData md= new MyData();
		ul= md.getUser( hs.getAttribute("email").toString());
		request.setAttribute("EditData", ul);
		RequestDispatcher rd= request.getRequestDispatcher("EditProfile.jsp");
		rd.forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
