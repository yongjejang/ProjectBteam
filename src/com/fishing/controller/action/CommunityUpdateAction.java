package com.fishing.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fishing.dao.CommunityDAO;
import com.fishing.dto.CommunityVO;
import com.fishing.controller.action.CommunityListAction;


public class CommunityUpdateAction implements Action {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		CommunityVO cvo = new CommunityVO();
		String communityNum = request.getParameter("communityNum");
		String title = request.getParameter("title");
		String nicname = request.getParameter("nicname");
		String content = request.getParameter("content");
		
		//CommunityVO 객체에 저장
		cvo.setCommunityNum(Integer.parseInt(communityNum));
		cvo.setnicname(nicname);
		cvo.setTitle(title);
		cvo.setContent(content);
		
		
		CommunityDAO cdao = CommunityDAO.getInstance();
		cdao.updateBoard(cvo);
		
		new CommunityListAction().excute(request, response);
	}

}
