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
    public boolean joinMember(MemberVO mvo)
    
    {
       //INSERT INTO fishing.member (USERID, PASSWORD, nickname, NAME,EMAIL) VALUES('test1','1234','hkd','홍길동','hkd@naver.com');
       //INSERT INTO fishing.member (USERID, PASSWORD, BIRTHDAY,ADDRESS,NAME,EMAIL,PHONE, NICKNAME) VALUES('test1','1234',780124,'서울시','홍길동','hkd@naver.com','010-1234-5678','hkd');
       String query ="INSERT INTO fishing.member (USERID, PASSWORD,EMAIL,PHONE,NICKNAME) VALUES(?,?,?,?,?)";
       int result = 0;
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
         
         

         pstmt.executeUpdate();
         if(result!=0){
            return true;
         }
      } catch (Exception e) {
         System.out.println("joinMember 에러" + e);
      } finally {
         DBMangement.close(pstmt, con);
      }
      return false;
       
       
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

   public MemberVO getMember(String id) {
      Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        MemberVO mv = null;
        
      String query ="select * from fishing.member";
      
      
      try {
              con = DBMangement.getConnection();
              pstmt = con.prepareStatement(query);
              pstmt.setString(1, id);
   
              rs = pstmt.executeQuery();
              if(rs.next()){
                 mv = new MemberVO();
                 mv.setAddr(rs.getString("userid"));
                 mv.setPw(rs.getString("password"));
                 mv.setBirthday(rs.getString("birthday"));
                 mv.setAddr(rs.getString("address"));
                 mv.setEmail(rs.getString("email"));
                 mv.setPhone(rs.getString("phone"));
                 mv.setNickName(rs.getString("nickname"));
                 
              }
              
           } catch (SQLException e) {
              System.out.println("에러" + e.getMessage());
           } finally {
              DBMangement.close(rs, pstmt, con);
           }
      return mv;
      
      
      
          
   }

        
    
}