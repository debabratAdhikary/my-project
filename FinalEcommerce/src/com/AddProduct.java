package com;



import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class SaveServlet
 */
@WebServlet("/AddProduct")


@MultipartConfig(maxFileSize = 16177215)  

public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");  
        PrintWriter out=response.getWriter();  
        try {
			out = response.getWriter();
		} catch (IOException e1) {
		
			e1.printStackTrace();
		}
		String ProId=request.getParameter("p_name");
		String Cate=request.getParameter("p_cat");
		 String price=request.getParameter("price");  
	        /*String p_image=request.getParameter("p_image");*/
	        
	        String description=request.getParameter("description");
	        String quantity=request.getParameter("quantity");
	
		
	
		
		
		 /* InputStream inputStream1 = null; 
	        Part filePart1 = request.getPart("p_imagess");
	        if (filePart1 != null) {
	          
	            System.out.println(filePart1.getName());
	            System.out.println(filePart1.getSize());
	            System.out.println(filePart1.getContentType());
	             
	          
	            inputStream1 = filePart1.getInputStream();
	        }*/
	        Statement stat=null;
		Connection conn=null;
		int  resut=0;
		PreparedStatement pstmt=null;
		
			try {
				if(conn==null|| conn.isClosed()) {
			
					 Class.forName("com.mysql.jdbc.Driver");  
			            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce","root","as01bp2556");  	
					
					
				}		}
			catch (Exception e) {
			
				e.printStackTrace();
			}
		
			try {
		
			stat=conn.createStatement();
		 pstmt = conn.prepareStatement("INSERT INTO products(p_name,catagory,price,description,quantity) VALUES (?,?,?,?,?) ");
		 pstmt.setString(1, ProId);
		 pstmt.setString(2,Cate);
		 pstmt.setString(3, price);
		 pstmt.setString(4, description);
		 pstmt.setString(5, quantity);
		  resut = pstmt.executeUpdate();
		 
			}catch (Exception e) {
				
				e.printStackTrace();
			}
			finally {
			    try {
			    pstmt.close();
					stat.close();
				} catch (Exception e) {
					e.printStackTrace();}
			    try {
			    	if(conn!=null) {
					conn.close();
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			} 
			
			if(resut>0){
	
				try {
				
					out.print("<script type=\"text/javascript\">");
					out.print("alert('Submitted Successfully')");
					out.print("</script>");
					   
					System.out.println("Insert Sucess");
					
								   
					
			RequestDispatcher dispatcher = request.getRequestDispatcher("ProductHome.jsp");
			dispatcher.include(request, response);
			
				
			} catch (ServletException | IOException e) {
				
				e.printStackTrace();
			}
			}
			else
				
			{
				
				try {
					System.out.println("Insert Fail");
					
					out.print("<script type=\"text/javascript\">");
					out.print("alert('Error: Not Submitted')");
					out.print("</script>");

					   
					
			RequestDispatcher dispatcher = request.getRequestDispatcher("ProductHome.jsp");
			dispatcher.include(request, response);
			
				
			} catch (ServletException | IOException e) {
				
				e.printStackTrace();
			}
			}
	}}