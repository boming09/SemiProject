package writer.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import book.model.vo.Book;
import member.model.vo.Member;
import notice.model.vo.PageInfo;
import writer.model.dao.WriterDao;
import writer.model.vo.WProfile;
import writer.model.vo.WReview;
import writer.model.vo.WriterInfo;

public class WriterService {
	
	WriterDao writerDao = new WriterDao();
	
	// 작가 프로필 + 자기소개 들고오기(회원번호)
	public WProfile selectWProfile(int user_no) {
		Connection conn = getConnection();
		
		WProfile wprofile = writerDao.selecWProfile(conn, user_no);
		
		close(conn);
		
		return wprofile;
	}

	// 처음 작가 프로필 수정
	public int insertWProfile(WProfile wprofile) {
		Connection conn = getConnection();
		
		int result = writerDao.insertWProfile(conn, wprofile);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	// 작가 회원정보 수정
	public int updateWriterInfo(WriterInfo writerInfo) {
		Connection conn = getConnection();
		
		// writerInfo 안에있는 회원정보 먼저 업데이트 
		int infoResult = writerDao.updateWriterInfo(conn, writerInfo);
		
		// writerInfo 안에있는 프로필 업데이트
		WProfile upprofile = writerInfo.getWprofile();
		
		int proResult1 = 0;
		int proResult11 = 0;
		int proResult2 = 0;
		int proResult22 = 0;
		if(upprofile.getDelete_file() != null) {
			proResult1 = writerDao.updateWProfile(conn, upprofile);
			proResult11++;
		} 
		if(upprofile.getGreeting() != null) {
			proResult2 = writerDao.updateWProfileGreeting(conn, upprofile);
			proResult22++;
		}
				
		int result = 0;
		if(infoResult > 0 && proResult1 == proResult11 && proResult2 == proResult22) {
			commit(conn);
			result = 1;
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	// 로그인 유저 찾아오기
	public Member selectMember(int user_no) {
		Connection conn = getConnection();
		
		Member writer = writerDao.selecMember(conn, user_no);
		
		close(conn);
		
		return writer;
	}

	// 작가 회원 탈퇴
	public int deleteInfo(int user_no) {
		Connection conn = getConnection();
		
		int result = writerDao.deleteInfo(conn, user_no);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	// 작가 내도서 리스트
	public Map<String, Object> selectWBookList(int page, int user_no) {
		Connection conn = getConnection();
	
		PageInfo pi = null;
		
		// 1. 도서 총 개수 구하기
		int listCount = writerDao.getListCount(conn, user_no);
		// 2. PageInfo 객체 만들기
		pi = new PageInfo(page, listCount, 5, 10);
		// 3. 도서 리스트 구하기		
		List<Book> wbookList = writerDao.selectWBookList(conn, pi, user_no);
		
		Map<String, Object> returnMap = new HashMap<>();
		
		returnMap.put("pi", pi);
		returnMap.put("wbookList", wbookList);
				
		close(conn);
		
		return returnMap;
	}

	
	// 미답변 리뷰리스트 가져오기
	public Map<String, Object> selectReviewList(int page, int user_no) {
		Connection conn = getConnection();
		
		// 1. 리뷰 총 개수 구하기
		int listCount = writerDao.getReviewCount(conn, user_no);
		// 2. PageInfo 객체 만들기
		PageInfo pi = new PageInfo(page, listCount, 10, 10);
		// 3. 도서 리스트 구하기		
		List<WReview> reviewList = writerDao.selectReviewList(conn, pi, user_no);
		
		Map<String, Object> returnMap = new HashMap<>();
		
		if(listCount == 0) {
			returnMap.put("pi", null);
			returnMap.put("reviewList", null);
		} else {
			returnMap.put("pi", pi);
			returnMap.put("reviewList", reviewList);			
		}
		close(conn);
		
		return returnMap;
	}

	// 리뷰 디테일 페이지
	public WReview selectReview(int review_no) {
		Connection conn = getConnection();
		
		WReview review = writerDao.selectReview(conn, review_no);
		
		close(conn);
		
		return review;
	}

	
	// 답변 업데이트
	public int insertReply(WReview newreply) {
		Connection conn = getConnection();
		
		int result = writerDao.insertReply(conn, newreply);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
