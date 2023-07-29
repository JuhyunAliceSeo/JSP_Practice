package jsp.sjh.enp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jsp.sjh.dto.DeptDto;

public class DeptDao {

	private String driver = "oracle.jdbc.driver.OracleDriver";
	// 오라클을 사용하므로 oracle드라이버를 넣어서 초기화
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String uid = "scott";
	private String upw = "tiger";
	// DB에 접근하기 위해 id와 pw를 입력한다.

	public DeptDao() {
		try {
			// 객체를 동적으로 메모리에 올림(new 드라이버)
			// driver를 객체생성하여 메모리에 올린다 = 동적생성
			// 이때 driver는 클래스상단에 초기화한 값
			Class.forName(driver);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int deleteDept(int deptno) {
		int result = 0 ;
		Connection con = null;
		PreparedStatement stmt = null;
		String query = "delete from dept where deptno = ?";

		try {
			con = DriverManager.getConnection(url, uid, upw);
			stmt = con.prepareStatement(query);
			stmt.setInt(1, deptno);
			
			stmt.executeQuery();
			result = stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// ※제일 나중에 연거를 먼저 닫아줘야한다. Connection, Statement, ResultSet순서로
			// 열었으므로 거꾸로 닫아준다.
			try {
				if (stmt != null)
					stmt.close();
				if (con != null)
					con.close();

			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return result;

	}

	
	
	public int insertDept(int deptno, String dname, String loc) {
		int result = 0 ;
		Connection con = null;
		PreparedStatement stmt = null;
		String query = "insert into dept(deptno,dname,loc) values(?,?,?)";

		try {
			con = DriverManager.getConnection(url, uid, upw);
			stmt = con.prepareStatement(query);
			stmt.setInt(1, deptno);
			stmt.setString(2, dname);
			stmt.setString(3, loc);
			
			stmt.executeQuery();
			result = stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// ※제일 나중에 연거를 먼저 닫아줘야한다. Connection, Statement, ResultSet순서로
			// 열었으므로 거꾸로 닫아준다.
			try {
				if (stmt != null)
					stmt.close();
				if (con != null)
					con.close();

			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return result;

	}

	public List<DeptDto> getDepts() {
		// 테이블을 가져올때 Dto는 한 행을 객체로 보고 한 줄을 그대로 가져온다.
		// 메모리에 연속된방을 잡는 ArrayList을 리턴타입으로 설정해준다.
		ArrayList<DeptDto> dtos = new ArrayList<DeptDto>();

		// Connection, Statement, ResultSet 3종세트를 순서대로 객체생성한다.
		// 이때 import할시 java.sql에 있는 인터페이스를 가져와야한다!!(※주의)
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			String query = "select*from dept"; // 가지고 오고자 하는 쿼리문을 넣어준다
			con = DriverManager.getConnection(url, uid, upw); // 내어플리케이션이 오라클에 접속(connection)
			stmt = con.prepareStatement(query); // Preparedstatement(stmt)=커넥션객체에서 빨대가져옴(쿼리보낼거야)
			stmt.executeQuery(); // 빨대에서 쿼리를 오라클까지 전달하는 과정=채팅처럼 sql구문을 엔터쳐서 전달하면
			rs = stmt.executeQuery(); // 결과를 ResultSet으로 받아옴

			// 반복문을 사용해서 ArrayList에 가져온 데이터를 집어넣는다
			while (rs.next()) { // 데이터 한줄씩 가져오도록 해야니까 while문으로 돌림
				int deptno = rs.getInt("deptno"); // 자바객체로 바꾸기
				String dname = rs.getString("dname");
				String loc = rs.getString("loc");

				DeptDto dto = new DeptDto(deptno, dname, loc);

				dtos.add(dto); // 자바 배열에 가져온 데이터를 넣음
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// ※제일 나중에 연거를 먼저 닫아줘야한다. Connection, Statement, ResultSet순서로
			// 열었으므로 거꾸로 닫아준다.
			try {
				if (rs != null)
					rs.close(); // 닫아줘야하는이유: 메모리 아낄 수 있어서?
				if (stmt != null)
					stmt.close();
				if (con != null)
					con.close();

			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return dtos;

	}

}