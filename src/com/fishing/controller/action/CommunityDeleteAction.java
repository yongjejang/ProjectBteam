package com.fishing.controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

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
		System.out.println("넘값 확인" + communityNum);
		CommunityDAO cdao = CommunityDAO.getInstance();
		cdao.deleteBoard(communityNum);
		PrintWriter w = response.getWriter();
		
		
		
		
		
		new CommunityListAction().excute(request, response);
		

	}

}
