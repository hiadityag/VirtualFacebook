package com.aditya;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.serivces.Friend;
import com.serivces.MyData;


@WebServlet("/SendRequest")
public class SendRequest extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs=request.getSession();
		Friend fr=new Friend();
		fr.setSender(hs.getAttribute("email").toString());
		fr.setRec(request.getParameter("receiver"));
	MyData d=new MyData();
	d.saveFriendRequest(fr);	
	RequestDispatcher rd=request.getRequestDispatcher("Welcome");
	rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
