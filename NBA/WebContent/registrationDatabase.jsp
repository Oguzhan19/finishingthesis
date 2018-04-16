<%@ page import ="java.sql.*"
 %>
<%
  
    String user = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    String fname = request.getParameter("first_name");
    String lname = request.getParameter("last_name");
    String email = request.getParameter("email");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "gunslinger");
    Statement st = con.createStatement();  
    //ResultSet rs;
    int i = st.executeUpdate("insert into users(first_name, last_name, email, uname, pass, regdate) values ('" + fname + "','" + lname + "','" + email + "','" + user + "','" + pwd + "', CURDATE())");
    if (i > 0) {
        response.sendRedirect("login.jsp");
       // out.print("Registration Successfull!"+"<a href='login.jsp'>Go to Login</a>");
    } else {
        response.sendRedirect("index.jsp");
    }
%>
