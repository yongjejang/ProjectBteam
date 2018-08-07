package com.fishing.member.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fishing.controller.action.Action;
import com.fishing.dao.MemberDao;
import com.fishing.dto.MemberVO;

public class MemberViewAction implements Action {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		HttpSession session=request.getSession(); 
		MemberDao mdao = MemberDao.getInstance();
		MemberVO mvo = new MemberVO();
		
		System.out.println(mvo);
//		String id = (String)session.getAttribute("login");
		MemberVO id = (MemberVO) session.getAttribute("memberinfo");
		
		
    	
		if(id.getId().equals("admin")/*id.equals("admin")*/){
			String viewId =request.getParameter("id");
	
			mvo = mdao.selectDetailMember(viewId);

			  session.setAttribute("member", mvo);
			  System.out.println(mvo);
			 
			   RequestDispatcher rd = request.getRequestDispatcher("member/memberInfo.jsp");
			   rd.forward(request, response);
	    	
		}
		
		
	}

}
