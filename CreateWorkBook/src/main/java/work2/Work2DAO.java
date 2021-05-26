package work2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseConnection;

public class Work2DAO {
	private Connection conn = DatabaseConnection.getConnection();
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public int makeWork2(String userId, String work1Id,
			String qs, String view1,String view2 ,String view3,String view4) {
			String a =""+getNext(userId,work1Id);
		String sql="INSERT INTO work2 VALUES(?,?,?,?,?,?,?)";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, work1Id);
			pstmt.setString(3, a);
			pstmt.setString(4,qs);
			pstmt.setString(5,view1);
			pstmt.setString(6,view2);
			pstmt.setString(7,view3);
			pstmt.setString(8,view4);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return -1;
	}
	
	public int getNext(String userId, String work1Id) {
		String sql = "SELECT work2id FROM work2 WHERE userid='?' and work1id='?' ORDER BY work2id DESC";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userId);
			pstmt.setString(2,work1Id);
			rs= pstmt.executeQuery();
			if(rs.next()) {
				return Integer.valueOf(rs.getString(1))+1;
			}
			return 1;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
