package notice.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import notice.model.dao.FaqDao;
import notice.model.vo.Faq;
import notice.model.vo.Fcategory;
import notice.model.vo.PageInfo;

public class FaqService {
	
	private FaqDao faqDao = new FaqDao();
	
	// faqA total 게시판 조회
	public Map<String, Object> selectAList(int page) {
		Connection conn = getConnection();
		
		// 1. 게시글 총 개수 구하기
		int listCount = faqDao.getListACount(conn);
				
		// 2. PageInfo 객체 만들기
		PageInfo pi = new PageInfo(page, listCount, 5, 5);
		// page : 클릭한 페이지 바
		// listCount : db에 있는 게시글 총 수
		// 첫번째 5 : 페이지 바를 5개씩 두겠다 (ex 1~5 / 6~10) = pageLimit
		// 두번째 5 : 리스트를 5개씩 보여주겠다 = boardLimit
		
		// 3. 페이징 처리 된 게시글 목록 조회
		List<Faq> faqList = faqDao.selectAList(conn, pi);
		
		Map<String, Object> returnMap = new HashMap<>();
		
		returnMap.put("pi", pi);
		returnMap.put("faqList", faqList);
		
		close(conn);		
		
		return returnMap;
	}
	
	// faqB total 게시판 조회
	public Map<String, Object> selectBList(int page) {
		Connection conn = getConnection();
		
		// 1. 게시글 총 개수 구하기
		int listCount = faqDao.getListBCount(conn);
				
		// 2. PageInfo 객체 만들기
		PageInfo pi = new PageInfo(page, listCount, 5, 5);
		// page : 클릭한 페이지 바
		// listCount : db에 있는 게시글 총 수
		// 첫번째 5 : 페이지 바를 5개씩 두겠다 (ex 1~5 / 6~10) = pageLimit
		// 두번째 5 : 리스트를 5개씩 보여주겠다 = boardLimit
		
		// 3. 페이징 처리 된 게시글 목록 조회
		List<Faq> faqList = faqDao.selectBList(conn, pi);
		
		Map<String, Object> returnMap = new HashMap<>();
		
		returnMap.put("pi", pi);
		returnMap.put("faqList", faqList);
		
		close(conn);		
		
		return returnMap;
	}
	
	// faqC total 게시판 조회
	public Map<String, Object> selectCList(int page) {
		Connection conn = getConnection();
		
		// 1. 게시글 총 개수 구하기
		int listCount = faqDao.getListCCount(conn);
				
		// 2. PageInfo 객체 만들기
		PageInfo pi = new PageInfo(page, listCount, 5, 5);
		// page : 클릭한 페이지 바
		// listCount : db에 있는 게시글 총 수
		// 첫번째 5 : 페이지 바를 5개씩 두겠다 (ex 1~5 / 6~10) = pageLimit
		// 두번째 5 : 리스트를 5개씩 보여주겠다 = boardLimit
		
		// 3. 페이징 처리 된 게시글 목록 조회
		List<Faq> faqList = faqDao.selectCList(conn, pi);
		
		Map<String, Object> returnMap = new HashMap<>();
		
		returnMap.put("pi", pi);
		returnMap.put("faqList", faqList);
		
		close(conn);		
		
		return returnMap;
	}

	// faqD total 게시판 조회
	public Map<String, Object> selectDList(int page) {
		Connection conn = getConnection();
		
		// 1. 게시글 총 개수 구하기
		int listCount = faqDao.getListDCount(conn);
				
		// 2. PageInfo 객체 만들기
		PageInfo pi = new PageInfo(page, listCount, 5, 5);
		// page : 클릭한 페이지 바
		// listCount : db에 있는 게시글 총 수
		// 첫번째 5 : 페이지 바를 5개씩 두겠다 (ex 1~5 / 6~10) = pageLimit
		// 두번째 5 : 리스트를 5개씩 보여주겠다 = boardLimit
		
		// 3. 페이징 처리 된 게시글 목록 조회
		List<Faq> faqList = faqDao.selectDList(conn, pi);
		
		Map<String, Object> returnMap = new HashMap<>();
		
		returnMap.put("pi", pi);
		returnMap.put("faqList", faqList);
		
		close(conn);		
		
		return returnMap;
	}
	
	// 카테고리 조회
	public List<Fcategory> selectCateList() {
		Connection conn = getConnection();
		
		List<Fcategory> fcate = faqDao.selectCateList(conn);
		// System.out.println(fcate);
		
		close(conn);
		
		return fcate;
	}
	
	
	// faq 작성하기
	public int insertFaq(Faq faq) {
		Connection conn = getConnection();
		
		int result = faqDao.insertFaq(conn, faq);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	
	// faqA top3 가져오기(btype이 전체일시)
	public List<Faq> selectAAlltopList() {
		Connection conn = getConnection();
		
		List<Faq> topList = faqDao.selectAAlltopList(conn);
		
		close(conn);
		
		return topList;
	}
	// faqA top3 가져오기
	public List<Faq> selectAtopList(int cate_no) {
		Connection conn = getConnection();
		
		List<Faq> topList = faqDao.selectAtopList(conn, cate_no);
		
		close(conn);
		
		return topList;
	}
	
	// faqB top3 가져오기(btype이 전체일시)
	public List<Faq> selectBAlltopList() {
		Connection conn = getConnection();
		
		List<Faq> topList = faqDao.selectBAlltopList(conn);
		
		close(conn);
		
		return topList;
	}

	// faqB top3 가져오기
	public List<Faq> selectBtopList(int cate_no) {
		Connection conn = getConnection();
		
		List<Faq> topList = faqDao.selectBtopList(conn, cate_no);
		
		close(conn);
		
		return topList;
	}

	// faqC top3 가져오기(btype이 전체일시)
	public List<Faq> selectCAlltopList() {
		Connection conn = getConnection();
		
		List<Faq> topList = faqDao.selectCAlltopList(conn);
		
		close(conn);
		
		return topList;
	}

	// faqC top3 가져오기
	public List<Faq> selectCtopList(int cate_no) {
		Connection conn = getConnection();
		
		List<Faq> topList = faqDao.selectCtopList(conn, cate_no);
		
		close(conn);
		
		return topList;
	}
	
	// faqD top3 가져오기(btype이 전체일시)
	public List<Faq> selectDAlltopList() {
		Connection conn = getConnection();
		
		List<Faq> topList = faqDao.selectDAlltopList(conn);
		
		close(conn);
		
		return topList;
	}

	// faqD top3 가져오기
	public List<Faq> selectDtopList(int cate_no) {
		Connection conn = getConnection();
		
		List<Faq> topList = faqDao.selectDtopList(conn, cate_no);
		
		close(conn);
		
		return topList;
	}

	
	// faq 전체 클릭시 - top
	public List<Faq> selectAlltopList() {
		Connection conn = getConnection();
		
		List<Faq> topList = faqDao.selectAlltopList(conn);
		
		close(conn);
		
		return topList;
	}
	// faq 전체 클릭시 - total
	public Map<String, Object> selectAllList(int page) {
		Connection conn = getConnection();
		
		// 1. 게시글 총 개수 구하기
		int listCount = faqDao.getListAllCount(conn);
		// 2. PageInfo 객체 만들기
		PageInfo pi = new PageInfo(page, listCount, 5, 5);
		// 3. 페이징 처리 된 게시글 목록 조회
		List<Faq> faqList = faqDao.selectAllList(conn, pi);
		
		Map<String, Object> returnMap = new HashMap<>();
		
		returnMap.put("pi", pi);
		returnMap.put("faqList", faqList);
		
		close(conn);		
		
		return returnMap;
	}	

}
