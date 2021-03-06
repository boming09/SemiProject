package mypage.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import static common.JDBCTemplate.*;
import book.model.vo.Search;
import mypage.model.vo.B_Review;
import mypage.model.vo.Myreview;
import mypage.model.vo.PageInfo;

public class B_ReviewDao {
	private static Properties b_reviewQuery = new Properties();
	
	public B_ReviewDao() {
		String fileName = B_ReviewDao.class.getResource("/sql/mypage/b_review-query.xml").getPath();
		
		try {
			b_reviewQuery.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int getListCount(Connection conn, int user_no/*, Search search*/) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		String sql = b_reviewQuery.getProperty("getListCount");	
		
		/*if(search.getSearchCondition() != null && search.getSearchValue() != null) {
			if(search.getSearchCondition().equals("title")) {
				sql = b_reviewQuery.getProperty("getTitleListCount");
			} else if(search.getSearchCondition().equals("content")) {
				sql = b_reviewQuery.getProperty("getContentListCount");
			} else if(search.getSearchCondition().equals("writer")) {
				sql = b_reviewQuery.getProperty("getWriterListCount");
			}
		}
		*/
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, user_no);
			
			// 검색 SQL문을 실행하는 경우 검색 값 설정
			/*
			if(search.getSearchCondition() != null && search.getSearchValue() != null) {
				pstmt.setString(1, search.getSearchValue());
			}
			*/
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

	public List<B_Review> selectList(Connection conn, int user_no, PageInfo pi/*, Search search*/) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = b_reviewQuery.getProperty("selectList");
		List<B_Review> b_reviewList = new ArrayList<>();
		int listCount = 0;
		/*
		if(search.getSearchCondition() != null && search.getSearchValue() != null) {
			if(search.getSearchCondition().equals("title")) {
				sql = b_reviewQuery.getProperty("selectTitleList");
			} else if(search.getSearchCondition().equals("content")) {
				sql = b_reviewQuery.getProperty("selectContentList");
			} else if(search.getSearchCondition().equals("writer")) {
				sql = b_reviewQuery.getProperty("selectWriterList");
			}		
		}
		*/
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getPage() - 1) * pi.getMypagemyreviewLimit() + 1;
			int endRow = startRow + pi.getMypagemyreviewLimit() - 1;
			
			/*
			int index = 1;
			if(search.getSearchCondition() != null && search.getSearchValue() != null) {
				pstmt.setString(index++, search.getSearchValue());
			}
			pstmt.setInt(index++, startRow);
			pstmt.setInt(index, endRow);
			 */
			
			pstmt.setInt(1, user_no);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				B_Review b_review = new B_Review();
				b_review.setReview_no(rset.getInt("review_no"));		// 리뷰번호
				b_review.setBook_id(rset.getInt("book_id"));
				b_review.setBook_name(rset.getString("book_name"));				// 회원번호				
				b_review.setUser_nickname(rset.getString("user_nickname"));// 상태
				b_review.setCreate_date(rset.getDate("create_date"));			// 작성일
				b_review.setContent(rset.getString("content"));					// 내용
				b_review.setRating(rset.getInt("rating"));						// 평점
				b_review.setRef_no(rset.getInt("ref_no"));						// 참조리뷰번호
				b_review.setStatus(rset.getString("status"));
				
				b_reviewList.add(b_review);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return b_reviewList;
	}

	public int deleteb_review(Connection conn, int review_no) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = b_reviewQuery.getProperty("deleteb_review");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, review_no);
						
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}	
		
		return result;
	}

	public int updateB_Review(Connection conn, B_Review b_review) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = b_reviewQuery.getProperty("updateB_Review");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, b_review.getBook_id());
			pstmt.setString(2, b_review.getContent());
			pstmt.setInt(3, b_review.getReview_no());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}	
		
		return result;
	}

	public B_Review selectB_Review(Connection conn, int review_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		B_Review b_review = null;
		String sql = b_reviewQuery.getProperty("selectB_Review");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, review_no);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b_review = new B_Review();
				b_review.setReview_no(rset.getInt("review_no"));
				b_review.setBook_name(rset.getString("book_name"));
				b_review.setUser_nickname(rset.getString("user_nickname"));
				b_review.setCreate_date(rset.getDate("create_date"));
				b_review.setContent(rset.getString("content"));
				b_review.setRating(rset.getInt("rating"));
				b_review.setRef_no(rset.getInt("ref_no"));
				b_review.setStatus(rset.getString("status"));
				/*
				b_review.setBook_id(rset.getInt("book_id"));
				b_review.setCategory_id(rset.getInt("category_id"));
				*/
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return b_review;
	}

	public int insertB_Review(Connection conn, B_Review b_review) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = b_reviewQuery.getProperty("insertB_Review");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, b_review.getBook_id());
			pstmt.setInt(2, b_review.getUser_no());
			pstmt.setString(3, b_review.getContent());
			pstmt.setInt(4, b_review.getRating());
			pstmt.setInt(5, b_review.getRef_no());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}	
		
		return result;
	}

	public B_Review selectB_review(Connection conn, int review_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		B_Review b_review = null;
		String sql = b_reviewQuery.getProperty("selectB_review");
	
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, review_no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b_review = new B_Review();
				b_review.setReview_no(rset.getInt("review_no"));
				b_review.setBook_id(rset.getInt("book_id"));
				b_review.setBook_name(rset.getString("book_name"));
				b_review.setUser_nickname(rset.getString("user_nickname"));
				b_review.setCreate_date(rset.getDate("create_date"));
				b_review.setContent(rset.getString("content"));
				b_review.setRating(rset.getInt("rating"));
				b_review.setRef_no(rset.getInt("ref_no"));
				b_review.setStatus(rset.getString("status"));
								
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return b_review;
	}

	public int increaseCount(Connection conn, int review_no) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = b_reviewQuery.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, review_no);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	

	
	
	
}
