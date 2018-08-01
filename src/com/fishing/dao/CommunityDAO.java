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
	public List<CommunityVO> selectAllBoard(int page) {
		//select * from fishing.community
		String query = "select * from fishing.community order by Communitynum desc limit ? , ?";
		List<CommunityVO> list = new ArrayList<CommunityVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			con = DBMangement.getConnection();
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, (page - 1) * 10 + 1);
			pstmt.setInt(2, 10);
			
			rs = pstmt.executeQuery();
			
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
			boolean result = false;
			String query = "insert into community(title,nicname,content) values (?,?,?);";
			
			Connection con = null;
			PreparedStatement pstmt = null;
			
			
			try {
				con = DBMangement.getConnection();
				pstmt = con.prepareStatement(query);

				pstmt.setString(1, cvo.getTitle());
				pstmt.setString(2, cvo.getnicname());
				pstmt.setString(3, cvo.getContent());
				
				
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
		public CommunityVO selectOneBoard(String communityNum ) {
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
							rs.getString("content")
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
			String query = "UPDATE fishing.community SET count = Count + 1 WHERE communityNum = ?";
			
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
			String query = "update fishing.community set title = ? , nicname= ?, content = ? where communityNum = ?";
			
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				con = DBMangement.getConnection();
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, cvo.getTitle());
				pstmt.setString(2, cvo.getnicname());
				pstmt.setString(3, cvo.getContent());
				pstmt.setInt(4, cvo.getCommunityNum());
				
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
		public int AllBoardcount() {
			String query = "select count(communityNum)as allNum from fishing.community";
			
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int allNum = 0;
			
			
			try {
				con = DBMangement.getConnection();
				pstmt = con.prepareStatement(query);
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

		public void topTenBoard(){
			String query = "select * from ";

		}

}
		
		
		
		
		
		
		

