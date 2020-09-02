package apply;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;

import util.DataBaseUtil;

public class VehicleDAO {
	Connection conn = DataBaseUtil.getConnection();
	
	
	public int apply(String userName,String area, String carNo, String carType, String own, String ownName, String driverName, String Registration, String date) {
		String SQL = "insert into c_regi values(?,?,?,?,?,?,?,?,?,?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); 
			
			pstmt.setString(1, userName);
			pstmt.setString(2, area);
			pstmt.setString(3, carNo);
			pstmt.setString(4, carType);
			pstmt.setString(5, own);
			pstmt.setString(6, ownName);
			pstmt.setString(7, driverName);
			pstmt.setString(8, Registration);
			pstmt.setInt(9, 0);
			pstmt.setString(10, date);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return -1;
	}
	
	public HashMap<String, String> select_gname(String userID) {
		String SQL = "select gname,u_name from user where u_id = ?";
		HashMap<String, String> data = new HashMap<String,String>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, userID);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				data.put("gname",rs.getString("gname"));
				data.put("userName", rs.getString("u_name"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return data;
	}
}
