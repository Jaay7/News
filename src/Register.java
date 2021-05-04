import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Register")
public class Register extends HttpServlet {
  private static final long serialVersionUID = 1L;

  public Register() {
    super();
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.getWriter().append("Served at: ").append(request.getContextPath());
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request, response);
    PrintWriter out = response.getWriter();
    response.setContentType("text/html");
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
      if (rs != 0) {
        out.println("success");
        out.println("<a href='index.jsp' style='color: #596E57;'>Home</a>");
      }
      else {
        out.println("try again");
      }
    } catch (Exception e) {
      out.println(e);
    }
  }
}
