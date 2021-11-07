package writer.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import member.model.vo.Member;

import static common.JDBCTemplate.*;

import writer.model.vo.WProfile;
import writer.model.vo.WriterInfo;


public class WriterDao {
	
	private Properties writerQuery = new Properties();
	
	public WriterDao() {
		String fileName = WriterDao.class.getResource("/sql/writer/writer-query.xml").getPath();
		
		try {
			writerQuery.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 작가 회원정보 가져오기
	public WriterInfo selectWriter(Connection conn, int user_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = writerQuery.getProperty("selectWriter");
		
		WriterInfo writer = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, user_no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				writer = new WriterInfo();
				writer.setUser_no(rset.getInt("user_no"));
				writer.setId(rset.getString("user_id"));
				writer.setPwd(rset.getString("user_pwd"));
				writer.setName(rset.getString("user_name"));
				writer.setEmail(rset.getString("user_email"));
				writer.setPhone(rset.getString("user_phone"));
				writer.setAddress(rset.getString("user_grade"));
				writer.setEnrolldate(rset.getDate("enroll_date"));
				writer.setStatus(rset.getString("status"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return writer;
	}
	
	
	// 작가 프로필 + 자기소개 들고오기(회원번호)
	public WProfile selecWProfile(Connection conn, int user_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = writerQuery.getProperty("selectWProfile");
		
		WProfile wprofile = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, user_no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				wprofile = new WProfile();
				wprofile.setPro_no(rset.getInt("pro_no"));
				wprofile.setWriter_no(rset.getInt("writer_no"));
				wprofile.setFile_path(rset.getString("file_path"));
				wprofile.setGreeting(rset.getString("greeting"));
				wprofile.setOrigin_file(rset.getString("origin_file"));
				wprofile.setChange_file(rset.getString("change_file"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return wprofile;
	}

	// 처음 작가 프로필 수정
	public int insertWProfile(Connection conn, WProfile wprofile) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = writerQuery.getProperty("insertWProfile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, wprofile.getWriter_no());
			pstmt.setString(2, wprofile.getFile_path());
			pstmt.setString(3, wprofile.getGreeting());
			pstmt.setString(4, wprofile.getOrigin_file());
			pstmt.setString(5, wprofile.getChange_file());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}		
		
		return result;
	}

	// 작가 회원정보 수정
	public int updateWriterInfo(Connection conn, WriterInfo writerInfo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = writerQuery.getProperty("updateWriterInfo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, writerInfo.getName());
			pstmt.setString(2, writerInfo.getEmail());
			pstmt.setString(3, writerInfo.getPhone());
			pstmt.setString(4, writerInfo.getAddress());
			pstmt.setInt(5, writerInfo.getUser_no());
			
			result = pstmt.executeUpdate();
					
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}	
		
		return result;
	}
	
	// 작가 회원정보 안에있는 프로필 수정
	public int updateWProfile(Connection conn, WProfile upprofile) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = writerQuery.getProperty("updateWProfile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, upprofile.getFile_path());
			pstmt.setString(2, upprofile.getOrigin_file());
			pstmt.setString(3, upprofile.getChange_file());
			pstmt.setInt(4, upprofile.getWriter_no());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateWProfileGreeting(Connection conn, WProfile upprofile) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = writerQuery.getProperty("updateWProfileGreeting");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, upprofile.getGreeting());
			pstmt.setInt(2, upprofile.getWriter_no());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Member selecMember(Connection conn, int user_no) {
		Member writer = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = writerQuery.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, user_no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				writer = new Member();
				writer.setUserNo(rset.getInt("user_no"));
				writer.setUserId(rset.getString("user_id"));
				writer.setUserPwd(rset.getString("user_pwd"));
				writer.setUserName(rset.getString("user_name"));
				writer.setGender(rset.getString("gender"));
				writer.setUserEmail(rset.getString("user_email"));
				writer.setUserPhone(rset.getString("user_phone"));
				writer.setUserAddress(rset.getString("user_address"));
				writer.setUserGrade(rset.getInt("user_grade"));
				writer.setEnrollDate(rset.getDate("enroll_date"));
				writer.setStatus(rset.getString("status"));
				writer.setUserCertify(rset.getString("user_certify"));
				writer.setUserNickname(rset.getString("user_nickname"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
				
		return writer;
	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
