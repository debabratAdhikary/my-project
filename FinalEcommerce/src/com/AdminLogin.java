package com;
import java.io.*;  
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.*;  
  

@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {  

	private static final long serialVersionUID = 155222552L;



public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
response.setContentType("text/html");  
PrintWriter out = response.getWriter();  
          
String c=request.getParameter("uname");  
 
String p=request.getParameter("psw");  

          
try{  
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce","root","as01bp2556");  
boolean status=false;  
PreparedStatement ps=con.prepareStatement("select * from admin where username=? AND password=?");  
  
ps.setString(1,c);  
  
ps.setString(2,p);    
          
ResultSet rs=ps.executeQuery();  
status=rs.next();




String name=rs.getString("name");
System.out.println(""+name);
HttpSession sc=request.getSession();
sc.setAttribute("UserName", name);


if(status==true) {
out.println("<script type=\"text/javascript\">");
out.println("alert('Login Sucessfull');");
out.println("</script>");
RequestDispatcher rd=request.getRequestDispatcher("AdminHome.jsp");
rd.include(request, response);
}

else {
	out.println("<script type=\"text/javascript\">");
	out.println("alert('Login Fail');");
	out.println("</script>");
RequestDispatcher rd=request.getRequestDispatcher("adminLogin.jsp");
rd.include(request, response);	
	
}

}catch (Exception e2) {System.out.println(e2);}  
          
out.close();  
}  
  
}