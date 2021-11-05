package notice.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import book.model.vo.Book;
import notice.model.dao.WCheckDao;
import notice.model.vo.SearchB;
import notice.model.vo.Upload;
import notice.model.vo.WBook;
import notice.model.vo.WCheck;

public class WCheckService {
	
	WCheckDao wcDao = new WCheckDao();

	// 작가인증시 도서 검색 후 리스트
	public List<Book> selectBookList(SearchB search) {
		Connection conn = getConnection();
		
		List<Book> bookList = wcDao.selectBookList(conn, search);
		
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
		
		// 3가지 로직이 모두 잘 수행 되었음을 나타내는 변수
		int result = 0;		
		
		if(wcheckResult > 0 && wbookResult == wcheck.getWbook().size() && wuploadResult == wcheck.getWupload().size()) {
			commit(conn);
			result = 1;
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
