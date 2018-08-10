package com.fishing.member.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fishing.controller.action.Action;
import com.fishing.dao.MemberDao;

public class MemberIdCheckAction implements Action {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		// TODO Auto-generated method stub
				String id = request.getParameter("id");
				MemberDao dao = MemberDao.getInstance();
				
				boolean result = dao.duplicateIdCheck(id);
				
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();

				if(result)	out.println("0"); 
				else		out.println("1");
				
				out.close();
		

	}

}
