package com.fishing.controller;

import com.fishing.controller.action.Action;
import com.fishing.controller.action.CommunityDeleteAction;
import com.fishing.controller.action.CommunityListAction;
import com.fishing.controller.action.CommunityReplyAction;
import com.fishing.controller.action.CommunityUpdateAction;
import com.fishing.controller.action.CommunityUpdateFormAction;
import com.fishing.controller.action.CommunityViewAction;
import com.fishing.controller.action.CommunityWriteAction;
import com.fishing.controller.action.CommunityWriteFormAction;
import com.fishing.member.action.MemberJoinAction;
import com.fishing.member.action.MemberJoinFormAction;
import com.fishing.member.action.MemberLoginAction;
import com.fishing.controller.ActionFactory;


public class ActionFactory {
	


	private static ActionFactory instance = new ActionFactory();
	
	private ActionFactory() {
		
	}
	
	public static ActionFactory getInstance(){
		if(instance == null){
			return instance;
		}
		return instance;
	}
	
	public Action getAction(String command){
		Action action = null;
		System.out.println("Action Factory : " + command);
		
		if(command.equals("community_list")){
			action = new CommunityListAction();
		}else if(command.equals("community_write_form")){
			action = new CommunityWriteFormAction();
		}else if(command.equals("community_write")){
			action = new CommunityWriteAction();
		}else if(command.equals("community_reply")){
			action = new CommunityReplyAction();
		}else if(command.equals("community_delete")){
			action = new CommunityDeleteAction();
		}else if(command.equals("community_update_form")){
			action = new CommunityUpdateFormAction();
		}else if(command.equals("community_update")){
			action = new CommunityUpdateAction();
		}else if(command.equals("community_view")){
			action = new CommunityViewAction();
		}else if(command.equals("member_login")){
			action = new MemberLoginAction();
		}else if(command.equals("member_join")){
			action = new MemberJoinAction();
		}else if(command.equals("member_join_form")){
			action = new MemberJoinFormAction();
		}
		
		return action;
	}
}
