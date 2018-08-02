package com.fishing.member.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fishing.controller.action.Action;
import com.fishing.dao.MemberDao;
import com.fishing.dto.MemberVO;
import com.mysql.cj.xdevapi.Result;

public class MemberJoinAction implements Action {

   @Override
   public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      
      request.setCharacterEncoding("UTF-8");

      
      MemberVO mvo = new MemberVO();
       MemberDao mdao = MemberDao.getInstance();
     
       boolean joinSucess = false;
       
       
      String userId = request.getParameter("userId");
      String password = request.getParameter("password");
      String nickName = request.getParameter("nickname");
      String birthday = request.getParameter("birthday");
      String email = request.getParameter("email");
      String phone = request.getParameter("phone");
      //String addr = request.getParameter("addr");
      
      System.out.println(userId);
      
      mvo.setId(userId);
      mvo.setNickName(nickName);
      mvo.setPw(password);
      mvo.setEmail(email);
      mvo.setBirthday(birthday);
      mvo.setPhone(phone);
      //mvo.setAddr(addr);

      int joinCount = mdao.joinMember(mvo);
      System.out.println(joinCount);
      if(joinCount > 0){
    	 /* String url ="index.jsp";
          RequestDispatcher rd = request.getRequestDispatcher(url);
          rd.forward(request, response);*/
    	  joinSucess = true;
    	  PrintWriter out = response.getWriter();
    	  response.setContentType("text/html;charset=utf-8");
    	  
    	  out.println("<script>");
    	  out.println("alert('join Success!');");
    	  out.println("location.href='index.jsp';");
    	  out.println("</script>");
    	  //response.sendRedirect("index.jsp");
      }
      
     
     
      
     /* result = mdao.joinMember(mvo);
      if(result == false){
    	 
    	  response.setContentType("text/html;charset=UTF-8");
          PrintWriter out = response.getWriter();
          out.println("<script>");
          out.println("alert('join Fail');");
          out.println("location.href='member.do?command=member_login_form';'");
          out.println("<script>");
    	  
      }else if(result == true){
    	  String url ="../index.jsp";
          RequestDispatcher rd = request.getRequestDispatcher(url);
          rd.forward(request, response);
      }*/
      
   
      
      

   }

}