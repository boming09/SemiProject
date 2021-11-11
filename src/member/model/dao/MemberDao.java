package member.model.dao;

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

import admin.model.vo.GradeList;
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
			pstmt.setString(4, member.getGender());
			pstmt.setString(5, member.getUserPhone());
			pstmt.setString(6, member.getUserEmail());
			pstmt.setString(7, member.getUserAddress());
			
			result = pstmt.executeUpdate();		
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
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
			pstmt.setString(5, member.getUserNickname());
			pstmt.setInt(6, member.getUserNo());
			
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

	public Member searchId(Connection conn, String userName, String userEmail) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = memberQuery.getProperty("searchId");
		Member member = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userName);
			pstmt.setString(2, userEmail);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				member.setUserNo(rset.getInt("user_no"));
				member.setUserId(rset.getString("user_id"));
				member.setUserPwd(rset.getString("user_pwd"));
				member.setUserName(rset.getString("user_name"));
				member.setGender(rset.getString("gender"));
				member.setUserEmail(rset.getString("user_email"));
				member.setUserPhone(rset.getString("user_phone"));
				member.setUserAddress(rset.getString("user_address"));
				member.setUserGrade(rset.getInt("user_grade"));
				member.setEnrollDate(rset.getDate("enroll_date"));
				member.setStatus(rset.getString("status"));
				member.setUserCertify(rset.getString("user_certify"));
				member.setUserNickname(rset.getString("user_nickname"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}		
		
		return member;
	}
	
	public Member searchPw(Connection conn, String userId, String userName, String userEmail) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = memberQuery.getProperty("searchPw");
		Member member = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, userName);
			pstmt.setString(3, userEmail);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
						member.setUserNo(rset.getInt("user_no"));
						member.setUserId(rset.getString("user_id"));
						member.setUserPwd(rset.getString("user_pwd"));
						member.setUserName(rset.getString("user_name"));
						member.setGender(rset.getString("gender"));
						member.setUserEmail(rset.getString("user_email"));
						member.setUserPhone(rset.getString("user_phone"));
						member.setUserAddress(rset.getString("user_address"));
						member.setUserGrade(rset.getInt("user_grade"));
						member.setEnrollDate(rset.getDate("enroll_date"));
						member.setStatus(rset.getString("status"));
						member.setUserCertify(rset.getString("user_certify"));
						member.setUserNickname(rset.getString("user_nickname"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}	
		
		return member;
	}


	public List<Member> nSelectList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = memberQuery.getProperty("nSelectList");
		List<Member> memberList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Member member = new Member();
				member.setUserNo(rset.getInt("user_No"));
				member.setUserId(rset.getString("user_Id"));
				member.setUserNickname(rset.getString("user_NickName"));
				member.setUserName(rset.getString("user_Name"));
				member.setGender(rset.getString("gender"));
				member.setUserAddress(rset.getString("user_Address"));
				member.setUserPhone(rset.getString("user_Phone"));
				member.setEnrollDate(rset.getDate("enroll_Date"));
				
				memberList.add(member);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return memberList;
	}

	public int nUpdateMember(Connection conn, int userNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = memberQuery.getProperty("nUpdateMember");
		
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

	public int uDeleteMember(Connection conn, int userNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = memberQuery.getProperty("nDeleteMember");
		
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

	public List<GradeList> gSelectList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<GradeList> gradeList = new ArrayList<>();
		String sql = memberQuery.getProperty("gSelectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				GradeList grade = new GradeList();
				
				grade.setwNo(rset.getInt("wck_no"));
				grade.setuNo(rset.getInt("user_no"));
				grade.setTitle(rset.getString("title"));
				grade.setUserId(rset.getString("user_Id"));
				grade.setUserNickName(rset.getString("user_NickName"));
				grade.setUserName(rset.getString("user_name"));
				grade.setCreate_date(rset.getDate("create_date"));
				
				gradeList.add(grade);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		return gradeList;
	}

	public int gUpdateMember(Connection conn, int uNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = memberQuery.getProperty("gUpdateMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, uNo);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int gUpdate2Member(Connection conn, int wNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = memberQuery.getProperty("gUpdate2Member");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, wNo);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int gDeleteMember(Connection conn, int wNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = memberQuery.getProperty("gDeleteMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, wNo);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int idCheck(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String sql = memberQuery.getProperty("idCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}		
		
		return result;
	}

	public int nicknameCheck(Connection conn, String userNickname) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String sql = memberQuery.getProperty("nicknameCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userNickname);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}		
		
		return result;
	}
		
}
