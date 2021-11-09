package order.model.service;

import java.sql.Connection;
import java.util.List;
import static common.JDBCTemplate.*;

import order.model.dao.cartDao;
import order.model.vo.Cart;

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

}
