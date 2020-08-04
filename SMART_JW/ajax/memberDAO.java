package ajax;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	private static MemberDAO instance;
	public MemberDAO() {}
	public static MemberDAO getInstance() {
		if(instance == null) {
			instance = new MemberDAO();
		}
		return instance;
	}
	
	private Connection getConnection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		}catch(SQLException e) {
			System.err.println(" * Error 이유 : Database 구문 오류, "+e.getMessage());
		}catch (Exception e) {
			System.err.println(" * Error 이유 : "+e.getMessage());
		}
		return conn;
	}

	public int confirm(String id) throws SQLException {
		Connection conn = null;
		PreparedStatement psmt = null;
		int result = 0;
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("SELECT * FROM member1 where id = ?");
			psmt.setString(1, id);
			ResultSet rs = psmt.executeQuery();
			if(rs.next() == true) result=1;
			else result = 0;
		}catch(SQLException e) {
			System.err.println(" * Error 이유 : Database 구문 오류, "+e.getMessage());			
		}catch(Exception e) {
			System.err.println(" * Error 이유 : "+e.getMessage());
		}finally {
			if(psmt != null) psmt.close();
			if(conn != null) conn.close();
			
		}
		return result;
		
	}
}