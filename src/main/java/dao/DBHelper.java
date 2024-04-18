package dao;
import java.io.FileReader;
import java.sql.*;
import java.util.Properties;

public class DBHelper {
	public static Connection getConnection() throws Exception{
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		//System.out.println("드라이브로딩성공");
		
		//String dbUrl = "jdbc:oracle:thin:@localhost:1521:orcl";
		//String dbUser = "admin";
		//String dbPw = "java1234";
		
		// 로컬 PC의 Properties파일, 읽어오기
		FileReader fr = new FileReader("C:\\Users\\SAMSUNG\\Desktop\\EclipseFile\\eclipse\\auth\\oracleDB.properties");
		Properties prop = new Properties();
		prop.load(fr);
		
		String dbUrl = (prop.getProperty("dbUrl"));
		String dbUser = (prop.getProperty("dbUser"));
		String dbPw =	(prop.getProperty("dbPw"));
		//System.out.println("dbUrl : " + dbUrl);
		//System.out.println("dbUser : " + dbUser);
		//System.out.println("dbPw : " + dbPw);
		
		
		Connection conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
		
		
		fr.close();
		return conn;
	}
	
	//getConnection()메서드 디버깅용 테스트 코드
	public static void main(String[]args) throws Exception{
		Connection conn = new DBHelper().getConnection();
		System.out.println(conn);
	}
}
