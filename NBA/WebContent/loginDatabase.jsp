<%@ page import ="java.sql.*" %>

<%
    String username = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users",
            "root", "gunslinger");
     Statement st = con.createStatement();
 
    ResultSet rs;
    rs = st.executeQuery("select * from users where uname='" + username + "' and pass='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("username", username);
        // session.setAttribute("id", id);
        //session.getAttribute("id");
        
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("profile.jsp");
    } else {
        out.println("Invalid password <a href='login.jsp'>try again</a>");
    }
%>