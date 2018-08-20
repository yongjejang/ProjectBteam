

package com.fishing.member.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fishing.controller.action.Action;
import com.fishing.dao.MemberDao;
import com.fishing.dto.MemberVO;

public class MemberLoginAction implements Action {

   @Override
   public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   request.setCharacterEncoding("UTF-8");
	   response.setContentType("text/html; charset=UTF-8");
	   
      String command = request.getParameter("command");
     // request.setCharacterEncoding("UTF-8");
     
      HttpSession session = request.getSession();
      MemberVO mvo = new MemberVO();
     
      ArrayList<MemberVO> list = new ArrayList<MemberVO>();
      
      String id = request.getParameter("id");
      String pw = request.getParameter("pw");
      
      
      MemberDao mdao = MemberDao.getInstance();
      mvo.setId(id);
      mvo.setPw(pw);
      PrintWriter w = response.getWriter();
      //System.out.println(mvo);
      
      
      if(mdao.login(mvo) != null){
        //MemberVO mv = mdao.getMember(id);
    	  MemberVO mv = mdao.selectDetailMember(id);
         System.out.println(mv);
         session.setAttribute("memberinfo", mv);
         // w.print("<meta charset='utf-8'>");
            w.print("<script>");
            w.print("alert('로그인 되었습니다.');");
            w.print("location.href='index.jsp';");
            w.print("</script>");
            
         
      }else{
        
         System.out.println("아이디나 패스워드가 맞지 않습니다.");
         w.print("<script>");
            w.print("alert('아이디나 패스워드가 맞지 않습니다.');");
            w.print("location.href='<a href='member.do?command=member_login_form'>';");
            w.print("</script>");
      }
      
   }

}