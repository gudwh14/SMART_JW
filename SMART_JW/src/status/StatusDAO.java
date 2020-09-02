package status;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import util.DataBaseUtil;
public class StatusDAO {
	Connection conn = DataBaseUtil.getConnection();
	
	public int[] load_person(String userID) {
		String SQL = "select status from u_regi where u_name = ?";
		int data[] = {0,0,0,0,0};
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1,userID);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				switch(rs.getInt("status")) {
					case 0 :
						data[0]++;
						break;
					case 1 :
						data[1]++;
						break;
					case 2 :
						data[2]++;
						break;
					case 3 :
						data[3]++;
						break;
					case 4 :
						data[4]++;
						break;
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return data;
	}
	
	public int[] load_vehicle(String userID) {
		String SQL = "select c_status from c_regi where u_name = ?";
		int data[] = {0,0,0,0,0};
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1,userID);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				switch(rs.getInt("c_status")) {
					case 0 :
						data[0]++;
						break;
					case 1 :
						data[1]++;
						break;
					case 2 :
						data[2]++;
						break;
					case 3 :
						data[3]++;
						break;
					case 4 :
						data[4]++;
						break;
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return data;
	}
	
	public ArrayList<HashMap<String, Object>> detail_person(String userID, int status) {
		String SQL = "select * from u_regi where u_name = ? and status = ?";
		ArrayList<HashMap<String, Object>> data = new ArrayList<>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, userID);
			pstmt.setInt(2, status);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				HashMap<String, Object> data2 = new HashMap<>();
				String p_status = "";
				data2.put("id",rs.getString("r_info"));
				data2.put("area",rs.getString("area"));
				data2.put("name",rs.getString("name"));
				data2.put("date",rs.getString("date"));
				data2.put("gender",rs.getString("gender"));
				switch(rs.getInt("status")) {
					case 0 :
						p_status ="접수대기";
						break;
					case 1 :
						p_status ="심의대기";
						break;
					case 2 :
						p_status ="반려대기";
						break;
					case 3 :
						p_status ="발급대기";
						break;
					case 4 :
						p_status ="발급완료";
						break;
				}
				data2.put("status",p_status);
				
				data.add(data2);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return data;
	}
	
	public ArrayList<HashMap<String, Object>> detail_vehicle(String userID, int status) {
		String SQL = "select * from c_regi where u_name = ? and c_status = ?";
		String SQL2 = "select gname from user where u_name =?";
		ArrayList<HashMap<String, Object>> data = new ArrayList<>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			PreparedStatement pstmt2 = conn.prepareStatement(SQL2);
			
			pstmt.setString(1, userID);
			pstmt.setInt(2, status);
			
			pstmt2.setString(1, userID);
			
			
			ResultSet rs = pstmt.executeQuery();
			ResultSet rs2 = pstmt2.executeQuery();
			rs2.next();
			while(rs.next()) {
				HashMap<String, Object> data2 = new HashMap<>();
				String c_status ="";
				data2.put("gname",rs2.getString("gname"));
				data2.put("area",rs.getString("area"));
				data2.put("date",rs.getString("date"));
				data2.put("driverName",rs.getString("c_driver_name"));
				data2.put("c_number",rs.getString("c_number"));
				switch(rs.getInt("c_status")) {
					case 0 :
						c_status ="접수대기";
						break;
					case 1 :
						c_status ="심의대기";
						break;
					case 2 :
						c_status ="반려대기";
						break;
					case 3 :
						c_status ="발급대기";
						break;
					case 4 :
						c_status ="발급완료";
						break;
				}
				data2.put("status",c_status);
				
				data.add(data2);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return data;
	}
	
	
}
