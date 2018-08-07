package com.fishing.member.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fishing.controller.action.Action;
import com.fishing.dao.MemberDao;
import com.fishing.dto.MemberVO;

public class MemberDeleteAction implements Action {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		MemberVO mvo = new MemberVO();
		MemberDao mdao = MemberDao.getInstance();
		
		String Id = request.getParameter("id");
		System.out.println(Id);
		
		
		mvo.setId(Id);
		
		
		boolean deleteResult = false;
		
		int deleteCount = mdao.deleteMember(Id);
		if(deleteCount > 0){
			
			deleteResult = true;
			 PrintWriter out = response.getWriter();
	    	  response.setContentType("text/html;charset=utf-8");
	    	  
	    	  out.println("<script>");
	    	  out.println("alert('delete Success!');");
	    	  out.println("location.href='member.do?command=member_list';");
	    	  out.println("</script>");
		}

	}

}
