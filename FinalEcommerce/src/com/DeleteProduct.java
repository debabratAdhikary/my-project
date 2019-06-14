package com;



import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/DeleteProduct")
public class DeleteProduct extends HttpServlet {
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 12335L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("delete page");
        String sid=request.getParameter("id"); 
        System.out.println("delete===="+sid);
        
        try{  
            Connection con;
            Class.forName("com.mysql.jdbc.Driver");  
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce","root","as01bp2556");
            PreparedStatement ps=con.prepareStatement("delete from products where p_id=?");  
            ps.setString(1,sid);  
            ps.executeUpdate();  
              
            con.close();  
        }catch(Exception e){e.printStackTrace();} 
        
        
        response.sendRedirect("ViewProduct");  
    }  
}  
