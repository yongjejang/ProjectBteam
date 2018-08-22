package com.fishing.member.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fishing.controller.action.Action;
import com.fishing.dao.MemberDao;
import com.fishing.dto.CommunityVO;
import com.fishing.dto.MemberVO;


public class MemberUserInfoAction implements Action{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		//String id = session.getAttribute("login").toString();
		MemberVO id = (MemberVO)session.getAttribute("memberinfo");
		System.out.println(id);
		
		MemberDao dao = MemberDao.getInstance();
		
		
		MemberVO mvo= dao.selectDetailMember(id.getId());
		
		List<CommunityVO> cvo = dao.myWritten(id.getNickName());
		System.out.println(cvo);
		request.setAttribute("memberInfo", mvo);
		request.setAttribute("writelist", cvo);
		String url = "/member/UserInfoForm.jsp";
		
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);

		
	}
}
