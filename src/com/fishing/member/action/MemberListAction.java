package com.fishing.member.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fishing.controller.action.Action;
import com.fishing.dao.MemberDao;
import com.fishing.dto.MemberVO;

public class MemberListAction implements Action {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		

		HttpSession session = request.getSession(); 
		
		ArrayList<MemberVO> memberList = MemberDao.getMemberList();
		System.out.println(memberList);
	   session.setAttribute("memberList", memberList);
	   String url ="member/memberList.jsp";
	   
	   RequestDispatcher rd = request.getRequestDispatcher(url);
	   rd.forward(request, response);
	

	}

}
