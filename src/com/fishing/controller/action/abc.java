package com.fishing.controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fishing.dao.CommunityDAO;
import com.fishing.dto.CommunityVO;
import com.google.gson.Gson;

public class abc implements Action {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/json; charset=UTF-8"); 
		List<CommunityVO> list = new ArrayList<CommunityVO>();
		CommunityDAO cdao = new CommunityDAO().getInstance();
		list = cdao.pictureTop5();
		PrintWriter w =response.getWriter();
		Gson gson = new Gson();
		w.print(gson.toJson(list));
		w.flush();
		w.close();
	}

}
