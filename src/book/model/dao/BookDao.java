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
import book.model.vo.Reply;
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
			} else if (search.getSearchCondition().equals("category")) {
				sql = bookQuery.getProperty("getCategoryListCount");
			}
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			// 검색 SQL문을 실행하는 경우 검색 값 설정
			int index = 1;
			if (search.getSearchCondition() != null && search.getSearchValue() != null) {
				pstmt.setString(index++, search.getSearchValue());
				
				if(sql.equals(bookQuery.getProperty("getSearchListCount")) || sql.equals(bookQuery.getProperty("getCategoryListCount"))) {
					pstmt.setString(index, search.getSearchValue());
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
	
	// 검색 도서 리스트
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
			} else if (search.getSearchCondition().equals("category")) {
				sql = bookQuery.getProperty("selectCategoryList");
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
	        	 
	        	 if(sql.equals(bookQuery.getProperty("selectSearchList")) || sql.equals(bookQuery.getProperty("selectCategoryList"))) {
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
	            book.setAvgScore(rset.getDouble("avg_score"));
	            
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

	// 도서 카테고리 리스트
	public List<String> categoryList(Connection conn, Search search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = bookQuery.getProperty("getCategoryList");
		List<String> categoryList = new ArrayList<>();
		
		// 검색 시 수행할 쿼리문 변경
		if (search.getSearchCondition() != null && search.getSearchValue() != null) {
			if (search.getSearchCondition().equals("search")) {
				sql = bookQuery.getProperty("getSearchCategoryList");
			} else if (search.getSearchCondition().equals("title")) {
				sql = bookQuery.getProperty("getTitleCategoryList");
			} else if (search.getSearchCondition().equals("author")) {
				sql = bookQuery.getProperty("getAuthorCategoryList");
			} else if(search.getSearchCondition().equals("category")) {
				sql = bookQuery.getProperty("getMainCategoryList");
			}
		}
		
		try {
	         pstmt = conn.prepareStatement(sql);
	         
	         /* 추가 : 변수로 처리 1, 2, 3 물음표 순서가 달라지니까 */
	         int index = 1;
	         // 검색 sql 실행 시
	         if(search.getSearchCondition() != null && search.getSearchValue() != null) {
	        	 if(sql.equals(bookQuery.getProperty("getSearchCategoryList"))) {
	        		 pstmt.setString(index++, search.getSearchValue());	// 후위 연산 됨
	        		 pstmt.setString(index, search.getSearchValue());
	        	 } else if(sql.equals(bookQuery.getProperty("getTitleCategoryList"))){
	        		 pstmt.setString(index, search.getSearchValue());
	        	 } else if(sql.equals(bookQuery.getProperty("getAuthorCategoryList"))) {
	        		 pstmt.setString(index, search.getSearchValue());
	        	 } else if(sql.equals(bookQuery.getProperty("getMainCategoryList"))) {
	        		 pstmt.setString(index++, search.getSearchValue());
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
	
	// 인기순 정렬
	public List<Book> selectPopularList(Connection conn, PageInfo pi, Search search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = bookQuery.getProperty("selectPopularList");
		List<Book> bookList = new ArrayList<>();
		
		// 검색 시 수행할 쿼리문 변경
		if (search.getSearchCondition() != null && search.getSearchValue() != null) {
			if (search.getSearchCondition().equals("search")) {
				sql = bookQuery.getProperty("selectPopularSearchList");
			} else if (search.getSearchCondition().equals("title")) {
				sql = bookQuery.getProperty("selectPopularTitleList");
			} else if (search.getSearchCondition().equals("author")) {
				sql = bookQuery.getProperty("selectPopularAuthorList");
			} else if (search.getSearchCondition().equals("category")) {
				sql = bookQuery.getProperty("selectPopularCategoryList");
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
	        	 
	        	 if(sql.equals(bookQuery.getProperty("selectPopularSearchList")) || sql.equals(bookQuery.getProperty("selectPopularCategoryList"))) {
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
	            book.setAvgScore(rset.getDouble("avg_score"));
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
	
	// 신상순 정렬
	public List<Book> selectNewList(Connection conn, PageInfo pi, Search search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = bookQuery.getProperty("selectNewList");
		List<Book> bookList = new ArrayList<>();
		
		// 검색 시 수행할 쿼리문 변경
		if (search.getSearchCondition() != null && search.getSearchValue() != null) {
			if (search.getSearchCondition().equals("search")) {
				sql = bookQuery.getProperty("selectNewSearchList");
			} else if (search.getSearchCondition().equals("title")) {
				sql = bookQuery.getProperty("selectNewTitleList");
			} else if (search.getSearchCondition().equals("author")) {
				sql = bookQuery.getProperty("selectNewAuthorList");
			} else if (search.getSearchCondition().equals("category")) {
				sql = bookQuery.getProperty("selectNewCategoryList");
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
	        	 
	        	 if(sql.equals(bookQuery.getProperty("selectNewSearchList")) || sql.equals(bookQuery.getProperty("selectNewCategoryList"))) {
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
	            book.setAvgScore(rset.getDouble("avg_score"));
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

	// 최고가순 정렬
	public List<Book> selectHighestList(Connection conn, PageInfo pi, Search search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = bookQuery.getProperty("selectHighestList");
		List<Book> bookList = new ArrayList<>();
		
		// 검색 시 수행할 쿼리문 변경
		if (search.getSearchCondition() != null && search.getSearchValue() != null) {
			if (search.getSearchCondition().equals("search")) {
				sql = bookQuery.getProperty("selectHighestSearchList");
			} else if (search.getSearchCondition().equals("title")) {
				sql = bookQuery.getProperty("selectHighestTitleList");
			} else if (search.getSearchCondition().equals("author")) {
				sql = bookQuery.getProperty("selectHighestAuthorList");
			} else if (search.getSearchCondition().equals("category")) {
				sql = bookQuery.getProperty("selectHighestCategoryList");
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
	        	 
	        	 if(sql.equals(bookQuery.getProperty("selectHighestSearchList")) || sql.equals(bookQuery.getProperty("selectHighestCategoryList"))) {
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
	            book.setAvgScore(rset.getDouble("avg_score"));
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

	// 최저가순 정렬
	public List<Book> selectLowestList(Connection conn, PageInfo pi, Search search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = bookQuery.getProperty("selectLowestList");
		List<Book> bookList = new ArrayList<>();
		
		// 검색 시 수행할 쿼리문 변경
		if (search.getSearchCondition() != null && search.getSearchValue() != null) {
			if (search.getSearchCondition().equals("search")) {
				sql = bookQuery.getProperty("selectLowestSearchList");
			} else if (search.getSearchCondition().equals("title")) {
				sql = bookQuery.getProperty("selectLowestTitleList");
			} else if (search.getSearchCondition().equals("author")) {
				sql = bookQuery.getProperty("selectLowestAuthorList");
			} else if (search.getSearchCondition().equals("category")) {
				sql = bookQuery.getProperty("selectLowestCategoryList");
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
	        	 
	        	 if(sql.equals(bookQuery.getProperty("selectLowestSearchList")) || sql.equals(bookQuery.getProperty("selectLowestCategoryList"))) {
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
	            book.setAvgScore(rset.getDouble("avg_score"));
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
//------------------------------------------------------------------------------------------------	
	// 검색 목록 & 카테고리 선택한 총 갯수
	public int getCategoryBookListCount(Connection conn, Search search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		String sql = bookQuery.getProperty("getCategoryBookListCount");
		
		// 검색 시 수행할 쿼리문 변경
		if (search.getSearchCondition() != null && search.getSearchValue() != null) {
			if (search.getSearchCondition().equals("search")) {
				sql = bookQuery.getProperty("getSearchCategoryBookListCount");
			} else if (search.getSearchCondition().equals("title")) {
				sql = bookQuery.getProperty("getTitleCategoryBookListCount");
			} else if (search.getSearchCondition().equals("author")) {
				sql = bookQuery.getProperty("getAuthorCategoryBookListCount");
			}
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			// 검색 SQL문을 실행하는 경우 검색 값 설정
			int index = 1;
			pstmt.setString(index++, search.getCategory());
			
			if (search.getSearchCondition() != null && search.getSearchValue() != null && !search.getSearchCondition().equals("category")) {
				pstmt.setString(index++, search.getSearchValue());
				
				if(sql.equals(bookQuery.getProperty("getSearchCategoryBookListCount"))) {
					pstmt.setString(index, search.getSearchValue());
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
	
	// 검색 목록 & 카테고리 선택한 도서 목록 조회
	public List<Book> selectCategoryBookList(Connection conn, PageInfo pi, Search search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = bookQuery.getProperty("selectCategoryBookList");
		List<Book> bookList = new ArrayList<>();
		
		// 검색 시 수행할 쿼리문 변경
		if (search.getSearchCondition() != null && search.getSearchValue() != null) {
			if (search.getSearchCondition().equals("search")) {
				sql = bookQuery.getProperty("selectSearchCategoryBookList");
			} else if (search.getSearchCondition().equals("title")) {
				sql = bookQuery.getProperty("selectTitleCategoryBookList");
			} else if (search.getSearchCondition().equals("author")) {
				sql = bookQuery.getProperty("selectAuthorCategoryBookList");
			}
		}
		
		try {
	         pstmt = conn.prepareStatement(sql);
	         
	         int startRow = (pi.getPage() - 1) * pi.getBookLimit() + 1;
	         int endRow = startRow + pi.getBookLimit() - 1;
	         
	         /* 추가 : 변수로 처리 1, 2, 3 물음표 순서가 달라지니까 */
	         int index = 1;
	         // 검색 sql 실행 시
	         pstmt.setString(index++, search.getCategory());
	         
	         if(search.getSearchCondition() != null && search.getSearchValue() != null && !search.getSearchCondition().equals("category")) {
	        	 pstmt.setString(index++, search.getSearchValue());	// 후위 연산 됨
	        	 if(sql.equals(bookQuery.getProperty("selectSearchCategoryBookList"))) {
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
	            book.setAvgScore(rset.getDouble("avg_score"));
	            
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
//----------------------------------------------------------------------------------
	// 도서 상세 조회
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
	            book.setBid(rset.getInt("book_id"));
	            book.setBtitle(rset.getString("book_name"));
	            book.setCid(rset.getInt("category_id"));
	            book.setCname(rset.getString("category_name"));
	            book.setUserNo(rset.getInt("user_no"));
	            book.setAuthor(rset.getString("author"));
	            book.setEditor(rset.getString("editor"));
	            book.setPublicationDate(rset.getDate("publication_date"));
	            book.setPublisher(rset.getString("publisher"));
	            book.setPrice(rset.getInt("price"));
	            book.setSalePrice(rset.getInt("sale_price"));
	            book.setBintro(rset.getString("book_intro"));
	            book.setBurl(rset.getString("book_url"));
	            book.setFilepath(rset.getString("file_path"));
	            book.setAintro(rset.getString("author_intro"));
	            book.setBimg(rset.getString("book_img"));
	            book.setStarScore(rset.getInt("star_score"));
	            book.setAvgScore(rset.getDouble("avg_score"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return book;
	}
	
	// 도서 댓글 조회
	public List<Reply> selectReplyList(Connection conn, int bid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = bookQuery.getProperty("selectReplyList");
		List<Reply> replyList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bid);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				replyList.add(new Reply(rset.getInt("review_no")
									  , rset.getInt("book_id")
									  , rset.getInt("user_no")
									  , rset.getDate("create_date")
									  , rset.getString("content")
									  , rset.getDouble("rating")
									  , rset.getInt("ref_no")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return replyList;
	}

}
