package want.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import want.dao.WantDAO;
import want.exception.wantNotFoundException;

public class WantService {

	private WantDAO wantDAO = new WantDAO();

	// 찜기능 처리
	public int wantInsert(String member_id, int no) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);

			int savedContentRow = wantDAO.wantInsert(conn, member_id, no);
			if (savedContentRow == 0) {
				throw new RuntimeException("Fail to insert to want table");
			}
			conn.commit();

			return savedContentRow;
		} catch (SQLException e) {
			e.printStackTrace();

			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} catch (RuntimeException e) {
			e.printStackTrace();

			JdbcUtil.rollback(conn);
			throw e;
		} finally {
			JdbcUtil.close(conn);
		}
	}

	// 삭제
	public int wantDelete(String member_id, int no) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);

			// want테이블에 delete하는 메서드호출
			int deleteResult = wantDAO.wantDelete(conn, no);

			conn.commit();
			return deleteResult;
		} catch (SQLException e) {
			e.printStackTrace();
			JdbcUtil.rollback(conn);
			throw new RuntimeException();
		} finally {
			JdbcUtil.close(conn);
		}

	}

	// 찜여부 확인
	public boolean wantCheck(String member_id, int no) throws wantNotFoundException {
		Connection conn = null;

		try {
			conn = ConnectionProvider.getConnection();
			// 찜 여부 확인하는 쿼리문 DAO에서 가져옴
			boolean wantCheck = wantDAO.wantCheck(conn, member_id, no);
			
			return wantCheck;
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException();
		} finally {
			JdbcUtil.close(conn);

		}
	}

}
