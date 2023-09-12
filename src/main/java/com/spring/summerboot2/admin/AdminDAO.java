package com.spring.summerboot2.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.summerboot2.DBconn;
import com.spring.summerboot2.branch.WashlistVO;
import com.spring.summerboot2.shop.ProductVO;

public class AdminDAO {
	private PreparedStatement pstmt;
	private Connection con;
	private ResultSet rs;
	
	public boolean addProduct(ProductVO vo) {
		try {
			con = DBconn.getDBCP();
			
			String sql = "INSERT INTO sb_product(product_id, name, amount, price, img, category) VALUES (?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, vo.getProduct_id());
			pstmt.setString(2, vo.getName());
			pstmt.setInt(3, vo.getAmount());
			pstmt.setInt(4, vo.getPrice());
			pstmt.setString(5, vo.getImg());
			pstmt.setString(6, vo.getCategory());
			
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
				String category = rs.getString("category");
				
				System.out.println(product_id);
				System.out.println(name);
				System.out.println(amount);
				System.out.println(price);
				System.out.println(img);
				
				ProductVO vo = new ProductVO(product_id, name, amount, price, img, category);
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
	
	public List<Integer> reserCount() {
		List<Integer> list= new ArrayList<Integer>();
		int count=0;
		String[] month = {"01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"};
		try {
			con = DBconn.getDBCP();
			String sql="";
			for(int i =0; i < month.length; i++) {
				sql = "SELECT count(*) as cnt FROM sb_reservation WHERE res_date like '" + month[i] + "%'";
				System.out.println("prepareStatement : " + sql);
				
				pstmt = con.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				while(rs.next()) {
					count = rs.getInt("cnt");
					System.out.println(i + ">>" + count);
				}
				
				list.add(count);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Integer> orderMonthSum() {
		List<Integer> list= new ArrayList<Integer>();
		int sum = 0;
		String[] month = {"01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"};
		try {
			con = DBconn.getDBCP();
			String sql="";
			for(int i =0; i < month.length; i++) {
				sql = "SELECT sum(pur.mount * pro.price) as sum FROM sb_purchase as pur INNER JOIN sb_product as pro ON pur.product_id = pro.product_id WHERE year(pur_date)=year(now()) AND month(pur_date)='" + month[i] + "'";
				System.out.println("prepareStatement : " + sql);
				
				pstmt = con.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				while(rs.next()) {
					sum = rs.getInt("sum");
					System.out.println(i + ">>" + sum);
				}
				
				list.add(sum);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public Map<String, Integer> storePerRes() {
		Map<String, Integer> list= new HashMap<String, Integer>();
		String name;
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM");
		String formatedMonth = now.format(formatter);
		int count = 0;
		try {
			con = DBconn.getDBCP();
			String sql="";
			sql = "SELECT name, count(res.res_no) as cnt from sb_reservation as res inner join sb_carwash as car on res.no = car.no where res.res_date like '" + formatedMonth + "%' group by res.no order by res.no";
			System.out.println("prepareStatement : " + sql);
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				name = rs.getString("name");
				count = rs.getInt("cnt");
				System.out.println(name + ">>" + count);
				list.put(name, count);
			}
			
			rs.close();
			pstmt.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<String> storeName() {
		List<String> list= new ArrayList<String>();
		String name;
		try {
			con = DBconn.getDBCP();
			String sql="SELECT name FROM sb_carwash";
			System.out.println("prepareStatement : " + sql);
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				name = rs.getString("name");
				list.add(name);
			}
			
			rs.close();
			pstmt.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Integer> inquiryCnt() {
		List<Integer> list = new ArrayList();
		int cnt = 0;
		String[] category = {"세차", "쇼핑", "기타"};
		try {
			con = DBconn.getDBCP();
			for(int i = 0; i < category.length; i++) {
				String sql = "SELECT count(*) as cnt FROM sb_inquiry WHERE category like '" + category[i] + "%'";
				System.out.println("prepareStatement : " + sql);
				
				pstmt = con.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				while(rs.next()) {
					cnt = rs.getInt("cnt");
					System.out.println(category[i] + ">>>" + cnt);
					list.add(cnt);
				}
			}
			
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public int memCnt() {
		int cnt = 0;
		try {
			con = DBconn.getDBCP();
			String sql = "SELECT count(*) as cnt FROM sb_member";
			System.out.println("prepareStatement : " + sql);
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt("cnt");
			}
			
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
}
