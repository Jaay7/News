<!DOCTYPE html>
<html lang="en">
<head>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:400,600,700"/>
  <title>Login</title>
</head>
<body>
  <div class="body-div">
    <div class="container">
      <div id="login_div" class="main-div">
        <h3 style="align-self: flex-start; padding: 10px 0px;">Login Here,</h3>
        <form action="actionLogin.jsp" method="POST">
          <input type="email" placeholder="Email Id" id="email_field" name="email" required/>
          <input type="password" placeholder="Password" id="password_field" name="password" required/>
          <p style="align-self: flex-end; padding: 10px;">Forgot Password?</p>
          <button type="submit" id="btn_login">
            <a>login</a>
          </button>
        </form>
        <p style="padding: 10px 0px;">Don't have an account? <a href="register.jsp" style="color: #596E57;">Signup</a></p>
      </div>
      <div>
        <img height="300px" width="300px" src="images/undraw_Newsletter_re_wrob.svg" alt="">
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
/* body {
	background-image: url('../images/index-bg2.jpg');
	background-color: #27096b2a;
	backdrop-filter: blur(5px);
} */
.body-div {
	font-size: 16px;
	display: flex;
	flex: 1;
	justify-content: center;
	align-content: center;
	min-height: 100vh;
}
p, input, button {
  font-family: 'Nunito' ,sans-serif;
  font-weight: 700;
}
a{
	color: #fff;
	text-decoration: none;
}
.container {
	display: flex;
	align-items: center; 
	flex-direction: row; 
	border: 1px solid #e2e2e2; 
	box-shadow: 1px 6px 20px #4444444b;
	padding: 50px;
  border-radius: 5px;
	height: 70vh;
  align-self: center;
  justify-content: space-between;
  backdrop-filter: blur(10px);
  }
.main-div {
  width: 45%;
  /* margin: 0px auto; */
  padding: 10px;
  align-items: center;
  align-self: center;
  display: flex;
  flex-direction: column;
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