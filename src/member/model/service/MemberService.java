package member.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;

import member.model.dao.MemberDao;
import member.model.vo.Member;

public class MemberService {
	
	private MemberDao memberDao = new MemberDao();

	public Member loginMember(String userId, String userPwd) {
		Connection conn = getConnection();
		
		Member loginMember = memberDao.loginMember(conn, userId, userPwd);
		
		close(conn);
		
		return loginMember;
	}

	public int insertMember(Member member) {
		Connection conn = getConnection();
		
		int result = memberDao.insertMember(conn, member);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public Member updateMember(Member member) {
		Connection conn = getConnection();
		Member updatedMember = null;
		
		int result = memberDao.updateMember(conn, member);
		
		if(result > 0) {
			updatedMember = memberDao.selectMember(conn, member.getUserNo());
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return updatedMember;
	}

	public Member updatePwd(int userNo, String userPwd, String newPwd) {
		Connection conn = getConnection();
		Member updatedMember = null;
		
		int result = memberDao.updatePwd(conn, userNo, userPwd, newPwd);
		
		if(result > 0) {
			updatedMember = memberDao.selectMember(conn, userNo);
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);		
		
		return updatedMember;
	}
	
	public int deleteAccount(int userNo) {
		Connection conn = getConnection();
		// Member updatedMember = null;
		
		int result = memberDao.deleteAccount(conn, userNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}


}
