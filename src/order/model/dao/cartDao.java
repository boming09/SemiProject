package order.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import static common.JDBCTemplate.close;
import order.model.vo.Cart;

public class cartDao {
	private Properties cartQuery = new Properties();
	
	public cartDao() {
		String fileName = cartDao.class.getResource("/sql/order/cart-query.xml").getPath();
		
		try {
			cartQuery.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public List<Cart> selectList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Cart> cartList = new ArrayList<>();
		String sql = cartQuery.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				cartList.add(new Cart(rset.getString("book_name")
									, rset.getInt("category_id")
									, rset.getString("author")
									, rset.getString("publisher")
									, rset.getInt("sale_price")
									, rset.getInt("price")
									, rset.getInt("stock")
									, rset.getString("book_img")
									, rset.getInt("cart_no")
									, rset.getInt("book_id")
									, rset.getInt("user_no")
									, rset.getInt("amount")));

			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return cartList;
	}

	public int insertCart(Connection conn, Cart cart) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = cartQuery.getProperty("insertCart");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cart.getBook_id());
			pstmt.setInt(2, cart.getAmount());
			pstmt.setInt(3, cart.getUser_no());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
				
		return result;
	}

	public int deleteCart(Connection conn, int cart_no) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = cartQuery.getProperty("deleteCart");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cart_no);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateCart(Connection conn, Cart cart) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = cartQuery.getProperty("updateCart");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cart.getAmount());
			pstmt.setInt(2, cart.getCart_no());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public List<Cart> selectOrderList(Connection conn, int[] cartNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Cart> cartList = new ArrayList<>();
		//String sql = cartQuery.getProperty("selectOrderList");
		
		String params = "";
		
		for(int i=0; i<cartNo.length; i++) {
			params += cartNo[i];
			
			if(i< cartNo.length-1)
					params += ",";
		}
		String sql =  "SELECT BOOK_NAME, CATEGORY_ID, AUTHOR, PUBLISHER, SALE_PRICE, PRICE, STOCK, BOOK_IMG, CART_NO, BOOK_ID, C.USER_NO, AMOUNT FROM CART C LEFT JOIN BOOK USING(BOOK_ID) WHERE CART_NO in ("+params+")";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				cartList.add(new Cart(rset.getString("book_name")
									, rset.getInt("category_id")
									, rset.getString("author")
									, rset.getString("publisher")
									, rset.getInt("sale_price")
									, rset.getInt("price")
									, rset.getInt("stock")
									, rset.getString("book_img")
									, rset.getInt("cart_no")
									, rset.getInt("book_id")
									, rset.getInt("user_no")
									, rset.getInt("amount")));

			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return cartList;
	}

}
