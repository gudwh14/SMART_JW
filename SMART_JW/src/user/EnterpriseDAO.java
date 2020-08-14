package user;

import java.sql.Connection; 
import java.sql.PreparedStatement; 

import util.DataBaseUtil;

public class EnterpriseDAO {
	Connection conn = DataBaseUtil.getConnection();
	
	public int register(String regist_num, String enterprise_name, String leader_name,
			String enterprise_upload, String leader_upload, String roadAddress, String detailAddress) {
		String SQL = "INSERT INTO ENTERPRISE VALUES (?,?,?,?,?,?,?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, null);
			pstmt.setString(2, regist_num);
			pstmt.setString(3, enterprise_name);
			pstmt.setString(4, leader_name);
			pstmt.setString(5, enterprise_upload);
			pstmt.setString(6, leader_upload);
			pstmt.setString(7, roadAddress + detailAddress);
			
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return -1;
	}
}
