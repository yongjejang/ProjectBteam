package com.fishing.controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fishing.dao.CommunityDAO;
import com.fishing.dto.CommunityVO;
import com.google.gson.Gson;

public class CommunityReplyAction implements Action {

	@Override
	public void excute(HttpServletRequest requsst, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = requsst.getSession();
		CommunityDAO cdao = CommunityDAO.getInstance();
		CommunityVO cvo = new CommunityVO();
		String nickname = requsst.getParameter("nickname");
		String content = requsst.getParameter("content");
		int ref = Integer.parseInt(requsst.getParameter("ref"));
		PrintWriter w = response.getWriter();
		cvo.setnicname(nickname);
		cvo.setContent(content);
		cvo.setRef(ref);
		System.out.println(cvo);
		cdao.insertreply(cvo);
		List<CommunityVO> list = cdao.selectreply(ref);
		
		response.setContentType("application/json; charset=UTF-8");   
        Gson gson = new Gson();
        w.print(gson.toJson(list));
        System.out.println(list);
        w.flush();
        w.close();


	}

}
