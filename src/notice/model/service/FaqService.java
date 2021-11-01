package notice.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import notice.model.dao.FaqDao;
import notice.model.vo.Faq;
import notice.model.vo.PageInfo;

public class FaqService {
	
	private FaqDao faqDao = new FaqDao();
	
	// faq 게시판 조회
	public Map<String, Object> selectList(int page) {
		Connection conn = getConnection();
		
		// 1. 게시글 총 개수 구하기
		int listCount = faqDao.getListCount(conn);
		
		// System.out.println(listCount); 
		// => ㅇㅇ
		
		// 2. PageInfo 객체 만들기
		PageInfo pi = new PageInfo(page, listCount, 5, 5);
		// page : 클릭한 페이지 바
		// listCount : db에 있는 게시글 총 수
		// 첫번째 5 : 페이지 바를 5개씩 두겠다 (ex 1~5 / 6~10) = pageLimit
		// 두번째 5 : 리스트를 5개씩 보여주겠다 = boardLimit
		
		// 3. 페이징 처리 된 게시글 목록 조회
		List<Faq> faqList = faqDao.selectList(conn, pi);
		
		// System.out.println(pi);
		// System.out.println(faqList);
		// => ㅇㅇ
		
		Map<String, Object> returnMap = new HashMap<>();
		
		returnMap.put("pi", pi);
		returnMap.put("faqList", faqList);
		
		close(conn);		
		
		return returnMap;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
