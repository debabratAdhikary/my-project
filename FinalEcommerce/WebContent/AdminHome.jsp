<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
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
  <a href="#home">Home</a>
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
          <h3><a href="ViewProduct">View Product</a></h3>
         
        </div>
        <div class="column">
          <h3><a href="">Category 3</a></h3>
          
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
          <h3><a href="ViewUsers">view user </a>   </h3>
          
        </div>
        <div class="column">
          <h3><a href="">delete user</a></h3>
         
        </div>
        <div class="column">
          <h3><a href="">edit status</a></h3>
          
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

<div style="padding:16px">
  <h3>Responsive Mega Menu (Full-width dropdown in navbar)</h3>
  <p>Hover over the "Dropdown" link to see the mega menu.</p>
  <p>Resize the browser window to see the responsive effect.</p>
</div>

</body>
</html>
