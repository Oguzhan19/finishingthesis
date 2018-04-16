package nba.web.jdbc;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class UsersDbUtil {
	private DataSource dataSource;

	public UsersDbUtil(DataSource theDataSource) {

		dataSource = theDataSource;
	}

	public List<Users> getUsers() throws Exception {
		List<Users> users = new ArrayList();
		java.sql.Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;
		try {
			// get a connection
			myConn = dataSource.getConnection();
			// create sql statement
			String sql = "select * from usersdata order by userName";
			// execute the query
			myRs = myStmt.executeQuery(sql);
			// process result set
			while (myRs.next()) {
				// retrieve data from result set row
				String userName = myRs.getString("userName");
				int userId = myRs.getInt("userId");
				String fullname = myRs.getString("fullname");
				String email = myRs.getString("email");
				String password = myRs.getString("password");
				String userType = myRs.getString("userType");
				// create new user object
				Users tempUsers = new Users(userName, userId, fullname, email, password, userType);
				// add it to the list of students
				users.add(tempUsers);
			}
			return users;
		} finally {
			// close JDBC objects
			close(myConn, myStmt, myRs);
		}

	}

	private void close(java.sql.Connection myConn, Statement myStmt, ResultSet myRs) {
		// TODO Auto-generated method stub
		try {
			if (myRs != null) {
				myRs.close();
				if (myStmt != null) {
					myStmt.close();
				}
				if (myConn != null) {
					myConn.close();
				}
			}

		} catch (Exception exc) {
			exc.printStackTrace();
		}
	}
}
