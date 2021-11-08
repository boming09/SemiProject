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
		
		// System.out.println(listCount); // 총게시글 숫자 확인 OK
		
		// PageInfo 객체 만들기
		PageInfo pi = new PageInfo(page, listCount, 10, 10);
		
		// 페이징 처리 된 게시글 목록 조회
		List<Myreview> myreviewList = myreviewDao.selectList(conn, pi);
		
		System.out.println(pi);
		System.out.println(myreviewList);
		
		Map<String, Object> returnMap = new HashMap<>();
		
		returnMap.put("pi", pi);
		returnMap.put("myreviewList", myreviewList);
		
		return returnMap;
	}

	public int increaseCount(int mid) {
		Connection conn = getConnection();
		
		int result = myreviewDao.increaseCount(conn, mid);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public Myreview selectMyreview(int mid) {
		Connection conn = getConnection();
		Myreview myreview = myreviewDao.selectMyreview(conn, mid);
		close(conn);		
		
		return myreview;
	}

	public int insertBoard(Myreview myreview) {
		Connection conn = getConnection();
		
		int result = myreviewDao.insertMyreview(conn, myreview);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

}
