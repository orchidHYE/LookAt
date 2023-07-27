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
		String sql = "INSERT INTO location (loc, details_place) "
							+ "VALUES (?,?); "
							+ "INSERT INTO exhibition (TITLE, OPEN_DATE, END_DATE, PLACE, THUMBNAIL, DETAILS_IMG, INTRODUCTION) "
							+ "VALUES (?, ?, ?, ?, ?, ?, ?); "
							+ "INSERT INTO price (price_adult, price_student, price_baby) "
							+ "VALUES (?, ?, ?);";
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
		String sql = "select e.exhibition_no,e.title,e.open_date,e.end_date,e.PLACE,e.thumbnail,e.details_img,e.introduction, p.price_no, p.price_adult, p.price_student, p.price_baby, l.loc_no, l.loc, l.details_place " + 
							  "from exhibition e,price p,location l " + 
							  "where e.exhibition_no = p.exhibition_no " + 
							  "and e.PLACE = l.place " + 
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
				result.add(convertExhibition(rs)); 
			} // while
			return result;
		} finally { // 5.자원반납
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}

	}

	// 전시회 상세조회
	public Exhibition getDetail (Connection conn, int no) throws SQLException {
		String sql = "select e.exhibition_no,e.title,e.open_date,e.end_date,e.PLACE,e.thumbnail,e.details_img,e.introduction, p.price_no, p.price_adult, p.price_student, p.price_baby, l.loc_no, l.loc, l.details_place " + 
							  "from exhibition e,price p,location l " + 
							  "where e.exhibition_no = p.exhibition_no " + 
							  "and e.PLACE = l.place " + 
							  "and e.exhibition_no=?";
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1,no);
			rs = stmt.executeQuery();
			Exhibition detailData = null;
			if (rs.next()) {
				detailData = convertExhibition(rs);
			}
			return detailData;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
		
	}		
		
	
	
	

	// 전시회 수정
	//타이틀만 수정하는게 아니라 모든걸 수정할 수 있어야지 ㅡㅡ
	public int update(Connection conn, int no, String title) throws SQLException {
		
		System.out.println("update DAO진입");
		
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
		Exhibition exhibition = new Exhibition();
		exhibition.setExhibition_no(rs.getInt("exhibition_no"));
		exhibition.setTitle(rs.getString("title"));
		exhibition.setOpen_date(rs.getDate("open_date"));
		exhibition.setEnd_date(rs.getDate("end_date"));
		exhibition.setThumbnail(rs.getString("thumbnail"));
		exhibition.setDetails_img(rs.getString("details_img"));
		exhibition.setIntroduction(rs.getString("introduction"));
		exhibition.setPrice_no(rs.getInt("price_no"));
		exhibition.setPrice_adult(rs.getInt("price_adult"));
		exhibition.setPrice_student(rs.getInt("price_student"));
		exhibition.setPrice_baby(rs.getInt("price_baby"));
		exhibition.setLoc_no(rs.getInt("loc_no"));
		exhibition.setPlace(rs.getString("place"));
		exhibition.setLoc(rs.getString("loc"));
		exhibition.setDetails_place(rs.getString("details_place"));
		return exhibition;
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


	//지역만 눌렀을 때
	public List<Exhibition> filterExhibition(Connection conn, String[] locations, String yearMonth) throws NumberFormatException, SQLException {
		StringBuilder sql = new StringBuilder( "select e.exhibition_no,e.title,e.open_date,e.end_date, e.thumbnail,e.details_img,e.introduction, " + 
								"p.price_no, p.price_adult, p.price_student, p.price_baby, " + 
								"l.loc_no, l.loc, l.place, l.details_place " + 
								"from exhibition e,price p,location l " + 
								"where e.exhibition_no = p.exhibition_no " +  
								"and e.PLACE = l.place ");  
								if (locations != null && locations.length > 0) {
							        sql.append(" AND place IN (");
							        for (int i = 0; i < locations.length; i++) {
							            sql.append("?");
							            if (i < locations.length - 1) {
							                sql.append(", ");
							            }
							        }
							            sql.append(")");
							        }
								if (yearMonth != null) {
						            sql.append(" AND ((YEAR(open_date) = ? AND MONTH(open_date) = ?) "
						            		+ "OR (YEAR(end_date) = ? AND MONTH(end_date) = ?))");
						        }
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt = conn.prepareStatement(sql.toString());
			
			int index = 1;
            if (locations != null) {
                for (String location : locations) {
                    stmt.setString(index++, location);
                }
            }
            if (yearMonth != null) {
                String[] parts = yearMonth.split("-");
                stmt.setInt(index++, Integer.parseInt(parts[0]));  // year
                stmt.setInt(index++, Integer.parseInt(parts[1]));  // month
                stmt.setInt(index++, Integer.parseInt(parts[0]));  // year
                stmt.setInt(index++, Integer.parseInt(parts[1]));  // month
            }
            rs = stmt.executeQuery();

			List<Exhibition> result = new ArrayList<Exhibition>();

			while (rs.next()) {
				result.add(convertExhibition(rs)); 
			} // while
			return result;
		} finally { // 5.자원반납
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
		} 
		
}