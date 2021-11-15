package book.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
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
				
				if(search.getCategory() != null) {
					sql = bookQuery.getProperty("getSearchCategoryListCount");
				}
			} else if (search.getSearchCondition().equals("title")) {
				sql = bookQuery.getProperty("getTitleListCount");
				
				if(search.getCategory() != null) {
					sql = bookQuery.getProperty("getTitleCategoryListCount");
				}
			} else if (search.getSearchCondition().equals("author")) {
				sql = bookQuery.getProperty("getAuthorListCount");
				
				if(search.getCategory() != null) {
					sql = bookQuery.getProperty("getAuthorCategoryListCount");
				}
			} else if (search.getSearchCondition().equals("category")) {
				sql = bookQuery.getProperty("getCategoryListCount");
				
				if(search.getCategory() != null) {
					sql = bookQuery.getProperty("getMainCategoryListCount");
				}
			}
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			// 검색 SQL문을 실행하는 경우 검색 값 설정
			int index = 1;
			if (search.getSearchCondition() != null && search.getSearchValue() != null) {
				if(search.getCategory() != null) {
	        		 pstmt.setString(index++, search.getCategory());
	        	 }
				
				pstmt.setString(index++, search.getSearchValue());
				
				if(search.getSearchCondition().equals("search") || search.getSearchCondition().equals("category")) {
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
				
				if(search.getCategory() != null) {
					sql = bookQuery.getProperty("selectPopularSearchCategoryBookList");
				}
			} else if (search.getSearchCondition().equals("title")) {
				sql = bookQuery.getProperty("selectPopularTitleList");
				
				if(search.getCategory() != null) {
					sql = bookQuery.getProperty("selectPopularTitleCategoryBookList");
				}
			} else if (search.getSearchCondition().equals("author")) {
				sql = bookQuery.getProperty("selectPopularAuthorList");
				
				if(search.getCategory() != null) {
					sql = bookQuery.getProperty("selectPopularAuthorCategoryBookList");
				}
			} else if (search.getSearchCondition().equals("category")) {
				sql = bookQuery.getProperty("selectPopularCategoryList");
				
				if(search.getCategory() != null) {
					sql = bookQuery.getProperty("selectPopularMainCategoryBookList");
				}
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
	        	 if(search.getCategory() != null) {
	        		 pstmt.setString(index++, search.getCategory());
	        	 }
	        	 
	        	 pstmt.setString(index++, search.getSearchValue());	// 후위 연산 됨
	        	 
	        	 if(search.getSearchCondition().equals("search") || search.getSearchCondition().equals("category")) {
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
				
				if(search.getCategory() != null) {
					sql = bookQuery.getProperty("selectNewSearchCategoryBookList");
				}
			} else if (search.getSearchCondition().equals("title")) {
				sql = bookQuery.getProperty("selectNewTitleList");
				
				if(search.getCategory() != null) {
					sql = bookQuery.getProperty("selectNewTitleCategoryBookList");
				}
			} else if (search.getSearchCondition().equals("author")) {
				sql = bookQuery.getProperty("selectNewAuthorList");
				
				if(search.getCategory() != null) {
					sql = bookQuery.getProperty("selectNewAuthorCategoryBookList");
				}
			} else if (search.getSearchCondition().equals("category")) {
				sql = bookQuery.getProperty("selectNewCategoryList");
				
				if(search.getCategory() != null) {
					sql = bookQuery.getProperty("selectNewMainCategoryBookList");
				}
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
	        	 if(search.getCategory() != null) {
	        		 pstmt.setString(index++, search.getCategory());
	        	 }
	        	 
	        	 pstmt.setString(index++, search.getSearchValue());	// 후위 연산 됨
	        	 
	        	 if(search.getSearchCondition().equals("search") || search.getSearchCondition().equals("category")) {
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
				
				if(search.getCategory() != null) {
					sql = bookQuery.getProperty("selectHighestSearchCategoryBookList");
				}
			} else if (search.getSearchCondition().equals("title")) {
				sql = bookQuery.getProperty("selectHighestTitleList");
				
				if(search.getCategory() != null) {
					sql = bookQuery.getProperty("selectHighestTitleCategoryBookList");
				}
			} else if (search.getSearchCondition().equals("author")) {
				sql = bookQuery.getProperty("selectHighestAuthorList");
				
				if(search.getCategory() != null) {
					sql = bookQuery.getProperty("selectHighestAuthorCategoryBookList");
				}
			} else if (search.getSearchCondition().equals("category")) {
				sql = bookQuery.getProperty("selectHighestCategoryList");
				
				if(search.getCategory() != null) {
					sql = bookQuery.getProperty("selectHighestMainCategoryBookList");
				}
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
	        	 if(search.getCategory() != null) {
	        		 pstmt.setString(index++, search.getCategory());
	        	 }
	        	 
	        	 pstmt.setString(index++, search.getSearchValue());	// 후위 연산 됨
	        	 
	        	 if(search.getSearchCondition().equals("search") || search.getSearchCondition().equals("category")) {
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
				
				if(search.getCategory() != null) {
					sql = bookQuery.getProperty("selectLowestSearchCategoryBookList");
				}
			} else if (search.getSearchCondition().equals("title")) {
				sql = bookQuery.getProperty("selectLowestTitleList");
				
				if(search.getCategory() != null) {
					sql = bookQuery.getProperty("selectLowestTitleCategoryBookList");
				}
			} else if (search.getSearchCondition().equals("author")) {
				sql = bookQuery.getProperty("selectLowestAuthorList");
				
				if(search.getCategory() != null) {
					sql = bookQuery.getProperty("selectLowestAuthorCategoryBookList");
				}
			} else if (search.getSearchCondition().equals("category")) {
				sql = bookQuery.getProperty("selectLowestCategoryList");
				
				if(search.getCategory() != null) {
					sql = bookQuery.getProperty("selectLowestMainCategoryBookList");
				}
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
	        	 if(search.getCategory() != null) {
	        		 pstmt.setString(index++, search.getCategory());
	        	 }
	        	 
	        	 pstmt.setString(index++, search.getSearchValue());	// 후위 연산 됨
	        	 
	        	 if(search.getSearchCondition().equals("search") || search.getSearchCondition().equals("category")) {
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

	/* 검색&카테고리 */
	
	// 검색 &카테고리 도서 목록
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
	
//----- Detail -----------------------------------------------------------------------------
	// 도서 상세 조회
	public Book selectBook(Connection conn, int bid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = bookQuery.getProperty("selectBook");
		Book book = new Book();
		
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
	            book.setSumScore(rset.getInt("sum_score"));
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
									  , rset.getString("user_id")
									  , rset.getDate("create_date")
									  , rset.getString("content")
									  , rset.getInt("rating")
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
	

	public List<Book> cSelect(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Book> cList = new ArrayList<>();
		String sql = bookQuery.getProperty("cSelect");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Book book = new Book();
				book.setCid(rset.getInt(1));
				book.setCname(rset.getString(2));
				
				cList.add(book);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return cList;
	}

	public List<Book> cSelect2(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Book> cList2 = new ArrayList<>();
		String sql = bookQuery.getProperty("cSelect2");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Book book = new Book();
				book.setCid(rset.getInt(1));
				book.setCname(rset.getString(2));
				
				cList2.add(book);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return cList2;
	}

	public List<Book> cSelect3(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Book> cList3 = new ArrayList<>();
		String sql = bookQuery.getProperty("cSelect3");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Book book = new Book();
				book.setCid(rset.getInt(1));
				book.setCname(rset.getString(2));
				
				cList3.add(book);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return cList3;
	}

	public int insertBook(Connection conn, Book book) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = bookQuery.getProperty("insertBook");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, book.getBtitle());
			pstmt.setInt(2, book.getCid());
			pstmt.setString(3, book.getAuthor());
			pstmt.setString(4, book.getEditor());
			pstmt.setDate(5, (Date) book.getPublicationDate());
			pstmt.setString(6, book.getPublisher());
			pstmt.setInt(7, book.getPrice());
			pstmt.setInt(8, book.getSalePrice());
			pstmt.setString(9, book.getBintro());
			pstmt.setString(10, book.getBurl());
			pstmt.setString(11, book.getBimg());
			pstmt.setString(12, book.getFilepath());
			pstmt.setString(13, book.getAintro());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
			

	// 댓글 갯수 조회
	public int getReviewCount(Connection conn, int bid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = bookQuery.getProperty("getReviewCount");
		int reviewCount = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bid);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				reviewCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return reviewCount;
	}

	// 도서 댓글 등록
	public int insertReply(Connection conn, Reply reply) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = bookQuery.getProperty("insertReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reply.getBid());
			pstmt.setInt(2, reply.getUserNo());
			pstmt.setString(3, reply.getRcontent());
			pstmt.setInt(4, reply.getStarScore());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 도서 댓글 삭제
	public int deleteReply(Connection conn, int rid) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = bookQuery.getProperty("deleteReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rid);
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		
		return result;
	}

	public Book ajaxSelect(Connection conn, int bNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Book book = new Book();
		String sql = bookQuery.getProperty("ajaxSelect");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				book.setBid(rset.getInt(1));
				book.setStock(rset.getInt(2));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return book;
	}

	public List<Book> bookSelect(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Book> bookList = new ArrayList<>();
		String sql = bookQuery.getProperty("bookSelect");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Book book = new Book();
				
				book.setBid(rset.getInt(1));
				book.setBtitle(rset.getString(2));
				book.setStock(rset.getInt(3));
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

	public int stockInsert(Connection conn, int stockId, int pstock) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = bookQuery.getProperty("stockInsert");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pstock);
			pstmt.setInt(2, stockId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	// 작가 대댓글 등록
	public int insertAddReply(Connection conn, Reply reply) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = bookQuery.getProperty("insertAddReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reply.getBid());
			pstmt.setInt(2, reply.getUserNo());
			pstmt.setString(3, reply.getRcontent());
			pstmt.setInt(4, reply.getRefRid());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 도서 별점/평점 입력
	public int insertScore(Connection conn, Reply reply, double avgScore, int starScore) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = bookQuery.getProperty("updateAvgScore");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reply.getStarScore());
			pstmt.setDouble(2, avgScore);
			pstmt.setInt(3, starScore);
			pstmt.setInt(4, reply.getBid());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public void deleteAddReply(Connection conn, int rid) {
		PreparedStatement pstmt = null;
		String sql = bookQuery.getProperty("deleteAddReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rid);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
	}


}
