package com.fishing.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fishing.dao.CommunityDAO;
import com.fishing.dto.CommunityVO;


public class CommunityViewAction implements Action {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// request에 있는 num을 DAO에 selectOneBoard()로 호출하고
		String url ="/communityboard/communityboardView.jsp";
		String communityNum = request.getParameter("communityNum");
		HttpSession session = request.getSession();

//		System.out.println(communityNum);
	
	    CommunityDAO cDao = CommunityDAO.getInstance();
		CommunityVO cvo = cDao.selectOneBoard(communityNum);
		System.out.println(cvo);
		
		if (cvo != null) {
			// 조회수 증가
			cDao.readCountUp(communityNum);
		}
		
		//받아온 BoardVo를 communityboardView.jsp에 포워딩
		request.setAttribute("cboard1", cvo);
		
		
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
		
		
	}

}
