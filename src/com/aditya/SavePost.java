package com.aditya;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.serivces.MyData;
import com.serivces.Wpost;


@WebServlet("/SavePost")
public class SavePost extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Wpost w=new Wpost();
		HttpSession hs=request.getSession();
		w.setSender(hs.getAttribute("email").toString());
		w.setMsg(request.getParameter("message"));
		w.setDate(new Date().toString());
		MyData d=new MyData();
		d.saveWpost(w);
		RequestDispatcher rd=request.getRequestDispatcher("Welcome");
		rd.forward(request, response);

		}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
