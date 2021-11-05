package book.model.dao;

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

import book.model.vo.Book;
import book.model.vo.PageInfo;
import book.model.vo.Search;

public class BookDao {

	private Properties bookQuery = new Properties();

	public BookDao() {
		// properties : 키와 값을 String타입으로 제한한 Map컬렉션
		String fileName = BookDao.class.getResource("/sql/book/book-query.xml").getPath();
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
		
		// 검색 시 수행할 쿼리문 변경
		if (search.getSearchCondition() != null && search.getSearchValue() != null) {
			if (search.getSearchCondition().equals("search")) {
				sql = bookQuery.getProperty("getSearchListCount");
			} else if (search.getSearchCondition().equals("title")) {
				sql = bookQuery.getProperty("getTitleListCount");
			} else if (search.getSearchCondition().equals("author")) {
				sql = bookQuery.getProperty("getAuthorListCount");
			}
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			// 검색 SQL문을 실행하는 경우 검색 값 설정
			int index = 1;
			if (search.getSearchCondition() != null && search.getSearchValue() != null) {
				
				pstmt.setString(1, search.getSearchValue());
				
				if(sql.equals(bookQuery.getProperty("getSearchListCount"))) {
					pstmt.setString(++index, search.getSearchValue());
				}
	         }
			
			rset = pstmt.executeQuery();

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

	public List<Book> selectList(Connection conn, PageInfo pi, Search search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = bookQuery.getProperty("selectList");
		List<Book> bookList = new ArrayList<>();
		
		// 검색 시 수행할 쿼리문 변경
		if (search.getSearchCondition() != null && search.getSearchValue() != null) {
			if (search.getSearchCondition().equals("search")) {
				sql = bookQuery.getProperty("selectSearchList");
			} else if (search.getSearchCondition().equals("title")) {
				sql = bookQuery.getProperty("selectTitleList");
			} else if (search.getSearchCondition().equals("author")) {
				sql = bookQuery.getProperty("selectAuthorList");
			}
		}
		
		try {
	         pstmt = conn.prepareStatement(sql);
	         
	         int startRow = (pi.getPage() - 1) * pi.getBookLimit() + 1;
	         int endRow = startRow + pi.getBookLimit() - 1;
	         
	         /* 추가 : 변수로 처리 1, 2, 3 물음표 순서가 달라지니까 */
	         int index = 1;
	         // 검색 sql 실행 시
	         if(search.getSearchCondition() != null && search.getSearchValue() != null) {
	        	 
	        	 pstmt.setString(index++, search.getSearchValue());	// 후위 연산 됨
	        	 
	        	 if(sql.equals(bookQuery.getProperty("selectSearchList"))) {
	        		 pstmt.setString(index++, search.getSearchValue());
	        	 }
	         }
	         
	         pstmt.setInt(index++, startRow);
	         pstmt.setInt(index, endRow);
	         

	         rset = pstmt.executeQuery();
	         
	         while(rset.next()) {
	            Book book = new Book();
	            
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(rset);
	         close(pstmt);
	      }
		
		return bookList;
	}

}
