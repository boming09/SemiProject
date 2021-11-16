package mypage.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import book.model.vo.Search;
import mypage.model.dao.B_ReviewDao;
import mypage.model.vo.B_Review;
import mypage.model.vo.Myreview;
import mypage.model.vo.PageInfo;

public class B_ReviewService {

	private B_ReviewDao b_reviewDao = new B_ReviewDao();
	
	public Map<String, Object> selectList(int page, int user_no/*, Search search*/) {
		Connection conn = getConnection();
		
		// 게시글 총 개수 구하기
		int listCount = b_reviewDao.getListCount(conn, user_no/*, search*/);
		
		// System.out.println(listCount); // 총게시글 숫자 확인 OK
		
				
		// PageInfo 객체 만들기
		PageInfo pi = new PageInfo(page, listCount, 10, 10);
		
		// 페이징 처리 된 게시글 목록 조회
		List<B_Review> b_reviewList = b_reviewDao.selectList(conn, user_no, pi/*, search*/);
		
		// System.out.println(pi);
		// System.out.println(b_reviewList);
		
		Map<String, Object> returnMap = new HashMap<>();
		
		returnMap.put("pi", pi);
		returnMap.put("b_reviewList", b_reviewList);
		
		return returnMap;
	}

	public int deleteb_review(int review_no) {
		Connection conn = getConnection();
		
		/* 삭제 하기 */
		int result = b_reviewDao.deleteb_review(conn, review_no);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int updateB_Review(B_Review b_review) {
		Connection conn = getConnection();
		
		/* 수정 하기 */
		int result = b_reviewDao.updateB_Review(conn, b_review);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public B_Review selectB_Review(int review_no) {
		Connection conn = getConnection();
		B_Review b_review = b_reviewDao.selectB_Review(conn, review_no);
		close(conn);
		
		return b_review;
	}

	public int insertBoard(B_Review b_review) {
		Connection conn = getConnection();
		
		int result = b_reviewDao.insertB_Review(conn, b_review);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public B_Review selectB_review(int review_no) {
		Connection conn = getConnection();
		
		B_Review b_review = b_reviewDao.selectB_review(conn, review_no);
		
		close(conn);		
		
		return b_review;
	}

	public int increaseCount(int review_no) {
		Connection conn = getConnection();
		
		int result = b_reviewDao.increaseCount(conn, review_no);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	

}
