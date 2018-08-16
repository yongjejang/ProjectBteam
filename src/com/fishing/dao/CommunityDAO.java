package com.fishing.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.fishing.dto.CommunityVO;


import util.DBMangement;

public class CommunityDAO {
	private static CommunityDAO instance = new CommunityDAO();
	
	public static CommunityDAO getInstance(){
		if(instance == null){
			return new CommunityDAO();
		}
		
		return instance; 
	}
	
	
	// ------------- 전체 글 리스트 목록 페이지를 위한 메서드 -------------------------------------
	public List<CommunityVO> selectAllBoard(int page,int category) {
		//select * from fishing.community
		String query = "select * from fishing.community  where category = ? order by Communitynum desc limit ? , ?";
		List<CommunityVO> list = new ArrayList<CommunityVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			con = DBMangement.getConnection();
			pstmt = con.prepareStatement(query);
			
			
			pstmt.setInt(1, category);
			pstmt.setInt(2, (page - 1) * 10);
			pstmt.setInt(3, 10);
			
			rs = pstmt.executeQuery();
			if(category == 0){
			while(rs.next()) {
				list.add(
					new CommunityVO(
								rs.getInt("communityNum"),
								rs.getString("title"),
								rs.getDate("date"),
								rs.getString("nicname"),
								rs.getInt("count")
								));
			}
		}
			
			if(category == 1){
				while(rs.next()) {
					list.add(
						new CommunityVO(
									rs.getInt("communityNum"),
									rs.getString("title"),
									rs.getDate("date"),
									rs.getString("nicname"),
									rs.getInt("count")
									));
				}
			}
			if(category == 2){
				while(rs.next()) {
					list.add(
						new CommunityVO(
									rs.getInt("communityNum"),
									rs.getString("title"),
									rs.getDate("date"),
									rs.getString("nicname"),
									rs.getInt("count")
									));
				}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBMangement.close(rs,  pstmt, con);
		}
		
		return list;
	}
	
		// 현재 글 번호중 가장 큰 글 번호 반환
		public int getMaxRef() {
			String query = "select max(communityNum) as maxRef from fishing.community";
			
			
			int maxRef = 0;
			Connection con = null;
			ResultSet rs = null;
			PreparedStatement pstmt = null;
			
			try {
				con = DBMangement.getConnection();
				pstmt = con.prepareStatement(query);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					maxRef = rs.getInt("maxRef");
					
					
				}else {
					maxRef = 1;
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBMangement.close(rs, pstmt,  con);			
			}
			System.out.print("max(communityNum) : " + maxRef);
			return maxRef;
		
		
			
			
			
			
		}
		//-------------------------------------- 게시 글 저장 메서드 ----------------------------------------------
		// insert into boardtable(title, nicname, content, password, ref) values('안녕', 'hkd', '내가 일빠~', '1234' , '');
		// ref : 현재글의 글 번호를 저장

		public boolean insertBoard(CommunityVO cvo) {
			String query = "insert into community(title,nicname,content,file,category) values (?,?,?,?,?);";
			boolean result = false;
			Connection con = null;
			PreparedStatement pstmt = null;
			
			
			try {
				con = DBMangement.getConnection();
				pstmt = con.prepareStatement(query);

				pstmt.setString(1, cvo.getTitle());
				pstmt.setString(2, cvo.getnicname());
				pstmt.setString(3, cvo.getContent());
				pstmt.setString(4, cvo.getFile());
				pstmt.setInt(5, cvo.getCartegory());
				
				if (pstmt.executeUpdate() == 1) {
					result = true;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBMangement.close(pstmt, con);			
			}
			
			return result;
		}
		// -------------------------------- 게시판 글을 조회하는 메서드(상세보기) ---------------------------------
		// 글번호로 찾아본다. 실패 : null
		public CommunityVO selectOneBoard(String communityNum) {
			String query = "select * from fishing.community where communityNum = ?";
			
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			CommunityVO cvo  = null;
			
			
			try {
				con = DBMangement.getConnection();
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, communityNum);
				
				rs = pstmt.executeQuery();
				while (rs.next()) {
					cvo = new CommunityVO(
							rs.getInt("communityNum"),
							rs.getString("title"),
							rs.getString("nicname"),
							rs.getDate("date"),
							rs.getInt("count"),
							rs.getString("content"),
							rs.getString("file"),
							rs.getInt("category")
					);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBMangement.close(rs, pstmt, con);
			}
			
			return cvo;
		}
		
		//------------------------------------ 조회수 증가 메서드 -------------------------------------------
		public void readCountUp(String communityNum) {
			String query = "UPDATE fishing.community SET count = count + 1 WHERE communityNum = ?";
			
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				con = DBMangement.getConnection();
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, communityNum);
				
				pstmt.executeUpdate();
				
			} catch(SQLException e) {
				e.printStackTrace();
			} finally {
				DBMangement.close(pstmt, con);
			}		
		}
		// -------------------------------------------- 글 수정 메서드 ---------------------------------------
				// update fishing.community set content = '짜파게티~', title='오늘의 요리는~' where num=3;
				// cvo ; 새롭게 수정할 글 객체
		public void updateBoard(CommunityVO cvo) {
			String query = "update fishing.community set title = ? , nicname= ?, content = ?,file = ? where communityNum = ?";
			
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				con = DBMangement.getConnection();
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, cvo.getTitle());
				pstmt.setString(2, cvo.getnicname());
				pstmt.setString(3, cvo.getContent());
				pstmt.setString(4, cvo.getFile());
				pstmt.setInt(5, cvo.getCommunityNum());
				
				pstmt.executeUpdate();
				
			} catch(SQLException e) {
				e.printStackTrace();
			} finally {
				DBMangement.close(pstmt, con);
			}
		}
		//-------------------------------------------글 삭제하는 메서드--------------------------------------------
		public void deleteBoard(String communityNum){
		      String query = "delete from fishing.community where communityNum = ?"; //수정
		      Connection con = null;
		      PreparedStatement pstmt = null;
		      try {
		         con = DBMangement.getConnection();
		         pstmt = con.prepareStatement(query);
		         pstmt.setString(1, communityNum);
		         
		         pstmt.executeUpdate();
		         }catch(SQLException e){
		         e.printStackTrace();
		         }finally{
		         DBMangement.close(pstmt, con);
		         }
		   }
		
		//----------------------------------------총게시글의 수를 세는 메서드---------------------------------------
		public int AllBoardcount(int category) {
			String query = "select count(communityNum)as allNum from fishing.community where category = ?";
			
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int allNum = 0;
			
			try {
				con = DBMangement.getConnection();
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, category);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					allNum = rs.getInt("allNum");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBMangement.close(rs, pstmt, con);
			}
			
			return allNum;
		}

		


		public boolean insertreply(CommunityVO cvo) {
			boolean result = false;
			
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = "insert into community(nicname,content,ref) values (?,?,?)";
			try{
				con = DBMangement.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, cvo.getnicname());
				pstmt.setString(2, cvo.getContent());
				pstmt.setInt(3, cvo.getRef());
				if(cvo.getContent().equals("")){
					result = false;
				}else{
					pstmt.executeUpdate();
					result = true;
				}
				
				
			}catch (SQLException e) {
				System.out.println("에러다" + e.getMessage());
			}finally{
				DBMangement.close(pstmt, con);
			}
			return result;
		}


		


		public List<CommunityVO> selectreply(int ref) {
		     Connection con = null;
	         PreparedStatement pstmt = null;
	         ResultSet rs = null;
	         System.out.println(ref);
	         List<CommunityVO> list = new ArrayList<CommunityVO>();
	         String sql = "SELECT nicname,content,date from community where ref = ?";  //여기에  getAttribute로 nickname 넣어줘야 함
	         
	         try{
	            con = DBMangement.getConnection();
	            pstmt = con.prepareStatement(sql);
	            pstmt.setInt(1, ref);
	            rs = pstmt.executeQuery();
	            
	            while (rs.next()) {
	               list.add(
	                     new CommunityVO(
	                        rs.getString("nicname"),
	                        rs.getString("content"),
	                        rs.getDate("date") 
	                    	));
	               }
	         }catch (SQLException e) {
	            System.out.println(e.getMessage());
	         }finally{
	            DBMangement.close(rs, pstmt, con);
	         }
	         
	         return list;
	      }
		
		public List<CommunityVO> sea5(int i) {
			Connection con = null;
	         PreparedStatement pstmt = null;
	         ResultSet rs = null;
	         List<CommunityVO> indexlist = new ArrayList<CommunityVO>();
	         String sql = "select * from  fishing.community where category =?  order by count desc limit 5 ";  //여기에  getAttribute로 nickname 넣어줘야 함
	         
	         try{
	            con = DBMangement.getConnection();
	            pstmt = con.prepareStatement(sql);
	            pstmt.setInt(1, i);
	            rs = pstmt.executeQuery();
	            
	            while (rs.next()) {
	            	indexlist.add(
	                     new CommunityVO(
	                        rs.getInt("communityNum"),
	                        rs.getString("title"),
	                        rs.getDate("date"),
	                        rs.getString("nicname"),
	                        rs.getInt("count")
	                    	));
	               }
	         }catch (SQLException e) {
	            System.out.println(e.getMessage());
	         }finally{
	            DBMangement.close(rs, pstmt, con);
	         }
	         return indexlist;
	      }

		public List<CommunityVO> search(int page, String search1 , String search2, String cate) {
		     Connection con = null;
	         PreparedStatement pstmt = null;
	         ResultSet rs = null;
	         String sql = "select * from community where category in(?) && "+search1+"  like ? && ref = 0 order by communityNum desc limit ?,?";
	         List<CommunityVO> indexlist = new ArrayList<CommunityVO>();
	         try{
	        		con = DBMangement.getConnection();
		            pstmt = con.prepareStatement(sql);
		            pstmt.setString(1, cate);
		            pstmt.setString(2, "%"+search2+"%");
		            pstmt.setInt(3, (page - 1) * 10);
					pstmt.setInt(4, 10);
		            System.out.println(pstmt);
		            rs = pstmt.executeQuery();
	            while (rs.next()) {
	            	indexlist.add(
	                     new CommunityVO(
	                        rs.getInt("communityNum"),
	                        rs.getString("title"),
	                        rs.getDate("date"),
	                        rs.getString("nicname"),
	                        rs.getInt("count")
	                    	));
	               }
	         }catch (SQLException e) {
	            System.out.println(e.getMessage());
	         }finally{
	            DBMangement.close(rs, pstmt, con);
	         }
	         System.out.println(indexlist);
	         return indexlist;
	      }
		
		public int searchBoardcount(String search1, String search2){
			String query = "select count(communityNum) from community where "+search1+" like '%?%' && ref = 0 order by communityNum desc ";
			
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int allNum = 0;
			
			try {
				con = DBMangement.getConnection();
				pstmt = con.prepareStatement(query);
	            pstmt.setString(1, "%"+search2+"%");

				rs = pstmt.executeQuery();
				while (rs.next()) {
					allNum = rs.getInt("allNum");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBMangement.close(rs, pstmt, con);
			}
			
			return allNum;
		}
		
		
		
		
		
		public List<CommunityVO> pictureTop5() {
			//select * from fishing.community
			String query = "select * from community where file is not null order by count desc limit 5";

			List<CommunityVO> list = new ArrayList<CommunityVO>();
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				con = DBMangement.getConnection();
				pstmt = con.prepareStatement(query);
				rs = pstmt.executeQuery();
			while (rs.next()) {
            	list.add(
                     new CommunityVO(
                        rs.getString("file"),
                        rs.getString("title"),
                        rs.getInt("communityNum")
                    		 )
            			);     
			}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBMangement.close(rs,  pstmt, con);
			}
			
			return list;
			}
		
}
		
		
		
		
		
		
		

