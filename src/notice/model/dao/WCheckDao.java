package notice.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import book.model.vo.Book;
import notice.model.vo.SearchB;

public class WCheckDao {
	
	private Properties wcQuery = new Properties();
	
	public WCheckDao() {
		String fileName = WCheckDao.class.getResource("/sql/wCheck/wcheck-query.xml").getPath();
		
		try {
			wcQuery.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	// 작가인증시 도서 검색 후 리스트
	public List<Book> selectBookList(Connection conn, SearchB search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = wcQuery.getProperty("selectBookList");
		
		List<Book> bookList = new ArrayList<>();
		
		// 검색 된 목록을 조회해야 하는 경우 다른 SQL문 수행
		// 검색조건, 검색 값이 null이 아닌경우
		if(search.getSearchType() != null && search.getSearch() != null) {
			if(search.getSearchType().equals("title")) {
				sql = wcQuery.getProperty("selectTitleList");				
			} else if(search.getSearchType().equals("writer")) {
				sql = wcQuery.getProperty("selectWriterList");
			}
		}
		
		// 검색 조건 없을시 맨 위 selectBookList으로 된다
		try {
			pstmt = conn.prepareStatement(sql);
			
			// 검색 SQL 실행시
			if(search.getSearchType() != null && search.getSearch() != null) {
				pstmt.setString(1, search.getSearch());
			}
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Book book = new Book();
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
