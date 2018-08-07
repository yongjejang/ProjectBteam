package com.fishing.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fishing.dao.CommunityDAO;
import com.fishing.dto.CommunityVO;

public class IndexAction implements Action {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "index.jsp";
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		CommunityDAO cdao = new CommunityDAO().getInstance();
		
		List<CommunityVO> list = cdao.sea5();
		
		
		
		
		
		System.out.println(list);
		request.setAttribute("communityList", list);

		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
