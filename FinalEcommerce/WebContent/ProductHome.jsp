<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
  <form action="AddProduct" method="POST" enctype="multipart/form-data">
    <div class="row">
      <div class="col-25">
        <label for="fname">Product Name</label>
      </div>
      <div class="col-75">
        <input type="text" id="p_name" name="p_name" >
      </div>
    </div>
    
    <div class="row">
      <div class="col-25">
        <label for="country">Product Category</label>
      </div>
 	 <div class="col-75">
        <select id="p_cat" name="p_cat">
    <option value="pen">PEN</option>
    <option value="marker">MARKER</option>
    <option value="Brush">BRUSH</option>
    <option value="calculator">CALCULATOR</option>
  </select>
      </div>
    </div> 
    <div class="row">
      <div class="col-25">
        <label for="lname">Product Price</label>
      </div>
      <div class="col-75">
        <input type="text" id="price" name="price" >
      </div>
    </div>
    
    <div class="row">
      <div class="col-25">
        <label for="subject">Description</label>
      </div>
      <div class="col-75">
        <textarea id="description" name="description" placeholder="Write something.." style="height:200px"></textarea>
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="country">Quantity</label>
      </div>
     	 <div class="col-75">
        <input type="text" id="quantity" name="quantity" >
      </div>
    </div>
    <div class="row">
	  
      <input type="submit" value="Submit">
      <a href="AdminHome.jsp"><input type="button" class="btn-success" style="width:105px;height:40px;" value="Back"></a>
    </div>
  </form> 
</div>

</body>
</html>
