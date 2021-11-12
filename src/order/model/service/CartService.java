package order.model.service;

import java.sql.Connection;
import java.util.List;
import static common.JDBCTemplate.*;

import order.model.dao.cartDao;
import order.model.vo.Cart;
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
		
		/*if(orderResult > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return orderResult;*/
		
		//오더디테일 삽입
		int orderDetailResult = 0;
		
		for(OrderDetail orderDetail : order.getOrderDetail()) {
			orderDetailResult += cartDao.insertOrderDetail(conn, orderDetail);
		}
		
		int result = 0;
		
		if(orderResult > 0 && orderDetailResult == order.getOrderDetail().size()) {
			commit(conn);
			result = 1;
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

}
