<%@page import="java.io.PrintWriter" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.io.IOException" %>

<% 
  String firstname = request.getParameter("firstname");
  String lastname = request.getParameter("lastname");
  String username = request.getParameter("username");
  String email = request.getParameter("email");
  String password = request.getParameter("password");
  String cpassword = request.getParameter("cpassword");
  String phone = request.getParameter("phone");
  try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jay", "data32026");
    PreparedStatement pStatement = connection.prepareStatement("insert into news values(?,?,?,?,?,?,?)");
    pStatement.setString(1, firstname);
    pStatement.setString(2, lastname);
    pStatement.setString(3, username);
    pStatement.setString(4, email);
    pStatement.setString(5, password);
    pStatement.setString(6, cpassword);
    pStatement.setString(7, phone);
    int rs = pStatement.executeUpdate();
    connection.commit();
    if (rs > 0) {
      session.setAttribute("email", email);
      response.sendRedirect("index.jsp?auth=success");
    }
    else {
      response.sendRedirect("register.jsp?auth=failed");
    }
  } catch (Exception e) {
    out.println(e);
  }
%>