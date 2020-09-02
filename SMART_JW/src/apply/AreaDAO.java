package apply;


import java.util.ArrayList;
import java.util.HashMap;
import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import util.DataBaseUtil;

public class AreaDAO {
	Connection conn = DataBaseUtil.getConnection();
	
	public ArrayList<String> load() {
		String SQL = "select area from access_area";
		ArrayList<String> data = new ArrayList<String>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				data.add(rs.getString("area"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return data;
	}
}
