import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login extends HttpServlet {
  private static final long serialVersionUID = 1L;
  
  public Login() {
    super();
  }

  public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    PrintWriter out = response.getWriter();
    response.setContentType("text/html");
    String email = request.getParameter("email");
    @SuppressWarnings("unused")
    String password = request.getParameter("password");
    try {
      Class.forName("oracle.jdbc.driver.OracleDriver");
      Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jay", "data32026");
      PreparedStatement pStatement = connection.prepareStatement("select email,password from news where email=? and password=?");
      pStatement.setString(1, email);
      pStatement.setString(2, password);
      ResultSet rs = pStatement.executeQuery();
      if (rs.next()) {
        HttpSession session = request.getSession();
        session.setAttribute("email", email);
        session.setAttribute("password", password);
        out.println("<a href='index.jsp'>login</a>");
      }
    } catch (Exception e) {
      out.println(e);
    }
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request, response);
  }
}
