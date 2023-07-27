package want.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import exhibition.model.Exhibition;
import jdbc.JdbcUtil;

public class WantDAO {

	public int wantInsert (Connection conn, String member_id, int no) throws SQLException {
		String sql = "insert into want (member_id,exhibition_no) " + 
							  "values (? ,?)";
		PreparedStatement stmt = null;
		try {
			stmt = conn.prepareStatement(sql);

			stmt.setString(1, member_id);
			stmt.setInt(2, no);

			int insertedCnt = stmt.executeUpdate();

			return insertedCnt;
		} finally { // 5.자원반납
			JdbcUtil.close(stmt);
		}
	}
		
	
	public int wantDelete (Connection conn, int no) throws SQLException {
		String sql = "delete from want " + 
							 "where want_no = ?";
		PreparedStatement stmt = null;
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1,no);
			return stmt.executeUpdate();
			//delete가 성공되면 1리턴, 실패시 0리턴
		}finally {
			JdbcUtil.close(stmt);
		}
	}
	
	//찜 여부 체크
	//true면 찜한거 false면 안한거
	public boolean wantCheck (Connection conn, String member_id, int no) throws SQLException {
		String sql = "select * from want " +
							 "where member_id = ? and exhibition_no = ?";
		PreparedStatement stmt = null;
		ResultSet rs = null;
		boolean wantCheck = false;
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, member_id);
			stmt.setInt(2, no);
			rs = stmt.executeQuery();
			
			if (rs.next()) {
				wantCheck = true; 
			} 
			
			return wantCheck;
		} finally { // 5.자원반납
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}

	}
	
}


