package com;


public class ProductEmp {
	private int p_id;  
	private String p_name,price,p_cat,description,quantity;/* add image*/
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public String getP_Name() {
		return p_name;
	}
	public void setP_Name(String p_name) {
		this.p_name = p_name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	
	public String getP_cat() {
		return p_cat;
	}
	public void setP_cat(String p_cat) {
		this.p_cat = p_cat;
	}
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
}
