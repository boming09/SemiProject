package notice.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import notice.model.vo.One;
import notice.model.vo.PageInfo;

public class OneDao {
	
	private Properties oneQuery = new Properties();
	
	public OneDao() {
		String fileName = FaqDao.class.getResource("/sql/one/one-query.xml").getPath();
		
		try {
			oneQuery.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	
	// 1:1문의하기 작성
	public int insertOne(Connection conn, One one) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = oneQuery.getProperty("insertOne");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, one.getOtitle());
			pstmt.setString(2, one.getOcontent());
			pstmt.setInt(3, one.getOuser());
			pstmt.setString(4, one.getFile_path());
			pstmt.setString(5, one.getOrigin_file());
			pstmt.setString(6, one.getChange_file());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	// 1:1문의 리스트 총 개수 구하기
	public int getListCount(Connection conn, int ouser) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		String sql = oneQuery.getProperty("getListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, ouser);
			
			rset = pstmt.executeQuery();
			
			// 총 게시글이 몇개인지만 알아오는거라서 값이 1개뿐
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
								
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}

	
	// 페이징 처리된 게시글 목록 조회
	public List<One> selectList(Connection conn, int ouser, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		String sql = oneQuery.getProperty("selectList");
		
		List<One> oneList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			// 페이지 설정
			int startRow = (pi.getPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, ouser);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				One one = new One();
				one.setOne_no(rset.getInt("one_no"));
				one.setOtitle(rset.getString("title"));
				one.setOcontent(rset.getString("content"));
				one.setOdate(rset.getDate("create_date"));
				one.setStatus(rset.getString("status"));
				one.setOuser(rset.getInt("user_no"));
				one.setOreply(rset.getString("reply"));
				one.setFile_path(rset.getString("fileid"));
				one.setOrigin_file(rset.getString("origin_file"));
				one.setChange_file(rset.getString("change_file"));
				
				oneList.add(one);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return oneList;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
