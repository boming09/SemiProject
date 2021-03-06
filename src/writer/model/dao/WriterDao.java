package writer.model.dao;

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
import member.model.vo.Member;
import notice.model.vo.PageInfo;
import writer.model.vo.WProfile;
import writer.model.vo.WReview;
import writer.model.vo.WriterInfo;


public class WriterDao {
	
	private Properties writerQuery = new Properties();
	
	public WriterDao() {
		String fileName = WriterDao.class.getResource("/sql/writer/writer-query.xml").getPath();
		
		try {
			writerQuery.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	
	// 작가 프로필 + 자기소개 들고오기(회원번호)
	public WProfile selecWProfile(Connection conn, int user_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = writerQuery.getProperty("selectWProfile");
		
		WProfile wprofile = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, user_no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				wprofile = new WProfile();
				wprofile.setPro_no(rset.getInt("pro_no"));
				wprofile.setWriter_no(rset.getInt("writer_no"));
				wprofile.setFile_path(rset.getString("file_path"));
				wprofile.setGreeting(rset.getString("greeting"));
				wprofile.setOrigin_file(rset.getString("origin_file"));
				wprofile.setChange_file(rset.getString("change_file"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return wprofile;
	}

	// 처음 작가 프로필 수정
	public int insertWProfile(Connection conn, WProfile wprofile) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = writerQuery.getProperty("insertWProfile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, wprofile.getWriter_no());
			pstmt.setString(2, wprofile.getFile_path());
			pstmt.setString(3, wprofile.getGreeting());
			pstmt.setString(4, wprofile.getOrigin_file());
			pstmt.setString(5, wprofile.getChange_file());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}		
		
		return result;
	}

	// 작가 회원정보 수정
	public int updateWriterInfo(Connection conn, WriterInfo writerInfo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = writerQuery.getProperty("updateWriterInfo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, writerInfo.getName());
			pstmt.setString(2, writerInfo.getEmail());
			pstmt.setString(3, writerInfo.getPhone());
			pstmt.setString(4, writerInfo.getAddress());
			pstmt.setInt(5, writerInfo.getUser_no());
			
			result = pstmt.executeUpdate();
					
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}	
		
		return result;
	}
	
	// 작가 회원정보 안에있는 프로필 수정
	public int updateWProfile(Connection conn, WProfile upprofile) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = writerQuery.getProperty("updateWProfile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, upprofile.getFile_path());
			pstmt.setString(2, upprofile.getOrigin_file());
			pstmt.setString(3, upprofile.getChange_file());
			pstmt.setInt(4, upprofile.getWriter_no());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateWProfileGreeting(Connection conn, WProfile upprofile) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = writerQuery.getProperty("updateWProfileGreeting");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, upprofile.getGreeting());
			pstmt.setInt(2, upprofile.getWriter_no());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Member selecMember(Connection conn, int user_no) {
		Member writer = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = writerQuery.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, user_no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				writer = new Member();
				writer.setUserNo(rset.getInt("user_no"));
				writer.setUserId(rset.getString("user_id"));
				writer.setUserPwd(rset.getString("user_pwd"));
				writer.setUserName(rset.getString("user_name"));
				writer.setGender(rset.getString("gender"));
				writer.setUserEmail(rset.getString("user_email"));
				writer.setUserPhone(rset.getString("user_phone"));
				writer.setUserAddress(rset.getString("user_address"));
				writer.setUserGrade(rset.getInt("user_grade"));
				writer.setEnrollDate(rset.getDate("enroll_date"));
				writer.setStatus(rset.getString("status"));
				writer.setUserCertify(rset.getString("user_certify"));
				writer.setUserNickname(rset.getString("user_nickname"));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
				
		return writer;
	}
	
	// 작가 회원 탈퇴
	public int deleteInfo(Connection conn, int user_no) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = writerQuery.getProperty("deleteInfo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, user_no);
			
			result = pstmt.executeUpdate();
					
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	
	// 작가도서리스트 페이징 처리
	public int getListCount(Connection conn, int user_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		String sql = writerQuery.getProperty("getListCount");
		
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
			close(pstmt);
		}
		
		return listCount;
	}
	
	
	// 작가 도서리스트
	public List<Book> selectWBookList(Connection conn, PageInfo pi, int user_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = writerQuery.getProperty("selectWBookList");
		
		List<Book> wbookList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			// 페이지 설정
			int startRow = (pi.getPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, user_no);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Book wbook = new Book();
				wbook.setBid(rset.getInt("book_id"));
				wbook.setBtitle(rset.getString("book_name"));
				wbook.setPublicationDate(rset.getDate("publication_date"));
				wbook.setPublisher(rset.getString("publisher"));
				wbook.setBimg(rset.getString("book_img"));
				wbook.setReviewCount(rset.getInt("count(review_no)"));
				
				wbookList.add(wbook);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return wbookList;
	}

	
	// 미답변 리뷰 총 개수 가져오기
	public int getReviewCount(Connection conn, int user_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		String sql = writerQuery.getProperty("getReviewCount");
		
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

	// 미답변 리뷰 리스트
	public List<WReview> selectReviewList(Connection conn, PageInfo pi, int user_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = writerQuery.getProperty("selectReviewList");
		
		List<WReview> reviewList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			// 페이지 설정
			int startRow = (pi.getPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, user_no);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				WReview review = new WReview();
				review.setReview_no(rset.getInt("review_no"));
				review.setBook_id(rset.getInt("book_id"));
				review.setBook_name(rset.getString("book_name"));
				review.setUser_no(rset.getInt("user_no"));
				review.setUser_id(rset.getString("user_id"));
				review.setCreate_date(rset.getDate("create_date"));
				review.setContent(rset.getString("content"));
				review.setRating(rset.getInt("rating"));
				review.setRef_no(rset.getInt("ref_no"));
				review.setStatus(rset.getString("status"));
				
				reviewList.add(review);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}		
		
		return reviewList;
	}


	// 리뷰 디테일 페이지
	public WReview selectReview(Connection conn, int review_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = writerQuery.getProperty("selectReview");
		
		WReview review = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, review_no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				review = new WReview();
				review.setReview_no(rset.getInt("review_no"));
				review.setBook_id(rset.getInt("book_id"));
				review.setBook_name(rset.getString("book_name"));
				review.setUser_no(rset.getInt("user_no"));
				review.setUser_id(rset.getString("user_id"));
				review.setCreate_date(rset.getDate("create_date"));
				review.setContent(rset.getString("content"));
				review.setRating(rset.getInt("rating"));
				review.setRef_no(rset.getInt("ref_no"));
				review.setStatus(rset.getString("status"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}		
				
		return review;
	}

	// 리뷰 답댓 업데이트
	public int insertReply(Connection conn, WReview newreply) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = writerQuery.getProperty("insertReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, newreply.getBook_id());
			pstmt.setInt(2, newreply.getUser_no());
			pstmt.setString(3, newreply.getContent());
			pstmt.setInt(4, newreply.getRef_no());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	
	
	
	
	
	
	
	
	
	
}
