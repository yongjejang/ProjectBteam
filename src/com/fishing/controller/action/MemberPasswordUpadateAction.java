package com.fishing.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class MemberPasswordUpadateAction implements Action {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 String url = "index.jsp";
	 
	 
	 
	 
	 
	 RequestDispatcher rd = request.getRequestDispatcher(url);
	 rd.forward(request, response);
		

	}
}
