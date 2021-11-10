package notice.model.dao;

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

import notice.model.vo.Faq;
import notice.model.vo.Fcategory;
import notice.model.vo.PageInfo;

public class FaqDao {
		
	private Properties faqQuery = new Properties();
	
	public FaqDao() {
		String fileName = FaqDao.class.getResource("/sql/faq/faq-query.xml").getPath();
		
		try {
			faqQuery.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	// 조회 Atype 게시글 수
	public int getListACount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		String sql = faqQuery.getProperty("getListACount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			// 총 게시글이 몇개인지만 알아오는거라서 값이 1개뿐
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;  // 총 갯수 리턴
	}

	// 조회 btype 게시글 수
	public int getListBCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		String sql = faqQuery.getProperty("getListBCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			// 총 게시글이 몇개인지만 알아오는거라서 값이 1개뿐
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;  // 총 갯수 리턴
	}
	// 조회 Ctype 게시글 수
	public int getListCCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		String sql = faqQuery.getProperty("getListCCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			// 총 게시글이 몇개인지만 알아오는거라서 값이 1개뿐
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;  // 총 갯수 리턴
	}
	// 조회 Dtype 게시글 수
	public int getListDCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		String sql = faqQuery.getProperty("getListDCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			// 총 게시글이 몇개인지만 알아오는거라서 값이 1개뿐
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;  // 총 갯수 리턴
	}
	
	// faqA List
	public List<Faq> selectAList(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = faqQuery.getProperty("selectAList");
		
		List<Faq> faqList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			// 페이지 설정
			int startRow = (pi.getPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
		
			pstmt.setInt(1, startRow); // 페이지 시작 값
			pstmt.setInt(2, endRow);  // 페이지 끝 값
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Faq faq = new Faq();
				faq.setFaq_no(rset.getInt("faq_no"));
				faq.setTitle(rset.getString("title"));
				faq.setReply(rset.getString("reply"));
				faq.setFcategory_no(rset.getInt("category_no"));
				faq.setFcategory(rset.getString("category_type"));
				faq.setFref_no(rset.getInt("ref_no"));
				faq.setFcount(rset.getInt("count"));
				
				faqList.add(faq);  // 리스트에 추가
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return faqList;
	}

	// faqB List
	public List<Faq> selectBList(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = faqQuery.getProperty("selectBList");
		
		List<Faq> faqList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			// 페이지 설정
			int startRow = (pi.getPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
		
			pstmt.setInt(1, startRow); // 페이지 시작 값
			pstmt.setInt(2, endRow);  // 페이지 끝 값
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Faq faq = new Faq();
				faq.setFaq_no(rset.getInt("faq_no"));
				faq.setTitle(rset.getString("title"));
				faq.setReply(rset.getString("reply"));
				faq.setFcategory_no(rset.getInt("category_no"));
				faq.setFcategory(rset.getString("category_type"));
				faq.setFref_no(rset.getInt("ref_no"));
				faq.setFcount(rset.getInt("count"));
				
				faqList.add(faq);  // 리스트에 추가
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return faqList;
	}
	
	// faqC List
	public List<Faq> selectCList(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = faqQuery.getProperty("selectCList");
		
		List<Faq> faqList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			// 페이지 설정
			int startRow = (pi.getPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow); // 페이지 시작 값
			pstmt.setInt(2, endRow);  // 페이지 끝 값
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Faq faq = new Faq();
				faq.setFaq_no(rset.getInt("faq_no"));
				faq.setTitle(rset.getString("title"));
				faq.setReply(rset.getString("reply"));
				faq.setFcategory_no(rset.getInt("category_no"));
				faq.setFcategory(rset.getString("category_type"));
				faq.setFref_no(rset.getInt("ref_no"));
				faq.setFcount(rset.getInt("count"));
				
				faqList.add(faq);  // 리스트에 추가
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return faqList;
	}
	// faqD List
	public List<Faq> selectDList(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = faqQuery.getProperty("selectDList");
		
		List<Faq> faqList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			// 페이지 설정
			int startRow = (pi.getPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow); // 페이지 시작 값
			pstmt.setInt(2, endRow);  // 페이지 끝 값
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Faq faq = new Faq();
				faq.setFaq_no(rset.getInt("faq_no"));
				faq.setTitle(rset.getString("title"));
				faq.setReply(rset.getString("reply"));
				faq.setFcategory_no(rset.getInt("category_no"));
				faq.setFcategory(rset.getString("category_type"));
				faq.setFref_no(rset.getInt("ref_no"));
				faq.setFcount(rset.getInt("count"));
				
				faqList.add(faq);  // 리스트에 추가
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return faqList;
	}
	
	
	// 카테고리 조회
	public List<Fcategory> selectCateList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = faqQuery.getProperty("selectCateList");
		
		List<Fcategory> fcate = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Fcategory f = new Fcategory();
				f.setFcate_no(rset.getInt("category_no"));
				f.setFcate_type(rset.getString("category_type"));
				f.setFref_no(rset.getInt("ref_no"));
				
				fcate.add(f);
			}
					
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}		
		
		return fcate;
	}

	
	// faq 작성하기
	public int insertFaq(Connection conn, Faq faq) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = faqQuery.getProperty("insertFaq");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, faq.getTitle());
			pstmt.setString(2, faq.getReply());
			pstmt.setInt(3, faq.getFref_no());
			
			result = pstmt.executeUpdate();
					
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// faqA top3 가져오기(btype이 전체일시)
	public List<Faq> selectAAlltopList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = faqQuery.getProperty("selectAAlltopList");
		
		List<Faq> topList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
						
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Faq faq = new Faq();
				faq.setFaq_no(rset.getInt("faq_no"));
				faq.setTitle(rset.getString("title"));
				faq.setReply(rset.getString("reply"));
				faq.setFcategory_no(rset.getInt("category_no"));
				faq.setFcategory(rset.getString("category_type"));
				faq.setFref_no(rset.getInt("ref_no"));
				faq.setFcount(rset.getInt("count"));
				
				topList.add(faq);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return topList;
	}
		
	// faqA top3 가져오기
	public List<Faq> selectAtopList(Connection conn, int cate_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = faqQuery.getProperty("selectAtopList");
		
		List<Faq> topList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cate_no);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Faq faq = new Faq();
				faq.setFaq_no(rset.getInt("faq_no"));
				faq.setTitle(rset.getString("title"));
				faq.setReply(rset.getString("reply"));
				faq.setFcategory_no(rset.getInt("category_no"));
				faq.setFcategory(rset.getString("category_type"));
				faq.setFref_no(rset.getInt("ref_no"));
				faq.setFcount(rset.getInt("count"));
				
				topList.add(faq);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return topList;
	}

	// faqB top3 가져오기(btype이 전체일시)
	public List<Faq> selectBAlltopList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = faqQuery.getProperty("selectBAlltopList");
		
		List<Faq> topList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
						
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Faq faq = new Faq();
				faq.setFaq_no(rset.getInt("faq_no"));
				faq.setTitle(rset.getString("title"));
				faq.setReply(rset.getString("reply"));
				faq.setFcategory_no(rset.getInt("category_no"));
				faq.setFcategory(rset.getString("category_type"));
				faq.setFref_no(rset.getInt("ref_no"));
				faq.setFcount(rset.getInt("count"));
				
				topList.add(faq);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return topList;
	}
	
	// faqB top3 가져오기
	public List<Faq> selectBtopList(Connection conn, int cate_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = faqQuery.getProperty("selectBtopList");
		
		List<Faq> topList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cate_no);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Faq faq = new Faq();
				faq.setFaq_no(rset.getInt("faq_no"));
				faq.setTitle(rset.getString("title"));
				faq.setReply(rset.getString("reply"));
				faq.setFcategory_no(rset.getInt("category_no"));
				faq.setFcategory(rset.getString("category_type"));
				faq.setFref_no(rset.getInt("ref_no"));
				faq.setFcount(rset.getInt("count"));
				
				topList.add(faq);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return topList;
	}

	// faqC top3 가져오기(btype이 전체일시)
	public List<Faq> selectCAlltopList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = faqQuery.getProperty("selectCAlltopList");
		
		List<Faq> topList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
						
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Faq faq = new Faq();
				faq.setFaq_no(rset.getInt("faq_no"));
				faq.setTitle(rset.getString("title"));
				faq.setReply(rset.getString("reply"));
				faq.setFcategory_no(rset.getInt("category_no"));
				faq.setFcategory(rset.getString("category_type"));
				faq.setFref_no(rset.getInt("ref_no"));
				faq.setFcount(rset.getInt("count"));
				
				topList.add(faq);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return topList;
	}
	
	// faqC top3 가져오기
	public List<Faq> selectCtopList(Connection conn, int cate_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = faqQuery.getProperty("selectCtopList");
		
		List<Faq> topList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cate_no);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Faq faq = new Faq();
				faq.setFaq_no(rset.getInt("faq_no"));
				faq.setTitle(rset.getString("title"));
				faq.setReply(rset.getString("reply"));
				faq.setFcategory_no(rset.getInt("category_no"));
				faq.setFcategory(rset.getString("category_type"));
				faq.setFref_no(rset.getInt("ref_no"));
				faq.setFcount(rset.getInt("count"));
				
				topList.add(faq);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return topList;
	}
	
	// faqD top3 가져오기(btype이 전체일시)
	public List<Faq> selectDAlltopList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = faqQuery.getProperty("selectDAlltopList");
		
		List<Faq> topList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
						
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Faq faq = new Faq();
				faq.setFaq_no(rset.getInt("faq_no"));
				faq.setTitle(rset.getString("title"));
				faq.setReply(rset.getString("reply"));
				faq.setFcategory_no(rset.getInt("category_no"));
				faq.setFcategory(rset.getString("category_type"));
				faq.setFref_no(rset.getInt("ref_no"));
				faq.setFcount(rset.getInt("count"));
				
				topList.add(faq);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return topList;
	}
	
	// faqD top3 가져오기
	public List<Faq> selectDtopList(Connection conn, int cate_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = faqQuery.getProperty("selectDtopList");
		
		List<Faq> topList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cate_no);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Faq faq = new Faq();
				faq.setFaq_no(rset.getInt("faq_no"));
				faq.setTitle(rset.getString("title"));
				faq.setReply(rset.getString("reply"));
				faq.setFcategory_no(rset.getInt("category_no"));
				faq.setFcategory(rset.getString("category_type"));
				faq.setFref_no(rset.getInt("ref_no"));
				faq.setFcount(rset.getInt("count"));
				
				topList.add(faq);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return topList;
	}

	// faq 전체 클릭시 - top
	public List<Faq> selectAlltopList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = faqQuery.getProperty("selectAlltopList");
		
		List<Faq> topList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
						
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Faq faq = new Faq();
				faq.setFaq_no(rset.getInt("faq_no"));
				faq.setTitle(rset.getString("title"));
				faq.setReply(rset.getString("reply"));
				faq.setFcategory_no(rset.getInt("category_no"));
				faq.setFcategory(rset.getString("category_type"));
				faq.setFref_no(rset.getInt("ref_no"));
				faq.setFcount(rset.getInt("count"));
				
				topList.add(faq);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return topList;
	}

	
	// faq 전체 클릭스 - total 리스트 수
	public int getListAllCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		String sql = faqQuery.getProperty("getListAllCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			// 총 게시글이 몇개인지만 알아오는거라서 값이 1개뿐
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;  // 총 갯수 리턴
	}

	// faq 전체 클릭스 - total 리스트
	public List<Faq> selectAllList(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = faqQuery.getProperty("selectAllList");
		
		List<Faq> faqList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			// 페이지 설정
			int startRow = (pi.getPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
		
			pstmt.setInt(1, startRow); // 페이지 시작 값
			pstmt.setInt(2, endRow);  // 페이지 끝 값
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Faq faq = new Faq();
				faq.setFaq_no(rset.getInt("faq_no"));
				faq.setTitle(rset.getString("title"));
				faq.setReply(rset.getString("reply"));
				faq.setFcategory_no(rset.getInt("category_no"));
				faq.setFcategory(rset.getString("category_type"));
				faq.setFref_no(rset.getInt("ref_no"));
				faq.setFcount(rset.getInt("count"));
				
				faqList.add(faq);  // 리스트에 추가
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return faqList;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
