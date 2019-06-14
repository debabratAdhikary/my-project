package com;

import java.io.*;  
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.*;  
  

@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {  

	private static final long serialVersionUID = 3190L;

public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
response.setContentType("text/html");  
PrintWriter out = response.getWriter();  
          
String c=request.getParameter("contact");  
 
String p=request.getParameter("psw");  

          
try{  
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce","root","as01bp2556");  
boolean status=false;  
PreparedStatement ps=con.prepareStatement("select * from register where contact=? AND password=?");  
  
ps.setString(1,c);  
  
ps.setString(2,p);    
          
ResultSet rs=ps.executeQuery();  

status=rs.next();



String r_id=rs.getString("r_id");
String name=rs.getString("name");
int valid=rs.getInt("valid");



System.out.println(""+name);

 /*creating r_id because we need it in updateregister*/
HttpSession sc=request.getSession();
sc.setAttribute("UserName", name);

sc.setAttribute("r_id", r_id);
if(status==true && valid ==0 ) {
	
	
out.println("<script type=\"text/javascript\">");
out.println("alert('Login Sucessfull');");
out.println("</script>");
RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
rd.include(request, response);
}

else {
	out.println("<script type=\"text/javascript\">");
	out.println("alert('Login Fail');");
	out.println("</script>");
RequestDispatcher rd=request.getRequestDispatcher("UserLogin.jsp");
rd.include(request, response);	
	
}

}catch (Exception e2) {System.out.println(e2);}  
          
out.close();  
}  
  
}