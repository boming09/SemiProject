package mypage.model.service;

import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;
import static common.JDBCTemplate.*;
import mypage.model.dao.MyOrderDao;
import mypage.model.vo.MyOrder;

public class MyOrderService {
	
	MyOrderDao orderDao = new MyOrderDao();

	public List<MyOrder> selectMyOrderList(int user_no) {
		Connection conn = getConnection();
		
		// oder 테이블 가져오기
		List<MyOrder> orderList = orderDao.selectMyOrderList(conn, user_no);
		
		close(conn);		
		
		return orderList;
	}

	
	
	
	
	
	
	
	
	
	
	
	
}
