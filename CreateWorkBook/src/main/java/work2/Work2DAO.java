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
		String sql = "INSERT INTO work2 VALUES(?,?,?,?,?,?,?,?,?)";
		String id2=""+getNext(wk.getUserId(),wk.getWork1Id());
		try {
			PreparedStatement spstmt = conn.prepareStatement(sql);
			spstmt.setString(1, wk.getUserId());
			spstmt.setInt(2, Integer.parseInt(wk.getWork1Id()));
			spstmt.setInt(3, Integer.parseInt(id2));
			spstmt.setString(4, wk.getWork2_Qw());
			spstmt.setString(5, wk.getWork2_view1());
			spstmt.setString(6, wk.getWork2_view2());
			spstmt.setString(7, wk.getWork2_view3());
			spstmt.setString(8, wk.getWork2_view4());
			spstmt.setString(9, wk.getWork2_value());
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
	public Work2DTO updateList(String userId, String work1Id,String work2Id) {
		String sql ="SELECT * FROM work2 WHERE userid=? AND work1id=? AND work2id=?";
		Work2DTO w2 =new Work2DTO();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, work1Id);
			pstmt.setString(3, work2Id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				w2.setWork2_Qw(rs.getString(4));
				w2.setWork2_view1(rs.getString(5));
				w2.setWork2_view2(rs.getString(6));
				w2.setWork2_view3(rs.getString(7));
				w2.setWork2_view4(rs.getString(8));
				w2.setWork2_value(rs.getString(9));
				
				return w2;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return w2;
	}
	public int update(Work2DTO dto) {
		String sql ="UPDATE work2 "
				+ "SET work2_qs=?, work2_view1=?, work2_view2=?, work2_view3=?, work2_view4=?, work2_value=? "
				+ "WHERE userid=? AND work1id=? AND work2id=? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getWork2_Qw());
			pstmt.setString(2, dto.getWork2_view1());
			pstmt.setString(3, dto.getWork2_view2());
			pstmt.setString(4, dto.getWork2_view3());
			pstmt.setString(5, dto.getWork2_view4());
			pstmt.setString(6, dto.getWork2_value());
			pstmt.setString(7, dto.getUserId());
			pstmt.setInt(8, Integer.parseInt(dto.getWork1Id()));
			pstmt.setInt(9, Integer.parseInt(dto.getWork2Id()));
			
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public void delete(String userId, String work1Id, String work2Id) {
		String sql="DELETE FROM work2 WHERE userid=? AND work1id=? AND work2id=?";
		
		try {
			PreparedStatement dp = conn.prepareStatement(sql);
			dp.setString(1, userId);
			dp.setString(2, work1Id);
			dp.setString(3, work2Id);
			dp.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Work2DTO> getWork2( String userId,String work1Id) {
		String sql ="SELECT * FROM work2 WHERE userid=? AND work1id=? ORDER BY work2id";
		ArrayList<Work2DTO> list = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, work1Id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Work2DTO w2 =new Work2DTO();
				w2.setWork2Id(rs.getString(3));
				w2.setWork2_Qw(rs.getString(4));
				w2.setWork2_view1(rs.getString(5));
				w2.setWork2_view2(rs.getString(6));
				w2.setWork2_view3(rs.getString(7));
				w2.setWork2_view4(rs.getString(8));
				w2.setWork2_value(rs.getString(9));
				list.add(w2);
			}
			return list;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public void wrong(String userid,int wrong){
		String sql ="INSERT INTO wrong values(?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setInt(2, wrong);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<Work2DTO> getwrong2(String userId, String work1Id) {
		String sql ="SELECT * FROM work2 WHERE userid=? AND work1id=? AND work2id IN (SELECT wrong FROM wrong WHERE userid=?)";
		ArrayList<Work2DTO> list = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, work1Id);
			pstmt.setString(3, userId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Work2DTO w2 =new Work2DTO();
				w2.setWork2Id(rs.getString(3));
				w2.setWork2_Qw(rs.getString(4));
				w2.setWork2_view1(rs.getString(5));
				w2.setWork2_view2(rs.getString(6));
				w2.setWork2_view3(rs.getString(7));
				w2.setWork2_view4(rs.getString(8));
				w2.setWork2_value(rs.getString(9));
				list.add(w2);
			}
			return list;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public ArrayList<Work2DTO> publgetwrong2(String userId, String work1Id,String makeUser) {
		String sql ="SELECT * FROM work2 WHERE userid=? AND work1id=? AND work2id IN (SELECT wrong FROM wrong WHERE userid=?)";
		ArrayList<Work2DTO> list = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, makeUser);
			pstmt.setString(2, work1Id);
			pstmt.setString(3, userId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Work2DTO w2 =new Work2DTO();
				w2.setWork2Id(rs.getString(3));
				w2.setWork2_Qw(rs.getString(4));
				w2.setWork2_view1(rs.getString(5));
				w2.setWork2_view2(rs.getString(6));
				w2.setWork2_view3(rs.getString(7));
				w2.setWork2_view4(rs.getString(8));
				w2.setWork2_value(rs.getString(9));
				list.add(w2);
			}
			return list;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public void wrongdel(String userid) {
		String sql ="DELETE FROM wrong WHERE userid=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
