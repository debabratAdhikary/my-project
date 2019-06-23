

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
  
}

* {
  box-sizing: border-box;
}

/* Add padding to containers */
.container {
  padding: 16px;
  
}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 47%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

/* Overwrite default styles of hr */
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}

/* Set a style for the submit button */
.registerbtn {
  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 35%;
  opacity: 0.9;
}

.registerbtn:hover {
  opacity: 1;
}

/* Add a blue text color to links */
a {
  color: dodgerblue;
}

/* Set a grey background color and center the text of the "sign in" section */
.signin {
  background-color: #f1f1f1;
  text-align: center;
}
.navbar-brand>img {
	background-color: black;
  padding-top: 11px;
  width: 150px;
}
</style>
</head>
<body>

<form action="UserLogin" method="post">
  <div class="container" align="center">
	<h1><u>Welcome to Panchratna Stationery</u></h1>
    <h2>User Login</h2>
    
    <hr>

	
    <input type="text" placeholder="Contact Number" name="contact" required><br>
	
    

    
    <input type="password" placeholder="Enter Password" name="psw" required><br>
	<!-- <p style="padding-left:26%;"><a href="#">Forgot password?</a></p> -->
    <hr>
	
    <!-- <p>By Logging in agree to our <a href="#">Terms & Privacy</a></p> -->

    <button type="submit" class="registerbtn">Login</button>
  </div>
  
  <div class="container signin">
    <p>New to Panchratna Stationery? <a href="UserRegister.jsp">Register</a>.</p>
  </div>
</form>

</body>
</html>
