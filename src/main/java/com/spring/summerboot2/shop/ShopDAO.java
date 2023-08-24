package com.spring.summerboot2.shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.spring.summerboot2.DBconn;
import com.spring.summerboot2.cart.CartVO;
import com.spring.summerboot2.pay.InformVO;

public class ShopDAO {
	private PreparedStatement pstmt;
	private Connection conn;
	private ResultSet rs;
	
	public ArrayList<ProductVO> Load_Product(String category, int sort) {
		try {
			InformVO inform = null;
			conn = DBconn.getDBCP();
			
			ArrayList<ProductVO> productVO = new ArrayList<ProductVO>();
			String sql = null;
			if(category.equals("전체")) {
				if(sort == 1) {sql = "SELECT * from sb_product order by name asc";}
				else if(sort == 2) {sql = "SELECT * from sb_product order by price asc";}
				else if(sort == 3) {sql = "SELECT * from sb_product order by price desc";}
				else {sql = "SELECT * from sb_product";}
			}
			else{
				if(sort == 1) {sql = "SELECT * from sb_product where category = '" + category +"' order by name asc";}
				else if(sort == 2) {sql = "SELECT * from sb_product where category = '" + category +"' order by price asc";}
				else if(sort == 3) {sql = "SELECT * from sb_product where category = '" + category +"' order by price desc";}
				else {sql = "SELECT * from sb_product where category = '" + category +"'";}
			}
					
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);
			
			int product_id;
			String name;
			int price;
			int amount;
			String img;
			String p_category;
			int rating;
			
			while(rs.next()) {
				product_id = rs.getInt("product_id");
				name = rs.getString("name");
				price = rs.getInt("price");
				amount = rs.getInt("amount");
				img = rs.getString("img");
				p_category = rs.getString("category");
				rating = rs.getInt("rating");
				
				productVO.add(new ProductVO(product_id, name, price, amount, img, p_category, rating));
			}
						
			rs.close();
			pstmt.close();
			conn.close();
			
			return productVO;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
		}
	
	public ArrayList<String> Load_Category() {
		try {
			conn = DBconn.getDBCP();

			String sql = "SELECT category from sb_product GROUP BY category";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);

			ArrayList<String> category = new ArrayList<String>();
			
			while(rs.next()) {
				category.add(rs.getString("category"));
			}
					
			rs.close();
			pstmt.close();
			conn.close();
			
			return category;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
		}
	
	public ProductVO Load_Product(String product_id) {
		try {
			conn = DBconn.getDBCP();
			
			ProductVO product = null;
			
			String sql = "SELECT * from sb_product where product_id = '" + product_id + "'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);

			String name;
			int price;
			int amount;
			String img;
			String description;
			String category;
			int rating;
			
			while(rs.next()) {
				name = rs.getString("name");
				price = rs.getInt("price");
				amount = rs.getInt("amount");
				img = rs.getString("img");
				description = rs.getString("description");
				category = rs.getString("category");
				rating = rs.getInt("rating");
				
				product = new ProductVO(Integer.parseInt(product_id), name, price, amount, img, category, description, rating);
			}
					
			rs.close();
			pstmt.close();
			conn.close();
			
			return product;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public void Add_Review(int product_id, String id, int point, String content) {
		try {
			conn = DBconn.getDBCP();
			
			ProductVO product = null;
			
			String sql = "insert into sb_reviews (id, member_id, point, contents) values (?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, product_id);
			pstmt.setString(2, id);
			pstmt.setInt(3, point);
			pstmt.setString(4, content);
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
