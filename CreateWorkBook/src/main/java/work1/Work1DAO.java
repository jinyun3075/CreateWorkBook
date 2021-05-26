package work1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import util.DatabaseConnection;

public class Work1DAO {

	private Connection conn = DatabaseConnection.getConnection();
	private PreparedStatement pstmt;
	private ResultSet rs;

	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; // 데이터베이스 오류
	}
	
	public int getNext(String userId) {
		String SQL = "SELECT work1id FROM work1 WHERE userid=? ORDER BY work1id DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return Integer.parseInt(rs.getString(1)) + 1;
			}
			return 1; // 첫번째 게시물인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	public int makeWork1(String work1Title, String userId) {
		String sql="INSERT INTO work1 VALUES(?,?,?,?)";
		int b =getNext(userId);
		String a=""+b;
		if(work1Title!=null && b>0) {			
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,a);
			pstmt.setString(2, work1Title);
			pstmt.setString(3, userId);
			pstmt.setString(4,getDate());
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		}
		return -1;
	}
}
