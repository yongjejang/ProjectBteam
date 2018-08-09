package com.fishing.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fishing.dao.CommunityDAO;
import com.fishing.dto.CommunityVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.fishing.controller.action.CommunityListAction;


public class CommunityUpdateAction implements Action {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String outputUrl = "communityboard/communityboardList.jsp";
		String minoutputUrl = "communityboard/communityboardminList.jsp";
		
		CommunityVO cvo = new CommunityVO();
		
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
		String communityNum = mr.getParameter("communityNum");
		String title = mr.getParameter("title");
		String nicname = mr.getParameter("nicname");
		String content = mr.getParameter("content");
		int category = Integer.parseInt(mr.getParameter("category"));
		cvo.setCommunityNum(Integer.parseInt(communityNum));
		cvo.setnicname(nicname);
		cvo.setTitle(title);
		cvo.setContent(content);
		cvo.setFile(realFile);
		cvo.setCartegory(category);
		
		
		CommunityDAO cdao = CommunityDAO.getInstance();
		cdao.updateBoard(cvo);
		
		
		RequestDispatcher rd = request.getRequestDispatcher("community.do?command=community_view&communityNum="+cvo.getCommunityNum());
		rd.forward(request, response);
		
		
//		if(category == 0){
//			response.sendRedirect("community.do?command=community_list&page=1&category=0");
//		}else{
//			response.sendRedirect("community.do?command=community_list&page=1&category=1");
//		}
	}

}
