package notice.model.service;

import java.sql.Connection;
import static common.JDBCTemplate.*;
import notice.model.dao.OneDao;
import notice.model.vo.One;

public class OneService {
	
	private OneDao oneDao = new OneDao();

	
	// 1:1문의하기 작성
	public int insertOne(One one) {
		Connection conn = getConnection();
		
		int result = oneDao.insertOne(conn, one);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
}
