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

public class MemberModifyFormAction implements Action {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		

				HttpSession session = request.getSession();
				//String id = session.getAttribute("login").toString();
				MemberVO id = (MemberVO)session.getAttribute("memberinfo");
				System.out.println(id);
				
				MemberDao dao = MemberDao.getInstance();
				MemberVO member = dao.selectDetailMember(id.getId());
				
			
				request.setAttribute("memberInfo", member);
				
				

				String url = "/member/memberModifyForm.jsp";
				
				RequestDispatcher rd = request.getRequestDispatcher(url);
				rd.forward(request, response);
				

	}

}
