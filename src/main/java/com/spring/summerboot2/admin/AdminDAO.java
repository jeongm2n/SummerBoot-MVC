package com.spring.summerboot2.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.spring.summerboot2.DBconn;
import com.spring.summerboot2.member.MemberVO;
import com.spring.summerboot2.product.ProductVO;

public class AdminDAO {
	private PreparedStatement pstmt;
	private Connection con;
	private ResultSet rs;
	
	public boolean add(ProductVO vo) {
		try {
			con = DBconn.getDBCP();
			
			String sql = "INSERT INTO sb_product(product_id, name, amount, price, img) VALUES (?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, vo.getProduct_id());
			pstmt.setString(2, vo.getName());
			pstmt.setInt(3, vo.getAmount());
			pstmt.setInt(4, vo.getPrice());
			pstmt.setString(5, vo.getImg());
			
			System.out.println("prepareStatement : " + sql);
			pstmt.executeUpdate();
			pstmt.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public List<ProductVO> productList() {
		List<ProductVO> list= new ArrayList<ProductVO>();
		try {
			con = DBconn.getDBCP();
			
			String sql = "SELECT * FROM sb_product ORDER BY product_id ASC";
			System.out.println("prepareStatement : " + sql);
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int product_id = rs.getInt("product_id");
				String name = rs.getString("name");
				int amount = rs.getInt("amount");
				int price = rs.getInt("price");
				String img = rs.getString("img");
				
				System.out.println(product_id);
				System.out.println(name);
				System.out.println(amount);
				System.out.println(price);
				System.out.println(img);
				
				ProductVO vo = new ProductVO(product_id, name, amount, price, img);
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
}
