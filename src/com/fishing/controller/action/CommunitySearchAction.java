package com.fishing.controller.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fishing.dao.CommunityDAO;
import com.fishing.dto.CommunityVO;

public class CommunitySearchAction implements Action {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/communityboard/communityboardSearch.jsp";
		String search1 = request.getParameter("search1");
		String search2 = request.getParameter("search2");
		System.out.println("셀렉 "+search1);
		System.out.println("검색 "+search2);
		CommunityDAO cdao = CommunityDAO.getInstance();
		List<CommunityVO> indexlist = cdao.search(search1,search2);
		
		
		
		request.setAttribute("indexlist",indexlist);
		//System.out.println("인덱스리트스튼"+indexlist);
		
		
		
	RequestDispatcher rd = request.getRequestDispatcher(url);
	rd.forward(request, response);
		
	}

}
