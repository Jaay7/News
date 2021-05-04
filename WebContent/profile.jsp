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
<%

  try {
    String email = (String) session.getAttribute("email");
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jay", "data32026");
    PreparedStatement pStatement = connection.prepareStatement("select firstname,lastname,username,email,phone from news where email=?");
    pStatement.setString(1, email);
    ResultSet rs = pStatement.executeQuery();
    if (rs.next()) {
      String firstname = rs.getString("firstname");
      String lastname = rs.getString("lastname");
      String username = rs.getString("username");
      String email1 = rs.getString("email");
      String phone = rs.getString("phone");
    %>
    <title><%=username%></title>
</head>
<body>
  <div style="display: flex; flex-direction: row;">
    <span style="flex: 1 auto;"></span>
    <a href="index.jsp">Home</a>
  </div>
  
  <div class="container">
  <div class="main-div">
    <div style="flex-direction: row; display: flex; align-items: center; justify-content: space-between;">
      <span style="padding: 20px; font-size: 20px; font-weight: bold;">Profile</span>
      <span class="material-icons" onclick="edit()">edit</span>
    </div>
    <form action="updateProfile.jsp" method="post">
      <span>First Name</span>
      <input type="text" value="<%=firstname%>" name="fname" id="fname" disabled>
      <span>Last Name</span>
      <input type="text" value="<%=lastname%>" name="lname" id="lname" disabled>
      <span>Username</span>
      <input type="text" value="<%=username%>" name="uname" id="uname" disabled>
      <span>Email</span>
      <input type="text" value="<%=email%>" disabled name="emailid">
      <span>Phone</span>
      <input type="text" value="<%=phone%>" name="phoneno" id="phoneno" disabled>
      <div style="display: flex; flex-direction: row; align-items: center; justify-content: flex-end;">
        <span type="button" id="cancel" onclick="cancel()" style="display: none; cursor: pointer; padding: 10px;">Cancel</span>
        <button type="submit" id="savechanges" style="display: none;">Save Changes</button>
      </div>
    </form>
  </div>
</div>
 <%}
  } catch (Exception e) {
    out.println(e);
  } 
  %>

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
	/* flex-direction: row;  */
	border: 1px solid #e2e2e2; 
	/* box-shadow: 1px 6px 20px #4444444b; */
	padding: 50px;
  border-radius: 5px;
	height: 70vh;
  align-self: center;
  justify-content: center;
  backdrop-filter: blur(10px);
  }
  .main-div {
  width: 35%;
  /* margin: 0px auto; */
  padding: 10px;
  align-self: center;
  display: flex;
  flex-direction: column;
  justify-content: center;
}
.main-div input {
  background-color: #00000000;
	border: 1px solid #888888;
	border-radius: 5px;
	padding: 10px;
	outline: none;
	width: 100%;
	margin-bottom: 20px;
  transition: 0.3s;
	-webkit-transition: 0.3s;
	-moz-transition: 0.3s;
}
.main-div input:focus {
  border: 1px solid #777;
}
button {
	background: #596E57;
	color: #fff;
	border: 1px solid #596E57;
	border-radius: 5px;
	padding: 10px;
	display: block;
  /* width: 100%; */
  align-self: center;
	transition: 0.3s;
	-webkit-transition: 0.3s;
	-moz-transition: 0.3s;
}
button:hover {
	background: #00000000;
	color: #596E57;
	border: 1px solid #596E57;
	cursor: pointer;
}
button:hover a{
    color: #596E57;
}
</style>
<script>
  const fname = document.querySelector("#fname")
  const lname = document.querySelector("#lname")
  const uname = document.querySelector("#uname")
  const phoneno = document.querySelector("#phoneno")
  function edit() {
    document.getElementById("savechanges").style.display = "";
    document.getElementById("cancel").style.display = "";
    fname.disabled = false
    lname.disabled = false
    uname.disabled = false
    phoneno.disabled = false
  }
  function cancel() {
    document.getElementById("savechanges").style.display = "none";
    document.getElementById("cancel").style.display = "none";
    fname.disabled = true
    lname.disabled = true
    uname.disabled = true
    phoneno.disabled = true
  }
</script>
</html>