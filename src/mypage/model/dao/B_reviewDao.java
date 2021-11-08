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
import mypage.model.vo.B_review;

public class B_reviewDao {

	private Properties b_reviewQuery = new Properties();
	
	public B_reviewDao() {
		String fileName = B_reviewDao.class.getResource("/sql/mypage/b_review-query.xml").getPath();
		
		try {
		b_reviewQuery.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public List<B_review> selectList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<B_review> b_reviewList = new ArrayList<>();
		String sql = b_reviewQuery.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				b_reviewList.add(new B_review(rset.getInt("review_no")
											, rset.getInt("book_id")
											, rset.getInt("user_no")
											, rset.getDate("date")
											, rset.getString("content")
											, rset.getInt("rating")
											, rset.getInt("ref_no")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return b_reviewList;
	}

}
