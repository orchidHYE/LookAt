package auth.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import member.dao.MemberDao;
import member.model.Member;

public class ResetPwdService {
	private MemberDao memberDao = new MemberDao();
	public int resetPwd(String tel, String repwd) throws Exception {
		System.out.println("ResetPwdService-resetPwd");
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			Member member = memberDao.selectById(conn, tel);
			int updatePwd = memberDao.updatePwd(conn, member);
			if (member == null) {
				JdbcUtil.rollback(conn);
				throw new LoginFailException();
			}
		
			
			int updatepwd= memberDao.updatePwd(conn, member);
			
			
			conn.commit();
			return updatepwd;
	}catch(SQLException e) {
		JdbcUtil.rollback(conn);
		throw new RuntimeException(e);
	}finally {
		JdbcUtil.close(conn);
	}
	}
}

