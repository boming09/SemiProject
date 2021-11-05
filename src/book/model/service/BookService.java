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

	public Map<String, Object> selectList(int page, Search search) {
		Connection conn = getConnection();
		Map<String, Object> returnMap = new HashMap<>();
		
		// 1. 게시글 총 개수 구하기
		int listCount = bookDao.getListCount(conn, search);
		
		// 2. PageInfo 객체 만들기
		PageInfo pi = new PageInfo(page, listCount, 10, 10);
		
		// 3. 페이징 처리된 게시글 목록 조회
		List<Book> bookList = bookDao.selectList(conn, pi, search);
		System.out.println(bookList);
		returnMap.put("pi", pi);
		returnMap.put("bookList", bookList);
		
		close(conn);
		
		return returnMap;
	}
	
	
}
