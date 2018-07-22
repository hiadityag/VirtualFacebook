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

@WebServlet("/Update")
public class Update extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User u = new User(request.getParameter("rname"),request.getParameter("remail"),request.getParameter("rpass"),request.getParameter("rphone"),request.getParameter("rdob"),request.getParameter("rgender"));
    	MyData md = new MyData();
    	HttpSession hs=request.getSession();
        md.UpdateUser(hs.getAttribute("email").toString(), u);
        RequestDispatcher rd = request.getRequestDispatcher("Welcome");
        rd.forward(request, response);
        
	
	}

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	
	}

}
