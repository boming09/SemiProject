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
import order.model.vo.OrderDetail;

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

	public List<Cart> selectList(Connection conn, String orderby) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Cart> cartList = new ArrayList<>();
		String sql = cartQuery.getProperty("selectList");
		
		try {
			
			
			
			if(orderby != null){
				
				if(orderby.equals("low")) {
					sql = cartQuery.getProperty("selectSortListLow");
				} else if(orderby.equals("high")) {
					sql = cartQuery.getProperty("selectSortListHigh");
				} else if(orderby.equals("name")) {
					sql = cartQuery.getProperty("selectSortListName");
				} else if(orderby.equals("rel")) {
					sql = cartQuery.getProperty("selectSortListRel");
				}
				
			}
			
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

	public List<Cart> selectSortList(Connection conn, String orderby) { //여기 필요 없음
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Cart> cartSortList = new ArrayList<>();
		String sql = null;
		
		if(orderby != null){
			
			if(orderby.equals("low")) {
				sql = cartQuery.getProperty("selectSortListLow");
			} else if(orderby.equals("high")) {
				sql = cartQuery.getProperty("selectSortListHigh");
			} else if(orderby.equals("name")) {
				sql = cartQuery.getProperty("selectSortListName");
			} else if(orderby.equals("rel")) {
				sql = cartQuery.getProperty("selectSortListRel");
			}
			
		}
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			

			while(rset.next()) {
				cartSortList.add(new Cart(rset.getString("book_name")
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
		}  finally {
			close(rset);
			close(pstmt);
		}
		
		
		return cartSortList;
	}

	public int deleteCartList(Connection conn, int[] cartNo) {
		PreparedStatement pstmt = null;
		int result = 0;
	//	String sql = cartQuery.getProperty("deleteCartList");
		
		String params = "";
		
		for(int i=0; i<cartNo.length; i++) {
			params += cartNo[i];
			
			if(i< cartNo.length-1)
					params += ",";
		}
		String sql =  "DELETE FROM CART WHERE CART_NO IN ("+params+")";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}  finally {
			close(pstmt);
		}
		
		
		return result;
		
	}

	public int insertOrder(Connection conn, Cart cart) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = cartQuery.getProperty("insertOrder");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cart.getBook_id());
			pstmt.setInt(2, cart.getAmount());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public Cart selectAbook(Connection conn, int book_id) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Cart direct = null;
		String sql = cartQuery.getProperty("selectAbook");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, book_id);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				direct = new Cart();
				direct.setBook_name(rset.getString("book_name"));
				direct.setCategory_id(rset.getInt("category_id"));
				direct.setAuthor(rset.getString("author"));
				//direct.setPublisher(rset.getString("publisher"));
				direct.setSale_price(rset.getInt("sale_price"));
				direct.setPrice(rset.getInt("price"));
				//direct.setStock(rset.getInt("stock"));
				//direct.setBook_img(rset.getString("book_img"));
				//direct.setCart_no(rset.getInt("cart_no"));
				direct.setBook_id(rset.getInt("book_id"));
				//direct.setUser_no(rset.getInt("user_no"));
				//direct.setAmount(rset.getInt("amount"));					
			
				
			}	
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return direct;
	}

	public int insertOrderDetail(Connection conn, List<OrderDetail> orderDt) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = cartQuery.getProperty("insertOrderDetail");
		
		//list에 담아오지 말고 객체에 담ㅇ아서 처음꺼는 nextval 다음거부턴 currval하면 될까?
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, ((OrderDetail) orderDt).getBookId());
			pstmt.setInt(2, ((OrderDetail) orderDt).getAmount());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

}
