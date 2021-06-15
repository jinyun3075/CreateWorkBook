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
				return rs.getInt(1) + 1;
			}
			return 1; // 첫번째 게시물인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	public int get(String userId) {
		String SQL = "SELECT work1id FROM work1 WHERE userid=? ORDER BY work1id DESC";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public int delete(String userID, String work1Id) {
		String sql = "DELETE FROM work1 WHERE userid=? AND work1id=?";
		Qdelete(userID, work1Id);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			pstmt.setString(2, work1Id);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public void Qdelete(String userID, String work1Id) {
		String d = "DELETE FROM work2 WHERE userid=? AND work1id=?";
		try {
			pstmt = conn.prepareStatement(d);
			pstmt.setString(1, userID);
			pstmt.setString(2, work1Id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int makeWork1(String work1Title, String userId) {
		String sql = "INSERT INTO work1 VALUES(?,?,?,?,'1','0')";
		int b = getNext(userId);
		String a = "" + b;
		try {
			PreparedStatement zpstmt = conn.prepareStatement(sql);

			zpstmt.setString(1, a);
			zpstmt.setString(2, work1Title);
			zpstmt.setString(3, userId);
			zpstmt.setString(4, getDate());
			int z = zpstmt.executeUpdate();
			return z;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public int makeAndget(String work1Title, String userId) {
		String sql = "INSERT INTO work1 VALUES(?,?,?,?,'1','0')";
		int b = getNext(userId);
		String a = "" + b;
		try {
			PreparedStatement zpstmt = conn.prepareStatement(sql);

			zpstmt.setString(1, a);
			zpstmt.setString(2, work1Title);
			zpstmt.setString(3, userId);
			zpstmt.setString(4, getDate());
			zpstmt.executeUpdate();
			return b;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public ArrayList<Work1DTO> getlist(String userID, int pageNumber, String serch) {
		String sql = "SELECT * FROM work1 WHERE userid=? AND work1title LIKE ? ORDER BY workdate LIMIT 5 OFFSET ?";
		ArrayList<Work1DTO> list = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			pstmt.setString(2, serch);
			pstmt.setInt(3, (pageNumber - 1) * 5);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Work1DTO work = new Work1DTO();
				work.setWork1Id(rs.getString(1));
				work.setWork1Title(rs.getString(2));
				work.setUserId(rs.getString(3));
				work.setWorkDate(rs.getString(4));

				list.add(work);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList<Work1DTO> publicgetlist(String serch, int pageNumber) {
		String sql = "SELECT * FROM work1 WHERE publ='0' AND work1title LIKE ? ORDER BY workdate LIMIT 10 OFFSET ?";
		ArrayList<Work1DTO> list = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, serch);
			pstmt.setInt(2, (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Work1DTO work = new Work1DTO();
				work.setWork1Id(rs.getString(1));
				work.setWork1Title(rs.getString(2));
				work.setUserId(rs.getString(3));
				work.setWorkDate(rs.getString(4));
				work.setCli(rs.getString(6));
				list.add(work);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean nextPage(int pageNumber, String serch,String userid) {
		String SQL = "SELECT * FROM work1 WHERE userid=? AND work1title LIKE ? ORDER BY workdate LIMIT 5 OFFSET ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userid);
			pstmt.setString(2, serch);
			pstmt.setInt(3, (pageNumber - 1) * 5);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	public boolean publnextPage(int pageNumber, String serch) {
		String SQL = "SELECT * FROM work1 WHERE publ='0' AND work1title LIKE ? ORDER BY workdate LIMIT 5 OFFSET ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, serch);
			pstmt.setInt(2, (pageNumber - 1) * 5);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public String shere(String work1Id, String userId) {
		String sql = "SELECT publ FROM work1 WHERE work1id=? AND userid=?";
		String rsult = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, work1Id);
			pstmt.setString(2, userId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				rsult = rs.getString(1);
			}
			return rsult;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rsult;
	}

	public int change(String work1Id, String userId, String val) {
		String sql = "UPDATE work1 SET publ=? WHERE work1id=? AND userid=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, val);
			pstmt.setString(2, work1Id);
			pstmt.setString(3, userId);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public void cliUp(String work1Id, String userId) {
		String sql = "UPDATE work1 SET cli=? WHERE work1id=? AND userid=?";
		int va = plus(work1Id, userId);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, va);
			pstmt.setString(2, work1Id);
			pstmt.setString(3, userId);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public int plus(String work1Id, String userId) {
		String sql = "SELECT cli from work1 WHERE work1id=? AND userid=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, work1Id);
			pstmt.setString(2, userId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return -1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;

	}
	public void Update(String work1title ,String work1Id, String userId) {
		String sql = "UPDATE work1 SET work1title=? WHERE work1id=? AND userid=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, work1title);
			pstmt.setString(2, work1Id);
			pstmt.setString(3, userId);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
