<%@page import="java.io.PrintWriter" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Blob" %>
<%@page import="java.io.IOException" %>

<% 
  String posttext = request.getParameter("posttext");
  String subposttext1 = request.getParameter("subposttext1");
  String subposttext2 = request.getParameter("subposttext2");
  String option = request.getParameter("option");
  try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jay", "data32026");
    PreparedStatement pStatement = connection.prepareStatement("insert into post values(?,?,?,?)");
    pStatement.setString(1, posttext);
    pStatement.setString(2, subposttext1);
    pStatement.setString(3, subposttext2);
    pStatement.setString(4, option);
    int rs = pStatement.executeUpdate();
    connection.commit();
    if (rs > 0) {
      response.sendRedirect("settings.html?upload=success");
    }
    else {
      response.sendRedirect("settings.html?upload=failed");
    }
  } catch (Exception e) {
    out.println(e);
  }
%>