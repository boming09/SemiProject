package notice.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import member.model.vo.Member;
import notice.model.dao.CommuDao;
import notice.model.vo.Commu;
import notice.model.vo.PageInfo;
import writer.model.vo.WProfile;

public class CommuService {

	CommuDao commuDao = new CommuDao();
	
	// 소통게시판 글작성시 작가 검색기능에 쓸 작가리스트
	public List<Member> getWriterList() {
		Connection conn = getConnection();
		
		List<Member> writerList = commuDao.getWriterList(conn);
		
		if(writerList != null) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return writerList;
	}
	
	
	// 소통게시판 글 작성
	public int insertCommu(Commu commu) {
		Connection conn = getConnection();
		
		int result = commuDao.insertCommu(conn, commu);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	
	// 소통게시판 총 게시글 리스트
	public Map<String, Object> selectList(int page, int user_no) {
		Connection conn = getConnection();
		int listCount = 0;
		PageInfo pi =null;
		List<Commu> commuList = null;
		
		if(user_no > 0) {
			// 1. 내가 쓴 게시글 총 개수 구하기
			listCount = commuDao.getMyListCount(conn, user_no);
			// 2. PageInfo 객체 만들기
			pi = new PageInfo(page, listCount, 5, 10);
			// 3. 내가 쓴 게시글 총 리스트 가져오기
			commuList = commuDao.selecMytList(conn, pi, user_no);
		} else {
			// 1. 게시글 총 개수 구하기
			listCount = commuDao.getListCount(conn);
			// System.out.println(listCount); 
			
			// 2. PageInfo 객체 만들기
			pi = new PageInfo(page, listCount, 5, 10);
			// page : 클릭한 페이지 바
			// listCount : db에 있는 게시글 총 수
			// 첫번째 5 : 페이지 바를 5개씩 두겠다 (ex 1~5 / 6~10) = pageLimit
			// 두번째 10 : 리스트를 10개씩 보여주겠다 = boardLimit
			
			// 3. 총 리스트 가져오기
			commuList = commuDao.selectList(conn, pi);
		}
		
		Map<String, Object> returnMap = new HashMap<>();
		
		returnMap.put("pi", pi);
		returnMap.put("commuList", commuList);
		
		close(conn);
		
		return returnMap;
	}

	
	// 소통게시판 게시글 클릭시 상세페이지
	public Commu selectCommu(int commu_no) {
		Connection conn = getConnection();
		
		Commu commu = commuDao.selectCommu(conn, commu_no);
		
		close(conn);
		
		return commu;
	}


	// 작가소개 페이지 -> 작가리스트
	public Map<String, Object> selectWriterList(int page, String w_name) {
		Connection conn = getConnection();
	
		// 게시글 총 개수 구하기
		int listCount = commuDao.selectWriterCount(conn, w_name);
		// 페이징 처리
		PageInfo pi = new PageInfo(page, listCount, 10, 5);
		// 페이징 처리 된 리스트 조회
		List<WProfile> writerList = commuDao.selectWriterList(conn, pi, w_name);
		
		Map<String, Object> returnMap = new HashMap<>();
		
		returnMap.put("pi", pi);
		returnMap.put("writerList", writerList);
		
		return returnMap;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
