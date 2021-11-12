package mypage.model.dao;

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

import mypage.model.vo.MyDetail;
import mypage.model.vo.MyOrder;
import notice.model.vo.PageInfo;

public class MyOrderDao {
	
private static Properties orderQuery = new Properties();
	
	public MyOrderDao() {		
		String fileName = MyOrderDao.class.getResource("/sql/mypage/myOrder-query.xml").getPath();
				
		try {
			orderQuery.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 주문내역 가져오기
	public List<MyOrder> selectMyOrderList(Connection conn, PageInfo pi, int user_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = orderQuery.getProperty("selectMyOrderList");
		
		List<MyOrder> orderList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			// 페이지 설정
			int startRow = (pi.getPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, user_no);
			pstmt.setInt(2, startRow); // 페이지 시작 값
			pstmt.setInt(3, endRow);  // 페이지 끝 값
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				MyOrder order = new MyOrder();
				order.setOrder_no(rset.getInt("order_no"));
				order.setOrder_date(rset.getDate("order_date"));
				order.setRel_date(rset.getDate("rel_date"));
				order.setReceipte_date(rset.getDate("receipte_date"));
				order.setAddress(rset.getString("address"));
				order.setPhone(rset.getString("phone"));
				order.setPayment(rset.getString("payment"));
				order.setDelivery(rset.getString("delivery"));
				order.setDelivery_number(rset.getInt("delivery_number"));
				order.setUser_no(rset.getInt("user_no"));
				order.setOrderchange(rset.getInt("orderchange"));
				order.setDetailCount(rset.getInt("count(d.book_id)"));
				
				orderList.add(order);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return orderList;
	}

	// 내 주문내역 리스트 개수
	public int selectMyOrderCount(Connection conn, int user_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		String sql = orderQuery.getProperty("selectMyOrderCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, user_no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}	
		
		return listCount;
	}

	// 주문 상세페이지
	public MyOrder selectMyOrder(Connection conn, int order_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = orderQuery.getProperty("selectMyOrder");
		
		MyOrder myorder = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, order_no);
			
			rset = pstmt.executeQuery();
					
			while(rset.next()) {
				myorder = new MyOrder();
				myorder.setOrder_no(rset.getInt("order_no"));
				myorder.setOrder_date(rset.getDate("order_date"));
				myorder.setRel_date(rset.getDate("rel_date"));
				myorder.setReceipte_date(rset.getDate("receipte_date"));
				myorder.setAddress(rset.getString("address"));
				myorder.setPhone(rset.getString("phone"));
				myorder.setPayment(rset.getString("payment"));
				myorder.setDelivery(rset.getString("delivery"));
				myorder.setDelivery_number(rset.getInt("delivery_number"));
				myorder.setUser_no(rset.getInt("user_no"));
				myorder.setOrderchange(rset.getInt("orderchange"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return myorder;
	}

	// 디테일 가져오기
	public List<MyDetail> selcetMyDetail(Connection conn, int order_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = orderQuery.getProperty("selectMyDetail");
		
		List<MyDetail> mydetail = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, order_no);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				MyDetail detail = new MyDetail();
				detail.setBook_id(rset.getInt("book_id"));
				detail.setOrder_no(rset.getInt("order_no"));
				detail.setAmount(rset.getInt("amount"));
				detail.setOrder_id(rset.getInt("order_id"));
				detail.setBook_name(rset.getString("book_name"));
				detail.setCategory_name(rset.getString("category_name"));
				detail.setAuthor(rset.getString("author"));
				detail.setPublisher(rset.getString("publisher"));
				detail.setPrice(rset.getInt("price"));
				detail.setSale_price(rset.getInt("sale_price"));
				detail.setBook_img(rset.getString("book_img"));
				
				mydetail.add(detail);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return mydetail;
	}

	// 주문 취소
	public int deleteMyOrder(Connection conn, int order_no) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = orderQuery.getProperty("deleteMyOrder");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, order_no);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
}
