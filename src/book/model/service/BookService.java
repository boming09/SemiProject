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
	
	// BookList
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
	
	// List category
	public List<String> categoryList(Search search) {
		Connection conn = getConnection();
		List<String> categoryList = bookDao.categoryList(conn, search);
		
		close(conn);
		
		return categoryList;
	}
	
	// detailBook
	public Book selectBook(int bid) {
		Connection conn = getConnection();
		Book book = bookDao.selectBook(conn, bid);
		
		close(conn);
		
		return book;
	}
	
	
}
