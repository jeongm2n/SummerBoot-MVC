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
	
	public ArrayList<ProductVO> Load_Product(String category, int sort, int page) {
		try {
			InformVO inform = null;
			conn = DBconn.getDBCP();
			
			ArrayList<ProductVO> productVO = new ArrayList<ProductVO>();
			String sql = null;
			
			int f_page = (0 + (9*(page-1)));
			int b_page = (9 + (9*(page-1)));
			
			if(category.equals("전체")) {
				if(sort == 1) {sql = "SELECT * from sb_product order by name asc limit " + f_page + "," + b_page + "";}
				else if(sort == 2) {sql = "SELECT * from sb_product order by price asc limit " + f_page + "," + b_page + "";}
				else if(sort == 3) {sql = "SELECT * from sb_product order by price desc limit " + f_page + "," + b_page + "";}
				else {sql = "SELECT * from sb_product  limit " + f_page + "," + b_page + "";}
			}
			else{
				if(sort == 1) {sql = "SELECT * from sb_product where category = '" + category + "' order by name asc limit " + f_page + "," + b_page + "";}
				else if(sort == 2) {sql = "SELECT * from sb_product where category = '" + category + "' order by price asc limit " + f_page + "," + b_page + "";}
				else if(sort == 3) {sql = "SELECT * from sb_product where category = '" + category + "' order by price desc limit " + f_page + "," + b_page + "";}
				else {sql = "SELECT * from sb_product where category = '" + category + "' limit " + f_page +"," + b_page + "";}
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
	
	public int Load_Size() {
		try {
			conn = DBconn.getDBCP();
				
			String sql = "SELECT count(*) as size from sb_product";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);
			
			rs.next();
			int size = rs.getInt("size");
			
						
			rs.close();
			pstmt.close();
			conn.close();
			
			return size;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
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
	
	public void Add_Cart(String id, int product_id, int quantity, int amount) {
		try {
			conn = DBconn.getDBCP();
			
			String sql = "select * from sb_cart where member_id = '" + id + "' and product_id = '" + product_id +"'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);
			if(rs.next()) {
				if(rs.getInt("quantity") + amount >= quantity) { amount = quantity;}
				else { amount += rs.getInt("quantity");}
				
				sql = "update sb_cart set quantity = '" + amount + "' where member_id = '" + id + "' and product_id = '" + product_id +"'";
				pstmt = conn.prepareStatement(sql);
				pstmt.executeUpdate();
			}
			else {
				sql = "insert into sb_cart (member_id, product_id, quantity) values (?, ?, ?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setInt(2, product_id);
				pstmt.setInt(3, amount);
				pstmt.executeUpdate();
			}
			rs.close();
			pstmt.close();
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public ArrayList<ReviewVO> Load_Review(String product_id) {
		try {
			conn = DBconn.getDBCP();
			
			ArrayList<ReviewVO> review = new ArrayList<ReviewVO>();
			
			String sql = "SELECT * from sb_reviews where product_id = '" + product_id + "' order by rev_date desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);

			String member_id;
			int point;
			String img;
			String contents;
			String date;
			
			while(rs.next()) {
				member_id = rs.getString("member_id");
				point = rs.getInt("point");
				img = rs.getString("img");
				contents = rs.getString("contents");
				date = rs.getString("rev_date");
				
				review.add(new ReviewVO(member_id, point, img, contents, date));
			}
					
			rs.close();
			pstmt.close();
			conn.close();
			
			return review;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;	
	}
	
	public void Add_review(String id, int product_id, String contents, int rating, String img) {
		try {
			conn = DBconn.getDBCP();
					
			String sql = "insert into sb_reviews (member_id, point, img, contents, product_id) values (?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, rating);
			pstmt.setString(3, img);
			pstmt.setString(4, contents);
			pstmt.setInt(5, product_id);
			pstmt.executeUpdate();
					
			pstmt.close();
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
			
	}
	
	public void Update_rating(int product_id, int rating) {
		try {
			conn = DBconn.getDBCP();
			
			String sql = "update sb_product set rating = ? where product_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rating);
			pstmt.setInt(2, product_id);
			pstmt.executeUpdate();
					
			pstmt.close();
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
