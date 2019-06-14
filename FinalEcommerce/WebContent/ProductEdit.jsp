<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
* {
  box-sizing: border-box;
}

input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}

input[type=submit] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: right;
}

input[type=submit]:hover {
  background-color: #45a049;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}

.col-25 {
  float: left;
  width: 25%;
  margin-top: 6px;
}

.col-75 {
  float: left;
  width: 75%;
  margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .col-25, .col-75, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}
</style>
</head>
<body>

<h2>Product Description Form....</h2>



<div class="container">

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
	
	String id=request.getParameter("id");
	System.out.println("In Update AdId="+id);
statement=connection.createStatement();

String sql ="SELECT * FROM products WHERE p_id='"+id+"'";


resultSet = statement.executeQuery(sql);
while(resultSet.next()){

	

%>

 <!-- till here --> 

  <form action="UpdateProduct" method="POST" >
  <input type="hidden" name="p_id" value="<%=id %>">
    <div class="row">
      <div class="col-25">
        <label for="fname">Product Name</label>
      </div>
      <div class="col-75">
        <input type="text" id="p_name" name="p_name" value="<%=resultSet.getString("p_name") %>" >  <!-- check the value section -->
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="lname">Product Price</label>
      </div>
      <div class="col-75">
        <input type="text" id="price" name="price" value="<%=resultSet.getString("price") %>">
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="country">Product Image</label>
      </div>
 	 <div class="col-75">
        <input type="hidden" id="p_image" name="p_imagess" >
      </div>
    </div> 
    
    <div class="row">
      <div class="col-25">
        <label for="subject">Description</label>
      </div>
      <div class="col-75">
        <textarea id="description" name="description" style="height:200px"><%=resultSet.getString("description") %></textarea>
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="country">Quantity</label>
      </div>
     	 <div class="col-75">
        <input type="text" id="quantity" name="quantity" value="<%=resultSet.getString("quantity") %>">
      </div>
    </div>
    <div class="row">
    <a href="AdminHome.jsp"><input type="button" class="btn-success" style="width:105px;height:40px;" value="Back"></a>
      <input type="submit" style="" value="Edit and Save">
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

</body>
</html>
