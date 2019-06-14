
package com;
import java.io.*;  
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;  
  

@WebServlet("/UserRegister")
public class UserRegister extends HttpServlet {  
/**
	 * 
	 */
	private static final long serialVersionUID = 4324L;

public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
response.setContentType("text/html");  
PrintWriter out = response.getWriter();  

String n=request.getParameter("name");  
String c=request.getParameter("contact");  
String e=request.getParameter("email");  
String p=request.getParameter("psw");  

/*String r=request.getParameter("psw-repeat");*/  

String a=request.getParameter("address");         

try{  
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce","root","as01bp2556");  
  
PreparedStatement ps=con.prepareStatement("insert into register(name,contact,email,password,address) values(?,?,?,?,?)");  

ps.setString(1,n);
ps.setString(2,c);  
ps.setString(3,e);  
ps.setString(4,p);  
ps.setString(5,a);   
          
int i=ps.executeUpdate();  
if(i>0)  
out.print("You are successfully registered...");  


RequestDispatcher rd=request.getRequestDispatcher("UserLogin.jsp");
rd.include(request, response);
          
}catch (Exception e2) {System.out.println(e2);}  
          
out.close();  
}  
  
}