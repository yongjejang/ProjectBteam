

package com.fishing.controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fishing.dao.CommunityDAO;
import com.fishing.dto.CommunityVO;
import com.fishing.dto.MemberVO;
import com.mysql.cj.jdbc.ha.ReplicationMySQLConnection;



public class CommunityWriteAction implements Action {
	

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	CommunityVO cvo = new CommunityVO();

	
	PrintWriter w = response.getWriter();
	

//	System.out.println(request.getParameter("title"));
//	System.out.println(request.getParameter("nickname"));
//	System.out.println(request.getParameter("content"));
		

		cvo.setTitle(request.getParameter("title"));
		cvo.setnicname(request.getParameter("nickname"));
		// 줄바꿈 처리(탭처리, &처리)를 위한 로직
		cvo.setContent(request.getParameter("content").replace("\r\n", "<br />").replace("&","&amp;"));
		System.out.println(cvo);
		
		if(CommunityDAO.getInstance().insertBoard(cvo)) {
			// 저장 ㅇㅇ
            w.print("<script>");
            w.print("alert('저장 되었습니다.')");
            w.print("</script>");
				//new CommunityListAction().excute(request, response); // 리스트 페이지로 이동
				
				response.sendRedirect("community.do?command=community_list&page=1");
			} else {//저장 안됨
		}
	}
		
}


