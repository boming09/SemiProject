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

	private static Properties myreviewQuery = new Properties();
	
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
			close(pstmt);
		}
		
		return listCount;
	}

	public List<Myreview> selectList(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = myreviewQuery.getProperty("selectList");
		List<Myreview> myreviewList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getPage() - 1) * pi.getMypagemyreviewLimit() + 1;
			int endRow = startRow + pi.getMypagemyreviewLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Myreview myreview = new Myreview();
				myreview.setMid(rset.getInt("mid"));
				myreview.setCategory_name(rset.getString("category_name"));								
				myreview.setMtitle(rset.getString("mtitle"));				
				myreview.setUserName(rset.getString("user_name"));
				myreview.setMcount(rset.getInt("mcount"));
				myreview.setCreate_Date(rset.getDate("create_date"));
				myreviewList.add(myreview);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return myreviewList;
	}

	public int increaseCount(Connection conn, int mid) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = myreviewQuery.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, mid);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public static Myreview selectMyreview(Connection conn, int mid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Myreview myreview = null;
		String sql = myreviewQuery.getProperty("selectMyreview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mid);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				myreview = new Myreview();
				myreview.setMid(rset.getInt("mid"));
				myreview.setCategory_id(rset.getInt("category_id"));
				myreview.setCategory_name(rset.getString("category_name"));
				myreview.setMtitle(rset.getString("Mtitle"));
				myreview.setMcontent(rset.getString("Mcontent"));
				myreview.setMwriter(rset.getInt("mwriter"));
				myreview.setUserName(rset.getString("user_name"));
				myreview.setMcount(rset.getInt("mcount"));
				myreview.setCreate_Date(rset.getTimestamp("create_date"));
				myreview.setModify_Date(rset.getTimestamp("modify_date"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return myreview;
	}

	public int insertMyreview(Connection conn, Myreview myreview) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = myreviewQuery.getProperty("insertMyreview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, myreview.getMtype());
			pstmt.setInt(2, myreview.getCategory_id());
			pstmt.setString(3, myreview.getMtitle());
			pstmt.setString(4, myreview.getMcontent());
			pstmt.setInt(5, myreview.getMwriter());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}	
		
		return result;
	}

}
