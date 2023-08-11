package com.spring.summerboot2.cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.spring.summerboot2.DBconn;

public class CartDAO {
	private PreparedStatement pstmt;
	private Connection con;
	private ResultSet rs;
	
	public List<CartVO> my_cart(String user_id) {
		List<CartVO> list= new ArrayList<CartVO>();
		try {
			con = DBconn.getDBCP();
			
			String sql = "SELECT c.product_id, p.name, c.quantity, p.price, p.img FROM sb_cart as c INNER JOIN sb_product as p on c.product_id = p.product_id AND c.member_id = ?";
			System.out.println("prepareStatement : " + sql);
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				 int product_id = rs.getInt("c.product_id"); 
				String product_name = rs.getString("p.name");
				int quantity = rs.getInt("c.quantity");
				int price = rs.getInt("p.price");
				String img = rs.getString("p.img");
				
				System.out.println(product_id); 
				System.out.println(product_name);
				System.out.println(quantity);
				System.out.println(price);
				
				CartVO vo = new CartVO(product_id, product_name, quantity, price, img);
				list.add(vo);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	 public void update_Quan(String id, int product_id, int quantity) {
	  	try {
			con = DBconn.getDBCP();
			
			String sql = "UPDATE sb_cart";
			sql += " SET quantity=? WHERE member_id = ? AND product_id = ?";
			System.out.println("prepareStatement : " + sql);

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, quantity);
			pstmt.setString(2, id);
			pstmt.setInt(3, product_id);

			pstmt.executeUpdate();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	 }
	 
	 public void delete(String id, int product_id) {
		 try {
			 con = DBconn.getDBCP();
			 
			 String sql = "DELETE FROM sb_cart";
			 sql += " WHERE member_id = ? AND product_id = ?";
			 System.out.println("prepareStatement : " + sql);
			 
			 pstmt = con.prepareStatement(sql);
			 pstmt.setString(1, id);
			 pstmt.setInt(2, product_id);
			 
			 pstmt.executeUpdate();
			 pstmt.close();
			 
		 } catch (Exception e) {
			 e.printStackTrace();
		 }
	 }
}
