<%@page import="java.io.PrintWriter" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.io.IOException" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:400,600,700"/>
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
  <!-- <link rel="stylesheet" href="stylesheets/styles.css"/> -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
  <meta charset="UTF-8">
  <title>COVID News</title>
</head>

    

<body>
  <div class="tabbar-div">
    <span style="flex: 1 auto;"></span>
    <h3>COVID</h3>
    <span style="flex: 1 auto;"></span>
    <a href="index.jsp">Home</a>
  </div>
  
  <div class="container">
    <div class="main-div">
    <%

  try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jay", "data32026");
    PreparedStatement pStatement = connection.prepareStatement("select posttext,subposttext1,subposttext2,optiontype from post where optiontype=?");
    pStatement.setString(1, "covid");
    ResultSet rs = pStatement.executeQuery();
    while (rs.next()) {
      
    %>
      <div id="content-headlines" >
        <span class="boxes" style="margin-top: 20px; flex-direction: column;">
          <div class="fcsentences" style="font-size: 19px;">
            <a><%=rs.getString("posttext")%></a> 
            <p style="color: #888888; font-weight: 400; font-size: 13px;">The Indian Express</p> 
          </div>
          <ul>
            <li>
              <div class="fcsentences">
                <a><%=rs.getString("subposttext1")%></a> 
                <p style="color: #888888; font-weight: 400; font-size: 13px;">The Indian Express</p> 
              </div>
            </li>
            <li>
              <div class="fcsentences">
                <a><%=rs.getString("subposttext2")%></a> 
                <p style="color: #888888; font-weight: 400; font-size: 13px;">The Indian Express</p> 
              </div>
            </li>
          </ul>
          <button id="button">View Full coverage</button>
        </span>
      </div>
    
    <%}
    } catch (Exception e) {
      out.println(e);
    } 
    %>
    </div>
  </div>
</body>
<style>
  *{
	  margin: 0px;
	  padding: 0px;
	  box-sizing: border-box;
	  font-family: 'Nunito' ,sans-serif;
  }
  @font-face {
  font-family: 'Material Icons';
  font-style: normal;
  font-weight: 400;
  src: url(https://example.com/MaterialIcons-Regular.eot); /* For IE6-8 */
  src: local('Material Icons'),
    local('MaterialIcons-Regular'),
    url(https://example.com/MaterialIcons-Regular.woff2) format('woff2'),
    url(https://example.com/MaterialIcons-Regular.woff) format('woff'),
    url(https://example.com/MaterialIcons-Regular.ttf) format('truetype');
}
.tabbar-div {
  height: 65px;
  min-width: 100%;
  background-color: #31313107;
  flex-direction: row;
  padding: 18px;
  justify-content: space-between;
  display: flex;
  flex: 1;
  backdrop-filter: blur(5px);
  z-index: 1;
  position: fixed;
  align-items: center;
  border-bottom: 1px solid #f0f0f036;
  box-shadow: 0px 1px 10px #24242488;
}
.material-icons {
  font-family: 'Material Icons';
  font-weight: normal;
  font-style: normal;
  font-size: 24px;  /* Preferred icon size */
  display: inline-block;
  line-height: 1;
  text-transform: none;
  letter-spacing: normal;
  word-wrap: normal;
  white-space: nowrap;
  direction: ltr;
  padding-right: 10px;
  /* Support for all WebKit browsers. */
  -webkit-font-smoothing: antialiased;
  /* Support for Safari and Chrome. */
  text-rendering: optimizeLegibility;

  /* Support for Firefox. */
  -moz-osx-font-smoothing: grayscale;

  /* Support for IE. */
  font-feature-settings: 'liga';
  cursor: pointer;
}
  a{
  	color: #000;
	  text-decoration: none;
    padding: 20px;
  }
  .container {
	display: flex;
	align-items: center;
	padding: 50px;
  align-self: center;
  justify-content: center;
  backdrop-filter: blur(10px);
  }
  .main-div {
  width: 50%;
  /* margin: 0px auto; */
  padding: 10px;
  align-self: center;
  display: flex;
  flex-direction: column;
}

#button {
  outline: none;
  border: none;
  color: #596E57;
  background: none;
  /* font-size: 13px; */
}
.content-headlines {
  display: flex;
  flex-direction: column;
}
.boxes {
  border: 1px solid #cac9c9;
  display: flex;
  padding: 15px;
  border-radius: 10px;
  align-items: center;
  justify-content: space-between;
}
.fcsentences {
  font-size: 14px; 
  font-weight: 800; 
  flex-direction: column; 
  text-align: start;
  cursor: pointer;
  padding: 7px;
}
</style>
</html>