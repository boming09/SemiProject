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

import book.model.vo.Search;
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
	
	public int getListCount(Connection conn, Search search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		String sql = myreviewQuery.getProperty("getListCount");	
		
		if(search.getSearchCondition() != null && search.getSearchValue() != null) {
			if(search.getSearchCondition().equals("title")) {
				sql = myreviewQuery.getProperty("getTitleListCount");
			} else if(search.getSearchCondition().equals("content")) {
				sql = myreviewQuery.getProperty("getContentListCount");
			} else if(search.getSearchCondition().equals("writer")) {
				sql = myreviewQuery.getProperty("getWriterListCount");
			}
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			if(search.getSearchCondition() != null && search.getSearchValue() != null) {
				pstmt.setString(1, search.getSearchValue());
			}
			
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

	public List<Myreview> selectList(Connection conn, PageInfo pi, Search search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = myreviewQuery.getProperty("selectList");
		List<Myreview> myreviewList = new ArrayList<>();
		
		
		if(search.getSearchCondition() != null && search.getSearchValue() != null) {
			if(search.getSearchCondition().equals("title")) {
				sql = myreviewQuery.getProperty("selectTitleList");
			} else if(search.getSearchCondition().equals("content")) {
				sql = myreviewQuery.getProperty("selectContentList");
			} else if(search.getSearchCondition().equals("writer")) {
				sql = myreviewQuery.getProperty("selectWriterList");
			}		
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getPage() - 1) * pi.getMypagemyreviewLimit() + 1;
			int endRow = startRow + pi.getMypagemyreviewLimit() - 1;
			
			int index = 1;
			if(search.getSearchCondition() != null && search.getSearchValue() != null) {
				pstmt.setString(index++, search.getSearchValue());
			}
			
			pstmt.setInt(index++, startRow);
			pstmt.setInt(index, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Myreview myreview = new Myreview();
				myreview.setMid(rset.getInt("mid"));
				myreview.setCategory_name(rset.getString("category_name"));								
				myreview.setMtitle(rset.getString("mtitle"));				
				myreview.setUser_nickname(rset.getString("user_nickname"));
				myreview.setMcount(rset.getInt("mcount"));
				myreview.setCreate_Date(rset.getDate("create_date"));
				// myreview.setUserNickname(rset.getString("user_nickname"));
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
				myreview.setUser_nickname(rset.getString("user_nickname"));
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

	public int deleteMyreview(Connection conn, int mid) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = myreviewQuery.getProperty("deleteMyreview");
		
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

	public int updateMyreview(Connection conn, Myreview myreview) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = myreviewQuery.getProperty("updateMyreview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, myreview.getCategory_id());
			pstmt.setString(2, myreview.getMtitle());
			pstmt.setString(3, myreview.getMcontent());
			pstmt.setInt(4, myreview.getMid());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}	
		
		return result;
	}

}
