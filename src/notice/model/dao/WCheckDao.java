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
import notice.model.vo.PageInfo;
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
	public List<Book> searchBookList(Connection conn, SearchB search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = wcQuery.getProperty("searchBookList");
		
		List<Book> bookList = new ArrayList<>();
		
		// 검색 된 목록을 조회해야 하는 경우 다른 SQL문 수행
		// 검색조건, 검색 값이 null이 아닌경우
		if(search.getSearchType() != null && search.getSearch() != null) {
			if(search.getSearchType().equals("title")) {
				sql = wcQuery.getProperty("searchTitleList");				
			} else if(search.getSearchType().equals("writer")) {
				sql = wcQuery.getProperty("searchWriterList");
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


	// 게시글 총 개수 구하기
	public int getListCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		String sql = wcQuery.getProperty("getListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
				
		return listCount;
	}


	// 게시글 총 리스트
	public List<WCheck> selectList(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = wcQuery.getProperty("selectList");
		
		List<WCheck> wcheckList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			// 페이지 설정
			int startRow = (pi.getPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow); // 페이지 시작 값
			pstmt.setInt(2, endRow);  // 페이지 끝 값
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				WCheck wcheck = new WCheck();
				wcheck.setWck_no(rset.getInt("wck_no"));
				wcheck.setWtitle(rset.getString("title"));
				wcheck.setWcontent(rset.getString("content"));
				wcheck.setUser_no(rset.getInt("user_no"));
				wcheck.setUser_name(rset.getString("user_name"));
				wcheck.setCreate_date(rset.getDate("create_date"));
				wcheck.setStatus(rset.getString("status"));
				
				wcheckList.add(wcheck);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}	
		
		return wcheckList;
	}

	// 내가 쓴 게시글 총 개수
	public int getMyListCount(Connection conn, int user_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int myListCount = 0;
		String sql = wcQuery.getProperty("getMyListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, user_no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				myListCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
				
		return myListCount;
	}

	// 내가 쓴 게시글 리스트
	public List<WCheck> selectMyList(Connection conn, PageInfo pi, int user_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = wcQuery.getProperty("selectMyList");
		
		List<WCheck> wcheckMyList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			// 페이지 설정
			int startRow = (pi.getPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, user_no);
			pstmt.setInt(2, startRow); // 페이지 시작 값
			pstmt.setInt(3, endRow);  // 페이지 끝 값
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				WCheck wcheck = new WCheck();
				wcheck.setWck_no(rset.getInt("wck_no"));
				wcheck.setWtitle(rset.getString("title"));
				wcheck.setWcontent(rset.getString("content"));
				wcheck.setUser_no(rset.getInt("user_no"));
				wcheck.setUser_name(rset.getString("user_name"));
				wcheck.setCreate_date(rset.getDate("create_date"));
				wcheck.setStatus(rset.getString("status"));
				
				wcheckMyList.add(wcheck);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}	
		
		return wcheckMyList;
	}

	
	// 게시글 상세페이지 가져오기
	public WCheck selectWCheck(Connection conn, int wck_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = wcQuery.getProperty("selectWCheck");
		
		WCheck wcheck = null;
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, wck_no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				wcheck = new WCheck();
				wcheck.setWck_no(rset.getInt("wck_no"));
				wcheck.setWtitle(rset.getString("title"));
				wcheck.setWcontent(rset.getString("content"));
				wcheck.setUser_no(rset.getInt("user_no"));
				wcheck.setUser_name(rset.getString("user_name"));
				wcheck.setCreate_date(rset.getDate("create_date"));
				wcheck.setStatus(rset.getString("status"));				
			}	
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return wcheck;
	}

	// 게시글에 참조된 도서리스트
	public List<WBook> selectWBookList(Connection conn, int wck_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = wcQuery.getProperty("selectWBook");
		
		List<WBook> wbookList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, wck_no);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				WBook wbook = new WBook();
				wbook.setBid(rset.getInt("book_id"));
				wbook.setWck_no(rset.getInt("wck_no"));
				wbook.setB_name(rset.getString("book_name"));
				wbook.setB_author(rset.getString("author"));
				
				wbookList.add(wbook);
			}
					
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return wbookList;
	}

	// 게시글에 참조된 첨부파일리스트
	public List<Upload> selectUploadList(Connection conn, int wck_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = wcQuery.getProperty("selectUpload");
		
		List<Upload> uploadList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, wck_no);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Upload upload = new Upload();
				upload.setWup_no(rset.getInt("wcup_no"));
				upload.setWck_no(rset.getInt("wck_no"));
				upload.setFile_path(rset.getString("file_path"));
				upload.setOrigin_file(rset.getString("origin_file"));
				upload.setChange_file(rset.getString("change_file"));
				upload.setStatus(rset.getString("status"));
				
				uploadList.add(upload);
			}
					
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return uploadList;
	}


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
