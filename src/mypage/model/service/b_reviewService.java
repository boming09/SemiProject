package mypage.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import mypage.model.dao.B_reviewDao;
import mypage.model.vo.B_review;

public class b_reviewService {

	private B_reviewDao b_reviewDao = new B_reviewDao();
	
	public List<B_review> selectList() {
		Connection conn = getConnection();
		
		List<B_review> b_reviewList = b_reviewDao.selectList(conn);
		
		close(conn);
		
		return b_reviewList;
	}

}
