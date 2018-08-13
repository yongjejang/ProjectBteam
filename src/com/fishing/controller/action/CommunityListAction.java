package com.fishing.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fishing.dao.CommunityDAO;
import com.fishing.dto.CommunityVO;


public class CommunityListAction implements Action {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		String outputUrl = "communityboard/communityboardList.jsp";
		String minoutputUrl = "communityboard/communityboardminList.jsp";
		String qnaoutputUrl = "communityboard/communityboardQna.jsp";
		String command = request.getParameter("command");
		//int category = Integer.parseInt(request.getParameter("category"));
		int category = Integer.parseInt(request.getParameter("category"));
		System.out.println(category);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
		//System.out.println(command);
		CommunityDAO cDao = CommunityDAO.getInstance();
		//System.out.println(request.getParameter("page"));
		
		int page = 1;
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		if(category == 1){
		List<CommunityVO> list = cDao.selectAllBoard(page,category);
		int allNum= cDao.AllBoardcount(category);
		//System.out.println(allNum);
		System.out.println(list);
		
		
		
		request.setAttribute("communityList", list);
		request.setAttribute("allNum", allNum);
		
		
		RequestDispatcher rd = request.getRequestDispatcher(outputUrl);
		rd.forward(request, response);
		}else if(category == 0){
			List<CommunityVO> list = cDao.selectAllBoard(page,category);
			int allNum= cDao.AllBoardcount(category);
			//System.out.println(allNum);
			System.out.println(list);
			
			
			
			request.setAttribute("communityList", list);
			request.setAttribute("allNum", allNum);
			
			
			RequestDispatcher rd = request.getRequestDispatcher(minoutputUrl);
			rd.forward(request, response);
			
		}else{
			List<CommunityVO> list = cDao.selectAllBoard(page,category);
			int allNum= cDao.AllBoardcount(category);
			//System.out.println(allNum);
			System.out.println(list);
			System.out.println(category);
			System.out.println("규태");
			
			
			request.setAttribute("communityList", list);
			request.setAttribute("allNum", allNum);
			
			
			RequestDispatcher rd = request.getRequestDispatcher(qnaoutputUrl);
			rd.forward(request, response);
			
		}
	}

}
