package mypage.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import static common.JDBCTemplate.*;

import mypage.model.vo.MyDetail;
import mypage.model.vo.MyOrder;

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
	public List<MyOrder> selectMyOrderList(Connection conn, int user_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = orderQuery.getProperty("selectMyOrderList");
		
		List<MyOrder> orderList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, user_no);
			
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
				order.setDetailCount(rset.getInt("count(book_id)"));
				
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
	

	
	
	
	
	
	
	
	
	
	
	
	
	
}
