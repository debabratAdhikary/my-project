<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.util.List" %>


<!DOCTYPE html>
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
label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}

</style>
</head>
<body>
<div class="main">
<div class="row">
<div class="col-lg-3"></div>
<div class="col-lg-6">

<!-- add this section below -->
<%

Statement statement=null;
Connection connection=null;
ResultSet  resultSet=null;


try{  
    Class.forName("com.mysql.jdbc.Driver");  
    connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce","root","as01bp2556");  

}catch(Exception e){System.out.println(e);}  
try{ 
	
	String id=request.getParameter("Proid");
	String idd=(String)id;  /*conversion to string  */
	System.out.println("In Update AdId="+idd);
statement=connection.createStatement();

String sql ="SELECT * FROM register WHERE r_id='"+idd+"'";


resultSet = statement.executeQuery(sql);
while(resultSet.next()){

	

%>

 <!-- till here --> 


<form action="UpdateUser" method="post">
  <div class="container" align="center" >
  <!-- <a class="navbar-brand" href="#" align="center"><img alt="Logo" src="https://www.solodev.com/assets/side-nav/logo.png"></a> -->
    <h1>Edit</h1>
    
    <input type="hidden" name="id" value="<%=id %>" readonly> 
    
    <label><u>User Name:</u>  </label>
	<input type="text"  name="name" value="<%=resultSet.getString("name") %>" required readonly></br>
	
	<label><u>Contact:  </u>  </label>
    <input type="text"  name="contact" value="<%=resultSet.getString("contact") %>" required readonly></br>
	
    <label><u>Email:    </u>  </label>
    <input type="text"  name="email" value="<%=resultSet.getString("email") %>" readonly></br>

    <label><u>Password:  </u>  </label>
    <input type="password"  name="psw" value="<%=resultSet.getString("password") %>"required readonly></br>

    <label><u>Address:   </u>  </label>
    <input type="text"  name="adrs" value="<%=resultSet.getString("address") %>"required readonly><br>
    
    <label><u>Status:    </u>  </label>
    <input type="text"  name="stat" value="<%=resultSet.getString("valid") %>"required ><br>
    
    

    <button type="submit" class="registerbtn">Edit and Save</button>
  </div>
  
  
</form>

<!-- add this section below -->
  	<% 
	

}

} catch (Exception e) {
e.printStackTrace();
}
finally {
    try {
    	resultSet.close();
		statement.close();
	} catch (Exception e) {
		e.printStackTrace();}
    try {
    	if(connection!=null) {
		connection.close();
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
} 
%>
   <!-- ends here -->


</div>
<div class="col-lg-3"></div>
</div>
</div>
</body>
</html>
