package com.fishing.dto;

import java.sql.Date;

public class CommunityVO {
	
	private String nicname;
	private Date date;
	private String title;
	private String content;
	private int recommend;
	private String file;
	private int count;
	private int ref;
	private int step;
	private int reforder;
	private int replynum;
	private int cartegory;
	private int communityNum;
	private int allNum;
	
	
	
	


	public CommunityVO(String nicname, Date date, String title, int cartegory, int communityNum) {
		
		this.nicname = nicname;
		this.date = date;
		this.title = title;
		this.cartegory = cartegory;
		this.communityNum = communityNum;
	}


	public CommunityVO(String file, String title, int communityNum){
		this.file = file;
		this.title = title;
		this.communityNum = communityNum;
	}
	
	
	public CommunityVO(String nicname, Date date, String title, String content, int recommend, String file,
			int count, int ref, int step, int reforder, int replynum, int cartegory, int communityNum) {

		this.nicname = nicname;
		this.date = date;
		this.title = title;
		this.content = content;
		this.recommend = recommend;
		this.file = file;
		this.count = count;
		this.ref = ref;
		this.step = step;
		this.reforder = reforder;
		this.replynum = replynum;
		this.cartegory = cartegory;
		this.communityNum = communityNum;
	}
	
	public CommunityVO(String nicname,String content,Date date){
		this.nicname = nicname;
		this.content = content;
		this.date = date;
	}
	
	public CommunityVO(int allNum) {
		this.allNum = allNum;
	}


	public CommunityVO(int communityNum, String title, Date date, String nicname, int count) {
		this.communityNum = communityNum;
		this.title = title;
		this.date = date;
		this.nicname = nicname;
		this.count = count;
		
		
	}

	public CommunityVO(int communityNum, String title, String nicname, Date date, int count, String content,String file,int category) {
		this.communityNum = communityNum;
		this.title = title;
		this.nicname = nicname;
		this.date = date;
		this.count = count;
		this.content = content;
		this.file = file;
		this.cartegory = category;
	}


	public CommunityVO() {
		// TODO Auto-generated constructor stub
	}

	
	public int getCommunityNum() {
		return communityNum;
	}
	public void setCommunityNum(int communityNum) {
		this.communityNum = communityNum;
	}
	public String getnicname() {
		return nicname;
	}
	public void setnicname(String nicname) {
		this.nicname = nicname;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getRecommend() {
		return recommend;
	}
	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getReforder() {
		return reforder;
	}
	public void setReforder(int reforder) {
		this.reforder = reforder;
	}
	public int getReplynum() {
		return replynum;
	}
	public void setReplynum(int replynum) {
		this.replynum = replynum;
	}
	public int getCartegory() {
		return cartegory;
	}
	public void setCartegory(int cartegory) {
		this.cartegory = cartegory;
	}

	@Override
	public String toString() {
		return "CommunityVO [nicname=" + nicname + ", date=" + date + ", title=" + title + ", content=" + content
				+ ", recommend=" + recommend + ", file=" + file + ", count=" + count + ", ref=" + ref + ", step=" + step
				+ ", reforder=" + reforder + ", replynum=" + replynum + ", cartegory=" + cartegory + ", communityNum="
				+ communityNum + ", allNum=" + allNum + "]";
	}
	
}
