package com;
import java.io.IOException;  
import java.io.PrintWriter;  
  
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import javax.servlet.http.HttpSession;

@WebServlet("/UserLogoutrrr")
public class UserLogout extends HttpServlet {  
   
	private static final long serialVersionUID = 15555L;

		protected void doGet(HttpServletRequest request, HttpServletResponse response)  
                                throws ServletException, IOException {  
            response.setContentType("text/html");  
            PrintWriter out=response.getWriter();  
            
            System.out.println("Here");
              
            
            
            request.getRequestDispatcher("UserLogin.jsp").include(request, response);  
              
            HttpSession session=request.getSession();  
            session.invalidate();  
              
            out.println("<script type=\"text/javascript\">");
            out.println("alert('you are successfully logged out');");
            out.println("</script>");
              
            out.close();  
    }  
  
}