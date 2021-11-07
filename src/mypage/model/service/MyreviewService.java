package mypage.model.service;

import java.sql.Connection;
import static common.JDBCTemplate.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import mypage.model.dao.MyreviewDao;
import mypage.model.vo.Myreview;
import mypage.model.vo.PageInfo;

public class MyreviewService {

	private MyreviewDao myreviewDao = new MyreviewDao();
	
	public Map<String, Object> selectList(int page) {
		Connection conn = getConnection();
		
		// 게시글 총 개수 구하기
		int listCount = myreviewDao.getListCount(conn);
		
		// PageInfo 객체 만들기
		PageInfo pi = new PageInfo(page, listCount, 10, 10);
		
		// 페이징 처리 된 게시글 목록 조회
		List<Myreview> MyreviewList = myreviewDao.selectList(conn, pi);
		
		Map<String, Object> returnMap = new HashMap<>();
		
		returnMap.put("pi", pi);
		returnMap.put("MyreviewList", MyreviewList);
		
		return returnMap;
	}

}
