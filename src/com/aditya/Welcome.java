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

import com.serivces.Friend;
import com.serivces.MyData;
import com.serivces.User;
import com.serivces.Wpost;

@WebServlet("/Welcome")
public class Welcome extends HttpServlet {
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	HttpSession hs=request.getSession();
	String email=hs.getAttribute("email").toString();
	MyData d=new MyData();
	ArrayList<User> userdata=d.getUser(email);
	ArrayList<Wpost> wpost=d.listWposts(email);
	ArrayList<String> friends=d.getFriends(email);
	ArrayList<Friend> pfriends=d.getPendingFriends(email);
	request.setAttribute("userdata",userdata);
	request.setAttribute("wposts",wpost);
	request.setAttribute("pfriends",pfriends);
	request.setAttribute("friends",friends);
	RequestDispatcher rd=request.getRequestDispatcher("welcome.jsp");
	rd.forward(request, response);

	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
