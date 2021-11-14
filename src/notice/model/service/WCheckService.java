package notice.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import book.model.vo.Book;
import notice.model.dao.WCheckDao;
import notice.model.vo.PageInfo;
import notice.model.vo.SearchB;
import notice.model.vo.Upload;
import notice.model.vo.WBook;
import notice.model.vo.WCheck;

public class WCheckService {
	
	WCheckDao wcDao = new WCheckDao();

	// 작가인증시 도서 검색 후 리스트
	public List<Book> searchBookList(SearchB search) {
		Connection conn = getConnection();
		
		List<Book> bookList = wcDao.searchBookList(conn, search);
		
		close(conn);
		
		return bookList;
	}

	
	// 작가 인증게시판 글 등록
	public int insertWCheck(WCheck wcheck) {
		Connection conn = getConnection();
		
		// WCHECK 테이블에 삽입
		int wcheckResult = wcDao.insertWCheck(conn, wcheck);
		
		// W_BOOK 테이블에 삽입
		int wbookResult = 0;
		for(WBook wbook : wcheck.getWbook()) {
			wbookResult += wcDao.insertWBook(conn, wbook); 
		}
		
		// WC_UPLOAD 테이블에 삽입
		int wuploadResult = 0;
		for(Upload upload : wcheck.getWupload()) {
			wuploadResult += wcDao.insertUpload(conn, upload);
		}
		
		// BOOK 테이블에 삽입
		int bookResult = 0;
		for(WBook book : wcheck.getWbook()) {
			bookResult += wcDao.updateBook(conn, book);
		}
		
		// 3가지 로직이 모두 잘 수행 되었음을 나타내는 변수
		int result = 0;		
		
		if(wcheckResult > 0 && wbookResult == wcheck.getWbook().size()
			&& wuploadResult == wcheck.getWupload().size() && bookResult == wcheck.getWbook().size()) {
			commit(conn);
			result = 1;
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	
	// 작가 인증 게시글 리스트 가져오기
	public Map<String, Object> selectList(int page, int user_no) {
		Connection conn = getConnection();
		int listCount = 0;
		PageInfo pi = null;
		List<WCheck> wcheckList = null;
		
		if(user_no > 0) {
			// 1. 내가 쓴 게시글 총 개수 구하기
			listCount = wcDao.getMyListCount(conn, user_no);
			// 2. PageInfo 객체 만들기
			pi = new PageInfo(page, listCount, 5, 10);
			// 3. 내가 쓴 게시글 총 리스트 가져오기
			wcheckList = wcDao.selectMyList(conn, pi, user_no);
			
		} else {
			// 1. 게시글 총 개수 구하기
			listCount = wcDao.getListCount(conn);
			// 2. PageInfo 객체 만들기
			pi = new PageInfo(page, listCount, 5, 10);
			// 3. 총 리스트 가져오기
			wcheckList = wcDao.selectList(conn, pi);
		}
				
		Map<String, Object> returnMap = new HashMap<>();
		
		returnMap.put("pi", pi);
		returnMap.put("wcheckList", wcheckList);
		
		close(conn);
		
		return returnMap;
	}

	// 게시글 상세페이지
	public WCheck selectWCheck(int wck_no) {
		Connection conn = getConnection();
		
		// 작가 인증게시글 조회
		WCheck wcheck = wcDao.selectWCheck(conn, wck_no);
		
		// 작가 인증게시글 MY도서 조회
		List<WBook> wbookList = wcDao.selectWBookList(conn, wck_no);
		wcheck.setWbook(wbookList);
		
		// 작가 인증게시글 첨부파일 조회
		List<Upload> uploadList = wcDao.selectUploadList(conn, wck_no);
		wcheck.setWupload(uploadList);
		
		close(conn);
		
		return wcheck;
	}

	// 파일 다운로드시 업로드한 파일 찾아오기
	public Upload selectUpload(int wup_no) {
		Connection conn = getConnection();
		
		Upload upload = wcDao.selectUpload(conn, wup_no);
		
		close(conn);
		
		return upload;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
