package notice.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;
import static common.JDBCTemplate.*;
import notice.model.vo.One;

public class OneDao {
	
	private Properties oneQuery = new Properties();
	
	public OneDao() {
		String fileName = FaqDao.class.getResource("/sql/one/one-query.xml").getPath();
		
		try {
			oneQuery.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	
	// 1:1문의하기 작성
	public int insertOne(Connection conn, One one) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = oneQuery.getProperty("insertOne");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, one.getOtitle());
			pstmt.setString(2, one.getOcontent());
			pstmt.setInt(3, one.getOwriter());
			pstmt.setString(4, one.getFile_path());
			pstmt.setString(5, one.getOrigin_file());
			pstmt.setString(6, one.getChange_file());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
