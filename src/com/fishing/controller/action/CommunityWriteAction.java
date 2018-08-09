

package com.fishing.controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fishing.dao.CommunityDAO;
import com.fishing.dto.CommunityVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;



public class CommunityWriteAction implements Action {
		

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	CommunityVO cvo = new CommunityVO();

	
	PrintWriter w = response.getWriter();
	

//	System.out.println(request.getParameter("title"));
//	System.out.println(request.getParameter("nickname"));
//	System.out.println(request.getParameter("content"));
		
		String savePath = "";
		ServletContext context = request.getServletContext();
		String filepath = context.getRealPath(savePath);
		int uploadFileSize = 5*1024*1024; 
	    String fileEncType = "UTF-8";
	    
	    MultipartRequest  mr= new MultipartRequest(	
	            request,
	            filepath,
	            uploadFileSize,
	            fileEncType,
	            new DefaultFileRenamePolicy());
		String realFile = mr.getFilesystemName("file");
		int category = Integer.parseInt(mr.getParameter("category"));
		System.out.println("여기봐"+category);
		cvo.setTitle(mr.getParameter("title"));
		cvo.setnicname(mr.getParameter("nickname"));
		// 줄바꿈 처리(탭처리, &처리)를 위한 로직
		cvo.setContent(mr.getParameter("content").replace("\r\n", "<br />").replace("&","&amp;"));
		cvo.setCartegory(category);
		cvo.setFile(realFile);
		System.out.println(cvo);
		
		if(CommunityDAO.getInstance().insertBoard(cvo)) {
			// 저장 ㅇㅇ
            w.print("<script>");
            w.print("alert('저장 되었습니다.')");
            w.print("</script>");
				
            //new CommunityListAction().excute(request, response); // 리스트 페이지로 이동
				if(category == 0){
					response.sendRedirect("community.do?command=community_list&page=1&category=0");
				}else if(category == 1){
					response.sendRedirect("community.do?command=community_list&page=1&category=1");
				}else{
					response.sendRedirect("community.do?command=community_list&page=1&category=2");
				}
				
			} else {//저장 안됨
		}
	}
		
}


