package util;

import java.sql.Connection; 
import java.sql.DriverManager;

public class DataBaseUtil {
	public static Connection getConnection() {
		try {
			String URL = "jdbc:mysql://127.0.0.1:3306/SMART_JW?useSSL=false&serverTimezone=UTC&useUnicode=true&characterEncoding=UTF-8";
			String ID = "root";
			String PW = "root";
			Class.forName("com.mysql.cj.jdbc.Driver");
			return DriverManager.getConnection(URL,ID,PW);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
