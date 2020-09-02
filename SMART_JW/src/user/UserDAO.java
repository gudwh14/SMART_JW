package user;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DataBaseUtil;

public class UserDAO {
   Connection conn = DataBaseUtil.getConnection();
   
   public int register(String userName, String userID, String userPW, String phone, String gName, String certification) {
      String SQL = "INSERT INTO USER(u_name,u_id,pw,p_number,gname,certification) VALUES (?,?,?,?,?,?)";
      
      try {
         PreparedStatement pstmt = conn.prepareStatement(SQL);
         
         pstmt.setString(1, userName);
         pstmt.setString(2, userID);
         pstmt.setString(3, userPW);
         pstmt.setString(4, phone);
         pstmt.setString(5, gName);
         pstmt.setString(6, certification);
         
         return pstmt.executeUpdate();
      } catch(Exception e) {
         e.printStackTrace();
      }
      
      return -1;
   } 
   
   public String login(String userID, String userPW) {
	   String SQL = "select u_name from user WHERE u_id = ? and pw = ?";
      
      try {
         PreparedStatement pstmt = conn.prepareStatement(SQL);
         
         pstmt.setString(1,userID);
         pstmt.setString(2,userPW);
         
         
         ResultSet rs = pstmt.executeQuery();
         
         if(rs.next()) {
            return rs.getString("u_name");
         }
      } catch(Exception e) {
         e.printStackTrace();
      }
      return "-1";
   }
   
   
}