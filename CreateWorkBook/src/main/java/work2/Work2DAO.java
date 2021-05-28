package work2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
		String sql = "SELECT work2id FROM work2 WHERE userid=? and work1id=? ORDER BY work2id DESC";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userId);
			pstmt.setString(2,work1Id);
			rs= pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
			return 1;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int createQs(Work2DTO wk) {
		String sql = "INSERT INTO work2 VALUES(?,?,?,?,?,?,?,?)";
		String id2=""+getNext(wk.getUserId(),wk.getWork1Id());
		try {
			PreparedStatement spstmt = conn.prepareStatement(sql);
			spstmt.setString(1, wk.getUserId());
			spstmt.setString(2, wk.getWork1Id());
			spstmt.setString(3, id2);
			spstmt.setString(4, wk.getWork2_Qw());
			spstmt.setString(5, wk.getWork2_view1());
			spstmt.setString(6, wk.getWork2_view2());
			spstmt.setString(7, wk.getWork2_view3());
			spstmt.setString(8, wk.getWork2_view4());
			return spstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public ArrayList<Work2DTO> getList(String work1Id, String userId) {
		String sql ="SELECT work2id,work2_qs FROM work2 WHERE userid=? AND work1id=? ORDER BY work2id";
		ArrayList<Work2DTO> list = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, work1Id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Work2DTO w2 =new Work2DTO();
				w2.setWork2Id(rs.getString(1));
				w2.setWork2_Qw(rs.getString(2));
				
				list.add(w2);
			}
			return list;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
