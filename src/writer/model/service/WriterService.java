package writer.model.service;

import static common.JDBCTemplate.*;
import java.sql.Connection;

import member.model.vo.Member;
import writer.model.dao.WriterDao;
import writer.model.vo.WProfile;
import writer.model.vo.WriterInfo;

public class WriterService {
	
	WriterDao writerDao = new WriterDao();
	
	// 작가 회원 정보 가져오기(등급 20 => 이건 로그인 후 마이페이지 버튼 클릭시 걸러줌)
	public WriterInfo selectWriter(int user_no) {
		Connection conn = getConnection();
		
		WriterInfo writer = writerDao.selectWriter(conn, user_no);
		
		//조회기 때문에 커밋 롤백 필요 없음
		close(conn);		
		
		return writer;
	}
	
	// 작가 프로필 + 자기소개 들고오기(회원번호)
	public WProfile selectWProfile(int user_no) {
		Connection conn = getConnection();
		
		WProfile wprofile = writerDao.selecWProfile(conn, user_no);
		
		close(conn);
		
		return wprofile;
	}

	// 처음 작가 프로필 수정
	public int insertWProfile(WProfile wprofile) {
		Connection conn = getConnection();
		
		int result = writerDao.insertWProfile(conn, wprofile);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	// 작가 회원정보 수정
	public int updateWriterInfo(WriterInfo writerInfo) {
		Connection conn = getConnection();
		
		// writerInfo 안에있는 회원정보 먼저 업데이트 
		int infoResult = writerDao.updateWriterInfo(conn, writerInfo);
		
		// writerInfo 안에있는 프로필 업데이트
		WProfile upprofile = writerInfo.getWprofile();
		
		int proResult1 = 0;
		int proResult11 = 0;
		int proResult2 = 0;
		int proResult22 = 0;
		if(upprofile.getDelete_file() != null) {
			proResult1 = writerDao.updateWProfile(conn, upprofile);
			proResult11++;
		} 
		if(upprofile.getGreeting() != null) {
			proResult2 = writerDao.updateWProfileGreeting(conn, upprofile);
			proResult22++;
		}
				
		int result = 0;
		if(infoResult > 0 && proResult1 == proResult11 && proResult2 == proResult22) {
			commit(conn);
			result = 1;
		} else {
			rollback(conn);
		}
		
		return result;
	}

	// 로그인 유저 찾아오기
	public Member selectMember(int user_no) {
		Connection conn = getConnection();
		
		Member writer = writerDao.selecMember(conn, user_no);
		
		close(conn);
		
		return writer;
	}

}
