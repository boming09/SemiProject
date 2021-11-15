package mypage.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import static common.JDBCTemplate.*;
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
		
		if(listCount == 0) {
			returnMap.put("pi", null);
			returnMap.put("orderList", null);
		} else {
			returnMap.put("pi", pi);
			returnMap.put("orderList", orderList);
		}
		
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

	// 주문취소하기
	public int deleteMyOrder(int order_no) {
		Connection conn = getConnection();
		
		int result = orderDao.deleteMyOrder(conn, order_no);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

	// 취소/변경/반품 리스트 가져가기
	public Map<String, Object> selectOrderChangeList(int page, int user_no) {
		Connection conn = getConnection();
		
		// 내 주문내역 개수 들고오기
		int listCount = orderDao.selectOrderChangeCount(conn, user_no); 
		
		// 2. PageInfo 객체 만들기
		PageInfo pi = new PageInfo(page, listCount, 10, 10);
		
		// oder 테이블 가져오기
		List<MyOrder> changeList = orderDao.selectOrderChangeList(conn, pi, user_no);
		
		// 정보 넣기
		Map<String, Object> returnMap = new HashMap<>();
		
		if(listCount == 0) {
			returnMap.put("pi", null);
			returnMap.put("changeList", null);
		} else {
			returnMap.put("pi", pi);
			returnMap.put("changeList", changeList);
		}
		
		close(conn);		
		
		return returnMap;
	}

	// 교환 신청
	public int changeMyOrder(int order_no) {
		Connection conn = getConnection();
		
		int result = orderDao.changeMyOrder(conn, order_no);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

	// 반품 신청
	public int returnMyOrder(int order_no) {
		Connection conn = getConnection();
		
		int result = orderDao.returnMyOrder(conn, order_no);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

	
	
	
	
	
	
	
	
	
	
	
	
}
