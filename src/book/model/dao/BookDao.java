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
	            book.setBid(rset.getInt("book_id"));
	            book.setBtitle(rset.getString("book_name"));
	            book.setCid(rset.getInt("category_id"));
	            book.setCname(rset.getString("category_name"));
	            book.setAuthor(rset.getString("author"));
	            book.setEditor(rset.getString("editor"));
	            book.setPublicationDate(rset.getDate("publication_date"));
	            book.setPublisher(rset.getString("publisher"));
	            book.setSalePrice(rset.getInt("sale_price"));
	            book.setBimg(rset.getString("book_img"));
	            book.setStarScore(rset.getInt("star_score"));
	            
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

	public List<String> categoryList(Connection conn, Search search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = bookQuery.getProperty("categoryList");
		List<String> categoryList = new ArrayList<>();
		
		// 검색 시 수행할 쿼리문 변경
		if (search.getSearchCondition() != null && search.getSearchValue() != null) {
			if (search.getSearchCondition().equals("search")) {
				sql = bookQuery.getProperty("searchCategoryList");
			} else if (search.getSearchCondition().equals("title")) {
				sql = bookQuery.getProperty("titleCategoryList");
			} else if (search.getSearchCondition().equals("author")) {
				sql = bookQuery.getProperty("authorCategoryList");
			}
		}
		
		try {
	         pstmt = conn.prepareStatement(sql);
	         
	         /* 추가 : 변수로 처리 1, 2, 3 물음표 순서가 달라지니까 */
	         int index = 1;
	         // 검색 sql 실행 시
	         if(search.getSearchCondition() != null && search.getSearchValue() != null) {
	        	 if(sql.equals(bookQuery.getProperty("searchCategoryList"))) {
	        		 pstmt.setString(index++, search.getSearchValue());	// 후위 연산 됨
	        		 pstmt.setString(index, search.getSearchValue());
	        	 } else if(sql.equals(bookQuery.getProperty("titleCategoryList"))){
	        		 pstmt.setString(index, search.getSearchValue());
	        	 } else if(sql.equals(bookQuery.getProperty("authorCategoryList"))) {
	        		 pstmt.setString(index, search.getSearchValue());
	        	 }
	         }

	         rset = pstmt.executeQuery();
	         
	         while(rset.next()) {
	        	 categoryList.add(rset.getString("category_name"));
	         }
		  } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(rset);
	         close(pstmt);
	      }
		
		return categoryList;
	}

	public Book selectBook(Connection conn, int bid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = bookQuery.getProperty("selectBook");
		Book book = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bid);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				book = new Book(rset.getInt("book_id")
							  , rset.getString("book_name")
							  , rset.getInt("category_id")
							  , rset.getString("category_name")
							  , rset.getInt("user_no")
							  , rset.getString("author")
							  , rset.getString("editor")
							  , rset.getDate("publication_date")
							  , rset.getString("publisher")
							  , rset.getInt("price")
							  , rset.getInt("stock")
							  , rset.getDouble("sale_rate")
							  , rset.getInt("sale_price")
							  , rset.getString("book_intro")
							  , rset.getString("book_url")
							  , rset.getString("file_path")
							  , rset.getString("author_intro")
							  , rset.getString("book_img")
							  , rset.getInt("star_score")
							  , rset.getDouble("avg_score"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return book;
	}

}
