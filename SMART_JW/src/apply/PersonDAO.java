package apply;

import java.util.HashMap;
import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import util.DataBaseUtil;

public class PersonDAO {
	Connection conn = DataBaseUtil.getConnection();
	
	public int apply(String area, String applyName, String birth, String gender, String pledge, String certification,
			String phone, String u_name, int status, String photo, String date) {
		String SQL = "INSERT INTO u_regi(area,name,birth,gender,pledge,certification,r_number,u_name,status,photo,date) values(?,?,?,?,?,?,?,?,?,?,?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setNString(1, area);
			pstmt.setString(2, applyName);
			pstmt.setString(3, birth);
			pstmt.setString(4, gender);
			pstmt.setString(5, pledge);
			pstmt.setString(6, certification);
			pstmt.setString(7, phone);
			pstmt.setString(8, u_name);
			pstmt.setInt(9, status);
			pstmt.setString(10, photo);
			pstmt.setString(11, date);
			
			
			
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return -1;
	}
	
	public HashMap<String, Object> getEnterprise(String userID) {
		HashMap<String, Object> data = new HashMap<>();
		
		String SQL = "select a.g_name, a.g_number, b.u_name, b.p_number from enterprise as a join user as b on b.u_id = ? and b.gname = a.g_name";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setNString(1, userID);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				data.put("g_name", rs.getString("g_name"));
				data.put("g_number", rs.getString("g_number"));
				data.put("u_name", rs.getString("u_name"));
				data.put("p_number", rs.getString("p_number"));
				
			}
			else {
				
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return data;
	}
}
