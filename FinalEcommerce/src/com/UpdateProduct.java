
package com;
import java.io.*;  
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;  
  

@WebServlet("/UpdateProduct")
public class UpdateProduct extends HttpServlet {  
/**
	 * 
	 */
	private static final long serialVersionUID = 4324L;
	
	   public UpdateProduct() {
	        super();
	        // TODO Auto-generated constructor stub
	    }

public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
response.setContentType("text/html");  
PrintWriter out = response.getWriter();  
try {
	out = response.getWriter();
} catch (IOException e1) {

	e1.printStackTrace();
}
String b=request.getParameter("p_id");
String n=request.getParameter("p_name");  
String c=request.getParameter("price");  
String e=request.getParameter("description");  
String p=request.getParameter("quantity");  
  
System.out.println("HERE In UPDT"+n);
try{  
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce","root","as01bp2556");  
  
PreparedStatement ps=con.prepareStatement("update products set p_name='"+n+"',price='"+c+"',description='"+e+"',quantity='"+p+"' where p_id='"+b+"'");  
   
int i=ps.executeUpdate();  
if(i>0)  
out.print("Successfully Updated");  


RequestDispatcher rd=request.getRequestDispatcher("ProductEdit.jsp?id="+b);
rd.include(request, response);
          
}catch (Exception e2) {System.out.println(e2);}  
          
out.close();  
}  
  
}