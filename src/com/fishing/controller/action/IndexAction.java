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

public class IndexAction implements Action {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "index.jsp";
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		List<CommunityVO> list = new ArrayList<CommunityVO>();
		CommunityDAO cdao = new CommunityDAO().getInstance();
		for(int i = 0 ;i<=2;i++){
			switch (i) {
			case 0:
				list = cdao.sea5(i);
				request.setAttribute("communityList", list);
				break;
			case 1:
				list = cdao.sea5(i);
				request.setAttribute("minList", list);
				break;
			default:
				list = cdao.sea5(i);
				request.setAttribute("qnaList", list);
				break;
			}
		}
		
		
//		System.out.println(list);
//		request.setAttribute("communityList", list);

		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}
	
}
