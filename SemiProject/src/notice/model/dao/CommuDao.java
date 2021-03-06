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

import member.model.vo.Member;
import notice.model.vo.Commu;
import notice.model.vo.PageInfo;
import writer.model.vo.WProfile;

public class CommuDao {
	
	private Properties commuQuery = new Properties();
	
	public CommuDao() {
		String fileName = CommuDao.class.getResource("/sql/commu/commu-query.xml").getPath();
		
		try {
			commuQuery.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	
	// 소통게시판 글작성시 작가 검색기능에 쓸 작가리스트
	public List<Member> getWriterList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = commuQuery.getProperty("getWriterList");
		
		List<Member> writerList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Member member = new Member();
				member.setUserNo(rset.getInt("user_no"));
				member.setUserName(rset.getString("user_name"));
				member.setUserGrade(rset.getInt("user_grade"));
				member.setStatus(rset.getString("status"));
				
				writerList.add(member);				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return writerList;
	}

	
	// 소통 게시판 게시글 작성
	public int insertCommu(Connection conn, Commu commu) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = commuQuery.getProperty("insertCommu");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, commu.getCtitle());
			pstmt.setString(2, commu.getCcontent());
			pstmt.setInt(3, commu.getUser_no());
			pstmt.setInt(4, commu.getCwriter_no());
			
			result = pstmt.executeUpdate();
					
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	
	// 페이징 처리를 위해 리스트 총 갯수
	public int getListCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		String sql = commuQuery.getProperty("getListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
	
	
	// 소통게시판 총 게시글 리스트
	public List<Commu> selectList(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = commuQuery.getProperty("selectList");
		
		List<Commu> commuList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			// 페이지 설정
			int startRow = (pi.getPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow); // 페이지 시작 값
			pstmt.setInt(2, endRow);  // 페이지 끝 값
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Commu commu = new Commu();
				commu.setCommu_no(rset.getInt("commu_no"));
				commu.setCtitle(rset.getString("title"));
				commu.setCcontent(rset.getString("content"));
				commu.setUser_no(rset.getInt("user_no"));
				commu.setUser_id(rset.getString("user_id"));
				commu.setCreate_date(rset.getDate("create_date"));
				commu.setCreply(rset.getString("reply"));
				commu.setCount(rset.getInt("count"));
				commu.setCwriter_no(rset.getInt("writer_no"));
				commu.setCwriter_name(rset.getString("user_name"));
				commu.setStatus(rset.getString("status"));
				
				commuList.add(commu);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}		
		
		return commuList;
	}

	
	// 소통게시판 게시글 클릭시 상세페이지
	public Commu selectCommu(Connection conn, int commu_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = commuQuery.getProperty("selectCommu");
		
		Commu commu = null;
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, commu_no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				commu = new Commu();
				commu.setCommu_no(rset.getInt("commu_no"));
				commu.setCtitle(rset.getString("title"));
				commu.setCcontent(rset.getString("content"));
				commu.setUser_no(rset.getInt("user_no"));
				commu.setUser_id(rset.getString("user_id"));
				commu.setCreate_date(rset.getDate("create_date"));
				commu.setCreply(rset.getString("reply"));
				commu.setCount(rset.getInt("count"));
				commu.setCwriter_no(rset.getInt("writer_no"));
				commu.setCwriter_name(rset.getString("user_name"));
				commu.setStatus(rset.getString("status"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return commu;
	}

	
	// 내가 쓴 글 게시글 총 개수
	public int getMyListCount(Connection conn, int user_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int myListCount = 0;
		
		String sql = commuQuery.getProperty("getMyListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, user_no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				myListCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return myListCount;
	}

	// 내가 쓴 글 총 리스트 가져오기
	public List<Commu> selecMytList(Connection conn, PageInfo pi, int user_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = commuQuery.getProperty("selectMyList");
		
		List<Commu> commuMyList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, user_no);
			
			// 페이지 설정
			int startRow = (pi.getPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(2, startRow); // 페이지 시작 값
			pstmt.setInt(3, endRow);  // 페이지 끝 값
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Commu commu = new Commu();
				commu.setCommu_no(rset.getInt("commu_no"));
				commu.setCtitle(rset.getString("title"));
				commu.setCcontent(rset.getString("content"));
				commu.setUser_no(rset.getInt("user_no"));
				commu.setUser_id(rset.getString("user_id"));
				commu.setCreate_date(rset.getDate("create_date"));
				commu.setCreply(rset.getString("reply"));
				commu.setCount(rset.getInt("count"));
				commu.setCwriter_no(rset.getInt("writer_no"));
				commu.setCwriter_name(rset.getString("user_name"));
				commu.setStatus(rset.getString("status"));
				
				commuMyList.add(commu);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}		
		
		return commuMyList;
	}

	// 작가소개 페이지 리스트 총 개수 구하기
	public int selectWriterCount(Connection conn, String w_name) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = commuQuery.getProperty("selectWriterCount");
		int listCount = 0;
		
		// 검색값이 null이 아닌경우
		if(w_name != null) {
			sql = commuQuery.getProperty("selectSearchWriterCount");
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			if(w_name != null) {
				pstmt.setString(1, w_name);
			}
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}	
		
		return listCount;
	}

	// 페이징처리된 작가리스트 가져오기
	public List<WProfile> selectWriterList(Connection conn, PageInfo pi, String w_name) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = commuQuery.getProperty("selectWriterList");
		
		List<WProfile> writerList = new ArrayList<>();
		
		if(w_name != null) {
			sql = commuQuery.getProperty("selectSearchWriterList");
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			int index = 1;
			// 작가 검색시
			if(w_name != null) {
				pstmt.setString(index++, w_name);
			}
			
			pstmt.setInt(index++, startRow);
			pstmt.setInt(index, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				WProfile wprofile = new WProfile();
				wprofile.setWriter_no(rset.getInt("user_no"));
				wprofile.setWriter_name(rset.getString("user_name"));
				wprofile.setFile_path(rset.getString("file_path"));
				wprofile.setGreeting(rset.getString("greeting"));
				wprofile.setOrigin_file(rset.getString("origin_file"));
				wprofile.setChange_file(rset.getString("change_file"));
				
				writerList.add(wprofile);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}		
		
		return writerList;
	}

	
	// 작가마이페이지-소통리스트 총 갯수
	public int selectWCommuCount(Connection conn, int writer) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = commuQuery.getProperty("selectWCommuCount");
		int listCount = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, writer);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}					
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}

	// 작가마이페이지-소통리스트 총 리스트(페이징처리)
	public List<Commu> selectWCommuList(Connection conn, PageInfo pi, int writer) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = commuQuery.getProperty("selectWCommuList");
		
		List<Commu> WCommuList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, writer);
			
			// 페이지 설정
			int startRow = (pi.getPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(2, startRow); // 페이지 시작 값
			pstmt.setInt(3, endRow);  // 페이지 끝 값
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Commu commu = new Commu();
				commu.setCommu_no(rset.getInt("commu_no"));
				commu.setCtitle(rset.getString("title"));
				commu.setCcontent(rset.getString("content"));
				commu.setUser_no(rset.getInt("user_no"));
				commu.setUser_id(rset.getString("user_id"));
				commu.setCreate_date(rset.getDate("create_date"));
				commu.setCreply(rset.getString("reply"));
				commu.setCount(rset.getInt("count"));
				commu.setCwriter_no(rset.getInt("writer_no"));
				commu.setCwriter_name(rset.getString("user_name"));
				commu.setStatus(rset.getString("status"));
				
				WCommuList.add(commu);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return WCommuList;
	}


	// 작가 답변 update
	public int updateWCommu(Connection conn, int commu_no, String reply) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = commuQuery.getProperty("updateWCommu");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, reply);
			pstmt.setInt(2, commu_no);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}	
		
		return result;
	}


	// 게시글 수정
	public int updateCommu(Connection conn, int commu_no, String title, String content) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = commuQuery.getProperty("updateCommu");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, commu_no);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	// 게시글 삭제
	public int deleteCommu(Connection conn, int commu_no) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = commuQuery.getProperty("deleteCommu");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, commu_no);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	
}
