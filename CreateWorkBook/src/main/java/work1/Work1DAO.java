package work1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1)+ 1;
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
		try {
			PreparedStatement zpstmt = conn.prepareStatement(sql);
			
			zpstmt.setString(1, a);
			zpstmt.setString(2, work1Title);
			zpstmt.setString(3, userId);
			zpstmt.setString(4, getDate());
			int z = zpstmt.executeUpdate();
			System.out.print(z);
			return z;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public ArrayList<Work1DTO> getlist(String userID){
		String sql = "SELECT * FROM work1 WHERE userid=?";
		ArrayList<Work1DTO> list =new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userID);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Work1DTO work = new Work1DTO();
				work.setWork1Id(rs.getString(1));
				work.setWork1Title(rs.getString(2));
				work.setUserId(rs.getString(3));
				work.setWorkDate(rs.getString(4));

				list.add(work);
			}
			return list;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
