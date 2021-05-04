<%@page import="java.io.PrintWriter" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.io.IOException" %>

<% 
  String fname = request.getParameter("fname");
  String lname = request.getParameter("lname");
  String uname = request.getParameter("uname");
  String phoneno = request.getParameter("phoneno");
  try {
    String email = (String) session.getAttribute("email");
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jay", "data32026");
    PreparedStatement pStatement = connection.prepareStatement("update news set firstname=?,lastname=?,username=?,phone=? where email=?");
    pStatement.setString(1, fname);
    pStatement.setString(2, lname);
    pStatement.setString(3, uname);
    pStatement.setString(4, phoneno);
    pStatement.setString(5, email);
    int rs = pStatement.executeUpdate();
    connection.commit();
    if (rs > 0) {
      response.sendRedirect("profile.jsp?update=success");
    }
    else {
      response.sendRedirect("profile.jsp?update=failed");
    }
  } catch (Exception e) {
    out.println(e);
  }
%>