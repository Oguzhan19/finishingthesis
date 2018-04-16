package nba.web.jdbc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.sql.DataSource;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TestServlet
 */
@WebServlet("/TestServlet")
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// Define datasource-connection pool for resource injection
	@Resource(name = "jdbc/users")
	private DataSource dataSource;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// step 1: set up the printwriter
		PrintWriter out = response.getWriter();
		response.setContentType("text/plain");
		// Step 2:Get a connection to the database
		java.sql.Connection myConn = null;
		java.sql.Statement myStmt = null;
		ResultSet myRs = null;

		try {
			myConn = dataSource.getConnection();
			// step 3: create a sql statements
			String sql = "select * from usersdata";
			myStmt =  myConn.createStatement();
			// step 4: execute SQL query
			myRs = myStmt.executeQuery(sql);
			// step 5: Process the result set
			while (myRs.next()) {
				String username = myRs.getString("UserName");
				out.println("User name is: "+username);
				String fullname = myRs.getString("Name and Surname");
				out.println("Full name is: "+fullname);
				String email = myRs.getString("email");
				out.println("Email address is :"+email);
				String userid = myRs.getString("userid");
				out.println("User id is :"+userid);
				
			}
		} catch (Exception exc) {
			exc.printStackTrace();
		}
	}

}
