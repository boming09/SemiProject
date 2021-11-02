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
	
	
	// 게시글 조회시 총 게시글 몇개인지 조회
	public int getListCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		String sql = faqQuery.getProperty("getListCount");
		
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

	// faq db에 있는 리스트 조회
	public List<Faq> selectList(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		String sql = faqQuery.getProperty("selectList");
		
		List<Faq> faqList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			// 페이지 설정
			int startRow = (pi.getPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			/* 
			int index = 1;
			pstmt.setInt(index++, startRow);
			pstmt.setInt(index, endRow);
			*/
			pstmt.setInt(1, startRow); // 페이지 시작 값
			pstmt.setInt(2, endRow);  // 페이지 끝 값
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Faq faq = new Faq();
				faq.setFaq_no(rset.getInt("faq_no"));
				faq.setTitle(rset.getString("title"));
				faq.setReply(rset.getString("reply"));
				faq.setFcategory(rset.getString("category_type"));
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