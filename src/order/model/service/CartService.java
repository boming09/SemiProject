package order.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import book.model.vo.Book;
import main.model.vo.Recommend;
import member.model.vo.Member;

import static common.JDBCTemplate.*;

import order.model.dao.cartDao;
import order.model.vo.Cart;
import order.model.vo.Coupon;
import order.model.vo.Order;
import order.model.vo.OrderDetail;

public class CartService {

	private cartDao cartDao = new cartDao();
	
	public List<Cart> selectList(String orderby) {
		Connection conn = getConnection();
		
		List<Cart> cartList = cartDao.selectList(conn,orderby);
		
		close(conn);

		return cartList;
	}

	public int insertCart(Cart cart) {
		Connection conn = getConnection();
		
		int result = cartDao.insertCart(conn, cart);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int deleteCart(int cart_no) {
		Connection conn = getConnection();
		
		int result = cartDao.deleteCart(conn, cart_no);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int updateCart(Cart cart) {
		Connection conn = getConnection();
		
		int result = cartDao.updateCart(conn, cart);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public List<Cart> selectOrderList(int[] cartNo) {
		Connection conn = getConnection();
		
		List<Cart> cartList = cartDao.selectOrderList(conn,cartNo);
		
		close(conn);

		return cartList;
	}

	public List<Cart> selectSortList(String orderby) {
		Connection conn = getConnection();
		
		List<Cart> cartSortList = cartDao.selectSortList(conn,orderby);
		
		close(conn);

		return cartSortList;
	}

	public int deleteCartList(int[] cartNo) {
		Connection conn = getConnection();
		
		int result = cartDao.deleteCartList(conn, cartNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int insertOrder(Cart cart) { //필요 x
		Connection conn = getConnection();
		
		int result = cartDao.insertOrder(conn, cart);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public Cart selectAbook(int book_id) {
		Connection conn = getConnection();
		
		
		Cart direct = cartDao.selectAbook(conn,book_id);
		close(conn);

		return direct;
	}

	/*public int insertOrderDetail(List<OrderDetail> orderDt) {
		Connection conn = getConnection();
		
		int result = cartDao.insertOrderDetail(conn, orderDt);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}*/

	public int insertFinalOrder(Order order) {
		Connection conn = getConnection();
		
		//오더 삽입
		int orderResult = cartDao.insertFinalOrder(conn, order);
		
		//오더디테일 삽입
		int orderDetailResult = 0;
		
		//북테이블에 판매수량 증가
		int addSaleRateResult = 0;
		
		//쿠폰 차감 결과
		int couponMinusResult = 0;
		
		for(OrderDetail orderDetail : order.getOrderDetail()) {
			orderDetailResult += cartDao.insertOrderDetail(conn, orderDetail);
		
			//amount add
			addSaleRateResult += cartDao.updateBookSaleRate(conn, orderDetail);
		}
		
		// 쿠폰 차감(있을시)
		if(order.getCouponNo() > 0) {
			
			couponMinusResult = cartDao.updateCouponStatus(conn, order);
			
		} else {
		// 없으면 그냥 0 반환	
			couponMinusResult = 1;
		}
		
		
		int result = 0;
		//&& addSaleRateResult == order.getOrderDetail().size()
		if(orderResult > 0 && orderDetailResult == order.getOrderDetail().size() && addSaleRateResult == order.getOrderDetail().size() && couponMinusResult > 0) {
			commit(conn);
			result = 1;
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public List<Coupon> selectCoupon(int userNo) {
		Connection conn = getConnection();
		
		List<Coupon> couponList = cartDao.selectCoupon(conn, userNo);

		close(conn);
		
		return couponList;
	}

	public Recommend selectBookList() {
		Connection conn = getConnection();
		//각각 세개씩 비아이디 받아와서 어디다 느면 되는데 
		//아니다 이미지랑 제목같은것도 있어야됨
	
		Recommend recommend= new Recommend();
		
		List<Book> WeekBookList = cartDao.selectWBookList(conn);
		List<Book> NewBookList = cartDao.selectNBookList(conn);
		List<Book> PopBookList = cartDao.selectPBookList(conn);
		List<Book> bestList = cartDao.selectBestList(conn);
		
		
		//rd에 리스트들 넣어라
		recommend.setWBookList(WeekBookList);
		recommend.setNBookList(NewBookList);
		recommend.setPBookList(PopBookList);
		recommend.setBestList(bestList);
		
		close(conn);

		//rd에 넣고 리턴해라
		return recommend;
	}

	public Order selectUpOrder(int userNo) {
		Connection conn = getConnection();
		
		Order upOrder = new Order();
		
		upOrder = cartDao.selectUpOrder(conn, userNo);
		
		close(conn);
		
		return upOrder;
	}

}
