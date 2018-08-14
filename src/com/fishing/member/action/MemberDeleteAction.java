package com.fishing.member.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fishing.controller.action.Action;
import com.fishing.dao.MemberDao;
import com.fishing.dto.MemberVO;

public class MemberDeleteAction implements Action {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		MemberVO id = (MemberVO) session.getAttribute("memberinfo");
		MemberVO mvo = new MemberVO();
		MemberDao mdao = MemberDao.getInstance();
		
		String Id = request.getParameter("id");
		System.out.println(Id);
		
		
		mvo.setId(Id);		
		int deleteCount = mdao.deleteMember(Id);
		if( deleteCount > 0){
			
			boolean deleteResult = true;
			 PrintWriter out = response.getWriter();
	    	  response.setContentType("text/html;charset=utf-8");
	    	  
	    	  out.println("<script>");
	    	  out.println("alert('delete Success!');");
	    	  out.println("location.href='member.do?command=member_list';");
	    	  out.println("</script>");
		}/*if(deleteCount > 0){
			
			session.removeAttribute("memberinfo");
			 PrintWriter w = response.getWriter();
			
			 w.println("<script>");
	    	  w.println("alert('회원탈퇴 되었습니다.');");
	    	  w.println("location.href='index.jsp';");
	    	  w.println("</script>");
			
		}*/
		/*
		int check = mdao.deleteMember(id.getId());
		System.out.println(id);
	
		if(check == 1){
			session.removeAttribute("memberinfo");
			 PrintWriter w = response.getWriter();
			
			 w.println("<script>");
	    	  w.println("alert('회원탈퇴 되었습니다.');");
	    	  w.println("location.href='index.jsp';");
	    	  w.println("</script>");
			
		}*/
	}

}
