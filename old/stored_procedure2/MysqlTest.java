import java.sql.*;

public class MysqlTest {	
	private String user = "popi";
	private String pw = "db1004";
	private String addr = "jdbc:mysql://10.73.44.20/popidb";
	
	public void procTest() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		Connection c = DriverManager.getConnection(addr,user,pw);
		System.out.println("Connection OK");
		
		CallableStatement cs = c.prepareCall("{CALL SP_TEST1(?,?)}");		

		//set inout parameter
		cs.registerOutParameter(2,Types.INTEGER);
		//set ?
		cs.setInt(1,  2);
		cs.setInt(2,  10);
		
		boolean hasResult = cs.execute();
		
		if (hasResult) {
			ResultSet rs = cs.getResultSet();
			
			while (rs.next()) {
				String name = rs.getString("NAME");
				System.out.println(name);
			}			
			System.out.println("result 1 end");
			
		}

		hasResult = cs.getMoreResults();
		if (hasResult) {
			ResultSet rs = cs.getResultSet();
			
			while (rs.next()) {
				String name = rs.getString("LOCATION");
				System.out.println(name);
			}			
			System.out.println("result 2 end");
		}
		
		int out = cs.getInt(2);
		System.out.printf("out = %d\n", out);
		cs.close();
		c.close();
	
	}
}
