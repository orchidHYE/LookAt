package exhibition.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import exhibition.model.Exhibition;
import jdbc.JdbcUtil;

public class ExhibitionDAO {

	// 전시회 등록
	public int insert(Connection conn, Exhibition exhibition) throws SQLException {
		String sql = "INSERT INTO exhibition (TITLE, OPEN_DATE, END_DATE, PLACE, THUMBNAIL, DETAILS_IMG, INTRODUCTION) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement stmt = null;
		try {
			stmt = conn.prepareStatement(sql);

			stmt.setString(1, exhibition.getTitle());
			stmt.setDate(2, exhibition.getOpen_date());
			stmt.setDate(3, exhibition.getEnd_date());
			stmt.setString(4, exhibition.getPlace());
			stmt.setString(5, exhibition.getThumbnail());
			stmt.setString(6, exhibition.getDetails_img());
			stmt.setString(7, exhibition.getIntroduction());

			int insertedCnt = stmt.executeUpdate();

			return insertedCnt;
		} finally { // 5.자원반납
			JdbcUtil.close(stmt);
		}
	}
	
	
	// 전시회 목록
	public List<Exhibition> getList(Connection conn, int startRow, int size) throws SQLException {
		String sql = "SELECT * FROM exhibition " +
							  "order by exhibition_no desc limit ?,?";
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, startRow);
			stmt.setInt(2, size);
			rs = stmt.executeQuery();

			List<Exhibition> result = new ArrayList<Exhibition>();

			while (rs.next()) {
				result.add(convertExhibition(rs)); // p647 27라인
			} // while
			return result;
		} finally { // 5.자원반납
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}

	}

	// 전시회 상세조회
	public Exhibition getDetail (Connection conn, int no) throws SQLException {
		String sql ="SELECT * FROM exhibition " + 
							 "where exhibition_no = ?";
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1,no);
			rs = stmt.executeQuery();
			Exhibition detailData = null;
			if (rs.next()) {
				detailData = new Exhibition();
				detailData.setExhibition_no(rs.getInt("exhibition_no"));
				detailData.setTitle(rs.getString("title"));
				detailData.setOpen_date(rs.getDate("open_date"));
				detailData.setEnd_date(rs.getDate("end_date"));
				detailData.setPlace(rs.getString("place"));
				detailData.setThumbnail(rs.getString("thumbnail"));
				detailData.setDetails_img(rs.getString("details_img"));
				detailData.setIntroduction(rs.getString("introduction"));
				
				//콘솔출력
				System.out.println("ExhibitionDAO - getDetail() Exhibition detailData= " + detailData);
			}
			return detailData;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
		
	}		
		
	
	
	

	// 전시회 수정
	public int update(Connection conn, int no, String title) throws SQLException {
		String sql = "update exhibition " +
							  "set title = ? " + 
							  "where exhibition_no = ?";
		PreparedStatement stmt = null;
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1,title);
			stmt.setInt(2,no);
			return stmt.executeUpdate();
			//update가 성공되면 1리턴, 실패시 0리턴
		}finally {
			JdbcUtil.close(stmt);
		}
	}

	// 전시회 삭제
	public int delete(Connection conn, int no) throws SQLException {
		String sql = "delete from exhibition where exhibition_no=?";
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

	// 전시회 Model 객체 생성을 위한 메소드
	public Exhibition convertExhibition(ResultSet rs) throws SQLException {
		return new Exhibition(rs.getInt("exhibition_no"), rs.getString("title"), rs.getDate("open_date"),
				rs.getDate("end_date"), rs.getString("place"), rs.getString("thumbnail"), rs.getString("details_img"),
				rs.getString("introduction"));
	}
	
	
	//게시물 수 조회하는 메소드
	public int selectCount(Connection conn) throws SQLException {
		String sql = "SELECT COUNT(*) FROM exhibition";
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			int totalCNT = 0; //총 게시물수를 저장하기 위한 변수 선언 및 초기화
			
			if (rs.next()) {
				totalCNT = rs.getInt(1);
			}
			return totalCNT;
			
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
		
	} //selectCount();
	
}