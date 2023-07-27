package member.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;


import jdbc.JdbcUtil;
import member.model.Member;

public class MemberDao {
 public Member selectById(Connection conn, String id) throws SQLException{
    System.out.println("MemberDao-select진입");
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    try {
       pstmt = conn.prepareStatement("select * from member where member_id =?");
       pstmt.setString(1, id);
       rs = pstmt.executeQuery();
       Member member = null;
       if(rs.next()) {
          member = new Member(
               rs.getString("member_id"), 
               rs.getString("member_pw"), 
               rs.getString("member_date"), 
               rs.getString("member_tel"), 
               rs.getString("member_email"), 
               rs.getString("member_name")); 
       }//if
       return member;
    }finally{
       JdbcUtil.close(rs);
       JdbcUtil.close(pstmt);
   }//try-catch
 } 
    
    //회원가입처리
    public int insert(Connection conn, Member mem) throws SQLException{
       System.out.println("insert진입");
   String sql = "insert into member(member_id,member_pw,member_date,member_tel,member_email,member_name) values(?,?,?,?,?,?)";
   PreparedStatement pstmt = null;
         
   
   try {
   
         conn.prepareStatement(sql);
          pstmt.setString(1,mem.getMember_id());
          pstmt.setString(2,mem.getMember_pw());
          pstmt.setString(3,mem.getMember_date());
          pstmt.setString(4,mem.getMember_tel());
          pstmt.setString(5,mem.getMember_email());
          pstmt.setString(6,mem.getMember_name());
          int cnt =pstmt.executeUpdate();
          System.out.println(cnt);
          return cnt;
   } finally {
       JdbcUtil.close(pstmt);
    }
    }

    //비번 새로 셋팅
    public int updatePwd(Connection conn, Member member) throws SQLException {
      System.out.println("updatePwd진입");
      String sql ="update member "
            + "set member_pw=? "
            + "where member_tel=?";
      PreparedStatement pstmt = null;
      try {
            conn.prepareStatement(sql);
       pstmt.setString(1,member.getMember_pw());
       pstmt.setString(2,member.getMember_tel());
       int cnt =pstmt.executeUpdate();
       System.out.println(cnt);
       //1이면 입력, 0이면 안 됨
       return cnt;
      }finally {
         JdbcUtil.close(pstmt);
      }
   }

 }
