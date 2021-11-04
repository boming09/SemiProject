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
									 , rset.getString("user_email")
									 , rset.getString("user_phone")
									 , rset.getString("user_address")
									 , rset.getInt("user_grade")
									 , rset.getDate("enroll_date")
									 , rset.getString("status"));
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
		ResultSet rset = null;
		String sql = memberQuery.getProperty("loginMember");
		
		return 0;
	}

}
