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
		String search1 = request.getParameter("search1");
		String search2 = request.getParameter("search2");
		String cate = request.getParameter("cate");
		System.out.println("이게1번"+search1); //어떤걸 검색을 하게 될지 
		System.out.println("이게2번"+search2); //이거는 어떤 내용인지
		int page = 1;
		
		String url = "communityboard/communityboardSearch.jsp";

		CommunityDAO cDao = CommunityDAO.getInstance();
		
		
		CommunityDAO cdao = CommunityDAO.getInstance();
		List<CommunityVO> indexlist = cdao.search(page,search1,search2,cate);
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		int allNum= cDao.searchBoardcount(search1,search2);
		
		System.out.println("전체 페이지는 몇개냐?" + allNum);
		
		request.setAttribute("indexlist",indexlist);
		request.setAttribute("search1", search1);
		request.setAttribute("search2", search2);
		request.setAttribute("allNum", allNum);
		//System.out.println("인덱스리트스튼"+indexlist);
		
		
	RequestDispatcher rd = request.getRequestDispatcher(url);
	rd.forward(request, response);
		
	}

}
