package mypage.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import mypage.model.dao.MyOrderDao;
import mypage.model.vo.MyDetail;
import mypage.model.vo.MyOrder;
import notice.model.vo.PageInfo;

public class MyOrderService {
	
	MyOrderDao orderDao = new MyOrderDao();

	public Map<String, Object> selectMyOrderList(int page, int user_no) {
		Connection conn = getConnection();
		
		// 내 주문내역 개수 들고오기
		int listCount = orderDao.selectMyOrderCount(conn, user_no); 
		
		// 2. PageInfo 객체 만들기
		PageInfo pi = new PageInfo(page, listCount, 10, 10);
		
		// oder 테이블 가져오기
		List<MyOrder> orderList = orderDao.selectMyOrderList(conn, pi, user_no);
		
		// 정보 넣기
		Map<String, Object> returnMap = new HashMap<>();
		
		returnMap.put("pi", pi);
		returnMap.put("orderList", orderList);
		
		close(conn);		
		
		return returnMap;
	}

	// 주문상세페이지
	public MyOrder selectMyOrder(int order_no) {
		Connection conn = getConnection();
		// order 테이블 가져오기
		MyOrder myorder = orderDao.selectMyOrder(conn, order_no);
		// order_detail 테이블 가져오기
		List<MyDetail> mydetail = orderDao.selcetMyDetail(conn, order_no);
		myorder.setMyDetail(mydetail);
		
		close(conn);		
		
		return myorder;
	}

	
	
	
	
	
	
	
	
	
	
	
	
}
