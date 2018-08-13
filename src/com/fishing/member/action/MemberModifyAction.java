package com.fishing.member.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fishing.controller.action.Action;
import com.fishing.dao.MemberDao;
import com.fishing.dto.MemberVO;


public class MemberModifyAction implements Action {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		
		MemberDao dao = MemberDao.getInstance();
		
		
		HttpSession session = request.getSession();
		//String id = session.getAttribute("login").toString();
		MemberVO id = (MemberVO)session.getAttribute("memberinfo");
		
		System.out.println(id);
		
		
		MemberVO mvo = new MemberVO();
		mvo.setId(id.getId());
		mvo.setNickName(id.getNickName());
		mvo.setPw(request.getParameter("password"));
		mvo.setEmail(request.getParameter("email"));
		mvo.setPhone(request.getParameter("phone"));
		
		try {
			PrintWriter w = response.getWriter();
			dao.updateMember(mvo);
			request.setAttribute("memberInfo",mvo);
            w.print("<script>");
            w.print("alert('modify Success!!');");
            w.print("location.href='index.jsp';");
            w.print("</script>");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
