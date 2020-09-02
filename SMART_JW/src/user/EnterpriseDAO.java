package user;

import java.sql.Connection; 
import java.sql.PreparedStatement; 

import util.DataBaseUtil;

public class EnterpriseDAO {
	Connection conn = DataBaseUtil.getConnection();
	
	public int register(String regist_num, String enterprise_name, String leader_name,
			String enterprise_upload, String leader_upload, String roadAddress, String detailAddress) {
		String SQL = "INSERT INTO ENTERPRISE(g_number,g_name,g_leader,b_registration,leader_certification,address) VALUES (?,?,?,?,?,?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, regist_num);
			pstmt.setString(2, enterprise_name);
			pstmt.setString(3, leader_name);
			pstmt.setString(4, enterprise_upload);
			pstmt.setString(5, leader_upload);
			pstmt.setString(6, roadAddress +" - "+ detailAddress);
			
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return -1;
	}
}
