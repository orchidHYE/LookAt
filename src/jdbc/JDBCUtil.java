package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

//p434 - Connection, Statement, ResultSet 사용후 자원 반환 및 rollback 기능 제공
public class JdbcUtil {

	//connection 반환
	public static void close (Connection conn) {
		try {
			if (conn != null) {conn.close();}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//preparedStatement 반환
	public static void close (PreparedStatement stmt) {
		try {
			if (stmt != null) {stmt.close();}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//Statement 반환
	public static void close (Statement stmt) {
		try {
			if (stmt != null) {stmt.close();}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//ResultSet 반환
	public static void close (ResultSet rs) {
		try {
			if (rs != null) {rs.close();}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//rollback기능
	public static void rollback (Connection conn) {
		try {
			if (conn != null) {conn.rollback();}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
