
package com;
import java.io.*;  
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;  
  

@WebServlet("/UpdateUser")
public class UpdateUser extends HttpServlet {  
/**
	 * 
	 */
	private static final long serialVersionUID = 4324L;
	
	   public UpdateUser() {
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


HttpSession sc=request.getSession();	
Object r_id=sc.getAttribute("r_id");
String id=(String) r_id;
String n=request.getParameter("name");  
String c=request.getParameter("contact");  
String e=request.getParameter("email");  
String p=request.getParameter("psw");
String a=request.getParameter("adrs");
String s=request.getParameter("stat");
  
System.out.println("HERE In UPDT"+id+"na"+n);

try{  
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce","root","as01bp2556");  
  
PreparedStatement ps=con.prepareStatement("update register set name='"+n+"', contact='"+c+"', email='"+e+"', password='"+p+"', address='"+a+"' , valid='"+s+"' where r_id='"+id+"' ");  
   
int i=ps.executeUpdate();  
if(i>0)  {
	out.println("<script type=\"text/javascript\">");
	out.println("alert('Successfully updated');");
	out.println("</script>");
RequestDispatcher rd=request.getRequestDispatcher("ViewUser.jsp");
rd.include(request, response);
}
else {
	out.print("Operation Unsuccessfull");  


	RequestDispatcher rd=request.getRequestDispatcher("ViewUser.jsp");
	rd.include(request, response);
}
}


catch (Exception e2) {System.out.println(e2);}  
          
out.close();  
}  
  
}