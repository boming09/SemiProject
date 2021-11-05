package notice.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import notice.model.dao.OneDao;
import notice.model.vo.One;
import notice.model.vo.PageInfo;

public class OneService {
	
	private OneDao oneDao = new OneDao();

	
	// 1:1문의하기 작성
	public int insertOne(One one) {
		Connection conn = getConnection();
		
		int result = oneDao.insertOne(conn, one);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}


	// 1:1문의내역 리스트 조회
	public Map<String, Object> selectList(int ouser, int page) {
		
		Connection conn = getConnection();
		
		// 1. 게시글 총 개수 구하기(로그인한 유저의 작성 리스트만)
		int listCount = oneDao.getListCount(conn, ouser);
		// System.out.println(listCount);
		
		// 2. PageInfo 객체 만들기
		PageInfo pi = new PageInfo(page, listCount, 5, 10);
		// page : 클릭한 페이지 바
		// listCount : db에 있는 게시글 총 수
		// 첫번째 5 : 페이지 바를 5개씩 두겠다 (ex 1~5 / 6~10) = pageLimit
		// 두번째 10 : 리스트를 10개씩 보여주겠다 = boardLimit
		
		// 3. 페이징 처리 된 게시글 목록 조회
		List<One> oneList = oneDao.selectList(conn, ouser, pi);
		// System.out.println(oneList);
		
		Map<String, Object> returnMap = new HashMap<>();
		
		if(listCount == 0) {
			returnMap.put("pi", null);
			returnMap.put("oneList", null);
		} else {
			returnMap.put("pi", pi);
			returnMap.put("oneList", oneList);
		}
		
		close(conn);	
		
		return returnMap;
	}


	// 1:1문의내역 상세페이지
	public One selectOne(int one_no) {
		Connection conn = getConnection();
		
		One one = oneDao.selectOne(conn, one_no);
		
		close(conn);
		
		return one;
	}
	
}
