package com;



import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ViewServlet
 */
@WebServlet("/ViewProduct")
public class ViewProduct extends HttpServlet {
	private static final long serialVersionUID = 15578655L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");  
        PrintWriter out=response.getWriter();  
        out.println("<a href='Index.jsp'>Add New Employee</a>");  
        out.println("<h1>Employees List</h1>");  
          
        List<ProductEmp> list=ProductEmpDao.getAllEmployees();  /*emp is the list and the empdao is the connection between the list and the database */
          
        out.print("<table border='1' width='100%'");  
        out.print("<tr><th>Id</th><th>Product Name</th><th>Price</th><th>Image</th><th>Description</th><th>Quantity</th><th>Edit</th><th>Delete</th></tr>");  
        for(ProductEmp e:list){  
       
        	
         out.print("<tr><td>"+e.getP_id()+"</td><td>"+e.getP_Name()+"</td><td>"+e.getPrice()+"</td><td></td><td></td><td>"+e.getQuantity()+"</td><td><a href='ProductEdit.jsp?id="+e.getP_id()+"'>edit</a></td><td><a href='DeleteProduct?id="+e.getP_id()+"'>delete</a></td></tr>");  
        }  
        out.print("</table>");  
          
        out.close();  
    }  
}