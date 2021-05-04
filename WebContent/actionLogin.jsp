<%@page import="java.io.PrintWriter" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.io.IOException" %>

<% 
  String email = request.getParameter("email");
  String password = request.getParameter("password");
  String username = "";
  try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jay", "data32026");
    PreparedStatement pStatement = connection.prepareStatement("select username,email,password from news where email=? and password=?");
    pStatement.setString(1, email);
    pStatement.setString(2, password);
    ResultSet rs = pStatement.executeQuery();
    if (rs.next()) {
      username = rs.getString("username");
      session.setAttribute("email", email);
      Cookie emailID = new Cookie("email", email);
      response.addCookie(emailID);
      response.sendRedirect("index.jsp?auth=success");
    }
    else {
      response.sendRedirect("login.jsp?auth=failed");
    }
  } catch (Exception e) {
    out.println(e);
  }
%>