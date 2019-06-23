package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
/*import java.io.FileOutputStream;
import java.sql.Blob;*/

public class ProductEmpDao {
    public static Connection getConnection(){  
        Connection con=null;  
        try{  
            Class.forName("com.mysql.jdbc.Driver");  
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce","root","as01bp2556");  
 
        }catch(Exception e){System.out.println(e);}  
        return con;  
    }  
    public static int save(ProductEmp e){  
        int status=0;  
        try{  
            Connection con=EmpDao.getConnection();  
            PreparedStatement ps=con.prepareStatement(  
                         "insert into products(p_name,category,price,description,quantity) values (?,?,?,?,?)"); /*include image*/   
            ps.setString(1,e.getP_Name());  
           
            ps.setString(2,e.getP_cat());  
            ps.setString(3,e.getPrice());
            ps.setString(4,e.getDescription());  
            ps.setString(5,e.getQuantity());  
              
            status=ps.executeUpdate();  
              
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return status;  
    }  
    public static int update(ProductEmp e){  			/*maintain emp page name*/  
        int status=0;  
        try{  
            Connection con=ProductEmpDao.getConnection();  	/*maintain the empdao page name*/
            PreparedStatement ps=con.prepareStatement(  
                         "update products set p_name=?,category=?,price=?,description=?,quantity=? where p_id=?");  
            ps.setString(1,e.getP_Name());  
            ps.setString(2,e.getP_cat());
            ps.setString(3,e.getPrice());
            
            
            
            ps.setString(3,e.getDescription());  
            ps.setString(4,e.getQuantity());  
            ps.setInt(5,e.getP_id());  
              
            status=ps.executeUpdate();  
              
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return status;  
    }  
    public static int delete(String Id){  
        int status=0;  
        try{  
            Connection con=EmpDao.getConnection();  
            PreparedStatement ps=con.prepareStatement("delete from products where p_id=?");  
            ps.setString(1,Id);  
            status=ps.executeUpdate();  
              
            con.close();  
        }catch(Exception e){e.printStackTrace();}  
          
        return status;  
    }  
    public static ProductEmp getEmployeeById(int p_id){  
        ProductEmp e=new ProductEmp();  
          
        try{  
            Connection con=EmpDao.getConnection();  
            PreparedStatement ps=con.prepareStatement("select * from products where p_id=?");  
            ps.setInt(1,p_id);  
            ResultSet rs=ps.executeQuery();  
            if(rs.next()){  
                e.setP_id(rs.getInt(1));  
                ps.setString(1,e.getP_Name());  
                ps.setString(2,e.getP_cat());
                ps.setString(3,e.getPrice());
                
                
                /*image retrieval*/
     		   /*Blob b=rs.getBlob(4);
     		   byte barr[]=b.getBytes(1,(int)b.length());
     		   FileOutputStream fout=new FileOutputStream("E:\\aa.jpg");
     		   fout.write(barr);
     		   fout.close();/*
     		   
              /*ends*/
                ps.setString(4,e.getDescription());  
                ps.setString(5,e.getQuantity());   
               
            }  
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return e;  
    }  
    public static List<ProductEmp> getAllEmployees(){  
        List<ProductEmp> list=new ArrayList<ProductEmp>();  
          
        try{  
            Connection con=ProductEmpDao.getConnection();  
            PreparedStatement ps=con.prepareStatement("select * from products");  
            ResultSet rs=ps.executeQuery();  
            while(rs.next()){ 
            	System.out.println(rs.getString("quantity"));
            	ProductEmp e=new ProductEmp();  
                e.setP_id(rs.getInt(1));  
                e.setP_Name(rs.getString(2));  
                e.setP_cat(rs.getString(3));
                e.setPrice(rs.getString(4));
                
                e.setDescription(rs.getString(5));  
                e.setQuantity(rs.getString("quantity"));  
                list.add(e);  
            }  
            con.close();  
        }catch(Exception e){e.printStackTrace();}  
          
        return list;  
    }  
}  
