package util;

import java.sql.Connection; 
import java.sql.DriverManager;

public class DataBaseUtil {
	public static Connection getConnection() {
		try {
			String URL = "jdbc:mysql://3.35.4.181:3306/SMART_JW?useSSL=false&serverTimezone=UTC";
			String ID = "root";
			String PW = "jw2020";
			Class.forName("com.mysql.cj.jdbc.Driver");
			return DriverManager.getConnection(URL,ID,PW);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
