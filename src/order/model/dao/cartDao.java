package order.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import book.model.vo.Book;
import order.model.vo.Cart;
import order.model.vo.Coupon;
import order.model.vo.Order;
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

	/*public int insertOrderDetail(Connection conn, List<OrderDetail> orderDt) {
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
	}*/

	public int insertFinalOrder(Connection conn, Order order) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = cartQuery.getProperty("insertFinalOrder");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, order.getAddress());
			pstmt.setString(2, order.getPhone());
			pstmt.setString(3, order.getPayment());
			pstmt.setInt(4, order.getUser_no());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertOrderDetail(Connection conn, OrderDetail orderDetail) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = cartQuery.getProperty("insertOrderDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, orderDetail.getBookId());
			pstmt.setInt(2, orderDetail.getAmount());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public List<Coupon> selectCoupon(Connection conn, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Coupon> couponList = new ArrayList<>();
		String sql = cartQuery.getProperty("selectCoupon");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				couponList.add(new Coupon(rset.getInt("coupon_no")
									, rset.getString("coupon_name")
									, rset.getString("coupon_content")
									, rset.getInt("discount")
									, rset.getDate("expdate")
									, rset.getInt("user_no")));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return couponList;
	}
	
	
	
	//메인 편의상 여기다

	public List<Book> selectWBookList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Book> wBookList = new ArrayList<>();
		String sql = cartQuery.getProperty("wBookList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
	            Book book = new Book();
	            book.setBid(rset.getInt("book_id"));
	            book.setBtitle(rset.getString("book_name"));
	            book.setCid(rset.getInt("category_id"));
	           // book.setCname(rset.getString("category_name"));
	            book.setAuthor(rset.getString("author"));
	            book.setEditor(rset.getString("editor"));
	            book.setPublicationDate(rset.getDate("publication_date"));
	            book.setPublisher(rset.getString("publisher"));
	            book.setSalePrice(rset.getInt("sale_price"));
	            book.setBimg(rset.getString("book_img"));
	            book.setStarScore(rset.getInt("star_score"));
	            book.setAvgScore(rset.getDouble("avg_score"));
	            wBookList.add(book);
	         }
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
	         close(rset);
	         close(pstmt);
	      }
		
		return wBookList;
	}

	public List<Book> selectNBookList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Book> nBookList = new ArrayList<>();
		String sql = cartQuery.getProperty("nBookList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
	            Book book = new Book();
	            book.setBid(rset.getInt("book_id"));
	            book.setBtitle(rset.getString("book_name"));
	            book.setCid(rset.getInt("category_id"));
	          //  book.setCname(rset.getString("category_name"));
	            book.setAuthor(rset.getString("author"));
	            book.setEditor(rset.getString("editor"));
	            book.setPublicationDate(rset.getDate("publication_date"));
	            book.setPublisher(rset.getString("publisher"));
	            book.setSalePrice(rset.getInt("sale_price"));
	            book.setBimg(rset.getString("book_img"));
	            book.setStarScore(rset.getInt("star_score"));
	            book.setAvgScore(rset.getDouble("avg_score"));
	            nBookList.add(book);
	         }
		
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
	         close(rset);
	         close(pstmt);
	      }
		
		
		return nBookList;
	}

	public List<Book> selectPBookList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Book> pBookList = new ArrayList<>();
		String sql = cartQuery.getProperty("pBookList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
	            Book book = new Book();
	            book.setBid(rset.getInt("book_id"));
	            book.setBtitle(rset.getString("book_name"));
	            book.setCid(rset.getInt("category_id"));
	           // book.setCname(rset.getString("category_name"));
	            book.setAuthor(rset.getString("author"));
	            book.setEditor(rset.getString("editor"));
	            book.setPublicationDate(rset.getDate("publication_date"));
	            book.setPublisher(rset.getString("publisher"));
	            book.setSalePrice(rset.getInt("sale_price"));
	            book.setBimg(rset.getString("book_img"));
	            book.setStarScore(rset.getInt("star_score"));
	            book.setAvgScore(rset.getDouble("avg_score"));
	            pBookList.add(book);
	         }
			
		} catch (SQLException e) {
			e.printStackTrace();
		}  finally {
	         close(rset);
	         close(pstmt);
	      }
		
		return pBookList;
	}

	public List<Book> selectBestList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Book> bestList = new ArrayList<>();
		String sql = cartQuery.getProperty("bestList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
	            Book book = new Book();
	            book.setBid(rset.getInt("book_id"));
	            book.setBtitle(rset.getString("book_name"));
	            //book.setCid(rset.getInt("category_id"));
	            // book.setCname(rset.getString("category_name"));
	            book.setAuthor(rset.getString("author"));
	            //book.setEditor(rset.getString("editor"));
	           // book.setPublicationDate(rset.getDate("publication_date"));
	            //book.setPublisher(rset.getString("publisher"));
	            //book.setSalePrice(rset.getInt("sale_price"));
	            book.setBimg(rset.getString("book_img"));
	           // book.setStarScore(rset.getInt("star_score"));
	            //book.setAvgScore(rset.getDouble("avg_score"));
	            book.setSaleRate(rset.getInt("sale_rate"));
	            
	            bestList.add(book);
	         }
			
		} catch (SQLException e) {
			e.printStackTrace();
		}  finally {
	         close(rset);
	         close(pstmt);
	      }
		
		return bestList;
	}

	
	
	public int updateBookSaleRate(Connection conn, OrderDetail orderDetail) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = cartQuery.getProperty("updateBookSaleRate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, orderDetail.getAmount());
			pstmt.setInt(2, orderDetail.getBookId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public Order selectUpOrder(Connection conn, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Order upOrder = null;
		String sql = cartQuery.getProperty("selectUpOrder");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				upOrder = new Order();
				upOrder.setOrder_no(rset.getInt("order_no"));
				upOrder.setOrder_date(rset.getDate("order_date"));
				upOrder.setRel_date(rset.getDate("rel_date"));
				upOrder.setReceipte_date(rset.getDate("receipte_date"));
				upOrder.setAddress(rset.getString("address"));
				upOrder.setPhone(rset.getString("phone"));
				upOrder.setPayment(rset.getString("payment"));
			
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
	         close(rset);
	         close(pstmt);
	      }
		
		
		return upOrder;
	}


	public int updateCouponStatus(Connection conn, Order order) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = cartQuery.getProperty("updateCouponStatus");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, order.getCouponNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int minusStock(Connection conn, OrderDetail orderDetail) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = cartQuery.getProperty("updateStock");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, orderDetail.getAmount());
			pstmt.setInt(2, orderDetail.getBookId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	
	

}
