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
import static common.JDBCTemplate.*;
import book.model.vo.Book;
import notice.model.vo.SearchB;
import notice.model.vo.Upload;
import notice.model.vo.WBook;
import notice.model.vo.WCheck;

public class WCheckDao {
	
	private Properties wcQuery = new Properties();
	
	public WCheckDao() {
		String fileName = WCheckDao.class.getResource("/sql/wCheck/wCheck-query.xml").getPath();
		
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
				book.setBid(rset.getInt("book_id"));
				book.setBtitle(rset.getString("book_name"));
				book.setAuthor(rset.getString("author"));
				book.setPublicationDate(rset.getDate("publication_date"));
				book.setPublisher(rset.getString("publisher"));
				book.setStock(rset.getInt("stock"));
				book.setBimg(rset.getString("book_img"));
				
				bookList.add(book);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return bookList;
	}


	// WCHECK 테이블에 삽입
	public int insertWCheck(Connection conn, WCheck wcheck) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = wcQuery.getProperty("insertWCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, wcheck.getWtitle());
			pstmt.setString(2, wcheck.getWcontent());
			pstmt.setInt(3, wcheck.getUser_no());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	// W_BOOK 테이블에 삽입
	public int insertWBook(Connection conn, WBook wbook) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = wcQuery.getProperty("insertWBook");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, wbook.getBid());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	// WC_UPLOAD 테이블에 삽입
	public int insertUpload(Connection conn, Upload upload) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = wcQuery.getProperty("insertUpload");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, upload.getFile_path());
			pstmt.setString(2, upload.getOrigin_file());
			pstmt.setString(3, upload.getChange_file());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}	
		
		return result;
	}


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
