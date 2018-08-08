package com.fishing.controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fishing.dao.CommunityDAO;
import com.fishing.controller.action.CommunityListAction;


public class CommunityDeleteAction implements Action {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String communityNum = request.getParameter("communityNum");
		int category = Integer.parseInt(request.getParameter("cartegory"));
		System.out.println("넘값 확인" + communityNum);
		System.out.println("카테고리" + category);
		CommunityDAO cdao = CommunityDAO.getInstance();
		cdao.deleteBoard(communityNum);
		PrintWriter w = response.getWriter();
		if (category == 0){
			response.sendRedirect("community.do?command=community_list&page=1&category=0");
			
		}
		if (category == 1){
			response.sendRedirect("community.do?command=community_list&page=1&category=1");
		
		}
		
		
		
		
		
		

	}

}
