

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
<div class="main">
<div class="row">
<div class="col-lg-3"></div>
<div class="col-lg-6">
<form action="UserRegister" method="post">
  <div class="container" align="center" >
  	<h1 ><u>Welcome to Panchratna Stationery</u></h1>
    <h2>Create Account</h2>
    
    
  <input type="text" placeholder="Enter your Name" name="name" style="height:10px;" required></br>
  
    <input type="text" placeholder="Enter Contact Number" name="contact" style="height:10px;" required></br>
  
    
    <input type="text" placeholder="Enter Email" name="email" style="height:10px;" required></br>

    
    <input type="password" placeholder="Enter Password" name="psw" style="height:10px;" required></br>

    
    <input type="password" placeholder="Repeat Password" name="psw-repeat" style="height:10px;" required></br>
    
    <input type="text" placeholder="Enter Address" name="address" style="height:10px;" required><br>
    
    <!-- <p>By creating an account you agree to our <a href="#">Terms & Privacy</a>.</p> -->

    <button type="submit" class="registerbtn">Register</button>
  </div>
  
  <div class="container signin">
    <p>Already have an account? <a href="UserLogin.jsp">Login</a></p>
  </div>
</form>
</div>
<div class="col-lg-3"></div>
</div>
</div>
</body>
</html>
