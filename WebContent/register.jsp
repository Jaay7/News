<!DOCTYPE html>
<html lang="en">
<head>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:400,600,700"/>
  <title>Sign up</title>
</head>
<body>
  <div class="body-div">
    <div class="container">
      <div id="signup_div" class="main-div">
      <h2 style="margin-bottom: 10px; align-self: flex-start;">Signup Here,</h2>
      <form action="actionRegister.jsp" method="POST">
        <div style="flex-direction: row; display: flex;">
          <input type="text" placeholder="First Name" id="firstname_field" name="firstname"/>
          <span style="padding: 10px;"></span>
          <input type="text" placeholder="Last Name" id="lastname_field" name="lastname"/>
        </div>
        <input type="text" placeholder="Username" id="username_field" name="username"/>
        <input type="email" placeholder="Email Id" id="email_field" name="email"/>
        <input type="password" placeholder="Password" id="password_field" name="password"/>
        <input type="password" placeholder="Confirm Password" id="cfrm_password_field" name="cpassword"/>
        <input type="text" placeholder="Mobile number" id="mobile_field" name="phone"/>
        <button type="submit" id="btn_signup">signup
        </button>
      </form>
      
      <p style="padding: 10px;">Already have an account? <a href="login.jsp" style="color: #596E57;">Login</a></p>
    </div>
    <div>
      <img height="300px" width="400px" src="images/undraw_Content_re_33px.svg" alt="">
    </div>
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
.body-div {
  font-size: 16px;
  display: flex;
  flex: 1;
  justify-content: center;
  align-content: center;
  min-height: 100vh;
}
p, input, button {
  font-weight: 700;
}
a{
	color: #ffffff;
	text-decoration: none;
}
.tabbar-div {
  height: 50px;
  background-color: #596E57;
  flex: 1;
}
.container {
  display: flex;
  align-items: center; 
  flex-direction: row; 
  border: 1px solid #e2e2e2; 
  box-shadow: 1px 6px 20px #b4b4b4;
  border-radius: 5px;
  padding: 50px;
  height: max-content;
  align-self: center;
}
.main-div {
	width: 40%;
	margin: 0px auto;
  padding: 10px;
  align-items: center;
  align-self: center;
  display: flex;
  flex-direction: column;
}
.main-div input {
  background-color: #00000000;
	display: block;
	border: 1px solid #a0a0a0;
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
.main-div button {
	background: #596E57;
	color: #fff;
	border: 1px solid #596E57;
	border-radius: 5px;
	padding: 10px;
	display: block;
  width: 100%;
  align-self: center;
	transition: 0.3s;
	-webkit-transition: 0.3s;
	-moz-transition: 0.3s;
}
.main-div button:hover {
	background: #00000000;
	color: #596E57;
	border: 1px solid #596E57;
	cursor: pointer;
}

.main-div button:hover a{
  color: #596E57;
}
</style>
</html>