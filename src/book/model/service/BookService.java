package book.model.service;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import book.model.dao.BookDao;
import book.model.vo.Book;
import book.model.vo.PageInfo;
import book.model.vo.Search;

import static common.JDBCTemplate.*;
public class BookService {
	
	private BookDao bookDao = new BookDao();
	
	// select bookList
	public Map<String, Object> selectList(int page, Search search) {
		Connection conn = getConnection();
		
		// 1. 게시글 총 개수 구하기
		int listCount = bookDao.getListCount(conn, search);
		
		// 2. PageInfo 객체 만들기
		PageInfo pi = new PageInfo(page, listCount, 7, 7);
		
		// 3. 페이징 처리된 게시글 목록 조회
		List<Book> bookList = bookDao.selectList(conn, pi, search);
		
		Map<String, Object> returnMap = new HashMap<>();
		returnMap.put("pi", pi);
		returnMap.put("bookList", bookList);
		
		close(conn);
		
		return returnMap;
	}
	
	// category List - search
	public List<String> categoryList(Search search) {
		Connection conn = getConnection();
		List<String> categoryList = bookDao.categoryList(conn, search);
		
		close(conn);
		
		return categoryList;
	}
	
	// select Book
	public Book selectBook(int bid) {
		Connection conn = getConnection();
		Book book = bookDao.selectBook(conn, bid);
		/* 댓글 조회 추가 */
		book.setReplyList(bookDao.selectReplyList(conn, bid));
		close(conn);
		
		return book;
	}
	
	// sort bookList
	public Map<String, Object> selectSortList(int page, Search search) {
		Connection conn = getConnection();
		List<Book> bookList = null;
		
		// 1. 게시글 총 개수 구하기
		int listCount = bookDao.getListCount(conn, search);
		
		// 2. PageInfo 객체 만들기
		PageInfo pi = new PageInfo(page, listCount, 7, 7);
		
		// 3. 페이징 처리&정렬된 게시글 목록 조회
		if(search.getSort().equals("popular")) {
			bookList = bookDao.selectPopularList(conn, pi, search);
		} else if(search.getSort().equals("new")) {
			bookList = bookDao.selectNewList(conn, pi, search);
		} else if(search.getSort().equals("highest")) {
			bookList = bookDao.selectHighestList(conn, pi, search);
		} else if(search.getSort().equals("lowest")) {
			bookList = bookDao.selectLowestList(conn, pi, search);
		}
		
		Map<String, Object> returnSortMap = new HashMap<>();
		returnSortMap.put("pi", pi);
		returnSortMap.put("bookList", bookList);
		
		close(conn);
		
		return returnSortMap;
	}
	
	// 검색 목록&카테고리 선택
	public Map<String, Object> selectCategoryBookList(int page, Search search) {
		Connection conn = getConnection();
		
		// 1. 게시글 총 개수 구하기
		int listCount = bookDao.getCategoryBookListCount(conn, search);
		
		// 2. PageInfo 객체 만들기
		PageInfo pi = new PageInfo(page, listCount, 7, 7);
		
		// 3. 검색 목록&카테고리 선택한 게시글 목록 조회
		List<Book> bookList = bookDao.selectCategoryBookList(conn, pi, search);
		
		Map<String, Object> returnMap = new HashMap<>();
		returnMap.put("pi", pi);
		returnMap.put("bookList", bookList);
		
		close(conn);
		
		return returnMap;
	}
	
}
