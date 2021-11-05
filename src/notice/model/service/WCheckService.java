package notice.model.service;

import java.sql.Connection;
import java.util.List;
import static common.JDBCTemplate.*;
import book.model.vo.Book;
import notice.model.dao.WCheckDao;
import notice.model.vo.SearchB;

public class WCheckService {
	
	WCheckDao wcDao = new WCheckDao();

	// 작가인증시 도서 검색 후 리스트
	public List<Book> selectBookList(SearchB search) {
		Connection conn = getConnection();
		
		List<Book> bookList = wcDao.selectBookList(conn, search);
		
		close(conn);
		
		return bookList;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
