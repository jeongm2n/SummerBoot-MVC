package com.spring.summerboot2.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.spring.summerboot2.DBconn;
import com.spring.summerboot2.branch.WashlistVO;
import com.spring.summerboot2.product.ProductVO;

public class AdminDAO {
	private PreparedStatement pstmt;
	private Connection con;
	private ResultSet rs;
	
	public boolean addProduct(ProductVO vo) {
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
	
	public boolean addStore(WashlistVO vo) {
		try {
			con = DBconn.getDBCP();
			
			String sql = "INSERT INTO sb_carwash(name, address, sites, tel, time, img, lat, lon) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getAddress());
			pstmt.setInt(3, vo.getSites());
			pstmt.setString(4, vo.getTel());
			pstmt.setString(5, vo.getTime());
			pstmt.setString(6, vo.getImg());
			pstmt.setString(7, vo.getLat());
			pstmt.setString(8, vo.getLon());
			
			System.out.println("prepareStatement : " + sql);
			pstmt.executeUpdate();
			pstmt.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean overlapped(String name) {
		int count = 0;
		
		try {
			con = DBconn.getDBCP();
			
			String sql = "SELECT count(*) as cnt FROM sb_carwash";
			sql += " WHERE name = '" + name + "'";
			
			System.out.println("prepareStatement : " + sql);
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery(sql);

			while(rs.next()) {
				count = rs.getInt("cnt");
			}
			System.out.println(count);
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(count == 1) {
			return false;
		} else {
			return true;
		}
	}
	
	public boolean update(WashlistVO vo) {
		boolean change = false;
		try {
			con = DBconn.getDBCP();
			
			String sql = "UPDATE sb_carwash";
			sql += " SET address=?, sites=?, tel=?, time=? WHERE no = ?";
			System.out.println("prepareStatement : " + sql);

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getAddress());
			pstmt.setInt(2, vo.getSites());
			pstmt.setString(3, vo.getTel());
			pstmt.setString(4, vo.getTime());
			pstmt.setInt(5, vo.getNo());

			pstmt.executeUpdate();
			pstmt.close();
			
			change = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return change;
	}
	
	public boolean updateImg(WashlistVO vo) {
		boolean change = false;
		try {
			con = DBconn.getDBCP();
			
			String sql = "UPDATE sb_carwash";
			sql += " SET address=?, sites=?, tel=?, time=?, img=? WHERE no = ?";
			System.out.println("prepareStatement : " + sql);
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getAddress());
			pstmt.setInt(2, vo.getSites());
			pstmt.setString(3, vo.getTel());
			pstmt.setString(4, vo.getTime());
			pstmt.setString(5, vo.getImg());
			pstmt.setInt(6, vo.getNo());
			
			pstmt.executeUpdate();
			pstmt.close();
			
			change = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return change;
	}
	
	public boolean deleteStore(int no) {
		boolean change = false;
		try {
			con = DBconn.getDBCP();
			
			String sql = "DELETE FROM sb_carwash";
			sql += " WHERE no = ?";
			System.out.println("prepareStatement : " + sql);
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			pstmt.executeUpdate();
			pstmt.close();
			
			change = true;
		} catch (Exception e) {
			e.printStackTrace();
			change = false;
		}
		return change;
	}
	
	public boolean deleteUser(String id) {
		boolean change = false;
		try {
			con = DBconn.getDBCP();
			
			String sql = "DELETE FROM sb_member";
			sql += " WHERE id = ?";
			System.out.println("prepareStatement : " + sql);
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			pstmt.executeUpdate();
			pstmt.close();
			
			change = true;
		} catch (Exception e) {
			e.printStackTrace();
			change = false;
		}
		return change;
	}
}
