package com.fishing.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.fishing.dto.MemberVO;

import util.DBMangement;

 
public class MemberDao {

 

    private static MemberDao instance;

    public static MemberDao getInstance(){
        if(instance == null)
            instance = new MemberDao();
        return instance;
    }

    private MemberDao(){
       
    }
   
//    모델 패키지에 있는 Member꺼 가져와서 쓰기
//    회원정보셋 데이터 추가하기
    public int joinMember(MemberVO mvo)
    
    {
       //INSERT INTO fishing.member (USERID, PASSWORD, nickname, NAME,EMAIL) VALUES('test1','1234','hkd','홍길동','hkd@naver.com');
       //INSERT INTO fishing.member (USERID, PASSWORD, BIRTHDAY,ADDRESS,NAME,EMAIL,PHONE, NICKNAME) VALUES('test1','1234',780124,'서울시','홍길동','hkd@naver.com','010-1234-5678','hkd');
       String query ="INSERT INTO fishing.member (USERID, PASSWORD,EMAIL,PHONE,NICKNAME) VALUES(?,?,?,?,?)";
       int insertCount = 0;
       Connection con = null;
      PreparedStatement pstmt = null;
       try {
         con = DBMangement.getConnection();
         pstmt = con.prepareStatement(query);
         
         pstmt.setString(1, mvo.getId());
         pstmt.setString(2, mvo.getPw());
         pstmt.setString(3, mvo.getEmail());
         pstmt.setString(4, mvo.getPhone());
         pstmt.setString(5, mvo.getNickName());
         
         

         insertCount=pstmt.executeUpdate();
         
      } catch (Exception e) {
         System.out.println("joinMember 에러" + e);
      } finally {
         DBMangement.close(pstmt, con);
      }
      return insertCount;
       
       
    }
    
    public String login(MemberVO mvo){
       
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        String loginId = null;
        String query ="select USERID from member where USERID = ? and PASSWORD = ?";
        try {
           con = DBMangement.getConnection();
           pstmt = con.prepareStatement(query);
           pstmt.setString(1, mvo.getId());
           pstmt.setString(2, mvo.getPw());
           rs = pstmt.executeQuery();
           if(rs.next()){
                 loginId = rs.getString("USERID");
           }
           
        } catch (SQLException e) {
           System.out.println("에러" + e.getMessage());
        } finally {
           DBMangement.close(rs, pstmt, con);
        }
       
        return loginId;
        
         
         
      }
      public static ArrayList<MemberVO> getMemberList(){
         ArrayList<MemberVO> memberList = new ArrayList<MemberVO>();
         Connection con = null;
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         MemberVO mvo = null;
         
         String query ="select * from fishing.member";
         
         try {
         con = DBMangement.getConnection();
           pstmt = con.prepareStatement(query);
           rs = pstmt.executeQuery();
           while(rs.next()){
              mvo = new MemberVO();
              mvo.setId(rs.getString("userid"));
              mvo.setPw(rs.getString("password"));
              mvo.setBirthday(rs.getString("birthday"));
              mvo.setAddr(rs.getString("address"));
              mvo.setEmail(rs.getString("email"));
              mvo.setPhone(rs.getString("phone"));
              mvo.setNickName(rs.getString("nickname"));
              memberList.add(mvo);
              
           }
           
           
           
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         System.out.println("에러" + e.getMessage());
      }finally {
              DBMangement.close(rs, pstmt, con);
           }
      return memberList;
         
         
      }

      public MemberVO selectDetailMember(String viewid) {
  		Connection con = null;
          PreparedStatement pstmt = null;
          ResultSet rs = null;
          MemberVO mvo = null;
         
          
  		String query ="select userid,password, email,phone,nickname from fishing.member where userid = ?";
  		
  		
  		try {
  	           con = DBMangement.getConnection();
  	           pstmt = con.prepareStatement(query);
  	           pstmt.setString(1,viewid);
  	
  	           rs = pstmt.executeQuery();
  	           if(rs.next()){
  	        	   mvo = new MemberVO();
  					  mvo.setId(rs.getString("userid"));
  					  mvo.setPw(rs.getString("password"));
  					  //mvo.setBirthday(rs.getString("birthday"));
  					 // mvo.setAddr(rs.getString("address"));
  					  mvo.setEmail(rs.getString("email"));
  					  mvo.setPhone(rs.getString("phone"));
  					  mvo.setNickName(rs.getString("nickname"));
  					 
  					  
  	           }
  	           
  	        } catch (SQLException e) {
  	           System.out.println("getDetaliMember에러" + e.getMessage());
  	        } finally {
  	           DBMangement.close(rs, pstmt, con);
  	        }
  		return mvo;
  
          
   }
    public int deleteMember(String id){
      	//delete from fishing.member where userid = 'aaaa';
      	String query ="delete from fishing.member where userid = ?";
  		int deleteCount = 0;
  		Connection con = null;
  		PreparedStatement pstmt = null;

  		

  		try {
  	           con = DBMangement.getConnection();
  	           pstmt = con.prepareStatement(query);
  	           pstmt.setString(1, id);
  	
  	           deleteCount = pstmt.executeUpdate();
  	           
  	           
  	        } catch (SQLException e) {
  	           System.out.println("에러" + e.getMessage());
  	        } finally {
  	           DBMangement.close(pstmt, con);
  	        }
  		
      	return deleteCount;
      }


        
    
}