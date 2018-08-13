package com.fishing.controller;

import com.fishing.controller.action.Action;
import com.fishing.controller.action.CommunityDeleteAction;
import com.fishing.controller.action.CommunityListAction;
import com.fishing.controller.action.CommunityReplyAction;
import com.fishing.controller.action.CommunitySearchAction;
import com.fishing.controller.action.CommunityUpdateAction;
import com.fishing.controller.action.CommunityUpdateFormAction;
import com.fishing.controller.action.CommunityViewAction;
import com.fishing.controller.action.CommunityWriteAction;
import com.fishing.controller.action.CommunityWriteFormAction;
import com.fishing.controller.action.IndexAction;
import com.fishing.member.action.MemberViewAction;
import com.fishing.member.action.MemberDeleteAction;
import com.fishing.member.action.MemberDeleteFormAction;
import com.fishing.member.action.MemberIdCheckAction;
import com.fishing.member.action.MemberInfomationAction;
import com.fishing.member.action.MemberJoinAction;
import com.fishing.member.action.MemberJoinFormAction;
import com.fishing.member.action.MemberListAction;
import com.fishing.member.action.MemberLoginAction;
import com.fishing.member.action.MemberPasswordUpadateAction;
import com.fishing.member.action.MemberPasswordUpadateFormAction;
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
		}else if(command.equals("member_view")){
			action = new MemberViewAction();
		}else if(command.equals("member_list")){
			action = new MemberListAction();
		}else if(command.equals("member_delete")){
			action = new MemberDeleteAction();
		}else if(command.equals("member_password_update")){
			action = new MemberPasswordUpadateAction();
		}else if(command.equals("member_password_update_Form")){
			action = new MemberPasswordUpadateFormAction();
		}else if(command.equals("Member_IdCheck")){
			action = new MemberIdCheckAction();
		}else if(command.equals("index")){
			action = new IndexAction();
		}else if(command.equals("community_search")){
			action = new CommunitySearchAction();
		}else if(command.equals("member_delete_form")){
			action = new MemberDeleteFormAction();
		}else if(command.equals("member_infomation")){
			action = new MemberInfomationAction();
		}
		
		return action;
	}
}
