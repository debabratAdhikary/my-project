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

</style>
</head>
<body>
<div class="main">
<div class="row">
<div class="col-lg-3"></div>
<div class="col-lg-6"> <table class="table table-bordered" id="tblCustomers">
       <thead class="thead-dark thead-flex sticky-top">
      <tr>
      <th style="font-size : 21; width:5%;">p_id</th>    <!--name should be same as the table  -->
      <th style="font-size : 21;width: 25%;">Product Name</th>
          <th style="font-size : 21;width: 10%;">catagory</th>
        <th style="font-size : 21;width: 10%;">price</th>
         <th style="font-size : 21;width: 25%;">description</th>
          <th style="font-size : 21;width: 25%;">quantity</th>
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

String sql ="SELECT * FROM products ORDER BY p_id DESC";


resultSet = statement.executeQuery(sql);
while(resultSet.next()){

	

%> 	
	<!-- name should be same as the table   -->
	
    <tbody class="tbody" style="height: 200px; text-align:left;  overflow: scroll;">
      <tr>
        <td style="width:5%;"><%=resultSet.getString("p_id") %></td> 
        <td style="width:25%;"> <strong style="color:#000033;"><%=resultSet.getString("p_name") %></strong></td>
        <td style="width:10%;"><%=resultSet.getString("catagory") %></td>
              <td style="width:20%;"><%=resultSet.getString("price") %></td>

        <td style="width:25%;">  <%=resultSet.getString("description") %>  </td>
        
        <td style="width:15%;">  <%=resultSet.getString("quantity") %>  </td>
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
