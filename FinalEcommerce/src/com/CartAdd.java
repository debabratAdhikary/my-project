package com;



import java.io.IOException;

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


/**
 * Servlet implementation class SaveServlet
 */
@WebServlet("/CartAdd")


@MultipartConfig(maxFileSize = 16177215)  

public class CartAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartAdd() {
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
		String userid=request.getParameter("uid");
	
		 String productid=request.getParameter("pid");  
		 System.out.println("here"+userid+"ss"+productid);
		 
		 /*String p_image=request.getParameter("p_image");*/
	        

	
		
		
		  /*InputStream inputStream1 = null; 
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
		 pstmt = conn.prepareStatement("INSERT INTO cart(r_id,p_id) VALUES (?,?)");
		 pstmt.setString(1,userid);
		 pstmt.setString(2,productid);
		
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
					
								   
					
			RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
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

					   
					
			RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
			dispatcher.include(request, response);
			
				
			} catch (ServletException | IOException e) {
				
				e.printStackTrace();
			}
			}
	}}