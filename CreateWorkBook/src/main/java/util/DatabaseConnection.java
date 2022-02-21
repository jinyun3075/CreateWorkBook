package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {
	public static Connection getConnection() {
		try {
			String dbURL="jdbc:mysql://localhost:3306/workbook"; // workbook 위치에 스키마 이름 작성
			String dbID ="root"; // 루트 아이디
			String dbPW="root";  // 루트 비밀번호
			Class.forName("com.mysql.jdbc.Driver");
			
			return DriverManager.getConnection(dbURL,dbID,dbPW);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
