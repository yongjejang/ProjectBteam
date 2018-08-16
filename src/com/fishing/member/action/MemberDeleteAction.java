package com.fishing.member.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
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
		session.getAttribute("memberinfo");
		String userId= request.getParameter("userid");
		String pw = request.getParameter("pw"); // 세선에 저장된 비밀번호(히든으로 받아옴)		
		String password =request.getParameter("password");//유저가 직접 입력한 비밀번호
		if(pw.equals(password)){
		MemberDao mdao = MemberDao.getInstance();
		MemberVO mvo = new MemberVO();
		mdao.deleteMember(userId,password);
		PrintWriter out = response.getWriter();
	  	 response.setContentType("text/html;charset=utf-8");
	  
	  	 out.println("<script>");
	  	 out.println("alert('성공적으로 탈퇴 되었습니다.');");
	  	  
	  	 
	  	 
	  	 

	  	 out.println("location.href='member.do?command=index';");

		  	session.invalidate(); //현재 세션영역에 있는 모든 속성 제거
	  	 out.println("</script>");
		}else {
			PrintWriter out = response.getWriter();
		  	 response.setContentType("text/html;charset=utf-8");
		  	  
		  	 out.println("<script>");
		  	 out.println("alert('비밀번호가 맞지 않습니다 비밀번호를 확인 해 주세요.');");
		  	 out.println("location.href='member.do?command=member_delete_form';");

		  	 out.println("</script>");
		}
		
		
				
			
			 
	    	  


		}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*if(deleteCount > 0){
			
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


