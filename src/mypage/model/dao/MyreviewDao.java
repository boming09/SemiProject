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

import mypage.model.vo.Myreview;
import mypage.model.vo.PageInfo;

public class MyreviewDao {

	private Properties myreviewQuery = new Properties();
	
	public MyreviewDao() {		
		String fileName = MyreviewDao.class.getResource("/sql/mypage/myreview-query.xml").getPath();
				
		try {
			myreviewQuery.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int getListCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		String sql = myreviewQuery.getProperty("getListCount");	
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(conn);
		}
		
		return listCount;
	}

	public List<Myreview> selectList(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = myreviewQuery.getProperty("selectList");
		List<Myreview> myreviewList = new ArrayList<>();
		
		
		
		
		
		
		return null;
	}

}
