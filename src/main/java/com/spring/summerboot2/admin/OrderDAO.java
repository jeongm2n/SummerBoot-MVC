package com.spring.summerboot2.admin;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.spring.summerboot2.DBconn;

public class OrderDAO {
	private PreparedStatement pstmt;
	private Connection con;
	private ResultSet rs;
	
	public List<OrderVO> orderList() {
		List<OrderVO> list= new ArrayList<OrderVO>();
		try {
			con = DBconn.getDBCP();
			
			String sql = "SELECT pur.order_num, pur.member_id, pur.product_id, p.name, p.price, pur.mount, pur.pur_date, pur.address FROM sb_purchase as pur INNER JOIN sb_product as p on pur.product_id = p.product_id ORDER BY pur.pur_date AND pur.order_num ASC";
			System.out.println("prepareStatement : " + sql);
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String order_num = rs.getString("pur.order_num");
				String member_id = rs.getString("pur.member_id");
				int product_id = rs.getInt("pur.product_id");
				String product_name = rs.getString("p.name");
				int price = rs.getInt("p.price");
				int mount = rs.getInt("mount");
				Date pur_date = rs.getDate("pur_date");
				String address = rs.getString("address");
				
				System.out.println(order_num);
				System.out.println(member_id);
				System.out.println(product_id);
				System.out.println(mount);
				System.out.println(pur_date);
				System.out.println(address);
				
				OrderVO vo = new OrderVO(order_num, member_id, product_id, product_name, price, mount, pur_date, address);
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
	
	public List<OrderVO> filterOrderList(String column, String str) {
		List<OrderVO> list= new ArrayList<OrderVO>();
		try {
			con = DBconn.getDBCP();
			
			String sql;
			if(column.equals("pur_date")) {
				String str1 = str + " 00:00:00";
				String str2 = str + " 23:59:59";
				sql = "SELECT pur.order_num, pur.member_id, pur.product_id, p.name, p.price, pur.mount, pur.pur_date, pur.address FROM sb_purchase as pur INNER JOIN sb_product as p on pur.product_id = p.product_id "
						+ "WHERE "+column+" BETWEEN '"+str1+"' AND '"+str2+"' ORDER BY pur.pur_date AND pur.order_num ASC";
			}
			else{
				sql = "SELECT pur.order_num, pur.member_id, pur.product_id, p.name, p.price, pur.mount, pur.pur_date, pur.address FROM sb_purchase as pur INNER JOIN sb_product as p on pur.product_id = p.product_id "
						+ "WHERE "+column+"='"+str+"' ORDER BY pur.pur_date AND pur.order_num ASC";
			}
					
			System.out.println("prepareStatement : " + sql);
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String order_num = rs.getString("pur.order_num");
				String member_id = rs.getString("pur.member_id");
				int product_id = rs.getInt("pur.product_id");
				String product_name = rs.getString("p.name");
				int price = rs.getInt("p.price");
				int mount = rs.getInt("mount");
				Date pur_date = rs.getDate("pur_date");
				String address = rs.getString("address");
				
				System.out.println(order_num);
				System.out.println(member_id);
				System.out.println(product_id);
				System.out.println(mount);
				System.out.println(pur_date);
				System.out.println(address);
				
				OrderVO vo = new OrderVO(order_num, member_id, product_id, product_name, price, mount, pur_date, address);
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
