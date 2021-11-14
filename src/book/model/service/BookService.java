package book.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import book.model.dao.BookDao;
import book.model.vo.Book;
import book.model.vo.PageInfo;
import book.model.vo.Reply;
import book.model.vo.Search;

import static common.JDBCTemplate.*;
public class BookService {
	
	private BookDao bookDao = new BookDao();
	
	// 도서 검색
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
	
	// 검색한 카테고리 리스트
	public List<String> categoryList(Search search) {
		Connection conn = getConnection();
		List<String> categoryList = bookDao.categoryList(conn, search);
		
		close(conn);
		
		return categoryList;
	}
	
	// 도서 상세
	public Book selectBook(int bid) {
		Connection conn = getConnection();
		Book book = bookDao.selectBook(conn, bid);
		/* 댓글 조회 추가 */
		book.setReplyList(bookDao.selectReplyList(conn, bid));
		/* 댓글 개수 */
		book.setReviewCount(bookDao.getReviewCount(conn, bid));
		close(conn);
		
		return book;
	}
	
	// 도서 정렬
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
	
	/* 검색&카테고리 */
	
	// 검색&카테고리 선택한 도서목록
	public Map<String, Object> selectCategoryBookList(int page, Search search) {
		Connection conn = getConnection();
		
		// 1. 게시글 총 개수 구하기
		int listCount = bookDao.getListCount(conn, search);
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
	
	/* 검색&카테고리&정렬 */
	
	// 검색&카테고리&정렬 선택한 도서 목록
	public Map<String, Object> selectCategorySortList(int page, Search search) {
		Connection conn = getConnection();
		
		// 1. 게시글 총 개수 구하기
		int listCount = bookDao.getListCount(conn, search);
		
		// 2. PageInfo 객체 만들기
		PageInfo pi = new PageInfo(page, listCount, 7, 7);
		
		// 3. 검색&카테고리&정렬한 도서 목록
		List<Book> bookList = new ArrayList<>();
		
		if(search.getSort().equals("popular")) {
			bookList = bookDao.selectPopularList(conn, pi, search);
		} else if(search.getSort().equals("new")) {
			bookList = bookDao.selectNewList(conn, pi, search);
		} else if(search.getSort().equals("highest")) {
			bookList = bookDao.selectHighestList(conn, pi, search);
		} else if(search.getSort().equals("lowest")) {
			bookList = bookDao.selectLowestList(conn, pi, search);
		}
		
		Map<String, Object> returnMap = new HashMap<>();
		returnMap.put("pi", pi);
		returnMap.put("bookList", bookList);
		
		close(conn);
		
		return returnMap;
	}
	
	// 도서 댓글 등록
	public int insertReply(Reply reply, double avgScore, int starScore) {
		Connection conn = getConnection();
		int result = bookDao.insertReply(conn, reply);
		int resultScore = bookDao.insertScore(conn, reply, avgScore, starScore);
		
		if(result > 0 && resultScore > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	// 도서 댓글 삭제
	public int deleteReply(int rid) {
		Connection conn = getConnection();
		int result = bookDao.deleteReply(conn, rid);
		
		if(result > 0) {
			bookDao.deleteAddReply(conn, rid);	/* 도서 대댓글 함께 삭제 */
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	// 작가 댓글 등록
	public int insertAddReply(Reply reply) {
		Connection conn = getConnection();
		int result = bookDao.insertAddReply(conn, reply);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
}
