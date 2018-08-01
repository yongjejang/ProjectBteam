package com.fishing.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fishing.dao.CommunityDAO;
import com.fishing.dto.CommunityVO;



public class CommunityWriteAction implements Action {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	CommunityVO cvo = new CommunityVO();
	
	
	
		cvo.setTitle(request.getParameter("title"));
		
		cvo.setnicname(request.getParameter("nicname"));
		
		
		// 줄바꿈 처리(탭처리, &처리)를 위한 로직
		cvo.setContent(request.getParameter("content").replace("\r\n", "<br />").replace("&","&amp;"));
		
		if(CommunityDAO.getInstance().insertBoard(cvo)) {
			// 저장 잘 됨
			// 자바스크립트로 메세지 뿌려주고
			new CommunityListAction().excute(request, response); // 리스트 페이지로 이동
		} else {
			//저장 안됨
		}
		
		
	}

}
