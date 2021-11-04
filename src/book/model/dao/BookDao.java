package book.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Properties;

import book.model.vo.Book;
import book.model.vo.PageInfo;
import book.model.vo.Search;

public class BookDao {

	private Properties bookQuery = new Properties();

	public BookDao() {
		// properties : 키와 값을 String타입으로 제한한 Map컬렉션
		String fileName = BookDao.class.getResource("/sql/board/book-query.xml").getPath();
		// path 경로를 담음
		// System.out.println(BoardDao.class.getResource("/sql/board/board-query.xml").getPath());
		// /D:/Server/workspace/JSPProject/webapp/WEB-INF/classes/sql/board/board-query.xml
		try {
			bookQuery.loadFromXML(new FileInputStream(fileName));
			// xml파일을 properties 파일로 변환하여 읽음
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 총 도서 개수
	public int getListCount(Connection conn, Search search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		String sql = bookQuery.getProperty("getListCount");
		
		if (search.getSearchCondition() != null && search.getSearchValue() != null) {
			if (search.getSearchCondition().equals("search")) {
				sql = bookQuery.getProperty("getTitleListCount");
			} else if (search.getSearchCondition().equals("title")) {
				sql = bookQuery.getProperty("getContentListCount");
			} else if (search.getSearchCondition().equals("author")) {
				sql = bookQuery.getProperty("getWriterListCount");
			}
		}
		
		try {
			pstmt = conn.prepareStatement(sql);

			// 검색 SQL문을 실행하는 경우 검색 값 설정
			if (search.getSearchCondition() != null && search.getSearchValue() != null) {
				pstmt.setString(1, search.getSearchValue());
			}
			
			rset = pstmt.executeQuery();

			if (rset.next()) {
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

	public List<Book> selectList(Connection conn, PageInfo pi, Search search) {
		// TODO Auto-generated method stub
		return null;
	}

}
