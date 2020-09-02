package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DataBaseUtil;

public class confirm {
	private static confirm instance;
	public confirm() {}
	public static confirm getinstance() {
		if(instance == null) {
			instance = new confirm();
		}
		return instance;
	}
	
	Connection conn = DataBaseUtil.getConnection();

	public boolean compare(String user_id) //아이디 중복확인 
	{
		String SQL = "select *from user where u_id = (?)";
		boolean result = false;
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user_id);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next() == true) {result=false;}
			else result = true;
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public ArrayList<String> compare_en(String enterprise)// 기업명 검색 
	{
		String SQL = "select g_name from enterprise where g_name Like (?)";
		ArrayList<String> arr = new ArrayList<String>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			String enter = "%" + enterprise + "%";
			pstmt.setString(1, enter);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next())
			{
				System.out.println("1");
				arr.add(rs.getNString("g_name"));
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return arr;
	}
	
}
