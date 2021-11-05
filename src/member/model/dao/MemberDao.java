package member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import static common.JDBCTemplate.*;
import member.model.vo.Member;

public class MemberDao {
	
	private Properties memberQuery = new Properties();
	
	public MemberDao() {
		memberQuery = new Properties();
		String fileName = MemberDao.class.getResource("/sql/member/member-query.xml").getPath();
		try {
			memberQuery.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public Member loginMember(Connection conn, String userId, String userPwd) {
		Member loginUser = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = memberQuery.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginUser = new Member(rset.getInt("user_no")
									 , rset.getString("user_id")
									 , rset.getString("user_pwd")
									 , rset.getString("user_name")
									 , rset.getString("gender")
									 , rset.getString("user_email")
									 , rset.getString("user_phone")
									 , rset.getString("user_address")
									 , rset.getInt("user_grade")
									 , rset.getDate("enroll_date")
									 , rset.getString("status")
									 , rset.getString("user_certify")
									 , rset.getString("user_nickname"));
			}			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}	
		
		return loginUser;
	}

	public int insertMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		int result = 0;
		ResultSet rset = null;
		String sql = memberQuery.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, member.getUserId());
			pstmt.setString(2, member.getUserPwd());
			pstmt.setString(3, member.getUserName());
			pstmt.setString(4, member.getUserEmail());
			pstmt.setString(5, member.getUserPhone());
			pstmt.setString(6, member.getUserAddress());
			
			result = pstmt.executeUpdate();		
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateMember(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = memberQuery.getProperty("updateMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getUserName());
			pstmt.setString(2, member.getUserPhone());
			pstmt.setString(3, member.getUserEmail());
			pstmt.setString(4, member.getUserAddress());
			pstmt.setInt(5, member.getUserNo());
			
			result = pstmt.executeUpdate();
						
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}		
		
		return result;
	}

	public Member selectMember(Connection conn, int userNo) {
		Member updatedMember = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = memberQuery.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				updatedMember = new Member(rset.getInt("user_no")
									 , rset.getString("user_id")
									 , rset.getString("user_pwd")
									 , rset.getString("user_name")
									 , rset.getString("gender")
									 , rset.getString("user_email")
									 , rset.getString("user_phone")
									 , rset.getString("user_address")
									 , rset.getInt("user_grade")
									 , rset.getDate("enroll_date")
									 , rset.getString("status")
									 , rset.getString("user_certify")
									 , rset.getString("user_nickname"));
			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
				
		return updatedMember;
	}

	public int updatePwd(Connection conn, int userNo, String userPwd, String newPwd) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = memberQuery.getProperty("updatePwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, newPwd);
			pstmt.setInt(2, userNo);
			pstmt.setString(3, userPwd);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int deleteAccount(Connection conn, int userNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = memberQuery.getProperty("deleteAccount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}

}
