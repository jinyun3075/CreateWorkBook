package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseConnection;
public class UserDAO {
	private Connection conn = DatabaseConnection.getConnection();
	private PreparedStatement pstmt;
	private ResultSet rs;
	public int login(String userID, String userPW) {
		String sql="SELECT userPW FROM userlist WHERE userID=? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPW)) {
					return 1; // 성공
				}else {
					return 2; // 비번실패
				}
			}
			return -1; // 아이디 없음
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2;// 데베문제
	}
	
	public int join(String userID, String userPW,String name) {
		String sql = "INSERT INTO userlist VALUES(?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			pstmt.setString(2, userPW);
			pstmt.setString(3, name);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
		
	}
	

}
