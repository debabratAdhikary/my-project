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
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

body {
  font-family: Arial, Helvetica, sans-serif;
 
}

* {
  box-sizing: border-box;
  
}
@media screen and (max-width: 500px) {
  .header a {
    float: none;
    display: block;
    text-align: left;
  }
  
  .header-right {
    float: none;
  }
}
.signin {
  background-color: #f1f1f1;
  text-align: center;
}
table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 100%;
  border: 1px solid #ddd;
}

th, td {
  text-align: left;
  padding: 16px;
}

tr:nth-child(even) {
  background-color: #f2f2f2
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



* {
  box-sizing: border-box;
}

body {
  margin: 0;
}

.navbar {
  overflow: hidden;
  background-color: #333;
  font-family: Arial, Helvetica, sans-serif;
}

.navbar a {
  float: left;
  font-size: 16px;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

.dropdown {
  float: left;
  overflow: hidden;
}

.dropdown .dropbtn {
  font-size: 16px;  
  border: none;
  outline: none;
  color: white;
  padding: 14px 16px;
  background-color: inherit;
  font: inherit;
  margin: 0;
}

.navbar a:hover, .dropdown:hover .dropbtn {
  background-color: red;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  width: 100%;
  left: 0;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content .header {
  background: red;
  padding: 16px;
  color: white;
}

.dropdown:hover .dropdown-content {
  display: block;
}

/* Create three equal columns that floats next to each other */
.column {
  float: left;
  width: 33.33%;
  padding: 10px;
  background-color: #ccc;
  height: 250px;
}

.column a {
  float: none;
  color: black;
  padding: 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.column a:hover {
  background-color: #ddd;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - makes the three columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .column {
    width: 100%;
    height: auto;
  }
}


</style>
</head>
<body>

<div class="navbar">
  <a href="AdminHome.jsp">Home</a>
    <div class="dropdown">
    <button class="dropbtn">product 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <div class="header">
     
      </div>   
      <div class="row">
        <div class="column">
          <h3><a href="ProductHome.jsp">Add product</a></h3>
         
        </div>
        <div class="column">
          <h3><a href="ViewProduct.jsp">View Product</a></h3>
         
        </div>
         <div class="column">
          <h3></h3>
          
        </div>
        
      </div>
    </div>
  </div>
  <div class="dropdown">
    <button class="dropbtn">user 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <div class="header">
        
      </div>   
      <div class="row">
        <div class="column">
          <h3><a href="ViewUser.jsp">view user </a>   </h3>
          
        </div>
        <div class="column">
          <h3><a href="">user order</a></h3>
         
        </div>
        <div class="column">
          <h3></h3>
          
        </div>
      </div>
    </div>
  </div>
  
  <%
       HttpSession sc=request.getSession();
       
       Object Name=sc.getAttribute("UserName");
       String Names=(String) Name;
       System.out.println("Here Get"+Names);
       
       if(Names==null){
       
       %>	
			
        			   
          <a href="adminLogin.jsp">Login </a>          
          
       
        
		
		<%
		}
		else
		{
		 %>
				    
     <a href="#" style="margin-left: 700px;"> <%="hi" +" "+Names %> </a>        
          
       
            
          <a href="AdminLogout" >Logout </a>          
          
        
		<%} %>
   
</div>


<div class="container signin" style="align:left;">
		<a href="AdminHome.jsp">Back</a>
		</div>

<div class="main">
<div class="row">
<div class="col-lg-3"></div>
<div class="col-lg-6"> <table class="table table-bordered" id="tblCustomers">
       <thead class="thead-dark thead-flex sticky-top">
      <tr>
      <th style="font-size : 21; width:25%;">Register ID</th>    <!--name should be same as the table  -->
      <th style="font-size : 21;width: 25%;">User Name</th>
          <th style="font-size : 21;width: 10%;">Contact</th>
        <th style="font-size : 21;width: 10%;">Email</th>
         <th style="font-size : 21;width: 25%;">Password</th>
          <th style="font-size : 21;width: 25%;">Address</th>
          <th style="font-size : 21;width: 25%;">Status</th>
                  
      </tr>	
    </thead>
    
<% 


Statement statement=null;
Connection connection=null;
ResultSet  resultSet=null;
	try {
		if(connection==null|| connection.isClosed()) {
			Class.forName("com.mysql.jdbc.Driver");  
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce","root","as01bp2556");
			
		}		}
	catch (Exception e) {
	
		e.printStackTrace();
	}

try{ 

statement=connection.createStatement();

String sql ="SELECT * FROM register ORDER BY r_id DESC";


resultSet = statement.executeQuery(sql);
while(resultSet.next()){

	

%> 	
	<!-- name should be same as the table   -->
	
    <tbody class="tbody" style="height: 200px; text-align:left;  overflow: scroll;">
      <tr>
        <td style="width:5%;"><%=resultSet.getString("r_id") %></td> 
        <td style="width:25%;"> <strong style="color:#000033;"><%=resultSet.getString("name") %></strong></td>
        <td style="width:10%;"><%=resultSet.getString("contact") %></td>
              <td style="width:20%;"><%=resultSet.getString("email") %></td>

        <td style="width:25%;">  <%=resultSet.getString("password") %>  </td>
        
        <td style="width:15%;">  <%=resultSet.getString("address") %>  </td>
        <td style="width:15%;">  <a href="UserUpdateAdmin.jsp?Proid=<%=resultSet.getString("r_id") %>">edit</a>  </td> 
       	
      </tr>
  	
   	
   	
    </tbody>
  
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
	
	
	


  </table>
   <!-- ends here -->


</div>
<div class="col-lg-3"></div>
</div>
</div>
</body>
</html>
