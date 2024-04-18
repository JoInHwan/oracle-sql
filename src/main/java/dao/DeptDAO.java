package dao;
import java.util.*;
import java.sql.*;
import vo.Dept;

public class DeptDAO {
	// VO사용
	public static ArrayList<Dept> selectDeptList()
					throws Exception{
		// Dept의 배열과 같음
		ArrayList<Dept>list = new ArrayList<>();
		
		Connection conn = DBHelper.getConnection();
		String sql = "SELECT deptno deptNo,dname,loc FROM dept";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery() ;
		while(rs.next()) {
			Dept d = new Dept();
			d.deptNo = rs.getInt("deptNo");
			d.dname = rs.getString("dname");
			d.loc = rs.getString("loc");
			list.add(d);			
		}
		
		conn.close();
		return list;
	}
	
	// Map 사용
	public static ArrayList<HashMap<String, Object>> selectDeptOnOffList() 
														throws Exception {
		ArrayList<HashMap<String, Object>> list = new ArrayList<>();
		
		Connection conn = DBHelper.getConnection();
		String sql = "SELECT"
				+ " deptno deptNo, dname, loc, 'ON' onOff"
				+ " FROM dept";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			HashMap<String, Object> m = new HashMap<>();
			m.put("deptNo", rs.getInt("deptNo"));
			m.put("dname", rs.getString("dname"));
			m.put("loc", rs.getString("deptNo"));
			m.put("onOff", rs.getString("onOff"));
			list.add(m);
		}
		return list;
	}
}
